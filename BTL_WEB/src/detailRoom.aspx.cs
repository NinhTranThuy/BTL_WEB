using BTL_WEB.Class;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace BTL_WEB.src
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        User userSession = new Class.User();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string idQuery = Request.QueryString["id"];
                if (!string.IsNullOrEmpty(idQuery))
                {
                    string idValue = HttpUtility.UrlDecode(idQuery);
                    KiemTraDangNhap();
                    HienThongTin(idValue);
                    HienHint(idValue);
                }
            }
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
        public void HienThongTin(string idValue)
        {
            List<Room> rooms = (List<Room>)Application["ListRoom"];

            foreach (Room room in rooms)
            {
                if (idValue.Equals(room.RoomID.ToString()))
                {
                    string htmlDetail = "";

                    //Room Ava
                    string htmlRoomAva = "";
                    for (int i = 0; i < room.Images.Count; i++)
                    {
                        string imageClass = i == 0 ? "large-image" : "small-image";
                        htmlRoomAva += $"<img class=\"{imageClass}\" src=\"{room.Images[i]}\" alt=\"Room\">";
                    }
                    room_ava.InnerHtml = htmlRoomAva;
                    // RoomName
                    room_name.InnerText = room.RoomName;
                    //Room Address
                    address.InnerText = room.Address;
                    //Room Rate
                    rate.InnerText = (room.Rate).ToString("#.#");
                    //Room Convienience
                    string htmlConvenience = "<ul>";
                    foreach (var convenience in room.Conveniences)
                    {
                        htmlConvenience += $"<li>{convenience}</li>";
                    }
                    htmlConvenience += "</ul>";
                    convenient.InnerHtml = htmlConvenience;
                    //Room Price
                    discountMain.InnerText = (room.Price * (1 - room.Discount)).ToString("#,###");
                    price.InnerText = room.Price.ToString("#,###");

                    //Room Description
                    description.InnerText = room.Description;
                    //Room Gallery
                    string htmlGallery = "";
                    foreach (var image in room.Images)
                    {
                        htmlGallery += $"<img src=\"{image}\" alt=\"Room\">";
                    }
                    gallery.InnerHtml = htmlGallery;
                }
            }
        }
        public void HienHint(string idValue)
        {
            List<Room> rooms = (List<Room>)Application["ListRoom"];
            List<Room> filteredRooms = rooms.Where(r => r.RoomID != idValue).ToList();
            Random rd = new Random();
            rooms = rooms.OrderBy(room => rd.Next()).ToList();

            int countTrending = 0;
            string htmlHint = "<div class=\"content\">";
            htmlHint += "<h2>Gợi ý phòng cho bạn nè</h2>\r\n";
            foreach (Room room in rooms)
            {
                if (countTrending >= 4) { break; }
                htmlHint += $"<div class=\"content-container\" id=\"{room.RoomID}\" onclick=\"roomDetail_onClick(this.id)\">";
                htmlHint += "<div class=\"ava\">";
                htmlHint += "<img class=\"img-heart\" src=\"/asset/img/icon/heart-regular.svg\" alt=\"Favour\">";
                htmlHint += $"<input type=\"hidden\" value=\"{room.RoomID}\">";
                htmlHint += $"<img class=\"thumbnail-ava\" src=\"{room.Images.First()}\" alt=\"Homestay1\">";
                htmlHint += "</div>";
                htmlHint += "<div class=\"hint-detail\">";
                htmlHint += $"<h4>{room.RoomName}</h4>";
                htmlHint += "<div class=\"address\">";
                htmlHint += "<img src=\"/asset/img/icon/location-dot-solid.svg\" alt=\"Location\">";
                htmlHint += $"<p>{room.Address}</p>";
                htmlHint += "</div>";
                htmlHint += "<div class=\"price\">";
                if (room.Discount > 0)
                {
                    htmlHint += $"<p id=\"discount\">{room.Price.ToString("#,###đ")}</p>";
                    htmlHint += $"<p id=\"cost\">{(room.Price * (1 - room.Discount)).ToString("#,###đ")}</p>";
                }
                else
                {
                    htmlHint += $"<p id=\"cost\">{room.Price.ToString("#,###đ")}</p>";
                }
                htmlHint += "</div>";
                htmlHint += "</div>";
                htmlHint += "</div>";
                countTrending++;
            }
            htmlHint += "</div>"; // Close the content div
            hintRoom.InnerHtml = htmlHint;
        }
        public void DatPhong(object sender, EventArgs e)
        {
            User userSession = (User)Session["user"];
            List<Room> rooms = (List<Room>)Application["ListRoom"];
            string idQuery = Request.QueryString["id"];
            string newCookies = "";
            bool checkExist = false;

            if (userSession != null)
            {
                String userCookie = Request.Cookies[userSession.Username]?.Value;

                if (string.IsNullOrEmpty(userCookie))
                {
                    // Cookies trống, tạo mới
                    string cookieValue = idQuery + "-" + DateTime.Now.ToString("dd/MM/yyyy") + "-Confirmed";
                    Response.Cookies[userSession.Username].Value = cookieValue;
                    Response.Cookies[userSession.Username].Expires = DateTime.Now.AddDays(15);
                    Response.Redirect("bookingList.aspx");
                }
                else
                {
                    string[] arr = userCookie.Split('_');

                    foreach (string arr1 in arr)
                    {
                        string[] r1 = arr1.Split('-'); // Tách RoomID, BookingDate, Status
                        if (idQuery == r1[0]) // So sánh RoomID
                        {
                            if (r1[2] == "Checkout")
                            {
                                newCookies = idQuery + "-" + DateTime.Now.ToString("dd/MM/yyyy") + "- Confirmed";
                            }
                            else
                            {
                                checkExist = true; // Phòng đã tồn tại
                                break;
                            }
                        }
                    }

                    if (checkExist == false)
                    {
                        // Phòng chưa tồn tại, thêm mới vào cookies
                        if (!string.IsNullOrEmpty(newCookies))
                        {
                            userCookie += "_" + newCookies;
                        }
                        else
                        {
                            newCookies = idQuery + "-" + DateTime.Now.ToString("dd/MM/yyyy") + "-Confirmed";
                            userCookie += "_" + newCookies;
                        }

                        Response.Cookies[userSession.Username].Value = userCookie;
                        Response.Cookies[userSession.Username].Expires = DateTime.Now.AddDays(15);
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Booking confirmed!');", true);
                        Response.Redirect("bookingList.aspx");
                    }
                    else
                    {
                        // Phòng đã tồn tại
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Room is already booked!');", true);
                        Response.Redirect("bookingList.aspx");
                    }
                }
            }
            else
            {
                string dn = HttpContext.Current.Request.Url.PathAndQuery;
                Session["SignIn"] = dn;
                Response.Redirect("signIn.aspx");
            }
        }

    }
}