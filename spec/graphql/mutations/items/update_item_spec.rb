require 'rails_helper'

module Mutations
  module Items
    RSpec.describe UpdateItem, type: :request do
      describe 'resolve' do
        it 'updates a item' do
          item   = create(:item, title: 'Hero', description: "None word")
          artist = create(:artist)

          post '/graphql', params: { query: query(id: item.id, artist_id: artist.id) }

          expect(item.reload).to have_attributes(
            'artist_id'        => artist.id,
            'title'            => 'Best musik ever',
            'description'      => 'Let ig, let it go',
          )
        end

        it 'returns a item' do
          item   = create(:item, title: 'Hero', description: "None word")
          artist = create(:artist)

          post '/graphql', params: { query: query(id: item.id, artist_id: artist.id) }

          json = JSON.parse(response.body)
          data = json['data']['updateItem']

          expect(data).to include(
            'id'              => item.id.to_s,
            'title'           => 'Best musik ever',
            'description'     => 'Let ig, let it go',
            'artist'          => { 'id' => artist.id.to_s }
          )
        end
      end

      def query(id:, artist_id:)
        <<~GQL
          mutation {
            updateItem(
              id: #{id}
              artistId: #{artist_id}
              title: "Best musik ever"
              description: 'Let ig, let it go'
            ) {
              id
              title
              description
              artist {
                id
              }
            }
          }
        GQL
      end
    end
  end
end
