import { Col, Image, Row } from "react-bootstrap"
import Moment from "react-moment"
import CommentForm from "./CommentForm"
import { useState } from "react"
import { LiaChevronUpSolid } from "react-icons/lia"

const Comment = ({ obj, replies, currentUserId, deleteComment, replyComment, editComment, activeComment, setActiveComment, errMessage, loading }) => {
    // const fiveMinutes = 300000
    // const timePassed = new Date() - new Date(obj.created_date) > fiveMinutes
    const [isDisplay, setIsDisplay] = useState(false)

    const canReply = Boolean(currentUserId)
    const canEdit = currentUserId === obj.user.id 
    const canDelete = currentUserId === obj.user.id

    const isReplying = activeComment && activeComment.type === "replying" && activeComment.id === obj.id
    const isEditing = activeComment && activeComment.type === "editing" && activeComment.id === obj.id

    return (
        <>
            <Row className="m-1 p-1" key={obj.id}>
                <Col xs={3} md={1}>
                    <Image src={obj.user.image || obj.user.avatar} alt={obj.user.username} width={65} style={{maxHeight: 65, objectFit: "scale-down"}} rounded/>
                </Col>
                <Col xs={9} md={11}>
                    <p>{obj.content}</p>
                    <small>Được bình luận bởi {obj.user.username} vào <Moment fromNow>{obj.created_date}</Moment> </small>
                    <Row xs="auto">
                        {(canReply || !currentUserId) && (
                            <Col>
                                <div className="d-flex">
                                    <div 
                                        style={{cursor: "pointer"}} 
                                        onClick={() => {
                                            {canReply && setActiveComment({id: obj.id, type: "replying"})}
                                            setIsDisplay(true)
                                        }}>
                                        Phản hồi
                                    </div>
                                    {obj.replies.length > 0 ? <div className="ms-1">({obj.replies.length})</div> : " "}
                                </div>

                                {isDisplay && obj.replies.length > 0 ? 
                                    <div style={{cursor: "pointer"}} className="me-2 ms-1" onClick={() => setIsDisplay(false)}>
                                        <LiaChevronUpSolid className="me-1" /> Thu gọn
                                    </div> : ""
                                }
                            </Col>
                        )}
                        {canEdit && (
                            <Col><div style={{cursor: "pointer"}} onClick={() => setActiveComment({id: obj.id, type: "editing"})}>Chỉnh sửa</div></Col>
                        )}
                        {canDelete && (
                            <Col><div style={{cursor: "pointer"}} onClick={() => deleteComment(obj.id)}>Xóa</div></Col>
                        )}
                    </Row>
                </Col>
            </Row>

            {isReplying && (
                <CommentForm 
                    submitLabel="Phản hồi"
                    handleSubmit={(content) => replyComment(content, obj.id)}
                    hasCancelButton
                    handleCancel={() => setActiveComment(null)}
                    errMessage={errMessage?errMessage:""}
                    loading={loading}
                />
            )}

            {isEditing && (
                <CommentForm
                    submitLabel="Chỉnh sửa"
                    initialText={obj.content}
                    handleSubmit={(content) => editComment(content, obj.id)}
                    hasCancelButton
                    handleCancel={() => setActiveComment(null)}
                    errMessage={errMessage?errMessage:""}
                    loading={loading}
                />
            )}

            {replies.length > 0 && isDisplay && (
                <div className="ms-4 p-1">
                    {replies.map(reply => (
                        <Comment 
                            key={reply.id} 
                            obj={reply} 
                            replies={reply.replies.length > 0 ? reply.replies : []} 
                            currentUserId={currentUserId}
                            deleteComment={deleteComment}
                            replyComment={replyComment}
                            editComment={editComment}
                            activeComment={activeComment}
                            setActiveComment={setActiveComment}
                            errMessage={errMessage}
                            loading={loading}
                        />
                    ))}
                </div>
            )}
        </>
    )
}

export default Comment