import { useState } from 'react'
import {Login} from './login/Login.jsx'

const App = () => {
  const [count, setCount] = useState(0)

  return (
    <>
      <Login />
    </>
  )
}

export { App };
