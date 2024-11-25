<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="roomList.aspx.cs" Inherits="BTL_WEB.src.WebForm3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Danh sách phòng đặt - Hotel Booking</title>
    <link rel="stylesheet" href="/asset/css/roomList.css">
    <link rel="shortcut icon" href="/asset/img/icon/favicon.ico" type="image/x-icon">
</head>
<body>
    <form id="roomList" runat="server" method="post">
        <header>
            <div class="header">
                <a href="./home.aspx">
                    <img class="logo" src="/asset/img/icon/logo.png" alt="Logo">
                </a>
                <nav>
                    <div class="left-nav">
                        <ul>
                            <li class="hover-effect"><a href="./home.aspx">Trang chủ</a></li>
                            <li class="hover-effect"><a href="./blog.aspx">Blog</a></li>
                            <li class="hover-effect"><a href="#footer">Về chúng tôi</a></li>
                        </ul>
                    </div>

                    <div class="right-nav">
                        <ul>
                            <li class="btn-favour-room hover-effect" style="visibility: hidden" id="adminButton" runat="server">
                                <a href="admin.aspx">
                                    <span>Quản lý phòng</span>
                                </a>
                            </li>
                            <li class="btn-favour-room hover-effect">
                                <a href="bookingList.aspx">
                                    <img src="/asset/img/icon/list.svg" alt="Đặt phòng" class="imgBooking">
                                    <span>Đặt phòng</span>
                                </a>
                            </li>
                            <li class="btn-signin hover-effect">
                                <a id="signin" class="sign-in" href="#" runat="server" onserverclick="SaveUrl">
                                    <img src="/asset/img/icon/user-regular.svg" alt="User">
                                    <span id="notsignin" runat="server">Đăng nhập</span>
                                    <span id="signout" runat="server">Exit</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </nav>
            </div>
        </header>
        <section class="list-room trending">
            <div class="container">
                <div class="title">
                    <h3>Danh sách phòng bạn đặt</h3>
                    <p>Các homestay được đã vào tầm ngắm được lưu trữ tại đây</p>
                </div>
                <div class="content">
                    <div class="content-container" id="p01" onclick="productDetail_onClick(this.id)">
                        <div class="ava">
                            <img class="img-heart" src="/asset/img/icon/heart-regular.svg" alt="Favour">
                            <input type="hidden" value="p01">
                            <img class="thumbnail-ava" src="/asset/img/image/p01/p01.jpg" alt="Homestay1">
                        </div>
                        <div class="detail">
                            <h4>Mai Chau Countryside Homestay</h4>
                            <div class="address">
                                <img src="/asset/img/icon/location-dot-solid.svg" alt="Location">
                                <p>Mai Châu</p>
                            </div>
                            <div class="price">
                                <p id="discount">1.000.000đ</p>
                                <p id="cost">500.000đ</p>
                            </div>
                        </div>
                    </div>
                    <div class="content-container" id="p01" onclick="productDetail_onClick(this.id)">
                        <div class="ava">
                            <img class="img-heart" src="/asset/img/icon/heart-regular.svg" alt="Favour">
                            <input type="hidden" value="p01">
                            <img class="thumbnail-ava" src="/asset/img/image/p01/p01.jpg" alt="Homestay1">
                        </div>
                        <div class="detail">
                            <h4>Mai Chau Countryside Homestay</h4>
                            <div class="address">
                                <img src="/asset/img/icon/location-dot-solid.svg" alt="Location">
                                <p>Mai Châu</p>
                            </div>
                            <div class="price">
                                <p id="discount">1.000.000đ</p>
                                <p id="cost">500.000đ</p>
                            </div>
                        </div>
                    </div>
                    <div class="content-container" id="p01" onclick="productDetail_onClick(this.id)">
                        <div class="ava">
                            <img class="img-heart" src="/asset/img/icon/heart-regular.svg" alt="Favour">
                            <input type="hidden" value="p01">
                            <img class="thumbnail-ava" src="/asset/img/image/p01/p01.jpg" alt="Homestay1">
                        </div>
                        <div class="detail">
                            <h4>Mai Chau Countryside Homestay</h4>
                            <div class="address">
                                <img src="/asset/img/icon/location-dot-solid.svg" alt="Location">
                                <p>Mai Châu</p>
                            </div>
                            <div class="price">
                                <p id="discount">1.000.000đ</p>
                                <p id="cost">500.000đ</p>
                            </div>
                        </div>
                    </div>
                    <div class="content-container" id="p01" onclick="productDetail_onClick(this.id)">
                        <div class="ava">
                            <img class="img-heart" src="/asset/img/icon/heart-regular.svg" alt="Favour">
                            <input type="hidden" value="p01">
                            <img class="thumbnail-ava" src="/asset/img/image/p01/p01.jpg" alt="Homestay1">
                        </div>
                        <div class="detail">
                            <h4>Mai Chau Countryside Homestay</h4>
                            <div class="address">
                                <img src="/asset/img/icon/location-dot-solid.svg" alt="Location">
                                <p>Mai Châu</p>
                            </div>
                            <div class="price">
                                <p id="discount">1.000.000đ</p>
                                <p id="cost">500.000đ</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <footer>
            <div class="footer-detail">
                <div class="col-descrip">
                    <img src="/asset/img/icon/logowhite.svg" alt="Logo">
                    <h4>Công ty cổ phần dịch vụ Homestay4u</h4>
                    <p>Tổng đài chăm sóc: 1900 1234</p>
                    <p>
                        Văn phòng tại: Tầng 55, tòa nhà Landmark 72
                        <br />
                        Lô E6, Khu đô thị mới Cầu Giấy, Nam Từ Liêm, Hà Nội
                    </p>
                    <p>
                        Công ty cổ phần dịch vụ Homestay4u là lorem ipsum dolor sit amet,<br />
                        consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut<br />
                        labore et dolore magna aliqua.
                    </p>
                    </p>
                </div>
                <div class="col-link">
                    <ul>
                        <li class="footer-mark"><a href="#">Trang chủ</a></li>
                        <li class="footer-mark"><a href="#">Blog</a></li>
                        <li class="footer-mark"><a href="#footer">Về chúng tôi</a></li>
                    </ul>
                </div>
            </div>
            <p>Copyright &copy; Công ty cổ phần dịch vụ Homestay4u</p>

        </footer>
    </form>
</body>
</html>
