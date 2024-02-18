import React from 'react';
import { useQuery, gql } from '@apollo/client';
import VenusImageCard from './VenusImageCard';

const GET_VENUS_IMAGES = gql`
  query GetVenusImage($startDate: String!, $endDate: String!) {
    getVenusImage(startDate: $startDate, endDate: $endDate) {
      dateCreated
      title
      description
      imageUrl
      thatDailyMythologicalStuff 
    }
  }
`;

const VenusImageDisplay = () => {
  const { loading, error, data } = useQuery(GET_VENUS_IMAGES, {
    variables: { startDate: "1999-06-12", endDate: "3056-12-31" },
  });

  if (loading) return <p>Loading...</p>;
  if (error) return <p>Error! {error.message}</p>;

  return (
    <div>
      {data.getVenusImage.map((image) => (
        <VenusImageCard key={image.title} {...image} />
      ))}
    </div>
  );
};

export default VenusImageDisplay;
