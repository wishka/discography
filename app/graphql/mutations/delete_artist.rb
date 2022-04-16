module Mutations
  class DeleteArtist < BaseMutation
    # arguments passed to the `resolve` method
    argument :id, ID, required: true

    # return type from the mutation
    type Types::ArtistInputType

    def resolve(id:)
      Artist.find(id).destroy
    end
  end
end
