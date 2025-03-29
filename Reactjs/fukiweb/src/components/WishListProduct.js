import { useContext, useEffect, useState } from "react"
import { authAPI, endpoints } from "../configs/API"
import { Button, Image, Table } from "react-bootstrap"
import { CartContext } from "../configs/MyContext"

const WishListProduct = () => {
    const [listProducts, setListProducts] = useState([])
    const [ , dispatchCart] = useContext(CartContext)
    const [like, setLike] = useState()

    useEffect(() => {
        const loadProducts = async () => {
            let res = await authAPI().get(endpoints['wish-list'])
            console.log(res.data)
            setListProducts(res.data)
        }
        loadProducts()
    }, [like])

    const addToCart = (obj) => {
        dispatchCart({
            type: "ADD_TO_CART",
            payload: {...obj, quantity: 1}
        })
    }

    const likeProcess = (id) => {
        const process = async () => {
            try {
                let res = await authAPI().post(endpoints['like-product'](id))
                if (res.status === 200)
                    setLike(res.data)
            } catch (ex) {
                console.error(ex)
            }
        }
        process()
    }

    if (listProducts.length === 0)
        return <div className="alert alert-info mt-1">Không có sản phẩm yêu thích nào!</div>

    return (
        <>
            <h1 className="text-center">DANH SÁCH YÊU THÍCH</h1>
            <Table striped bordered hover variant="light" className="mt-4">
                <thead className="text-center">
                    <tr>
                        <th>Hình ảnh</th>
                        <th>Tên sản phẩm</th>
                        <th>Giá</th>
                        <th colSpan={2}></th>
                    </tr>
                </thead>
                <tbody>
                    {listProducts.map((item) => 
                        <>
                            <tr key={item.product.id}>
                                <td className="text-center">
                                    <Image src={item.product.image} alt={item.product.name} width="30%"/>
                                </td>
                                <td>{item.product.name}</td>
                                <td>{Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(item.product.price)}</td>
                                <td style={{width: 200, textAlign: "center"}}><Button className="me-1" onClick={() => addToCart(item.product)}>Thêm vào giỏ</Button></td>
                                <td><button onClick={() => likeProcess(item.product.id)} className={like === true || item.liked === true?"btn btn-danger":"btn btn-outline-danger"} style={{fontSize:"16px"}}>♡</button> </td>
                            </tr>
                        </>
                    )}
                </tbody>
            </Table>
        </>
    )
}

export default WishListProduct