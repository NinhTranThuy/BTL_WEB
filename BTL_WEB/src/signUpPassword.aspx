<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="signUpPassword.aspx.cs" Inherits="BTL_WEB.src.WebForm10" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tạo mật khẩu - Hotel Booking</title>
    <link rel="stylesheet" href="/asset/css/account.css">
</head>
<body>
    <form id="signupPassword" runat="server" method="post">
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
                </nav>
            </div>
        </header>

    <div class="container">
        <h2>Tạo mật khẩu</h2>
        <form>
            <input type="password" placeholder="Mật khẩu" required>
            <input type="password" placeholder="Xác nhận mật khẩu" required>
            <button type="submit">Tạo tài khoản</button>
        </form>
        <div class="info">
            <p>Dùng ít nhất 10 ký tự, trong đó có chữ hoa, chữ thường và số.</p>
        </div>
    </div>
    <script>
        function redirectToHomepage() {
            string urlStr = Session["SignIn"].toString();
            alert('Tạo tài khoản thành công!');
            window.location.href = urlStr; 
            return false; 
        }
    </script>
    <footer>
        <div class="footer-detail">
            <div class="col-descrip">
                <img src="/asset/img/icon/logowhite.svg" alt="Logo">
                <h4>Công ty cổ phần dịch vụ Homestay4u</h4>
                <p>Tổng đài chăm sóc: 1900 1234</p>
                <P>Văn phòng tại: Tầng 55, tòa nhà Landmark 72 <br/> Lô E6, Khu đô thị mới Cầu Giấy, Nam Từ Liêm, Hà Nội</P>
                <p>Công ty cổ phần dịch vụ Homestay4u là lorem ipsum dolor sit amet,<br/> consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut<br/> labore et dolore magna aliqua.</p>
            </p>
            </div>
            <div class="col-link">
                <ul>
                    <li class="footer-mark"><a href = "#">Trang chủ</a></li>
                    <li class="footer-mark"><a href = "#">Blog</a></li>
                    <li class="footer-mark"><a href = "#footer">Về chúng tôi</a></li>
                </ul>
            </div>
        </div>
        <p>Copyright &copy; Công ty cổ phần dịch vụ Homestay4u</p>
     
    </footer>
    </form>
</body>
</html>
