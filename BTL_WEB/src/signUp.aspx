<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="signUp.aspx.cs" Inherits="BTL_WEB.src.WebForm9" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng ký </title>
    <link rel="stylesheet" href="/asset/css/account.css">
</head>
<body>
    <form id="signup" runat="server" method="post">
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
        <h2 id="checkcheck" runat="server">Đăng ký</h2>
            <input type="text" name="username" id="username" placeholder="Username" required>
            <div id="errorName" runat="server" style="font-size: 12px; color: red; font-style:italic"> </div>
            <input type="password" name="password" id="password" placeholder="Password" required />
            <input runat="server" type="email" name="email" id="email" placeholder="Email" required />
            <div id="errorEmail" runat="server" style="font-size: 12px; color: red; font-style:italic"> </div>
            <input type="tel" name="phone" id="phone" placeholder="SDT" required />
            <div id="errorPhone" runat="server" style="font-size: 12px; color: red; font-style:italic"> </div>
            <input type="text" name="address" id="address" placeholder="Thành phố" required />
            <button type="submit">Tiếp tục</button>
        <div class="switch">
            <p>Đã có tài khoản? <a href="signIn.aspx">Đăng nhập</a></p>
        </div>
    </div>
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
                    <li class="footer-mark"><a href = "home.html">Trang chủ</a></li>
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
