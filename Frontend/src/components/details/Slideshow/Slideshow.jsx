import React, { useState } from "react";
import "./Slideshow.css";
import { Swiper, SwiperSlide } from "swiper/react";
import { Navigation, Thumbs, EffectFade, Pagination, Autoplay } from "swiper";
import "swiper/css";
import "swiper/css/navigation";
import "swiper/css/thumbs";
import "swiper/css/effect-fade";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faXmark } from "@fortawesome/free-solid-svg-icons";

const Slideshow = ({ images, handleOpenSlideshow }) => {
  const [thumb, setThumb] = useState();

  return (
    <div className="slider">
      <Swiper
        autoplay={{ delay: 3000 }}
        loop={true}
        spaceBetween={10}
        navigation={true}
        modules={[Navigation, Thumbs, EffectFade, Pagination, Autoplay]}
        pagination={{ el: ".swiper-pagination", type: "fraction" }}
        effect={"fade"}
        speed={500}
        grabCursor={true}
        className="slider-img"
        thumbs={{
          swiper: thumb && !thumb.destroyed ? thumb : null,
        }}
      >
        {images.map((item, i) => (
          <SwiperSlide key={i}>
            <img src={item.imageUrl} />
          </SwiperSlide>
        ))}
      </Swiper>

      <div className="swiper-pagination count"></div>
      <button className="btn-slide" onClick={handleOpenSlideshow}>
        <FontAwesomeIcon icon={faXmark} size="2xl"></FontAwesomeIcon>
      </button>
      <div className="thumbnails">
        <Swiper
          loop={true}
          onSwiper={setThumb}
          spaceBetween={10}
          slidesPerView={4}
          modules={[Navigation, Thumbs]}
          className="slider-img-thumbs"
        >
          {images.map((item, i) => (
            <SwiperSlide key={i}>
              <div className="thumbs-wrapper">
                <img src={item.imageUrl} />
              </div>
            </SwiperSlide>
          ))}
        </Swiper>
      </div>
    </div>
  );
};

export default Slideshow;
