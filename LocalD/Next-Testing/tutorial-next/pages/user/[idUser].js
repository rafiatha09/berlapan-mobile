import React from 'react'
import Layout from '../../component/layout'
import { useRouter } from 'next/router'
export default function UserDetails(props){
    // console.log(props)
    const router = useRouter();
    const {idUser} = router.query;

    // const slicedRoute = router.pathname.split(/[ /]+/)
    // const previousRoute = slicedRoute.slice(1,-1).map(slicing)
    // console.log(previousRoute)
  
    // console.log(pathname)
    return(
        <Layout>
            <div>
                <p>User Detail Key Attribute {idUser}</p>
            </div>
        </Layout>
    )
}



// export async function getStaticPaths(){
//     const res = await fetch('https://jsonplaceholder.typicode.com/users/')
//     const dataUser = await res.json()
//     const paths = dataUser.map(user => {
//         return{
//             params:{
//                 id: user.id.toString(),
//             },
//         }
//     } )
//     return{
//         paths, fallback:false
//     }
// }

// export async function getStaticProps(context){
//     const{id} = context.params
//     const res = await fetch('https://jsonplaceholder.typicode.com/users/' + id)

//     return{
//         props:{
//             user: await res.json(),
//         },
//     };
// }