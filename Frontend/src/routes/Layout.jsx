import React from 'react'
import { Outlet } from 'react-router'
import Header from '../components/header/Header'
import Footer from '../components/footer/Footer'

const Layout = () => {
  return (
    <div style={{ width: '100 vw' }}>
      <Header />
      <Outlet />
      <Footer />
    </div>
  )
}
export default Layout
