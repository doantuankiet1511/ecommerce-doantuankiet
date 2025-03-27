import { useEffect, useState } from "react"
import { Link } from "react-router-dom"
import API, { endpoints } from "../configs/API"

const Categories = () => {
    const [categories, setCategories] = useState([])

    useEffect(() => {
        const loadCategories = async () => {
            let res = await API.get(endpoints['categories'])
            setCategories(res.data)
        }

        loadCategories()
    }, [])

    return (
        <>
            <div className="filter-categories">
                <h5 className="text-center">Danh mục sản phẩm</h5>
                <Link to="/" className="nav-link">Tất cả sản phẩm</Link>
                {categories.map(category => {
                    let url = `/?cateId=${category.id}`
                    return <Link to={url} className="nav-link" key={category.id}>{category.name}</Link>
                })}
            </div>
        </>
    )
}

export default Categories