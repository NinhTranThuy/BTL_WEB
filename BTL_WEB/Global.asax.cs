using BTL_WEB.Class;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;

namespace BTL_WEB
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {
            
            //Nguoi dung
            Application["ListUser"] = new List<User>();
            List<User> listUser = (List<User>)Application["ListUser"];

            User user1 = new User();
            user1.Username = "admin";
            user1.Password = "admin";
            user1.Email = "admin@admin.com";
            user1.Phone = "0123456789";
            user1.Address = "Ha Noi";
            listUser.Add(user1);


            User user2 = new User();
            user2.Username = "ninh";
            user2.Password = "ninh";
            user2.Email = "ninh@ninh.com";
            user2.Phone = "0123456789";
            user2.Address = "Ha Noi";
            listUser.Add(user2);

            User user3 = new User();
            user3.Username = "anh";
            user3.Password = "anh";
            user3.Email = "anh@anh.com";
            user3.Phone = "0123456789";
            user3.Address = "Ha Noi";
            listUser.Add(user3);

            User user4 = new User();
            user4.Username = "tuyet";
            user4.Password = "tuyet";
            user4.Email = "tuyet@tuyet.com";
            user4.Phone = "0123456789";
            user4.Address = "Ha Noi";
            listUser.Add(user4);

            Application["ListUser"] = listUser;

            //Phong

            Application["ListRoom"] = new List<Room>();
            List<Room> listRoom = (List<Room>)Application["ListRoom"];

            Room room1 = new Room();
            room1.RoomID = "p01";
            room1.RoomName = "Mai Chau Countryside Homestay";
            room1.Address = "No.30 Pom Coong, Mai Châu";
            room1.Rate = 4.5f;
            room1.Description = "Với quầy bar, Mai Chau Countryside Homestay cung cấp chỗ nghỉ ở Mai Châu. Chỗ nghỉ có Wi-Fi miễn phí ở toàn bộ chỗ nghỉ và chỗ đậu xe riêng có sẵn trong khuôn viên.";
            room1.Images = new List<string>();
            room1.Images.Add("/asset/img/image/p01/p01.jpg");
            room1.Images.Add("/asset/img/image/p01/p01-1.jpg");
            room1.Images.Add("/asset/img/image/p01/p01-2.jpg");
            room1.Images.Add("/asset/img/image/p01/p01-3.jpg");
            room1.Conveniences = new List<string>();
            room1.Conveniences.Add("Free WiFi");
            room1.Conveniences.Add("Xe đưa đón sân bay");
            room1.Conveniences.Add("Dịch vụ phòng");
            room1.Conveniences.Add("Quầy bar");
            room1.Conveniences.Add("Chỗ đậu xe riêng");
            room1.Price = 1000000;
            room1.Discount = 0.5f;
            listRoom.Add(room1);

            Room room2 = new Room();
            room2.RoomID = "p02";
            room2.RoomName = "The Song Apartment - Mỡ Homestay";
            room2.Address = "28 Đường Thi Sách, Vũng Tàu";
            room2.Rate = 4.0f;
            room2.Description = "\"Cách Bãi Sau 9 phút đi bộ, The Song Apartment - Mỡ Homestay có hồ bơi ngoài trời, khu vườn, điều hòa, sân hiên và Wi-Fi miễn phí. Chỗ đậu xe riêng có sẵn trong khuôn viên.\r\n\r\nTất cả các căn đều có phòng tắm riêng, TV màn hình phẳng, bếp đầy đủ tiện nghi và ban công.\r\n\r\nKhách có thể sử dụng câu lạc bộ trẻ em tại căn hộ.\r\n\r\nThe Song Apartment - Mỡ Homestay cách Tượng Chúa Ki-tô 3.4 km và Khu du lịch sinh thái văn hóa Hồ Mây 3.8 km";
            room2.Images = new List<string>();
            room2.Images.Add("/asset/img/image/p02/p02.jpg");
            room2.Conveniences = new List<string>();
            room2.Conveniences.Add("Free WiFi");
            room2.Conveniences.Add("Ban công");
            room2.Conveniences.Add("Phòng tắm riêng");
            room2.Conveniences.Add("Tầm nhìn ra khung cảnh");
            room2.Price = 2000000;
            room2.Discount = 0.3f;
            listRoom.Add(room2);

            Room room3 = new Room();
            room3.RoomID = "p03";
            room3.RoomName = "Orimi Cafe & Homie Dalat";
            room3.Address = " 30 Đường An Bình, Ấp Xuân An";
            room3.Rate = 4.5f;
            room3.Description = "Orimi Cafe & Homie Dalat là một nơi nghỉ nằm trong khu vực an ninh, toạ lạc tại Phường 3. Quầy tiếp tân 24 giờ luôn sẵn sàng phục vụ quý khách từ thủ tục nhận phòng đến trả phòng hay bất kỳ yêu cầu nào. Nếu cần giúp đỡ xin hãy liên hệ đội ngũ tiếp tân, chúng tôi luôn sẵn sàng hỗ trợ quý khách. Sóng WiFi phủ khắp các khu vực chung của nơi nghỉ cho phép quý khách luôn kết nối với gia đình và bè bạn";
            room3.Images = new List<string>();
            room3.Images.Add("/asset/img/image/p03/p03.jpg");
            room3.Conveniences = new List<string>();
            room3.Conveniences.Add("Chỗ đỗ xe miễn phí");
            room3.Conveniences.Add("Dịch vụ phòng");
            room3.Conveniences.Add("Phòng gia đình");
            room3.Price = 1500000;
            room3.Discount = 0f;
            listRoom.Add(room3);

            Room room4 = new Room();
            room4.RoomID = "p04";
            room4.RoomName = "Moon Valley Villas Đà Lạt";
            room4.Address = " 31 Đường Đặng Thái Thân, Ấp Xuân An, Việt Nam";
            room4.Rate = 3.0f;
            room4.Description = "Tọa lạc ở Ấp Xuân An, cách Công viên Yersin 18 phút đi bộ, Moon Valley Villas Đà Lạt cung cấp chỗ nghỉ có khu vườn, chỗ đậu xe riêng miễn phí, phòng chờ chung và sân hiên. Khách sạn 2 sao này cung cấp quầy lễ tân 24 giờ và Wi-Fi miễn phí. Đây là chỗ nghỉ không gây dị ứng và nằm cách Hồ Xuân Hương 1.7 km.\r\nTại khách sạn, mỗi phòng đều có bàn làm việc, TV màn hình phẳng, phòng tắm riêng, ga trải giường và khăn tắm. Các phòng đều đi kèm với ấm đun nước, trong đó một số phòng có ban công và một số khác thì nhìn ra núi. Các phòng có tủ quần áo.\r\nMoon Valley Villas Đà Lạt cách Quảng trường Lâm Viên 1.8 km và Vườn hoa Đà Lạt 3.6 km. Sân bay gần nhất là Sân bay Liên Khương, cách chỗ nghỉ 26 km, đồng thời chỗ nghỉ có cung cấp dịch vụ đưa đón sân bay mất phí.\r\nCác cặp đôi đặc biệt thích địa điểm này — họ cho điểm 8,7 khi đánh giá chuyến đi hai người";
            room4.Images = new List<string>();
            room4.Images.Add("/asset/img/image/p04/p04-1.jpg");
            room4.Images.Add("/asset/img/image/p04/p04.jpg");
            room4.Conveniences = new List<string>();
            room4.Conveniences.Add("Free WiFi");
            room4.Conveniences.Add("Chỗ đậu xe riêng");
            room4.Conveniences.Add("Phòng không hút thuốc");
            room4.Conveniences.Add("Phòng gia đình");
            room4.Conveniences.Add("Xe đưa đón sân bay");
            room4.Price = 3000000;
            room4.Discount = 0.2f;
            listRoom.Add(room4);

            Room room5 = new Room();
            room5.RoomID = "p05";
            room5.RoomName = "Field House SaPa - Nậm Cang\r\n";
            room5.Address = " Thôn Nậm Cang, xã Liên Minh, Sa Pa,Lào Cai";
            room5.Rate = 4.5f;
            room5.Description = "\"Nhìn ra núi, Field House SaPa - Nậm Cang cung cấp chỗ nghỉ có khu vườn và ban công, cách Trạm cáp treo Fansipan khoảng 39 km. Homestay cung cấp chỗ đậu xe riêng miễn phí, quầy lễ tân 24 giờ và Wi-Fi miễn phí.\r\n\r\nKhăn tắm và ga trải giường có sẵn ở homestay.\r\n\r\nHomestay có phục vụ bữa sáng thực đơn à la carte hằng ngày.\r\n\r\nField House SaPa - Nậm Cang cách Hồ Sa Pa 34 km và Sa Pa Stone Church 34 km. Sân bay gần nhất là Sân bay Điện Biên Phủ, cách chỗ nghỉ 301 km.";
            room5.Images = new List<string>();
            room5.Images.Add("/asset/img/image/p05/p05.jpg");
            room5.Conveniences = new List<string>();
            room5.Conveniences.Add("Free WiFi");
            room5.Conveniences.Add("Chỗ đậu xe riêng");
            room5.Conveniences.Add("Bữa sáng");
            room5.Conveniences.Add("Phòng không hút thuố");
            room5.Price = 4500000;
            room5.Discount = 0.1f;
            listRoom.Add(room5);

            Room room6 = new Room();
            room6.RoomID = "p06";
            room6.RoomName = "Tả Mẩy Homestay";
            room6.Address = " Thôn Tả Mẩy, xã Tả Mẩy, huyện Phong Thổ, Lai Châu";
            room6.Description = "\"Tả Mẩy Homestay nhìn ra núi, có Wi-Fi miễn phí và chỗ đậu xe riêng miễn phí, nằm ở Lào Cai, cách Trạm cáp treo Fansipan 41 km.\r\n\r\nNơi đây còn có phòng tắm riêng với vòi xịt/chậu rửa vệ sinh ở tất cả các căn, cùng đồ vệ sinh cá nhân miễn phí, máy sấy tóc và dép đi trong phòng.\r\n\r\nKhách cũng có thể thư giãn trong khu vườn.\r\n\r\nHomestay cách Hồ Sa Pa 37 km và Sa Pa Stone Church 36 km. Sân bay gần nhất là Sân bay Điện Biên Phủ, cách Tả Mẩy Homestay 303 km, đồng thời chỗ nghỉ này cũng cung cấp dịch vụ đưa đón sân bay mất phí";
            room6.Rate = 5.0f;
            room6.Images = new List<string>();
            room6.Images.Add("/asset/img/image/p06/p06-1.jpg");
            room6.Conveniences = new List<string>();
            room6.Conveniences.Add("Free WiFi");
            room6.Conveniences.Add("Chỗ đậu xe riêng");
            room6.Conveniences.Add("Bữa sáng");
            room6.Conveniences.Add("Phòng không hút thuốc");
            room6.Price = 5000000;
            room6.Discount = 0.0f;
            listRoom.Add(room6);

        }

        protected void Session_Start(object sender, EventArgs e)
        {
        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}