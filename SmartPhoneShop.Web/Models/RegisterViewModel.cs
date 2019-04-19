using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace SmartPhoneShop.Web.Models
{
    public class RegisterViewModel
    {
        [Required(ErrorMessage ="Bạn cần nhập họ tên")]
        public string FullName { get; set; }
        [Required(ErrorMessage = "Bạn cần nhập tên tài khoản")]

        public string UserName { set; get; }
        [Required(ErrorMessage = "Bạn cần nhập mật khẩu")]

        public string Password { set; get; }
        [MinLength(6,ErrorMessage ="Mật khẩu phải có ít nhất 6 kí tự")]
        [MaxLength(100,ErrorMessage ="Mật khẩu không vượt quá 100 kí tự")]
        [Required(ErrorMessage = "Bạn cần nhập email")]

        public string Email { set; get; }
        [Required(ErrorMessage = "Bạn cần nhập địa chỉ")]

        public string Address { set; get; }
        [Required(ErrorMessage = "Bạn cần nhập số điện thoại")]

        public string PhoneNumber { set; get; }
    }
}