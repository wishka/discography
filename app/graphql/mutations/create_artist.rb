module Mutations
  class CreateArtist < BaseMutation
    # arguments passed to the `resolve` method
    argument :first_name, String, required: true
    argument :last_name, String, required: true
    argument :email, String, required: true

    # return type from the mutation
    type Types::ArtistInputType

    def resolve(first_name: nil, last_name: nil, email: nil)
      Artist.create!(
        first_name: first_name,
        last_name: last_name,
        email: email,
      )
    end
  end
end
