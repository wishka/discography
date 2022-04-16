module Mutations
  class UpdateItem < BaseMutation

    argument :id, ID, required: true
    argument :title, String, required: false
    argument :description, String, required: false
    argument :artist_id, Integer, required: true


    # return type from the mutation
    type Types::ItemInputType

    def resolve(id:, **attributes)
      Item.find(id).tap do |item|
        item.update!(attributes)
      end
    end
  end
end
