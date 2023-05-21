/* eslint-disable react/prop-types */
import React from 'react'
const CardStars = ({ stars, styles }) => {
  const st = []

  for (let i = 1; i <= 5; i++) {
    let starFill = styles.empty
    if (stars >= i) {
      starFill = styles.full
    }
    st.push({ starFill, i })
  }

  return (
    <div>
      {st.map((star) => (
        <span className={star.starFill} key={star.i}>
          ★
        </span>
      ))}
    </div>
  )
}

export default CardStars
