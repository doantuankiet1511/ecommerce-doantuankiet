import { useEffect, useState } from "react"
import Loading from "../layouts/Loading"
import API, { endpoints } from "../configs/API"
import { useParams, useSearchParams } from "react-router-dom"
import Items from "../layouts/Items"
import { Col, Image, Row } from "react-bootstrap"
import PaginationUI from "../layouts/PaginationUI"

const ShopDetail = () => {
    const [shop, setShop] = useState(null)
    const [products, setProducts] = useState(null)
    const [page, setPage] = useState(1)
    const [totalProducts, setTotalProducts] = useState(0)
    const [productsPerPage, setProductsPerPage] = useState(9)

    const {shopId} = useParams()
    console.log(shop)

    useEffect(() => {
        const loadShop = async () => {
            let res = await API.get(endpoints['shop-detail'](shopId))
            setShop(res.data)
        }

        const loadProduct = async () => {
            try {
                let res = await API.get(`${endpoints['shop-detail-product'](shopId)}?page=${page}`)
                setProducts(res.data.results)
                setTotalProducts(res.data.count)
            } catch {
                setPage(1)
            }
        }

        loadShop()
        loadProduct()
    }, [shopId, page])

    if (shop === null || products === null)
        return <Loading />
    return (
        <>
            <h1 className="text-center">Cửa hàng {shop.name}</h1>
            <Row className="my-4">
                <Col md={4} className="text-center">
                    <Image src={shop.image || shop.avatar} alt={shop.name} width="40%"/>
                </Col>
                <Col md={8}>
                    {shop.description && (
                        <Row>
                            <Col md={3}>Mô tả</Col>
                            <Col md={9} className="_p-features" dangerouslySetInnerHTML={{ __html: shop.description }}></Col>
                        </Row>
                    )}
                    <Row>
                        <Col md={3}>Số lượng sản phẩm</Col>
                        <Col md={9}>{shop.product_count}</Col>
                    </Row>
                </Col>
            </Row>
            <Row>
                {products.map(product => <Items obj={product}/>)}
            </Row>
            <PaginationUI totalItems={totalProducts} itemsPerPage={productsPerPage} currentPage={page} setCurrentPage={setPage} />
        </>
    )
}

export default ShopDetail