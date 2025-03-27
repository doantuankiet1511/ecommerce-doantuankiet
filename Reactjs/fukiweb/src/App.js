import { BrowserRouter, Route, Routes } from 'react-router-dom';
import './App.css';
import Products from './components/Products';
import Footer from './layouts/Footer';
import Header from './layouts/Header';
import cookie from 'react-cookies'
import { Container } from 'react-bootstrap';
import ProductDetail from './components/ProductDetail';
import ShopDetail from './components/ShopDetail';
import Login from './components/Login';
import { CartContext, MyUserContext, StatsMyShopContext } from './configs/MyContext';
import { useReducer, useState } from 'react';
import MyUserReducer from './reducers/MyUserReducer';
import Register from './components/Register';
import 'moment/locale/vi'
import moment from 'moment';
import CartDetail from './components/CartDetail';
import CartReducer from './reducers/CartReducer';
import CartCheckout from './components/CartCheckout';
import ProfileUser from './components/ProfileUser';
import ChangePassword from './components/ChangePassword';
import MyShop from './components/MyShop';
import AddProduct from './components/AddProduct';
import AddShop from './components/AddShop';
import EditProduct from './components/EditProduct';
import ListRegisterSeller from './components/ListRegisterSeller';
import WishListProduct from './components/WishListProduct';
import ListOrderProduct from './components/ListOrderProduct';
import OrderDetail from './components/OrderDetail';
import StatsMyShop from './components/StatsMyShop';
import StatsTableMyShop from './components/StatsTableMyShop';

moment().local("vi")

function App() {
  const [user, dispatch] = useReducer(MyUserReducer, cookie.load('current-user') || null)
  const [stateCart, dispatchCart] = useReducer(CartReducer, [])
  const [statsYear, setStatsYear] = useState(null)
  const [statsMonth, setStatsMonth] = useState(null)
  const [statsQuarter, setStatsQuarter] = useState(null)
  
  return (
    <MyUserContext.Provider value={[user, dispatch]}>
      <CartContext.Provider value={[stateCart, dispatchCart]}>
        <StatsMyShopContext.Provider value={[statsYear, statsMonth, statsQuarter, setStatsYear, setStatsMonth, setStatsQuarter]} >
          <BrowserRouter>
            <Header />

            <Container>
              <Routes>
                <Route path='/eCommerceWebUI' element={<Products />} />
                <Route path='/' element={<Products />} />
                <Route path='/login' element={<Login />} />
                <Route path='/register' element={<Register />} />
                <Route path='/products/:productId' element={<ProductDetail />} />
                <Route path='/shops/:shopId/products' element={<ShopDetail />} />
                <Route path='/cart' element={<CartDetail />} />
                <Route path='/cart/checkout' element={<CartCheckout />} />
                
                {user ? (
                  <>
                    <Route path='/profile-user' element={<ProfileUser />} />
                    <Route path='/profile-user/change-password' element={<ChangePassword />} />
                    <Route path='/wish-list' element={<WishListProduct />} />
                    <Route path='/list-order' element={<ListOrderProduct />} />
                    <Route path='/orders/:orderId' element={<OrderDetail />} />
                  </>
                ) : <Route path='*' element={<div className='alert alert-info m-1'>Bạn cần phải đăng nhập</div>} />}
                
                {(user && (user.role === "Seller" || user.role === "Employee")) ? (
                  <>
                    <Route path='/create-shop' element={<AddShop />} />
                    <Route path='/my-shop' element={<MyShop />} />
                    <Route path='/add-product' element={<AddProduct />} />
                    <Route path='/edit-product/:productId' element={<EditProduct />} />
                    <Route path='/stats-shop' element={<StatsMyShop />} />
                    <Route path='/stats-table-shop' element={<StatsTableMyShop />} />
                  </>
                ) : <Route path='*' element={<div className='alert alert-info m-1'>Bạn không có quyền truy cập</div>} />}
                
                {user && user.role === "Employee" ? (
                  <>
                    <Route path='/list-seller' element={<ListRegisterSeller />} />
                  </>
                ) : <Route path='*' element={<div className='alert alert-info m-1'>Bạn không có quyền truy cập</div>} />}

                <Route path='*' element={<div className='alert alert-info m-1'>Coming soon...</div>} /> 
              </Routes>
            </Container>

            <Footer />
          </BrowserRouter>
        </StatsMyShopContext.Provider>
      </CartContext.Provider>
    </MyUserContext.Provider>
  );
}

export default App;
