import React from "react";
import {
  FacebookShareButton,
  TwitterShareButton,
  LinkedinShareButton,
  RedditShareButton,
  WhatsappShareButton,
  FacebookIcon,
  TwitterIcon,
  LinkedinIcon,
  RedditIcon,
  WhatsappIcon,
} from "react-share";

const Share = ({ styles }) => {
  const url = window.location.href;

  return (
    <div className={styles.shareIcons}>
      <TwitterShareButton
        url={url}
        title={"¿Planeas un viaje? Mira este alojamiento"}
        hashtag="#Db"
      >
        <TwitterIcon size={32} round />
      </TwitterShareButton>
      <FacebookShareButton
        url={url}
        quote={"¿Planeas un viaje? Mira este alojamiento"}
        hashtag="#Db"
      >
        <FacebookIcon size={32} round />
      </FacebookShareButton>
      <LinkedinShareButton
        url={url}
        title={"¿Planeas un viaje? Mira este alojamiento"}
      >
        <LinkedinIcon size={32} round />
      </LinkedinShareButton>
      <RedditShareButton
        url={url}
        title={"¿Planeas un viaje? Mira este alojamiento"}
      >
        <RedditIcon size={32} round />
      </RedditShareButton>
      <WhatsappShareButton
        url={url}
        title={"¿Planeas un viaje? Mira este alojamiento"}
      >
        <WhatsappIcon size={32} round />
      </WhatsappShareButton>
    </div>
  );
};

export default Share;
