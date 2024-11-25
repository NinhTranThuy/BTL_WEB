<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admin.aspx.cs" Inherits="BTL_WEB.src.WebForm5" EnableEventValidation="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin</title>
    <link rel="shortcut icon" href="/asset/img/icon/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="../asset/css/admin.css">
</head>
<body>
    <form id="admin" runat="server" method="post">
        <p id="test" runat="server"></p>
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
            <section id="admin-input" class="admin-input">
                <div class="input-box">
                    <h4>Mã Phòng</h4>
                    <input type="text" id="roomid" name="roomid" value="" runat="server" required>
                    <div id="alertMaPhong" name="alertMaPhong" class="alert" runat="server"></div>
                </div>

                <div class="input-box">
                    <h4>Tên Phòng</h4>
                    <input type="text" id="roomname" name="roomname" value="" runat="server" required>
                    <div id="alertTenPhong" name="alertTenPhong" class="alert" runat="server"></div>
                </div>

                <div class="input-box">
                    <h4>Địa chỉ</h4>
                    <input type="text" id="roomadress" name="roomadress" value="" runat="server" required>
                    <div id="alertDiachi" name="alertDiachi" class="alert" runat="server"></div>
                </div>

                <div class="input-box">
                    <h4>Đánh giá</h4>
                    <input type="number" id="rateInput" name="rateInput" value="" runat="server" required placeholder="0.0 - 5.0">
                    <div id="alertRate" name="alertRate" class="alert" runat="server"></div>
                </div>

                <div class="input-box">
                    <h4>Mô tả</h4>
                    <input type="text" id="descriptionInput" name="descriptionInput" value="" runat="server" required>
                    <div id="alertDiscript" name="alertDiscript" class="alert" runat="server"></div>
                </div>


                <div class="input-box uploadImg">
                    <h4>Chọn hình ảnh</h4>
                    <input type="file" id="fileInput" name="files" multiple accept="image/*" runat="server" required />

                    <!-- Thông báo lỗi -->
                    <div id="alertImage" class="alert" style="color: red; font-size: 14px; font-style: italic;" runat="server"></div>

                    <!-- Hiển thị ảnh preview -->
                    <div id="imagePreview" style="display: flex; flex-wrap: wrap; gap: 10px; margin-top: 10px;"></div>
                </div>


                <div class="input-box">
                    <h4>Tiện ích</h4>
                    <textarea required class="convenience" runat="server" id="roomconveniences" name="roomconveniences" rows="3" placeholder="Nhập tiện ích, cách nhau bởi dấu phẩy"></textarea>
                </div>


                <div class="input-box">
                    <h4>Giá</h4>
                    <input type="number" id="giasp" name="giasp" runat="server" required>
                    <div id="alertgia" name="alertgia" class="alert" runat="server"></div>
                </div>

                <div class="input-box">
                    <h4>Mức giảm giá</h4>
                    <input type="number" id="giamgia" name="giamgia" runat="server">
                    <div id="alertGiamgia" name="alertGiamgia" class="alert" runat="server" placeholder="0-100%"></div>
                </div>


            </section>
            <div class="buttonGroup">
                <button name="btnSubmit" id="btnAdd" runat="server" onserverclick="AddRoom">Thêm phòng</button>
                <button name="btnSubmit" id="btnUpdate" runat="server" onserverclick="UpdateRoom">Cập nhật</button>

            </div>
            <section id="dsPhong" runat="server">
            </section>
        </main>

    </form>
</body>
<script>
    // Gắn sự kiện onchange sau khi trang tải xong
    window.onload = function () {
        var fileInput = document.getElementById('<%= fileInput.ClientID %>');
        if (fileInput) {
            fileInput.addEventListener('change', previewImages);
        }
    };

    function previewImages() {
        var preview = document.getElementById("imagePreview");
        preview.innerHTML = ""; // Xóa nội dung cũ

        var files = document.getElementById('<%= fileInput.ClientID %>').files;
        if (files) {
            Array.from(files).forEach(file => {
                var reader = new FileReader();
                reader.onload = function (e) {
                    var img = document.createElement("img");
                    img.src = e.target.result;
                    img.style.width = "100px";
                    img.style.height = "100px";
                    img.style.objectFit = "cover";
                    preview.appendChild(img);
                };
                reader.readAsDataURL(file);
            });
        }
    }


    function suaPhong(clicked_value) {
        var sp = clicked_value.split("|");
        roomid.value = sp[0];
        roomname.value = sp[1];
        roomadress.value = sp[2];
        descriptionInput.value = sp[3];
        rateInput.value = sp[4];
        roomconveniences.value = sp[5];
        giasp.value = parseInt(sp[4]);
        giamgia.value = sp[5];
        location.href = "#admin-input";
    }
</script>
</html>
