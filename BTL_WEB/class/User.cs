using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BTL_WEB.Class
{
    public class User
    {
        string username;
        string password;
        string email;
        string phone;
        string address;

        public string Username
        {
            get { return username; }
            set { username = value; }
        }

        public string Password
        {
            get { return password; }
            set { password = value; }
        }

        public string Email
        {
            get { return email; }
            set { email = value; }
        }

        public string Phone
        {
            get { return phone; }
            set { phone = value; }
        }

        public string Address
        {
            get { return address; }
            set { address = value; }
        }

    }
}