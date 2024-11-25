<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="blog.aspx.cs" Inherits="BTL_WEB.src.WebForm12" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tin tức - Blog</title>
    <link rel="stylesheet" href="/asset/css/blog.css">
    <link rel="shortcut icon" href="/asset/img/icon/favicon.ico" type="image/x-icon">
</head>
<body>
    <form id="blog" runat="server" method="get">
        <header>
            <div class="header">
                <a href="./home.aspx">
                    <img class="logo" src="/asset/img/icon/logo.png" alt="Logo">
                </a>
                <nav>
                    <div class="left-nav">
                        <ul>
                            <li class="hover-effect"><a href="./home.aspx">Trang chủ</a></li>
                            <li class="hover-effect"><a href="#">Blog</a></li>
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
        <section class="news-list">
            <div class="container">
                <div class="title">
                    <h3>Tin tức</h3>
                    <p>Các bài viết mới nhất về homestay</p>
                </div>
                <div class="content">
                    <div class="content-container" onclick="window.location.href='detailblog.html?id=1';">
                        <img class="thumbnail-ava" src="/asset/img/image/news/danang.jpg" alt="News1">
                        <div class="detail">
                            <p id="post-date">20/10/2024</p>
                            <h3>Homestay ở đâu đẹp nhất?</h3>
                            <p>Homestay là một loại hình lưu trú phổ biến hiện nay,...</p>
                        </div>
                    </div>
                    <div class="content-container" onclick="window.location.href='detailblog.html?id=2';">
                        <img class="thumbnail-ava" src="/asset/img/image/news/ha-long.jpg" alt="News2">
                        <div class="detail">
                            <p id="post-date">20/10/2024</p>
                            <h3>Homestay ở đâu đẹp nhất?</h3>
                            <p>Homestay là một loại hình lưu trú phổ biến hiện nay,...</p>
                        </div>
                    </div>
                    <div class="content-container" onclick="window.location.href='detailblog.html?id=3';">
                        <img class="thumbnail-ava" src="/asset/img/image/news/phu-quoc.jpg" alt="News3">
                        <div class="detail">
                            <p id="post-date">20/10/2024</p>
                            <h3>Homestay ở đâu đẹp nhất?</h3>
                            <p>Homestay là một loại hình lưu trú phổ biến hiện nay,...</p>
                        </div>
                    </div>
                </div>
                <button class="btn-view-more">Xem thêm</button>
            </div>
        </section>
        <footer id="footer">
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
                </div>
                <div class="col-link">
                    <ul>
                        <li class="footer-mark"><a href="./home.aspx">Trang chủ</a></li>
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

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="blog.aspx.cs" Inherits="BTL_WEB.src.WebForm12" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tin tức - Blog</title>
    <link rel="stylesheet" href="/asset/css/blog.css">
    <link rel="shortcut icon" href="/asset/img/icon/favicon.ico" type="image/x-icon">
</head>
<body>
    <form id="blog" runat="server" method="get">
        <header>
            <div class="header">
                <a href="./home.aspx">
                    <img class="logo" src="/asset/img/icon/logo.png" alt="Logo">
                </a>
                <nav>
                    <div class="left-nav">
                        <ul>
                            <li class="hover-effect"><a href="./home.aspx">Trang chủ</a></li>
                            <li class="hover-effect"><a href="#">Blog</a></li>
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
        <section class="news-list">
            <div class="container">
                <div class="title">
                    <h3>Tin tức</h3>
                    <p>Các bài viết mới nhất về homestay</p>
                </div>
                <div class="content">
                    <div class="content-container" onclick="window.location.href='detailblog.html?id=1';">
                        <img class="thumbnail-ava" src="/asset/img/image/news/danang.jpg" alt="News1">
                        <div class="detail">
                            <p id="post-date">20/10/2024</p>
                            <h3>Homestay ở đâu đẹp nhất?</h3>
                            <p>Homestay là một loại hình lưu trú phổ biến hiện nay,...</p>
                        </div>
                    </div>
                    <div class="content-container" onclick="window.location.href='detailblog.html?id=2';">
                        <img class="thumbnail-ava" src="/asset/img/image/news/ha-long.jpg" alt="News2">
                        <div class="detail">
                            <p id="post-date">20/10/2024</p>
                            <h3>Homestay ở đâu đẹp nhất?</h3>
                            <p>Homestay là một loại hình lưu trú phổ biến hiện nay,...</p>
                        </div>
                    </div>
                    <div class="content-container" onclick="window.location.href='detailblog.html?id=3';">
                        <img class="thumbnail-ava" src="/asset/img/image/news/phu-quoc.jpg" alt="News3">
                        <div class="detail">
                            <p id="post-date">20/10/2024</p>
                            <h3>Homestay ở đâu đẹp nhất?</h3>
                            <p>Homestay là một loại hình lưu trú phổ biến hiện nay,...</p>
                        </div>
                    </div>
                </div>
                <button class="btn-view-more">Xem thêm</button>
            </div>
        </section>
        <footer id="footer">
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
                </div>
                <div class="col-link">
                    <ul>
                        <li class="footer-mark"><a href="./home.aspx">Trang chủ</a></li>
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
