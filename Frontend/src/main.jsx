import React from 'react'
import ReactDOM from 'react-dom/client'
import { BrowserRouter } from 'react-router-dom'
import { ContextProvider } from './utils/globalContext'
import App from './app/App'

ReactDOM.createRoot(document.getElementById('root')).render(
  <React.StrictMode>
    <ContextProvider>
      <BrowserRouter basename='/'>
        <App />
      </BrowserRouter>
    </ContextProvider>
  </React.StrictMode>
)
