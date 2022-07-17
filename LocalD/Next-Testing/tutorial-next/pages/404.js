import { useEffect } from "react"
import { useRouter } from "next/router"

export default function Customerror(){
    const router = useRouter();
    useEffect(() => {
        setTimeout(() => {
            // console.log('dipanggil setelah 2 detik')
            router.push('/')
        },2500)
    }, [])

    return(
        <div className="content">
            <div>
                <h1 className='title-not-found'>Sorry bro...</h1>
                <h1 className='title-not-found'>The page is not found</h1>
            </div>
        </div>
    )
}