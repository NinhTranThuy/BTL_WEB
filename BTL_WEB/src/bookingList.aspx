<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="bookingList.aspx.cs" Inherits="BTL_WEB.src.WebForm6" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Danh sách khách sạn đã đặt</title>
    <link rel="stylesheet" href="/asset/css/bookingList.css">
</head>
<body>
    <form id="bookingList" runat="server" method="post">
        <input type="hidden" id="huyphong" name="huyphong" runat="server" />
        <p id="test" runat="server"></p>
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
                            <li class="btn-favour-room hover-effect" style="visibility:hidden" id="adminButton" runat="server">  
                                <a href="admin.aspx">
                                    <span>Quản lý phòng</span>
                                </a>
                            </li>
                            <li class="adminPage">
                                <a href="admin.aspx">
                                    <img src="/asset/img/icon/admin.svg" alt="Admin">
                                    <span>Admin</span>
                                </a>
                            </li>
                            <li class="btn-favour-room hover-effect">
                                <a href="#">
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
        <div class="container">
            <h1>Danh sách khách sạn đã đặt</h1>
            .<div class="emptyMessage" id="emptyMessage" runat="server">
                <img src="../asset/img/icon/empty-box.png"
                <p>Hình như bạn chưa đặt phòng bao giờ?</p>
             </div>
            <ul class="hotel-list" id="bookingZone" runat="server">
            </ul>
        </div>
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
<script>
    function Huyphong(value) {
        var huyphong = document.getElementById("huyphong");
        huyphong.value = value;
    }
</script>
</html>