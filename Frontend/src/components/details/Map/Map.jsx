import React from "react";
import "./Map.css";

const Map = ({ address }) => {
  let url = `https://www.google.com/maps/embed/v1/place?key=AIzaSyDO5woQG6Ni56if3gOVoVoP3coiwxg4huI
  &q=${address?.street}+${address?.number},${address?.city}+${address?.state}+${address?.country}&zoom=19`;

  return (
    <div className="map">
      {address ? (
        <iframe
          width="90%"
          height="600px"
          style={{ border: "0" }}
          loading="lazy"
          allowFullScreen
          referrerPolicy="no-referrer-when-downgrade"
          src={url}
        ></iframe>
      ) : (
        ""
      )}
    </div>
  );
};

export default Map;
