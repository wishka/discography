# frozen_string_literal: true

module Types
  class ArtistInputType < Types::BaseObject
    graphql_name "createArtist"

    field :id, ID, null: false
    field :first_name, String, null: true
    field :last_name, String, null: true
    field :email, String, null: true

  end
end
