import { Button, Form } from "react-bootstrap"
import Loading from "./Loading"
import { useState } from "react"
import ErrorAlert from "./ErrorAlert"

const CommentForm = ({ submitLabel, handleSubmit, initialText = "", hasCancelButton = false, handleCancel, errMessage, loading }) => {
    const [contentComment, setContentComment] = useState(initialText)
    const [active, setActive] = useState(false)

    const onSubmit = (evt) => {
        evt.preventDefault()

        handleSubmit(contentComment)

        if (errMessage) {
            setActive(true)
            setTimeout(() => setActive(false), 1000)
        }
        
        setContentComment("")
    }

    return (
        <>
            {active?<ErrorAlert err={errMessage}/>:""}
            <Form onSubmit={onSubmit}>
                <Form.Group className="mb-3" controlId="exampleform.ControlTextarea">
                    <Form.Control as="textarea" rows={3} 
                                    placeholder="Nội dung bình luận ..." 
                                    value={contentComment}
                                    onChange={e => setContentComment(e.target.value)}/>
                </Form.Group>

                {loading?<Loading />:<Button className="me-1" variant="primary" type="submit">{submitLabel}</Button>}  
                {hasCancelButton && (
                    <Button type="button" onClick={handleCancel}>Hủy</Button>
                )}      
            </Form>
        </>
    )
}

export default CommentForm