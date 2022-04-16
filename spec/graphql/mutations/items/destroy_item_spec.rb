require 'rails_helper'

module Mutations
  module Items
    RSpec.describe DeleteItem, type: :request do
      describe 'resolve' do
        it 'removes a item' do
          item = create(:item)

          expect do
            post '/graphql', params: { query: query(id: item.id) }
          end.to change { Item.count }.by(-1)
        end

        it 'returns a item' do
          item = create(:item, title: 'Hero', description: 'Let ig, let it go')

          post '/graphql', params: { query: query(id: item.id) }
          json = JSON.parse(response.body)
          data = json['data']['deleteItem']

          expect(data).to include(
            'id'              => be_present,
            'title'           => 'Hero',
            'description' => 'Let ig, let it go',
            'artist'          => { 'id' => be_present }
          )
        end
      end

      def query(id:)
        <<~GQL
          mutation {
            deleteItem(
              id: #{id}
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
