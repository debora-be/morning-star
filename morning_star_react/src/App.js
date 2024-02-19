import React from 'react';
import { ApolloProvider } from '@apollo/client';
import client from './apollo-client';
import VenusImageDisplay from './components/VenusImageDisplay';
import './App.css';

function App() {
  return (
    <ApolloProvider client={client}>
      <div className="App">
        <VenusImageDisplay />
      </div>
    </ApolloProvider>
  );
}

export default App;
