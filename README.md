This is a first little Test app of GhaphQL
The app has Artists and they songs.
1.You can see all Artists and songs:
query {
  allArtists{
    id
    firstName
    lastName
    email
  } items {
    id
    title
    description
    artist{
      firstName
    }
  }
}
2.You can add new artist or item by use this code:

mutation {
  createArtist(input: {
    firstName: "FirstName"
    lastName: "LastName"
    email: "email"
  }
  ) {
    id
  }
}

mutation {
  createItem (input: {
    title: "Title",
    artistId: id,
    description: "description"
  })
  {
    id
    title
  }
}

3.Can update artist or item with attributes you need:
mutation {
  updateArtist(
    input: {id: id,
    firstName: "FirstName",
    lastName: "LastName",
    email: "email"}
  ) {
    id
    firstName
    email
  }
}

mutation {
  updateItem(
    input: {id: id,
    title: "title",
    description: "description",
    artistId: id
  }
  ) {
    id
    firstName
    email
  }
}

4.Or you cad delete Artist or Item:
mutation {
  deleteArtist(
    input: {id: id}
  ) {
    id
  }
}

mutation {
  deleteItem(
    input: {id: id}
  ) {
    id
  }
}
