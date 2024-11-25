<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="BTL_WEB.src.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home Page</title>
    <link rel="stylesheet" href="/asset/css/home.css">
    <link rel="shortcut icon" href="/asset/img/icon/favicon.ico" type="image/x-icon">
</head>
<body>
    <form id="home" runat="server" method="post">
        <header>
            <div class="header">
                <a href="./home.aspx">
                    <img class="logo" src="/asset/img/icon/logo.png" alt="Logo">
                </a>
                <nav>
                    <div class="left-nav">
                        <ul>
                            <li class="hover-effect"><a href="#">Trang chủ</a></li>
                            <li class="hover-effect"><a href="./blog.aspx">Blog</a></li>
                            <li class="hover-effect"><a href="#footer">Về chúng tôi</a></li>
                        </ul>
                    </div>

                    <div class="menu-toggle" aria-label="Open menu" onclick="">&#9776;</div>

                    <div class="right-nav">
                        <ul>
                            <li class="btn-favour-room hover-effect" style="visibility:hidden" id="adminButton" runat="server">  
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
        <main>
            <div class="main">
                <!-- Seach bar -->
                <section class="search-bar-section">
                    <div class="container">
                        <div class="title">
                            <h1>Hãy tìm kiếm nơi bạn muốn healing</h1>
                            <p>Chúng tôi cung cấp dịch vụ homestay tốt nhất cho bạn</p>
                        </div>
                        <div class="search-bar">
                            <div class="search-destination">
                                <img src="/asset/img/icon/search_24dp_E8EAED_FILL0_wght400_GRAD0_opsz24.svg">
                                <div class="seach-area">
                                    <label for="destination">Điểm đến</label>
                                    <input type="text" id="searchDestination" name="destination" placeholder="Bạn muốn đi đâu?" />
                                </div>
                            </div>
                            <button type="button" class="button-search" onclick="submitForm()">Tìm</button>
                        </div>
                    </div>
                </section>

                <!-- Room List -->
                <section class="list-room flash-sale">
                    <div class="container">
                        <div class="title">
                            <img class="flash-sale-icon" src="/asset/img/icon/icon_flashSale_home_white_new.png" alt="Flash Sale">
                            <p>Các homestay được tìm kiếm và đặt nhiều nhất do Homestay4u đề xuất</p>
                        </div>
                        <div class="content" id="contentSale" runat="server">
                        </div>
                        <button class="btn-view-more">Xem thêm</button>
                    </div>
                </section>

                <section class="list-room trending">
                    <div class="container">
                        <div class="title">
                            <h3>Đang thịnh hành</h3>
                            <p>Các homestay được tìm kiếm và đặt nhiều nhất do Homestay4u đề xuất</p>
                        </div>
                        <div class="content" id="contentTrending" runat="server">
                        </div>
                        <button class="btn-view-more">Xem thêm</button>
                    </div>
                </section>

                <!-- News -->
                <section class="news-list">
                    <div class="container">
                        <div class="title">
                            <h3>Tin tức</h3>
                            <p>Các bài viết mới nhất về homestay</p>
                        </div>
                        <div class="content">
                            <div class="content-container" id="news1" value="n1" onclick="newsDetail_onClick(this.id)">
                                <img class="thumbnail-ava" src="/asset/img/image/news/danang.jpg" alt="News1">
                                <div class="detail">
                                    <p id="post-date">20/10/2024</p>
                                    <h3>Homestay ở đâu đẹp nhất?</h3>
                                    <p>Homestay là một loại hình lưu trú phổ biến hiện nay,...</p>
                                </div>
                            </div>
                            <div class="content-container" id="news2" value="n2" onclick="newsDetail_onClick(this.id)">
                                <img class="thumbnail-ava" src="/asset/img/image/news/ha-long.jpg" alt="News2">
                                <div class="detail">
                                    <p id="post-date">20/10/2024</p>
                                    <h3>Homestay ở đâu đẹp nhất?</h3>
                                    <p>Homestay là một loại hình lưu trú phổ biến hiện nay,...</p>
                                </div>
                            </div>
                            <div class="content-container" id="news3" value="n3" onclick="newsDetail_onClick(this.id)">
                                <img class="thumbnail-ava" src="/asset/img/image/news/phu-quoc.jpg" alt="News2">
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
            </div>
        </main>
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
    document.querySelector('.menu-toggle').addEventListener('click', function () {
        document.querySelector('.left-nav').classList.toggle('active');
        document.querySelector('.right-nav').classList.toggle('active');
    });
    function submitForm() {
        const destination = document.getElementById('searchDestination').value.trim();

        if (!destination) {
            alert('Vui lòng nhập điểm đến!');
            return false;
        }

        // Mã hóa điểm đến (Unicode-friendly), sau đó thay thế '%20' thành dấu '+'
        const encodedDestination = encodeURIComponent(destination).replace(/%20/g, "+");

        // Xây dựng query string
        let queryString = `roomSearch.aspx?destination=${encodedDestination}`;

        // Redirect tới trang roomSearch.aspx với query string tùy chỉnh
        location.href = queryString;
    }

    function roomDetail_onClick(id) {
        var div = document.getElementById(id);

        // Tìm kiếm thẻ input con trong div và lấy giá trị của nó
        var input = div.querySelector("input[type='hidden']");
        var roomID = input.value;

        // Tạo query string và chuyển hướng đến trang chi tiết phòng
        let queryString = `detailRoom.aspx?id=${encodeURIComponent(roomID)}`;
        location.href = queryString; // Chuyển hướng đến trang chi tiết phòng
    }

    document.addEventListener("DOMContentLoaded", function () {
        const checkInInput = document.getElementById("check-in");
        const checkOutInput = document.getElementById("check-out");
        const today = new Date().toISOString().split('T')[0]; // Lấy ngày hiện tại theo định dạng YYYY-MM-DD
        checkInInput.min = today; // Thiết lập giá trị min là ngày hôm nay
        checkOutInput.min = today;
    });


    function datePicker_onclick(id) {
        const clickItem = document.getElementById(id);
        const picker = clickItem.querySelector('input[type="date"]');
        const text_span = clickItem.querySelector('span.fill-date');

        if (window.getComputedStyle(picker).display === "none") {
            text_span.style.display = "none";
            picker.style.display = "block";
            picker.focus();
            picker.showPicker();
        } else {
            picker.style.display = "block";
        }

        if (id === 'check-in-date') {
            const checkInDate = picker.value;
            const pickerCheckOut = document.getElementById("check-out-date");
            const checkOutInput = pickerCheckOut.querySelector('input[type="date"]');
        }

    }
</script>
</html>
