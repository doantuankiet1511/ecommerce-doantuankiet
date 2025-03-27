import { useContext, useState } from "react"
import { MyUserContext } from "../configs/MyContext"
import { Button, Form } from "react-bootstrap"
import InputItem from "../layouts/InputItem"
import Loading from "../layouts/Loading"
import { authAPI, endpoints } from "../configs/API"
import { useNavigate } from "react-router-dom"
import ErrorAlert from "../layouts/ErrorAlert"

const ChangePassword = () => {
    const [user, dispatch] = useContext(MyUserContext)
    const [oldPassword, setOldPassword] = useState("")
    const [newPassword, setNewPassword] = useState("")
    const [confirmNewPass, setConfirmNewPass] = useState("")
    const [loading, setLoading] = useState(false)
    const [err, setErr] = useState("")

    const nav = useNavigate()

    const changePassword = (evt) => {
        evt.preventDefault()

        const process = async () => {
            try {
                let res = await authAPI().post(endpoints['change-password'], {
                    "old_password": oldPassword,
                    "new_password": newPassword
                })
                console.log(res.data)
    
                if (res.status === 200) {
                    nav("/login")
                    dispatch({
                        "type": "logout"
                    })
                }
            } catch (ex) {
                let msg = ""
                for (let e of Object.values(ex.response.data))
                    msg += `${e} `
                setErr(msg)
            } finally {
                setLoading(false)
            }
        }

        if (newPassword !== confirmNewPass)
            setErr("Xác nhận mật khẩu mới sai! Vui lòng nhập lại")
        else {
            setLoading(true)
            process()
        }
    }

    return (
        <>
            <h1 className="text-center">THAY ĐỔI MẬT KHẨU</h1>
            {err ? <ErrorAlert err={err} /> : ""}
            <Form onSubmit={changePassword}>
                <InputItem label="Mật khẩu cũ" type="password" value={oldPassword} setValue={e => setOldPassword(e.target.value)} />
                <InputItem label="Mật khẩu mới" type="password" value={newPassword} setValue={e => setNewPassword(e.target.value)} />
                <InputItem label="Xác nhận mật khẩu mới" type="password" value={confirmNewPass} setValue={e => setConfirmNewPass(e.target.value)} />
                {loading ? <Loading /> : <Button variant="primary" type="submit">Lưu</Button>}
            </Form>
        </>
    )
}

export default ChangePassword