import { Pagination } from "react-bootstrap"

const PaginationUI = ({ totalItems, itemsPerPage, currentPage, setCurrentPage }) => {
    let active = currentPage
    let pages = []
    for (let i = 1; i <= Math.ceil(totalItems/itemsPerPage); i++) {
        pages.push(i)
    }

    const nextPage = () => setCurrentPage(current => current + 1)
    const prevPage = () => setCurrentPage(current => current - 1)

    return (
        <>
            {pages.length > 1 && (
                <Pagination className="mt-2">
                    <Pagination.First onClick={prevPage}/>
                    {pages.map((number) => {
                        return (
                            <Pagination.Item key={number} active={number === active} onClick={() => setCurrentPage(number)}>
                                {number}
                            </Pagination.Item>
                        )
                    })}
                    <Pagination.Last onClick={nextPage}/>
                </Pagination>
            )}
        </>
    )
}

export default PaginationUI