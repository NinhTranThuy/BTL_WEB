using BTL_WEB.Class;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BTL_WEB.src
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            KiemTraDangNhap();
            TimKiemTruyenTuHome();
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


        public void TimKiemTruyenTuHome()
        {
            
            string searchStr;
            string queryString = Request.QueryString["destination"];
            string decodeStr = HttpUtility.UrlDecode(queryString);
            if (decodeStr != null)
            {
                searchStr = decodeStr.Replace("+", " ");
            }
            else
            {
                stringSearchResult.InnerText = "Không tìm thấy kết quả nào phù hợp";
                return;
            }
            // Hiển thị chuỗi tìm kiếm trong placeholder
            //destination.Attributes["placeholder"] = searchStr;
            searchDestination.Value = searchStr;
            stringSearchResult.InnerText += searchStr;

            TimKiemPhong(searchStr);
        }
        public void TimKiemPhong(string searchStr)
        {
            // Tìm kiếm tương đối
            List<Room> rooms = (List<Room>)Application["ListRoom"];

            var roomFilter = rooms.Where(room =>
                !string.IsNullOrEmpty(searchStr) &&
                ((room.RoomName?.ToLower().Contains(searchStr.ToLower()) ?? false) ||
                     (room.Address?.ToLower().Contains(searchStr.ToLower()) ?? false)
                )
            ).ToList();


            // Hiển thị kết quả tìm kiếm
            string htmlSearch = "";
            if (roomFilter.Count > 0)
            {
                foreach (var room in roomFilter)
                {
                    htmlSearch += $"<div class=\"content-container\" id=\"{room.RoomID}\" onclick=\"roomDetail_onClick(this.id)\">";
                    htmlSearch += $"    <div class=\"ava\">";
                    htmlSearch += $"        <img class=\"img-heart\" src=\"/asset/img/icon/heart-regular.svg\" alt=\"Favour\">";
                    htmlSearch += $"        <input type=\"hidden\" value=\"{room.RoomID}\">";
                    htmlSearch += $"        <img class=\"thumbnail-ava\" src=\"{room.Images.First()}\" alt=\"{room.RoomName}\">";
                    htmlSearch += $"    </div>";
                    htmlSearch += $"    <div class=\"detail\">";
                    htmlSearch += $"        <h4>{room.RoomName}</h4>";
                    htmlSearch += $"        <div class=\"address\">";
                    htmlSearch += $"            <img src=\"/asset/img/icon/location-dot-solid.svg\" alt=\"Location\">";
                    htmlSearch += $"            <p>{room.Address}</p>";
                    htmlSearch += $"        </div>";
                    htmlSearch += $"        <div class=\"convenient\">";
                    htmlSearch += $"            <ul>";
                    foreach (var convenience in room.Conveniences)
                    {
                        htmlSearch += $"                <li>{convenience}</li>";
                    }
                    htmlSearch += $"            </ul>";
                    htmlSearch += $"        </div>";
                    htmlSearch += $"        <div class=\"price\">";
                    htmlSearch += $"            <p id=\"discount\">{room.Price.ToString("#,###")}đ</p>";
                    htmlSearch += $"            <p id=\"cost\">{(room.Price * (1 - room.Discount)).ToString("#,###")}đ</p>";
                    htmlSearch += $"        </div>";
                    htmlSearch += $"    </div>";
                    htmlSearch += $"</div>";
                }
            }
            else
            {
                htmlSearch = "<p>Không tìm thấy kết quả nào phù hợp.</p>";
            }

            stringSearchResult.InnerHtml = htmlSearch;
        }
        public void Search(object sender, EventArgs e)
        {
            var searchString = searchDestination.Value.Trim();
            TimKiemPhong(searchString);
        }
    }

}