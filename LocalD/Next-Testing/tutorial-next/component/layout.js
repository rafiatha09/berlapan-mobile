import Header from '../component/header'
import Footer from '../component/footer'
import styles from '../styles/Layout.module.css'

export default function Layout({ children }) {
    return(
        
        <div className={styles.container}>
            
            <Header />
                <div className={styles.content}>
                {children}

                </div>

            <Footer />
        </div>
    )
}