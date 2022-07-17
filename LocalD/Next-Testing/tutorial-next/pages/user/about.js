import React from 'react'
import Layout from '../../component/layout'
import {useRouter} from 'next/router'
import styles from '../../styles/User.module.css'
export default function UserDetails(props){
    const router = useRouter()
    const {dataUsers} = props;
    console.log(dataUsers)
    return(
        <Layout>
        {dataUsers.map(user => {
                    return(
                        <div key={user.id} onClick={() => router.push('/user/'+ user.id)} className={styles.card}>
                            <div>

                        <p>{user.name}</p>
                        <p>{user.username}</p>
                        <p>{user.email}</p>
                        <p>{user.address.street}</p>
                            </div>
                        </div>
                    )
                }
            )
        }
        </Layout>
    )
}

export async function getStaticProps(){ // tepat untuk data dinamis karena data disiapkan sebelum dipanggil user
    const res = await fetch('https://jsonplaceholder.typicode.com/users')
    
    return{
        props:{
            dataUsers : await res.json()
        }
    }
}

