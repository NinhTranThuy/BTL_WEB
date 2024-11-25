using BTL_WEB.Class;
using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BTL_WEB.src
{
    public partial class WebForm8 : System.Web.UI.Page
    {
        protected Label lblMessage;

        protected void Page_Load(object sender, EventArgs e)
        {
            // Kiểm tra Session "User"
                User userInput = (User)Session["User"];
            lblWelcome.InnerHtml = $"Chào {userInput.Username}, <br> nhập mật khẩu đi nha:";


            if (IsPostBack)
            {
                string mk = Request.Form["password"];
                List<User> users = (List<User>)Application["ListUser"];
                bool check = false;

                foreach (User user in users)
                {
                    if (mk == user.Password.ToString())
                    {
                        check = true;
                        string urlReturn = Session["SignIn"] as string ?? "home.aspx"; // URL trả về nếu không có SignIn
                        Session.Remove("SignIn");
                        Response.Redirect(urlReturn);
                    }
                }

                if (!check)
                {
                    errorMessage.InnerText = "Opps! Sai mật khẩu rồi, nhập lại đi nha!";
                }
            }
        }
    }
}
