using BTL_WEB.Class;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BTL_WEB.Class
{
    public class Booking
    {
        string BookingId;
        string UserId;
        string RoomId;
        DateTime bookingDate;
        BookingStatus status;


        public string BookingID
        {
            get { return BookingId; }
            set { BookingId = value; }
        }

        public string UserID
        {
            get { return UserId; }
            set { UserId = value; }
        }

        public string RoomID
        {
            get { return RoomId; }
            set { RoomId = value; }
        }

        public DateTime BookingDate
        {
            get { return bookingDate; }
            set { bookingDate = value; }
        }

        public BookingStatus Status
        {
            get { return status; }
            set { status = value; }
        }
    }

    public enum BookingStatus
    {
        Pending,        // Đang xử lý
        Confirmed,      // Đặt thành công
        Cancelled,      // Đã hủy
        CheckedIn,      // Đã nhận phòng
        CheckedOut      // Đã trả phòng
    }
}