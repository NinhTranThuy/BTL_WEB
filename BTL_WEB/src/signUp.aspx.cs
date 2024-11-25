using BTL_WEB.Class;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BTL_WEB.src
{
    public partial class WebForm9 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            List<User> users = (List<User>)Application["ListUser"];
            int userCount = users.Count;

            // Đường dẫn tuyệt đối đến file log
            string filePath = Server.MapPath("~/log.txt");

            // Ghi vào file log số lượng phần tử
            string logMessage = $"Số lượng người dùng: {userCount}";
            System.IO.File.AppendAllText(filePath, logMessage + Environment.NewLine);

            // Hiển thị đường dẫn file log trong giao diện người dùng
            checkcheck.InnerText = "File log đã được ghi tại: " + filePath;
            if (IsPostBack)
            {
                string userName = Request.Form["username"];
                string password = Request.Form["password"];
                string email = Request.Form["email"];
                string sdt = Request.Form["phone"];
                string address = Request.Form["address"];


                //List<User> users = (List<User>)Application["ListUser"];

                foreach (User user in users)
                {
                    if (userName.Equals(user.Username))
                    {
                        errorName.InnerText = "Trùng tên người dùng rồi!";
                        return;
                    }

                    if (email.Equals(user.Email))
                    {
                        errorEmail.InnerText = "Trùng email ai rồi!";
                        return;
                    }

                    if (sdt.Equals(user.Phone))
                    {
                        errorPhone.InnerText = "Trùng SDT rồi kìa!";
                        return;
                    }
                }

                // If no duplicates are found, create a new user and add to the list
                User newUser = new User();
                newUser.Username = userName;
                newUser.Password = password;
                newUser.Email = email;
                newUser.Phone = sdt;
                newUser.Address = address;

                users.Add(newUser); // Add the new user to the list
                Application["ListUser"] = users; // Update the application state
                Session["User"] = newUser;
                Response.Redirect("signIn.aspx");
            }
        }
    }
}