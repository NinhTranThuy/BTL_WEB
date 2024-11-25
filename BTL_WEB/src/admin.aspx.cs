using BTL_WEB.Class;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static System.Net.Mime.MediaTypeNames;

namespace BTL_WEB.src
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            KiemTraDangNhap();
            HienDS();
        }

        public void KiemTraDangNhap()
        {
            User userSession = (User)Session["user"];
            if (userSession == null)
            {
                signout.Attributes["style"] = "display:none";
                notsignin.Attributes["style"] = "visibility:visible";
                notsignin.InnerText = "Đăng nhập";
            }
            else
            {
                notsignin.InnerText = "Chào " + userSession.Username;
                signout.Attributes["style"] = "display:visibility";
                if (userSession.Username == "admin")
                {
                    adminButton.Attributes["style"] = "visibility:visible";
                }
            }
        }

        public void SaveUrl(object sender, EventArgs e)
        {
            if (Session["User"] == null)
            {
                //Neu chua ton tai User --> Chua Dang nhap
                string dn = HttpContext.Current.Request.Url.PathAndQuery;
                Session["SignIn"] = dn;
                Response.Redirect("signIn.aspx");
            }
            else
            {
                //Neu da dang nhap --> Ton tai user
                DangXuat();
            }

        }
        public void DangXuat()
        {
            signout.Attributes["style"] = "display:none";
            notsignin.Attributes["style"] = "visibility:visible";
            notsignin.InnerText = "Đăng nhập";
            Session.Remove("User");
            Response.Redirect("home.aspx");
        }

        public void HienDS()
        {
            List<Room> listRooms = (List<Room>)Application["ListRoom"];
            string output = "<table>\r\n<thead>\r\n<td>ID</td>\r\n<td>Tên phòng</td>\r\n<td>Địa chỉ</td>\r\n<td>Mô tả</td>\r\n<td>Đánh giá</td>\r\n<td>Tiện ích</td>\r\n<td>Giá</td>\r\n<td>Giảm giá</td>\r\n<td>Ảnh</td>\r\n</thead>\r\n<tbody>\r\n";
            foreach (Room room in listRooms)
            {
                string conveniencesDisplay = string.Join(", ", room.Conveniences);
                output += "<tr>\r\n" +
                                  "<td>" + room.RoomID + "</td>\r\n" +
                                  "<td>" + room.RoomName + "</td>\r\n" +
                                  "<td>" + room.Address + "</td>\r\n" +
                                  "<td>" + room.Description + "</td>\r\n" +
                                  "<td>" + room.Rate + "</td>\r\n" +
                                  "<td>" + conveniencesDisplay + "</td>\r\n" +
                                  "<td>" + room.Price.ToString("##.###đ") + "</td>\r\n" +
                                  "<td>" + (room.Discount * 100).ToString("0.##") + "%</td>\r\n" +
                                  "<td><img src=\"" + room.Images.First() + "\" alt=\"anh-sp\"></td>\r\n" +
                                  "<td><button type=\"button\" value=\"" + room.RoomID + "|" + room.RoomName + "|" + room.Address + "|" + room.Description + "|" + room.Rate + "|" + conveniencesDisplay + "|" + room.Price + "|" + room.Discount + "\" onclick=\"suaPhong(this.value)\">Chọn</button></td>\r\n</tr>\r\n";
            }
            output += "</table>";
            dsPhong.InnerHtml = output;
        }

        protected void AddRoom(object sender, EventArgs e)
        {
            Room newRoom = new Room();
            //Lay du lieu
            string roomId = roomid.Value;  // Lấy giá trị của input Mã Phòng
            newRoom.RoomID = roomId;
            string roomName = roomname.Value;  // Lấy giá trị của input Tên Phòng
            newRoom.RoomName = roomName;
            string roomAddress = roomadress.Value;  // Lấy giá trị của input Địa chỉ
            newRoom.Address = roomAddress;
            string rate = rateInput.Value;
            float rating = 0f;// Lấy giá trị của input Đánh giá
            if (float.TryParse(rate, out rating))
            {
                // Nếu giá trị nhập vào lớn hơn hoặc bằng 1, giả sử người dùng nhập phần trăm dưới dạng số nguyên (ví dụ: 66% = 66)
                if (rating >= 1)
                {
                    newRoom.Rate = rating / 10f; // Chia cho 100 để chuyển thành thập phân
                }
                else
                {
                    // Nếu giá trị nhập vào nhỏ hơn 1, nó đã là phần thập phân hợp lệ (ví dụ: 0.66 = 66%)
                    newRoom.Rate = rating;
                }
            }
            else
            {
                // Xử lý khi giá trị không hợp lệ (chẳng hạn gán giá trị mặc định là 0)
                newRoom.Rate = 0f;
            }
;
            string description = descriptionInput.Value;  // Lấy giá trị của input Mô tả
            newRoom.Description = description;
            decimal price = decimal.Parse(giasp.Value);  // Lấy giá trị của input Giá
            newRoom.Price = (float)price;
            float discount = 0f;
            string discountValue = giamgia.Value;
            if (float.TryParse(discountValue, out discount))
            {
                // Nếu giá trị nhập vào lớn hơn hoặc bằng 1, giả sử người dùng nhập phần trăm dưới dạng số nguyên (ví dụ: 66% = 66)
                if (discount >= 1)
                {
                    newRoom.Discount = discount / 100f; // Chia cho 100 để chuyển thành thập phân
                }
                else
                {
                    // Nếu giá trị nhập vào nhỏ hơn 1, nó đã là phần thập phân hợp lệ (ví dụ: 0.66 = 66%)
                    newRoom.Discount = discount;
                }
            }
            else
            {
                // Xử lý khi giá trị không hợp lệ (chẳng hạn gán giá trị mặc định là 0)
                newRoom.Discount = 0f;
            }

            //Conveniences
            List<string> conveniencesList = roomconveniences.Value
            .Split(',')
            .Select(a => a.Trim())
            .Where(a => !string.IsNullOrEmpty(a))
            .ToList();
            newRoom.Conveniences = conveniencesList;
            
            //Nhap anh
            List<String> imgUrlList = new List<string>();

            string folderPath = Server.MapPath($"/asset/img/image/{roomId}/");

            // Tạo thư mục nếu chưa tồn tại
            if (!Directory.Exists(folderPath))
            {
                Directory.CreateDirectory(folderPath);
            }

            // Kiểm tra số file được tải lên
            if (Request.Files.Count > 0)
            {
                for (int i = 0; i < Request.Files.Count; i++)
                {
                    HttpPostedFile uploadedFile = Request.Files[i];

                    // Kiểm tra file hợp lệ
                    if (uploadedFile.ContentLength > 0)
                    {
                        string fileName = Path.GetFileName(uploadedFile.FileName);
                        string filePath = Path.Combine(folderPath, fileName);
                        string virtualPath = $"/asset/img/image/{roomId}/{fileName}"; // Đường dẫn tương thích trình duyệt
                        imgUrlList.Add(virtualPath); // Thêm URL

                        test.InnerText = filePath;
                        // Lưu file vào server
                        uploadedFile.SaveAs(filePath);

                    }
                }

                // Thông báo thành công
                alertImage.InnerText = "Tải ảnh lên thành công!";
                alertImage.Style["color"] = "green";
            }
            else
            {
                // Thông báo nếu không có file
                alertImage.InnerText = "Vui lòng chọn ít nhất một file để tải lên.";
                alertImage.Style["color"] = "red";
            }

            newRoom.Images = imgUrlList;

            List<Room> listRooms = (List<Room>) Application["ListRoom"];
            List<Room> newRoomList = new List<Room>();
            newRoomList.Add(newRoom);
            //string output = "<table>\r\n<thead>\r\n<td>ID</td>\r\n<td>Tên phòng</td>\r\n<td>Địa chỉ</td>\r\n<td>Mô tả</td>\r\n<td>Đánh giá</td>\r\n<td>Giá</td>\r\n<td>Giảm giá</td>\r\n<td>Tiện ích</td>\r\n<td>Ảnh</td>\r\n</thead>\r\n<tbody>\r\n";
            foreach (Room room in listRooms)
            {
                newRoomList.Add(room);
                //output += "<tr>\r\n" +
                //                  "<td>" + room.RoomID + "</td>\r\n" +
                //                  "<td>" + room.RoomName + "</td>\r\n" +
                //                  "<td>" + room.Address + "</td>\r\n" +
                //                  "<td>" + room.Description + "</td>\r\n" +
                //                  "<td>" + room.Rate + "</td>\r\n" +
                //                  "<td>" + room.Conveniences + "</td>\r\n" +
                //                  "<td>" + room.Price.ToString("##.###đ") + "</td>\r\n" +
                //                  "<td>" + room.Discount * 100 + "</td>\r\n" +
                //                  "<td><img src=\"" + room.Images.First() + "\" alt=\"anh-sp\"></td>\r\n" +
                //                  "<td><button type=\"button\" value=\"" + room.RoomID + "|" + room.RoomName + "|" + room.Address + "|" + room.Description + "|" + room.Rate + "|" + room.Conveniences + "|" + room.Price + "|" + room.Discount + "\" onclick=\"suaPhong(this.value)\">Chọn</button></td>\r\n</tr>\r\n";
            }
            //output += "</table>";
            //dsPhong.InnerHtml = output;
            Application["ListRoom"] = newRoomList;
            Response.Redirect("admin.aspx");
        }
        protected void UpdateRoom(object sender, EventArgs e)
        {
            List<Room> rooms = (List<Room>)Application["ListRoom"];
            List<Room> updatedRooms = new List<Room>();
            if (!string.IsNullOrEmpty(roomid.Value))
            {
                string roomName = roomname.Value;
                string roomAddress = roomadress.Value;
                string description = descriptionInput.Value;
                string rateValue = rateInput.Value;
                string priceValue = giasp.Value;
                string discountValue = giamgia.Value;
                string conveniencesValue = roomconveniences.Value;
                HttpPostedFile uploadedFile = Request.Files["fileInput"];

                foreach (Room room in rooms)
                {
                    if (room.RoomID == roomid.Value)
                    {
                        room.RoomName = roomName;
                        room.Address = roomAddress;
                        room.Description = description;

                        // Cập nhật giá trị đánh giá
                        if (float.TryParse(rateValue, out float rate))
                        {
                            room.Rate = rate;
                        }

                        // Cập nhật giá trị giá
                        if (decimal.TryParse(priceValue, out decimal price))
                        {
                            room.Price = (float)price;
                        }

                        // Cập nhật giá trị giảm giá
                        if (float.TryParse(discountValue, out float discount))
                        {
                            room.Discount = discount >= 1 ? discount / 100f : discount;
                        }

                        // Cập nhật tiện ích
                        List<string> conveniencesList = conveniencesValue
                            .Split(',')
                            .Select(a => a.Trim())
                            .Where(a => !string.IsNullOrEmpty(a))
                            .ToList();
                        room.Conveniences = conveniencesList;

                        // Cập nhật hình ảnh
                        if (uploadedFile != null && uploadedFile.ContentLength > 0)
                        {
                            string folderPath = Server.MapPath($"/asset/img/image/{room.RoomID}/");

                            // Tạo thư mục nếu chưa tồn tại
                            if (!Directory.Exists(folderPath))
                            {
                                Directory.CreateDirectory(folderPath);
                            }

                            string fileName = Path.GetFileName(uploadedFile.FileName);
                            string filePath = Path.Combine(folderPath, fileName);
                            string virtualPath = $"/asset/img/image/{room.RoomID}/{fileName}"; // Đường dẫn tới ảnh

                            // Lưu ảnh vào server
                            uploadedFile.SaveAs(filePath);

                            // Cập nhật đường dẫn ảnh
                            room.Images.Add(virtualPath);
                        }

                        updatedRooms.Add(room);
                    }
                    else
                    {
                        updatedRooms.Add(room);
                    }
                }

                // Cập nhật danh sách phòng
                Application["ListRoom"] = updatedRooms;
                Response.Redirect("admin.aspx");
            }
        }
    }



}