import React, { useState } from "react";
import "./Gallery.css";
import Slideshow from "../Slideshow/Slideshow";

const Gallery = ({ pictures }) => {
  const [openSlideshow, setOpenSlideshow] = useState(false);

  const handleOpenSlideshow = () => {
    setOpenSlideshow(!openSlideshow);
  };

  return (
    <div>
      <div>
        <div className="details-images">
          {pictures.length >= 5
            ? pictures
                .slice(0, 5)
                .map((img, i) => (
                  <img
                    key={i}
                    className={`img${i + 1}`}
                    src={img.imageUrl}
                  ></img>
                ))
            : pictures.map((img, i) => (
                <img key={i} className={`img${i + 1}`} src={img.imageUrl}></img>
              ))}
        </div>
        <div className="see-more-div">
          {pictures.length >= 5 ? (
            <p className="see-more-btn" onClick={handleOpenSlideshow}>
              Ver más
            </p>
          ) : (
            ""
          )}
        </div>

        <div
          className={
            openSlideshow
              ? "slider-container fade-in-slider"
              : "hidden-slideshow "
          }
        >
          <Slideshow
            handleOpenSlideshow={handleOpenSlideshow}
            images={pictures}
          />
        </div>
      </div>
    </div>
  );
};

export default Gallery;
