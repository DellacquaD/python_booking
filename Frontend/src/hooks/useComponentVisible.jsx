import { useState, useEffect, useRef } from 'react'

export default function useComponentVisible (initialValue) {
  const selectorRef = useRef(null)
  const [isActive, setIsActive] = useState(initialValue)

  const handleClickSelect = (event) => {
    if (event.key === 'Escape') {
      setIsActive(false)
    }
  }
  
  const handleClickOutsideOfSelect = (event) => {
    if (selectorRef.current && !selectorRef.current.contains(event.target)) {
      setIsActive(false)
    }
  }

  useEffect(() => {
    document.addEventListener('keydown', handleClickSelect, true)
    document.addEventListener('click', handleClickOutsideOfSelect, true)
    return () => {
      document.removeEventListener('keydown', handleClickSelect, true)
      document.removeEventListener('click', handleClickOutsideOfSelect, true)
    }
  })

  return { selectorRef, isActive, setIsActive }
}
