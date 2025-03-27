import { Row } from "react-bootstrap";
import { BsFacebook, BsInstagram, BsTwitter, BsTiktok } from "react-icons/bs";
import { Link } from "react-router-dom";

const Footer = () => {
    return (
        <div className="mt-2 bg-dark footer">
            <div className="social-icons">
                <Link><BsFacebook size="2em" className="icon" /></Link>
                <Link><BsInstagram size="2em" className="icon" /></Link>
                <Link><BsTwitter size="2em" className="icon" /></Link>
                <Link><BsTiktok size="2em" className="icon" /></Link>
            </div>
            <div className="footer-nav">
                <ul>
                    <li><Link to="/">Home</Link></li>
                    <li><Link to="/">News</Link></li>
                    <li><Link to="/">About</Link></li>
                    <li><Link to="/">Contact Us</Link></li>
                    <li><Link to="/">Our Team</Link></li>
                </ul>
            </div>
            <div className="footer-bottom">
                <p>Copyright &copy;2023; Designed by Nguyen Van Phuc</p>
            </div>
        </div>
    )
}

export default Footer