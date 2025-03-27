import { useContext, useState } from "react"
import { Button, Card, Col, OverlayTrigger, Tooltip } from "react-bootstrap"
import { Link } from "react-router-dom"
import { CartContext, MyUserContext } from "../configs/MyContext"
import { authAPI, endpoints } from "../configs/API"

const Items = ({obj, setAction}) => {
    const [stateCart, dispatchCart] = useContext(CartContext)
    const [like, setLike] = useState()
    const [user, ] = useContext(MyUserContext)

    const addToCart = () => {
        dispatchCart({
            type: "ADD_TO_CART",
            payload: {id: obj.id, name: obj.name, price: obj.price, image: obj.image, quantity: 1}
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
            } finally {
                setAction(false)
            }
        }
        setAction(true)
        process()
    }

    const renderTooltip = (props) => (
        <Tooltip id="button-tooltip" {...props}>
          Bạn cần phải đăng nhập!
        </Tooltip>
    );

    let url = `/products/${obj.id}`

    return (
        <Col md={4} xs={12} className="mt-2" key={obj.id}>
            <Card>
                <Card.Img variant="top" src={obj.image} fluid/>
                <Card.Body>
                    <Card.Title>{obj.name.length > 52 ? obj.name.slice(0, 52) + " ..." : obj.name}</Card.Title>
                    <div className="d-flex">
                        <Card.Title>
                            {Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(obj.price)}
                        </Card.Title>
                        <Card.Title>
                            {user ? <button onClick={() => likeProcess(obj.id)} className={like === true || obj.liked === true?"btn btn-danger ms-4":"btn btn-outline-danger ms-4"} style={{fontSize:"16px"}}>♡</button> 
                                : (
                                    <OverlayTrigger
                                        placement="right"
                                        delay={{ show: 250, hide: 400 }}
                                        overlay={renderTooltip}
                                    >
                                        <button onClick={() => likeProcess(obj.id)} className={like === true || obj.liked === true?"btn btn-danger ms-4":"btn btn-outline-danger ms-4"} style={{fontSize:"16px"}}>♡</button>  
                                    </OverlayTrigger>
                                )}
                        </Card.Title>
                    </div>
                    <div className="d-flex flex-wrap">
                        <Link to={url} className="btn btn-outline-primary m-1">Xem chi tiết</Link>
                        <Button onClick={() => addToCart()} variant="outline-primary" className="m-1">Thêm vào giỏ hàng</Button>   
                    </div>          
                </Card.Body>
            </Card>
        </Col>
    )
}

export default Items