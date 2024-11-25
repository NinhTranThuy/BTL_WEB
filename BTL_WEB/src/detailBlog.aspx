<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="detailBlog.aspx.cs" Inherits="BTL_WEB.src.WebForm13" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chi Tiết Tin Tức</title>
    <link rel="stylesheet" href="/asset/css/blog.css">
    <link rel="shortcut icon" href="/asset/img/icon/favicon.ico" type="image/x-icon">
</head>
<body>
    <form id="detailBlog" runat="server">
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
                                <a id="A1" class="sign-in" href="#" runat="server" onserverclick="SaveUrl">
                                    <img src="/asset/img/icon/user-regular.svg" alt="User">
                                    <span id="Span1" runat="server">Đăng nhập</span>
                                    <span id="Span2" runat="server">Exit</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </nav>
            </div>
        </header>

        <section class="news-detail">
            <div class="container">
                <div class="title">
                    <h2 id="news-title">Chi Tiết Tin Tức</h2>
                </div>
                <div class="content">
                    <img class="thumbnail" src="" alt="News Image">
                    <div class="detail">
                        <p id="post-date">Ngày đăng: </p>
                        <h3 id="news-heading"></h3>
                        <p id="news-content"></p>
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
                        Văn phòng tại: Tầng 55, tòa nhà Landmark 72<br />
                        Lô E6, Khu đô thị mới Cầu Giấy, Nam Từ Liêm, Hà Nội
                    </p>
                    <p>Công ty cổ phần dịch vụ Homestay4u là lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
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
<script>
    document.addEventListener("DOMContentLoaded", function () {
        const urlParams = new URLSearchParams(window.location.search);
        const newsId = urlParams.get('id');

        const newsDetails = {
            1: {
                title: "Homestay ở đâu đẹp nhất?",
                date: "20/10/2024",
                content: "Nội dung chi tiết của bài viết. Homestay là một loại hình lưu trú phổ biến hiện nay...",
                image: "/asset/img/image/news/danang.jpg"
            },
            2: {
                title: "Homestay ở đâu đẹp nhất?",
                date: "20/10/2024",
                content: "Nội dung chi tiết của bài viết. Homestay là một loại hình lưu trú phổ biến hiện nay...",
                image: "/asset/img/image/news/ha-long.jpg"
            },
            3: {
                title: "Homestay ở đâu đẹp nhất?",
                date: "20/10/2024",
                content: "Nội dung chi tiết của bài viết. Homestay là một loại hình lưu trú phổ biến hiện nay...",
                image: "/asset/img/image/news/phu-quoc.jpg"
            }
        };

        if (newsDetails[newsId]) {
            document.getElementById('news-title').textContent = newsDetails[newsId].title;
            document.getElementById('post-date').textContent = "Ngày đăng: " + newsDetails[newsId].date;
            document.getElementById('news-content').textContent = newsDetails[newsId].content;
            document.querySelector('.thumbnail').src = newsDetails[newsId].image;
            document.querySelector('.thumbnail').alt = newsDetails[newsId].title;
        } else {
            document.getElementById('news-title').textContent = "Không tìm thấy thấy bài viết";
            document.getElementById('news-content').textContent = "";
        }
    });
</script>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="detailBlog.aspx.cs" Inherits="BTL_WEB.src.WebForm13" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chi Tiết Tin Tức</title>
    <link rel="stylesheet" href="/asset/css/blog.css">
    <link rel="shortcut icon" href="/asset/img/icon/favicon.ico" type="image/x-icon">
</head>
<body>
    <form id="detailBlog" runat="server">
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
                            <li class="btn-favour-room hover-effect">
                                <a href="roomList.aspx">
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

        <section class="news-detail">
            <div class="container">
                <div class="title">
                    <h2 id="news-title">Chi Tiết Tin Tức</h2>
                </div>
                <div class="content">
                    <img class="thumbnail" src="" alt="News Image">
                    <div class="detail">
                        <p id="post-date">Ngày đăng: </p>
                        <h3 id="news-heading"></h3>
                        <p id="news-content"></p>
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
                        Văn phòng tại: Tầng 55, tòa nhà Landmark 72<br />
                        Lô E6, Khu đô thị mới Cầu Giấy, Nam Từ Liêm, Hà Nội
                    </p>
                    <p>Công ty cổ phần dịch vụ Homestay4u là lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
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
<script>
    document.addEventListener("DOMContentLoaded", function () {
        const urlParams = new URLSearchParams(window.location.search);
        const newsId = urlParams.get('id');

        const newsDetails = {
            1: {
                title: "Homestay ở đâu đẹp nhất?",
                date: "20/10/2024",
                content: "Nội dung chi tiết của bài viết. Homestay là một loại hình lưu trú phổ biến hiện nay...",
                image: "/asset/img/image/news/danang.jpg"
            },
            2: {
                title: "Homestay ở đâu đẹp nhất?",
                date: "20/10/2024",
                content: "Nội dung chi tiết của bài viết. Homestay là một loại hình lưu trú phổ biến hiện nay...",
                image: "/asset/img/image/news/ha-long.jpg"
            },
            3: {
                title: "Homestay ở đâu đẹp nhất?",
                date: "20/10/2024",
                content: "Nội dung chi tiết của bài viết. Homestay là một loại hình lưu trú phổ biến hiện nay...",
                image: "/asset/img/image/news/phu-quoc.jpg"
            }
        };

        if (newsDetails[newsId]) {
            document.getElementById('news-title').textContent = newsDetails[newsId].title;
            document.getElementById('post-date').textContent = "Ngày đăng: " + newsDetails[newsId].date;
            document.getElementById('news-content').textContent = newsDetails[newsId].content;
            document.querySelector('.thumbnail').src = newsDetails[newsId].image;
            document.querySelector('.thumbnail').alt = newsDetails[newsId].title;
        } else {
            document.getElementById('news-title').textContent = "Không tìm thấy thấy bài viết";
            document.getElementById('news-content').textContent = "";
        }
    });
</script>
</html>
