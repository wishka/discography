module Mutations
  class CreateItem < BaseMutation

    argument :title, String, required: true
    argument :description, String, required: false
    argument :image_url, String, required: false
    argument :artist_id, Integer, required: true


    # return type from the mutation
    type Types::ItemInputType

    def resolve(artist_id:, **attributes)
      Artist.find(artist_id).items.create!(attributes)
    end
  end
end
