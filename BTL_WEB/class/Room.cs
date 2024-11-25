using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Web;

namespace BTL_WEB.Class
{
    public class Room
    {
        string roomID;
        string roomName;
        string address;
        float rate;
        string description;
        List<string> images;
        List<string> conveniences;
        float price;
        float discount;

        public string RoomID
        {
            get { return roomID; }
            set { roomID = value; }
        }

        public string RoomName
        {
            get { return roomName; }
            set { roomName = value; }
        }

        public string Address
        {
            get { return address; }
            set { address = value; }
        }

        public float Rate
        {
            get { return rate; }
            set { rate = value; }
        }

        public string Description
        {
            get { return description; }
            set { description = value; }
        }

        public List<string> Images
        {
            get { return images; }
            set { images = value; }
        }

        public List<string> Conveniences
        {
            get { return conveniences; }
            set { conveniences = value; }
        }

        public float Price
        {
            get { return price; }
            set { price = value; }
        }

        public float Discount
        {
            get { return discount; }
            set { discount = value; }
        }

        public Room()
        {
            images = new List<string>();
            conveniences = new List<string>();
        }  





    }
}