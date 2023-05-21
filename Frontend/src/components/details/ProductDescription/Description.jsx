import React from "react";
import "./Description.css";

const Description = ({ data }) => {
  return (
    <div className="description">
      <p className="description-text">{data.description}</p>
    </div>
  );
};

export default Description;
