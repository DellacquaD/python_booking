import React from 'react'
import Searcher from '../../components/Home/searcher/Searcher'
import Carousel from '../../components/Home/Carousel'
import Suggested from '../../components/Home/Suggested'

const Home = () => {
  return (
    <div className='home'>
      <Searcher />
      <Carousel />
      <Suggested />
    </div>
  )
}

export default Home
