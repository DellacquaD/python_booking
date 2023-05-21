import axios from 'axios'
import React, { useRef, useEffect, useState } from 'react'
import { motion } from 'framer-motion'
import CardCategory from './CardCategory/CardCategory'
import styles from './CardCategory/CardCategory.module.css'
import { apiCategory } from '../../utils/apiEndpoints'

const Carousel = () => {
  const [width, setWidht] = useState(0)
  const [categorys, setCategorys] = useState([])

  const carousel = useRef()

  useEffect(() => {
    setWidht(carousel.current.scrollWidth - carousel.current.offsetWidth)
  }, [carousel.current])

  useEffect(() => {
    const fetchData = async () => {
      try {
        const response = await axios.get(apiCategory)
        setCategorys(response.data)
      } catch (error) {
        console.log('Error al obtener datos de la API. Usando datos estáticos...')
        const fallbackData = await axios.get('/apiCategories.json')
        setCategorys(fallbackData.data)
      }
    }
    fetchData()
  }, [])

  return (
    <motion.div ref={carousel} className={styles.carousel} whileTap={{ cursor: 'grabbing' }}>
      <article>
        <p>Buscar por tipo de alojamiento</p>
      </article>
      <motion.div drag='x' dragConstraints={{ right: 0, left: -width }} className={styles.sliderCategories} id={styles.sliderCategories} >
        {categorys.map((category) => (
          <CardCategory key={category.id} {...category} styles={styles}/>
        ))}
      </motion.div>
    </motion.div>
  )
}

export default Carousel
