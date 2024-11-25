using BTL_WEB.Class;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static System.Net.Mime.MediaTypeNames;

namespace BTL_WEB.src
{
    public partial class WebForm6 : System.Web.UI.Page
    {
        User userSession = new User();
        protected void Page_Load(object sender, EventArgs e)
        {
            KiemTraDangNhap();
            HienDSPhong();
            //test.InnerText = Request.Cookies[userSession.Username].Value;
            if (Request.Cookies[userSession.Username] != null )
            { 
                if (huyphong.Value != "")
                {
                    
                    HuyPhong(huyphong.Value);
                    huyphong.Value = "";
                }
            }
        }

        public void KiemTraDangNhap()
        {
            userSession = (User)Session["user"];
            if (userSession == null)
            {
                signout.Attributes["style"] = "display:none";
                notsignin.Attributes["style"] = "visibility:visible";
                notsignin.InnerText = "Đăng nhập";
                string dn = HttpContext.Current.Request.Url.PathAndQuery;
                Session["SignIn"] = dn;
                Response.Redirect("signIn.aspx");
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

        public void HienDSPhong()
        {
            User userSession = (User)Session["user"];
            List<Room> rooms = (List<Room>)Application["ListRoom"];
            string html = "";
            if (userSession != null)
            {   
                if (Request.Cookies[userSession.Username] != null && Request.Cookies[userSession.Username].Value != "")
                {
                    emptyMessage.Attributes["style"] = "display:none";
                    string cookiesListBooking = Request.Cookies[userSession.Username].Value;
                    string[] listBooking = cookiesListBooking.Split('_');
                    foreach (string booking in listBooking)
                    {
                        string[] bookingDetail = booking.Split('-');
                        foreach (Room room in rooms)
                        {
                            if (room.RoomID == bookingDetail[0])
                            {
                                string statusColor = GetStatusColor(bookingDetail[2]);
                                html += "<li class=\"hotel-item\" id=" + room.RoomID + ">";
                                html += "<img src=\"" + room.Images.First() + "\" alt=\"Khách sạn\" class=\"hotel-image\">";
                                html += "<div class=\"hotel-info\">";
                                html += "<h2>" + room.RoomName + "</h2>";
                                html += "<p>Địa chỉ: " + room.Address + "</p>";
                                html += "<p>Ngày đặt: " + bookingDetail[1] + "</p>";
                                html += "<p style=\"color:" + statusColor + "; font-size: 12px; font-style:italic;\">Trạng thái: " + bookingDetail[2].ToString() + "</p>";
                                html += "</div>";
                                html += "<div class=\"hotel-actions\">";
                                html += "<button runat=\"server\" class=\"cancel\" value = \"" + room.RoomID + "-" + bookingDetail[1] + "\" onclick=\"Huyphong(this.value)\" value=\"" + bookingDetail[0] + "-" + bookingDetail[1] + "\">Hủy đặt phòng</button>";
                                html += "</div>";
                                html += "</li>";
                            }
                        }
                    }
                    bookingZone.InnerHtml = html;
                }
                else
                {
                    emptyMessage.Attributes["style"] = "display:flex";
                    bookingZone.InnerHtml = html;
                }
                
            }
        }

        private string GetStatusColor(string status)
        {
            switch (status.ToLower())
            {
                case "confirmed":
                    return "green";
                case "cending":
                    return "orange";
                case "cancelled":
                    return "red";
                default:
                    return "black";
            }
        }

        public void HuyPhong(string cancelRoom)
        {
            User userSession = (User)Session["user"];
            string cookiesListBooking = Request.Cookies[userSession.Username].Value;

            if (cookiesListBooking == null)
            {
                return; // Không có gì để hủy
            }

            string[] cancelDetail = cancelRoom.Split('-');
            string[] listBooking = cookiesListBooking.Split('_');
            string newCookiesListBooking = "";

            foreach (string cookie in listBooking)
            {
                string[] inforRoom = cookie.Split('-');
                if (cancelDetail[0] == inforRoom[0] && cancelDetail[1] == inforRoom[1])
                {
                    continue; // Loại bỏ phòng đã hủy
                }
                else
                {
                    newCookiesListBooking += (newCookiesListBooking.Length > 0 ? "_" : "") + cookie;
                }
            }

            // Cập nhật cookies
            if (string.IsNullOrEmpty(newCookiesListBooking))
            {
                Response.Cookies[userSession.Username].Value = ""; // Xóa cookies
                Response.Cookies[userSession.Username].Expires = DateTime.Now.AddDays(-1);
            }
            else
            {
                Response.Cookies[userSession.Username].Value = newCookiesListBooking;
                Response.Cookies[userSession.Username].Expires = DateTime.Now.AddDays(15);
            }

            // Buộc tải lại trang
            Response.Redirect(Request.RawUrl);
        }

    }
}