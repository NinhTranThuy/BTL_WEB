using BTL_WEB.Class;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Security.Principal;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BTL_WEB.src
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected Label errorMessage; // Add this line

        protected void Page_Load(object sender, EventArgs e)
        {
            KiemTraDangNhap();
            HienDSPhong();
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

        public void HienDSPhong()
        {
            List<Room> rooms = (List<Room>)Application["ListRoom"];

            //Hien Thi Phong SALE
            int countSale = 0;
            string htmlSale = "";
            Random rnd = new Random();
            rooms = rooms.OrderBy(room => rnd.Next()).ToList();

            foreach (Room room in rooms)
            {
                if (countSale > 4) { break; }
                if (room.Discount > 0)
                {
                    htmlSale += $"<div class=\"content-container\" id=\"{room.RoomID}\" onclick=\"roomDetail_onClick(this.id)\">";
                    htmlSale += "<div class=\"ava\">";
                    htmlSale += "<div class=\"sale\">";
                    htmlSale += "<span class=\"text\">";
                    htmlSale += $"<span> -{room.Discount * 100}</span>";
                    htmlSale += "<span>%</span>";
                    htmlSale += "</span>";
                    htmlSale += "</div>";
                    htmlSale += "<img class=\"img-heart\" src=\"/asset/img/icon/heart-regular.svg\" alt=\"Favour\">";
                    htmlSale += $"<input type=\"hidden\" value=\"{room.RoomID}\">";
                    htmlSale += $"<img class=\"thumbnail-ava\" src=\"{room.Images.First()}\" alt=\"Homestay1\">";
                    htmlSale += "</div>";
                    htmlSale += "<div class=\"detail\">";
                    htmlSale += $"<h4>{room.RoomName}</h4>";
                    htmlSale += "<div class=\"address\">";
                    htmlSale += "<img src=\"/asset/img/icon/location-dot-solid.svg\" alt=\"Location\">";
                    htmlSale += $"<p>{room.Address}</p>";
                    htmlSale += "</div>";
                    htmlSale += "<div class=\"price\">";
                    htmlSale += $"<p id=\"discount\">{room.Price.ToString("#,###")}</p>";
                    htmlSale += $"<p id=\"cost\">{(room.Price * (1 - room.Discount)).ToString("#,###đ")}</p>";
                    htmlSale += "</div>";
                    htmlSale += "</div>";
                    htmlSale += "</div>";
                    countSale++;
                }
            }

            contentSale.InnerHtml = htmlSale;


            int countTrending = 0;
            string htmlTrending = "";
            rooms = rooms.OrderByDescending(room => room.Rate).ToList();
            foreach (Room room in rooms)
            {
                if (countTrending >= 4) { break; }
                if (room.Rate > 0.0f)
                {
                    htmlTrending += $"<div class=\"content-container\" id=\"{room.RoomID}\" onclick=\"roomDetail_onClick(this.id)\">";
                    htmlTrending += "<div class=\"ava\">";
                    if (room.Discount > 0)
                    {
                        htmlTrending += "<div class=\"sale\">";
                        htmlTrending += "<span class=\"text\">";
                        htmlTrending += $"<span> -{room.Discount * 100}</span>";
                        htmlTrending += "<span>%</span>";
                        htmlTrending += "</span>";
                        htmlTrending += "</div>";
                    }
                    htmlTrending += "<img class=\"img-heart\" src=\"/asset/img/icon/heart-regular.svg\" alt=\"Favour\">";
                    htmlTrending += $"<input type=\"hidden\" value=\"{room.RoomID}\">";
                    htmlTrending += $"<img class=\"thumbnail-ava\" src=\"{room.Images.First()}\" alt=\"Homestay1\">";
                    htmlTrending += "</div>";
                    htmlTrending += "<div class=\"detail\">";
                    htmlTrending += $"<h4>{room.RoomName}</h4>";
                    htmlTrending += "<div class=\"address\">";
                    htmlTrending += "<img src=\"/asset/img/icon/location-dot-solid.svg\" alt=\"Location\">";
                    htmlTrending += $"<p>{room.Address}</p>";
                    htmlTrending += "</div>";
                    htmlTrending += "<div class=\"price\">";
                    if (room.Discount > 0)
                    {
                        htmlTrending += $"<p id=\"discount\">{room.Price.ToString("#,###")}</p>";
                        htmlTrending += $"<p id=\"cost\">{(room.Price * (1 - room.Discount)).ToString("#,###đ")}</p>";
                    }
                    else
                    {
                        htmlTrending += $"<p id=\"cost\">{room.Price.ToString("#,###đ")}</p>";
                    }
                    htmlTrending += "</div>";
                    htmlTrending += "</div>";
                    htmlTrending += "</div>";
                    countTrending++;
                }
            }
            contentTrending.InnerHtml = htmlTrending;
        }
    }

    

}