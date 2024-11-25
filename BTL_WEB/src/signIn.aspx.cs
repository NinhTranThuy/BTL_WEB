using BTL_WEB.Class;
using System;
using System.Collections.Generic;
using System.EnterpriseServices.CompensatingResourceManager;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BTL_WEB.src
{
    public partial class WebForm7 : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            bool check = false;
            if (IsPostBack)
            {
                //lấy danh sách người dùng từ application
                User user = new User();
                string dn = (string)Session["SignIn"];
                List<User> users = (List<User>)Application["ListUser"];

                //lấy dữ liệu được gửi đi từ phía client
                string tk = Request.Form["username"];
                
                //chạy vòng lặp xem có đúng tài khoản và mật khẩu không
                foreach (User user1 in users)
                {
                    if ((user1.Username == tk || user1.Email == tk))
                    {
                        check = true;
                        user = user1;
                        Session["User"] = user;
                        Response.Redirect("signInPassword.aspx");
                    }
                }

                //nếu đúng tài khoản và mật khẩu thì chuyển sang trang tương ứng
                if (!check)
                {
                    errorMessage.InnerHtml = "Tài khoản không chính xác";
                }
            }
        }
    }
}
