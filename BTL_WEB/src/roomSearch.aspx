<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="roomSearch.aspx.cs" Inherits="BTL_WEB.src.WebForm2" EnableEventValidation="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home Page</title>
    <link rel="stylesheet" href="/asset/css/roomSearch.css">
    <link rel="shortcut icon" href="/asset/img/icon/favicon.ico" type="image/x-icon">
</head>
<body>
    <form id="roomSearch" method="get" action="roomList.aspx" runat="server">
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
        <main>
            <section class="search-bar-section">
                <div class="container">
                    <div class="search-bar">
                        <div class="search-destination">
                            <img src="/asset/img/icon/search_24dp_E8EAED_FILL0_wght400_GRAD0_opsz24.svg">
                            <div class="seach-area">
                                <label for="destination">Điểm đến</label>
                                <input type="text" id="searchDestination" name="destination" placeholder="Bạn muốn đi đâu?" runat="server" />
                            </div>
                        </div>
                        <!-- Sử dụng asp:Button thay cho <button> -->
                        <asp:Button ID="btnSearch" runat="server" Text="Tìm" OnClick="Search" CssClass="button-search" />
                    </div>
                </div>
            </section>

            <section class="search-result">
                <div class="content">
                    <h2 id="stringSearchResult" runat="server">Kết quả tìm kiếm: </h2>
                    <div class="result-container" id="resultContainer" runat="server">
                    </div>
                </div>
            </section>

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
    function submitForm() {
        const destination = document.getElementById('searchDestination').value.trim();

        if (!destination) {
            alert('Vui lòng nhập điểm đến!');
            return false;
        }

        // Xây dựng query string
        let queryString = `roomList.aspx?destination=${encodeURIComponent(destination)}`;

        // Redirect tới trang roomList.aspx với query string tùy chỉnh
        location.href = queryString;  // Điều hướng mà không làm mới trang
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

</script>
</html>
