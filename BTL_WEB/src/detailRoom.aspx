<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="detailRoom.aspx.cs" Inherits="BTL_WEB.src.WebForm4" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mai Chau Countryside Homestay</title>
    <link rel="stylesheet" href="/asset/css/detailRoom.css">
    <link rel="shortcut icon" href="/asset/img/icon/favicon.ico" type="image/x-icon">
</head>
<body>
    <form id="detailRoom" runat="server" method="post">
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
        <h2 runat="server" id="test"></h2>
        <main id="main" runat="server">
            <p><a href="home.aspx"><b>Trang chủ</b></a> / <b>Chi tiết phòng</b></p>
            <section id="summary" class="summary">

                <div class="room_ava" id="room_ava" runat="server">
                </div>
                <div class="name">
                    <p class="room-name" id="room_name" runat="server"></p>
                    <hr />
                    <div class="address">
                        <img src="/asset/img/icon/location-dot-solid.svg" alt="Location">
                        <p id="address" runat="server"></p>
                    </div>
                    <div class="star-rate">
                        <img src="/asset/img/icon/star-solid.svg" alt="Star">
                        <p id="rate" runat="server">4.5</p>
                    </div>
                    <div class="convenient" id="convenient" runat="server">
                    </div>

                    <div class="booking">
                        <div class="price_booking">
                            <p>Giá/phòng/đêm từ</p>
                            <p id="discountMain" runat="server">2.000.000đ</p>
                            <p id="price" runat="server">1.000.000đ</p>
                            <button id="btnBooking" onserverclick="DatPhong" runat="server">Đặt Phòng</button>
                        </div>
                    </div>
                </div>
            </section>
            <section id="detail" class="detail">
                <h2>Thông tin chi tiết</h2>
                <p class="room-name" id="room_name"></p>
                <p id="description" runat="server"></p>
                <div class="gallery" id="gallery" runat="server">
                    <img src="/asset/img/image/p01/p01-1.jpg" alt="Room">
                    <img src="/asset/img/image/p01/p01.jpg" alt="Room">
                    <img src="/asset/img/image/p01/p01-2.jpg" alt="Room">
                    <img src="/asset/img/image/p01/p01-3.jpg" alt="Room">
                </div>
            </section>
        </main>
        <section id="hintRoom" class="hintRoom">
            <div class="containter" id="hintRoom" runat="server">
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
    function roomDetail_onClick(id) {
        var div = document.getElementById(id);

        // Tìm kiếm thẻ input con trong div và lấy giá trị của nó
        var input = div.querySelector("input[type='hidden']");
        var roomID = input.value;

        // Tạo query string và chuyển hướng đến trang chi tiết phòng
        let queryString = `detailRoom.aspx?id=${encodeURIComponent(roomID)}`;
        location.href = queryString; // Chuyển hướng đến trang chi tiết phòng
    }
</script>
</html>
