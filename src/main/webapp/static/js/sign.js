// /* 用户注册脚本文件*/
//  $(function() {
//     $('#btn_SignIn').click(function () {
//         if (check_user_info()) {  //如果密码至少6位并且包含数字和字母
//             $.ajax({
//                 url: '/sign_in', /*以form表格里边名字来命名*/
//                 data: $('form').serialize(),
//                 type: 'POST',
//                 success: function (response) {
//                     console.log(response);
//                     var result = JSON.parse(response)
//                     alert(result.message);
//                 },
//                 error: function (error) {
//                     console.log(error);
//                     var result = JSON.parse(error)
//                     alert(result.message);
//                 }
//             });
//         }
//     });
// });
//
//
// /*客户端脚本检查用户输入信息的合法性*/
// function check_user_info() {
//     var tel = $('#U_tel').val();
//     var psw = $('#U_password').val();
//     if (tel == "" || psw == "") {            //输入为空
//         alert('输入信息为空！');
//         return false;
//     }
//     else {
//         var req1=new RegExp(/^1[0-9]{10}$/);   //检测电话号码的正则表达式
//         var req2=new RegExp(/^[0-9]*[a-zA-Z]+[0-9]+[A-Za-z]*$/); //监测密码的正则表达式
//         if (req1.test(tel)){
//             if(psw.length>=6 &&req2.test(psw)) {  //如果密码至少6位并且包含数字和字母
//                 return true;
//             }
//             else{
//                  alert("密码强度不够！");
//                  return false;
//             }
//         }
//         else{
//             alert('电话号码输入错误！');
//             return false;
//         }
//     }
// }


/*客户端脚本，检查管理员登录信息合法性的脚本文件*/
function check_manager_info() {
    var acc = $('#M_acc').val();
    var psw = $('#M_psw').val();
    if (acc == "" || psw == "") {            //输入为空
        alert('输入信息为空！');
        return false;
    }
    else {
        var req1=new RegExp(/^(root[0-9]{4})|(ord[0-9]{5})$/);   //检测管理员登录名正则表达式
        var req2=new RegExp(/^[0-9]*[a-zA-Z]+[0-9]+[A-Za-z]*$/); //检测管理员登录密码的正则表达式
        if (req1.test(acc)){
            if(psw.length>=6 &&req2.test(psw)) {  //如果密码至少6位并且包含数字和字母
                return true;
            }
            else{
                 alert("密码输入错误！");

                 return false;
            }
        }
        else{
            alert('账号输入错误！');
            return false;
        }
    }
}