import { useState } from "react";
import { Form } from "react-bootstrap";
import ErrorAlert from "./ErrorAlert";

const InputTags = ({ tagsValue, setTagsValue }) => {
    const [err, setErr] = useState("")

    const addTags = (event) => {
        event.preventDefault()

        const nameTagSame = tagsValue.filter(tag => tag === event.target.value)

		if (event.target.value !== "" && nameTagSame.length === 0) {
			setTagsValue([...tagsValue, event.target.value]);
			event.target.value = "";
		} else {
            event.target.value = "";
            setErr("Nhãn dán (tags) bị trùng")
            setTimeout(() => setErr(""), 2000)   
        }
	};

    const removeTags = (indexToRemove) => {
		setTagsValue([...tagsValue.filter((_, index) => index !== indexToRemove)]);
	};

    return (
        <Form.Group>
            <Form.Label>Gắn nhãn dán (tags)</Form.Label>
            {err ? <ErrorAlert err={err} /> : ""}
            <div className="tags-input">
                <ul id="tags">
                    {tagsValue.map((tag, index) => (
                        <li key={index} className="tag">
                            <span className='tag-title'>{tag}</span>
                            <span className='tag-close-icon' onClick={() => removeTags(index)}>
                                &times;
                            </span>
                        </li>
                    ))}
                </ul>
                <input
                    type="text"
                    onKeyDown={(event) => event.key === "Enter" ? addTags(event) : null}
                    placeholder="Nhấn enter để thêm nhãn dán (tags)"
                />
            </div>
        </Form.Group>
    )
}

export default InputTags