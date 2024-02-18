import { ApolloClient, InMemoryCache } from '@apollo/client';

const client = new ApolloClient({
  uri: 'http://localhost:4000/v1/graphql', // Adjust this URI to match your GraphQL server
  cache: new InMemoryCache(),
});

export default client;
