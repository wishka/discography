module Mutations
  class UpdateArtist < BaseMutation
    # arguments passed to the `resolve` method
    argument :id, ID, required: false
    argument :first_name, String, required: false
    argument :last_name, String, required: false
    argument :email, String, required: false

    # return type from the mutation
    type Types::ArtistInputType

      def resolve(id:, **attributes)
        Artist.find(id) do |artist|
          artist.update!(attributes)
        end
      end
  end
end
