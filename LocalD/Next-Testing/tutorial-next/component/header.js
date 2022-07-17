import Link from "next/link"
import styles from '../styles/Header.module.css'

export default function Header(){
    return(
        <header className={styles.container}>
        <ul className={styles.list}>
          <li className={styles.link}><Link href="/">Home</Link></li>
          <li className={styles.link}> <Link href="/blog">Blog</Link></li>
          <li className={styles.link}><Link href="/user/about">About</Link></li>
        </ul>
      </header>
    )
}