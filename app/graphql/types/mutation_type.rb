module Types
  class MutationType < Types::BaseObject
    graphql_name 'Mutations'

    field :create_artist, mutation: Mutations::CreateArtist
    field :update_artist, mutation: Mutations::UpdateArtist
    field :delete_artist, mutation: Mutations::DeleteArtist

    field :create_item, mutation: Mutations::CreateItem
    field :update_item, mutation: Mutations::UpdateItem
    field :delete_item, mutation: Mutations::DeleteItem
  end
end
