# frozen_string_literal: true

module Types
  class ItemInputType < Types::BaseObject
    graphql_name "createItem"

    field :id, ID, null: false
    field :title, String, null: true
    field :description, String, null: true
    field :image_url, String, null: true
    field :artist_id, Integer, null: true
    field :artist, Types::ArtistType, null: true
  end
end
