import { useEffect, useState } from "react"
import { Button, ButtonGroup, Col, Form, InputGroup, Row } from "react-bootstrap"
import API, { authAPI, endpoints } from "../configs/API"
import { Link, useSearchParams } from "react-router-dom"
import Loading from "../layouts/Loading"
import Items from "../layouts/Items"
import Categories from "./Categories"
import PaginationUI from "../layouts/PaginationUI"

const Products = () => {
    const [products, setProducts] = useState(null)
    const [categories, setCategories] = useState([])
    const [page, setPage] = useState(1)
    const [q] = useSearchParams()
    const [action, setAction] = useState(false)
    const [totalProducts, setTotalProducts] = useState(0)
    const [productsPerPage, setProductsPerPage] = useState(9)

    const [price, setPrice] = useState({
        "min": null,
        "max": null
    })

    const [sortByValue, setSortByValue] = useState(null)
    const sortBy = [{
        "filter": "price",
        "name": "Giá từ thấp đến cao"
    }, {
        "filter": "-price",
        "name": "Giá từ cao đến thấp"
    }, {
        "filter": "name",
        "name": "Tên từ thấp đến cao"
    }, {
        "filter": "-name",
        "name": "Tên từ cao đến thấp"
    }]

    useEffect(() => {
        const loadProducts = async () => {
            try {
                let e = `${endpoints['products']}?page=${page}`

                let k = q.get("kw")
                if (k !== null)
                    e += `&kw=${k}`

                let cateId = q.get("cateId")
                if (cateId !== null)
                    e += `&category_id=${cateId}`

                let minPrice = q.get("min-price")
                let maxPrice = q.get("max-price")
                if (minPrice !== null && maxPrice !== null)
                    e += `&min_price=${minPrice}&max_price=${maxPrice}`

                if (sortByValue !== null)
                    e += `&ordering=${sortByValue}`

                let res = await authAPI().get(e)
    
                setProducts(res.data.results)
                setTotalProducts(res.data.count)
            } catch (ex) {
                setPage(1)
            }
        }

        const loadCategories = async () => {
            let res = await API.get(endpoints['categories'])
            setCategories(res.data)
        }

        setProducts(null)
        setPrice({
            "min": "",
            "max": ""
        })
        loadProducts()
        loadCategories()
    }, [page, q, sortByValue, action]) 

    const getNameCategory = categories.filter(c => c.id === parseInt(q.get("cateId"))).map(c => c.name)

    if (products === null)
        return <Loading />
    
    let navFilterProduct = (
        <>
            <Categories />
            <hr/>
            <div className="mt-2">
                <h5 className="text-center">Lọc sản phẩm</h5>
                <Row>
                    <h6>Khoảng giá</h6>
                    <Col>
                        <InputGroup className="mb-3">
                            <InputGroup.Text id="inputGroup-sizing-default">
                                Min price
                            </InputGroup.Text>
                            <Form.Control
                                aria-label="Default"
                                aria-describedby="inputGroup-sizing-default"
                                value={price.min}
                                onChange={(evt) => setPrice({...price, "min": evt.target.value})}
                            />
                        </InputGroup>
                    </Col>
                    <Col>
                        <InputGroup className="mb-3">
                            <InputGroup.Text id="inputGroup-sizing-default">
                                Max price
                            </InputGroup.Text>
                            <Form.Control
                                aria-label="Default"
                                aria-describedby="inputGroup-sizing-default"
                                value={price.max}
                                onChange={(evt) => setPrice({...price, "max": evt.target.value})}
                            />
                        </InputGroup>
                    </Col>
                </Row>
                <Row style={{width: 100}} className="mx-auto">
                    <Link to={q.get("cateId") 
                                    ? `/?catedId=${q.get("cateId")}&min-price=${price.min}&max-price=${price.max}` 
                                    : `/?min-price=${price.min}&max-price=${price.max}`
                                } 
                            className="btn btn-primary">
                            Lọc
                    </Link>
                </Row>
            </div>
        </>
    )

    if (products.length === 0)
        return (
            <>
                <Row className="mt-4">
                    <Col xs={6} md={2}>
                        {navFilterProduct}
                    </Col>
                    <Col xs={12} md={10}>
                        <div className="alert alert-info mt-1">Không có sản phẩm nào {q.get("cateId") !== null ? <>thuộc {getNameCategory}</> : ""}!!!</div>
                    </Col>
                </Row>
            </>
        )

    return (
        <>
            <Row className="mt-4">
                <Col xs={12} md={2}>
                    {navFilterProduct}
                </Col>
                <Col xs={12} md={10}>
                    <Row>
                        <Col>
                            <h5>Sản phẩm {q.get("cateId") !== null ? <>thuộc {getNameCategory}</> : ""}</h5>
                        </Col>
                        <Col>
                            <Form.Group as={Row} className="mb-3 justify-content-end">
                                <Form.Label column sm={2} className="text-center">Sắp xếp</Form.Label>
                                <Col sm={5}>
                                    <Form.Select aria-label="Default select example" className="text-center" style={{width: 190}} onChange={(e) => setSortByValue(e.target.value)}>
                                        <option value="" selected={sortByValue === ""}>Mặc định</option>
                                        {sortBy.map((item) => 
                                            <option value={item.filter} selected={sortByValue === item.filter}>{item.name}</option>
                                        )}
                                    </Form.Select>
                                </Col>
                            </Form.Group>
                        </Col>
                    </Row>
                    <Row>
                        {products.map(product => <Items key={product.id} obj={product} setAction={setAction} />)}
                    </Row>
                    <PaginationUI totalItems={totalProducts} itemsPerPage={productsPerPage} currentPage={page} setCurrentPage={setPage} /> 
                </Col>
            </Row>
        </>
    )
}

export default Products