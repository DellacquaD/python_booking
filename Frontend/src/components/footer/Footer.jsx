import React from 'react'
import Social from '../socials/Social'
import styles from'./Footer.module.css'
import { useNavigate } from 'react-router'

const Footer = () => {
  const navigate = useNavigate()
  return (
    <div className={styles.footer}>
      <div className={styles.copyright}>
        <span onClick={() => navigate('/aboutUs')}>©2023 Digital Booking</span>
      </div>
      <div className={styles.socialFooter}>
        <Social styles={styles}/>
      </div>
    </div>
  )
}

export default Footer
