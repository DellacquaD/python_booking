import React from "react";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import {
  faFacebook,
  faLinkedinIn,
  faTwitter,
  faInstagram,
} from "@fortawesome/free-brands-svg-icons";
import { Link } from "react-router-dom";

// const Social = ({ styles }) => {
//   return (
//     <div className={styles.socials}>
//       <Link to="https://es-la.facebook.com/" target="_blank">
//         <FontAwesomeIcon icon={faFacebook} size="xl" />
//       </Link>
//       <Link to="https://www.linkedin.com/" target="_blank">
//         <FontAwesomeIcon icon={faLinkedinIn} size="xl" />
//       </Link>
//       <Link to="https://twitter.com/" target="_blank">
//         <FontAwesomeIcon icon={faTwitter} size="xl" />
//       </Link>
//       <Link to="https://www.instagram.com/" target="_blank">
//         <FontAwesomeIcon icon={faInstagram} size="xl" />
//       </Link>
//     </div>
//   );
// };


function Social ({ styles }) {
  return (
    <div className={styles.socials}>
      <Link to="https://es-la.facebook.com/" target="_blank">
        <FontAwesomeIcon icon={faFacebook} size="xl" />
      </Link>
      <Link to="https://www.linkedin.com/" target="_blank">
        <FontAwesomeIcon icon={faLinkedinIn} size="xl" />
      </Link>
      <Link to="https://twitter.com/" target="_blank">
        <FontAwesomeIcon icon={faTwitter} size="xl" />
      </Link>
      <Link to="https://www.instagram.com/" target="_blank">
        <FontAwesomeIcon icon={faInstagram} size="xl" />
      </Link>
    </div>
  );
}

export default Social;