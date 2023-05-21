import React, { useState } from 'react'


const ProductPoliciesDetails = ({ props }) => {
    
    const { styles, rules, setRules, security, setSecurity, cancellation, setCancellation} = props

  return (
    <div className={styles.policiesContainer}>
        <h3 className={styles.policiesTitle}>Políticas del producto</h3>
        <div className={styles.policiesDescriptions}>
            <section className={styles.policiesSection}>
                <h4>Normas de la casa</h4>
                <p>Descripción</p>
            <textarea 
                className={styles.textarea} 
                placeholder='Escribir aquí' 
                name="" 
                cols="30" 
                rows="10" 
                value={rules} 
                onChange={(e) => setRules(e.target.value)} 
                required
            >
            </textarea>
            </section>
            <section className={styles.policiesSection}>
                <h4>Salud y seguridad</h4>
                <p>Descripción</p>
            <textarea className={styles.textarea} 
                placeholder='Escribir aquí' 
                name="" 
                cols="30" 
                rows="10" 
                value={security} 
                onChange={(e) => setSecurity(e.target.value)} 
                required
            >
            </textarea>
            </section>
            <section className={styles.policiesSection}>
                <h4>Politica de cancelación</h4>
                <p>Descripción</p>
            <textarea className={styles.textarea} 
                placeholder='Escribir aquí' 
                name="" 
                cols="30" 
                rows="10" 
                value={cancellation} 
                onChange={(e) => setCancellation(e.target.value)} 
                required
            >
            </textarea>
            </section>
        </div>
    </div>
  )
}

export default ProductPoliciesDetails