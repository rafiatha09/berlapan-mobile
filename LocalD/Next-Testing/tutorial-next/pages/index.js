import Head from 'next/head'
import Image from 'next/image'
import Layout from '../component/layout'
import styles from '../styles/Home.module.css'
import Rafiatha from '../public/Rafiatha.jpg'

export default function Home() {
  return (
    <>
      <Layout>
      <div className={styles.container}>
        <Image src={Rafiatha} width={400} height={200} alt='profile'/>
      </div>
      <div className={styles.container}>
        <h1 >Welcome to Rafi Atha's Website</h1>
      </div>
      </Layout>
    
    </>
  )
}
