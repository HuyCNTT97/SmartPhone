$(document).ready(function () {
    $('#password2').keyup(checkpass);
    $('#password1').keyup(checkpass);
    $('#btnCreate').click(confirm);
});

function confirm() {

    var password1 = $('#password1').val();
    var password2 = $('#password2').val();
    if (password1 === password2) {
        return true;
    }
    else {
        alert("Bạn chua xác nhậnn mật khẩu dúng");
        return false;
    }
    var kitu = scorePassword(password1);
    if (kitu < 30) {
        alert("mật khẩu phải dài hơn 6 kí tự");
        return false;
    }
    if (kitu >= 30 && kitu <= 60) {
        alert("Mật khẩu phải mạnh hoặc tốt")
        return false;

    }
    if (kitu > 60) {
        return true;
    }
    if (kitu > 80) {
        return true;
    }






}
function checkpass() {
    var password1 = $('#password1').val();
    var password2 = $('#password2').val();
    var kitu = scorePassword(password1);
    if (kitu < 30) {
        $('#checkstrongpass').removeClass("success");
        $('#checkstrongpass').text("Mật khẩu quá ngắn");
        $('#checkstrongpass').addClass("fail");

    }
    if (kitu >= 30 && kitu <= 60) {
        $('#checkstrongpass').removeClass("success");
        $('#checkstrongpass').text("Yêu cầu mật khẩu phải chứa chữ in và số");
        $('#checkstrongpass').addClass("fail");

    }
    if (kitu > 60) {
        $('#checkstrongpass').removeClass("fail");
        $('#checkstrongpass').text("Mật khẩu tốt");
        $('#checkstrongpass').addClass("success");
    }
    if (kitu > 80) {
        $('#checkstrongpass').removeClass("fail");
        $('#checkstrongpass').text("Mật khẩu mạnh");
        $('#checkstrongpass').addClass("success");
    }



    if (password1 === password2) {
        $('#checkstatus').removeClass("fail");
        $('#checkstatus').text("Mật mã xác nhận đúng");

        $('#checkstatus').addClass("success");
    }
    else {
        $('#checkstatus').text("Mật Mã Xác Nhận Sai")
        $('#checkstatus').removeAttr();

        $('#checkstatus').addClass("fail");

    }
    if (password1 === "" || password2 === "") {
        $('#checkstatus').removeClass("fail");
        $('#checkstatus').removeClass("success");
        $('#checkstatus').text("");

    }

}
function scorePassword(pass) {
    var score = 0;
    if (!pass)
        return score;

    // award every unique letter until 5 repetitions
    var letters = new Object();
    for (var i = 0; i < pass.length; i++) {
        letters[pass[i]] = (letters[pass[i]] || 0) + 1;
        score += 5.0 / letters[pass[i]];
    }

    // bonus points for mixing it up
    var variations = {
        digits: /\d/.test(pass),
        lower: /[a-z]/.test(pass),
        upper: /[A-Z]/.test(pass),
        nonWords: /\W/.test(pass),
    }

    variationCount = 0;
    for (var check in variations) {
        variationCount += (variations[check] === true) ? 1 : 0;
    }
    score += (variationCount - 1) * 10;

    return parseInt(score);
}