require 'rails_helper'

module Mutations
  module Items
    RSpec.describe CreateItem, type: :request do
      describe '.resolve' do
        it 'creates a item' do
          item = create(:item)

          expect do
            post '/graphql', params: { query: query(item_id: item.id) }
          end.to change { Item.count }.by(1)
        end

        it 'returns a item' do
          item = create(:item)

          post '/graphql', params: { query: query(item_id: item.id) }
          json = JSON.parse(response.body)
          data = json['data']['createItem']

          expect(data).to include(
            'id'              => be_present,
            'title'           => 'Best musik ever',
            'description'     =>  "Let ig, let it go",
            'artist'          => { 'id' => artist.id.to_s }
          )
        end
      end

      def query(artist_id:)
        <<~GQL
          mutation {
            createItem(
              artistId: #{artist_id}
              title: "Best musik ever"
              description: "Let ig, let it go"
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
