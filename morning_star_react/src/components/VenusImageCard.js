import React from 'react';
import './VenusImageCard.css';

const VenusImageCard = ({ title, imageUrl, description, dateCreated, thatDailyMythologicalStuff }) => {
  return (
    <div className="venus-image-container">
      <div className="venus-image-section">
      <h2 className="venus-title">{title}</h2> 
        <img className="venus-image" src={imageUrl} alt={title} />
        <div className="venus-description-section">
          <p className="venus-description">{description}</p>
          <p className="venus-date">{new Date(dateCreated).toLocaleDateString()}</p>
        </div>
      </div>
      <div className="venus-mythology-section">
        <p className="venus-mythology">{thatDailyMythologicalStuff}</p>
      </div>
    </div>
  );
};

export default VenusImageCard;
