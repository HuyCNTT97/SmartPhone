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
        [MaxLength(30,ErrorMessage ="Họ tên không được dài quá 30 kí tự")]
        public string FullName { get; set; }

        public string UserName { set; get; }
        [Required(ErrorMessage = "Bạn cần nhập mật khẩu")]

        public string Password { set; get; }
        [MinLength(6,ErrorMessage ="Mật khẩu phải có ít nhất 6 kí tự")]
        [MaxLength(100,ErrorMessage ="Mật khẩu không vượt quá 100 kí tự")]
        [Required(ErrorMessage = "Bạn cần nhập email")]
        [DataType(DataType.EmailAddress)]
        public string Email { set; get; }
        [Required(ErrorMessage = "Bạn cần nhập địa chỉ")]

        public string Address { set; get; }
        public string PhoneNumber { set; get; }
    }
}