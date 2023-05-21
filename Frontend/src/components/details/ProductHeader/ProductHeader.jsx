import React from 'react'
import './ProductHeader.css'
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import { faChevronLeft } from '@fortawesome/free-solid-svg-icons'
import { useNavigate } from 'react-router'

const ProductHeader = ({ generalInfo }) => {
  const navigate = useNavigate()

  const handleClickReturn = () => {
    const host = window.location.origin
    const currentUrl = window.location.href
    const newUrl = currentUrl.substring(0, currentUrl.lastIndexOf('/'))
    if (currentUrl === `${host}/product/${generalInfo?.id}`) {
      navigate('/')
    } else {
      window.location.href = newUrl
    }
  }


  return (
    <div className="details-product-header">
      <div className="details-product-general-info">
        <div>
          <p>{generalInfo?.category?.toUpperCase()}</p>
          <p className="details-place-name">{generalInfo?.title}</p>
        </div>

        <div id="details-back-arrow">
          <FontAwesomeIcon
            inverse
            icon={faChevronLeft}
            size="2xl"
            onClick={handleClickReturn}
          />
        </div>
      </div>
    </div>
  )
}

export default ProductHeader
