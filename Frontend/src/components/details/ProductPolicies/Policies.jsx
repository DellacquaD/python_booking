/* eslint-disable react/prop-types */
import React from 'react'

const Policies = ({ policies, styles }) => {
  const rules = policies.rules?.split('.')
  const security = policies.security?.split('.')
  const cancellation = policies.cancellation?.split('.')

  return (
    <div className={styles.detailPolicies}>
      <div className={styles.detailRules}>
        <h3>Normas de la casa</h3>
        <p className={styles.rulesBody}>
          {rules?.map((rule) => (
            <span key={rule}>{rule}</span>
          ))}
        </p>
      </div>
      <div className={styles.detailSecurity}>
        <h3>Salud y seguridad</h3>
        <p className={styles.securityBody}>
          {' '}
          {security?.map((sec) => (
            <span key={sec}>{sec}</span>
          ))}
        </p>
      </div>

      <div className={styles.detailCancelation}>
        <h3>Política de cancelación</h3>
        <p className={styles.cancellationBody}>
          {' '}
          {cancellation?.map((can) => (
            <span key={can}>{can}</span>
          ))}
        </p>
      </div>
    </div>
  )
}

export default Policies
