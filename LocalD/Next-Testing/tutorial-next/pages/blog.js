import Layout from '../component/layout'
import styles from '../styles/Blog.module.css'
export default function Blog(props){
    const {dataBlog} = props

    return (
        <Layout>
            
           
           {dataBlog.map(blog => {
            return(
                <div key={blog.id} className={styles.card}>
                    <div>

                    <p>User Id: {blog.userId}</p>
                    <br></br>
                    <p>
                        {blog.title}
                    </p>
                    <p>
                        {blog.body}
                    </p>
                    </div>
                </div>

)
})}
     
        </Layout>
    )
}

export async function getServerSideProps(){ //untuk dinamis
    const res = await fetch('https://jsonplaceholder.typicode.com/posts')
    const dataBlog = await res.json()

    return{
        props:{
            dataBlog: dataBlog
        }
    }
}
