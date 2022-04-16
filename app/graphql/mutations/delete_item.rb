module Mutations
  class DeleteItem < BaseMutation

    argument :id, ID, required: true


    # return type from the mutation
    type Types::ItemInputType

    def resolve(id:)
      Item.find(id).destroy
    end
  end
end
