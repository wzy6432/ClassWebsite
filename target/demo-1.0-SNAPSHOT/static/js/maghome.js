/*针对管理员的脚本文件*/
function AddManagerShow() {
    $('#addMagDlg').modal();
}

/*修改管理员密码*/
function EditMagPswShow() {
    $('#editMagPswDlg').modal();
}

/*增加一条管理员信息*/
function AddManager() {
    var a=$('#addAccount').val();
    var p=$('#addPassword').val();
    if(a==""||p==""){
        alert("管理员信息不能为空！");
    }
    else {
        var req1 = new RegExp(/^(ord[0-9]{5})$/); //检测管理员用户名的正则表达式
        var req2 = new RegExp(/^[0-9]*[a-zA-Z]+[0-9]+[A-Za-z]*$/); //检测管理员登录密码的正则表达式
        if (req1.test(a)){
            if(req2.test(p)&&p.length>=6){
                $.ajax({
                    url: '/create_manager',
                    data: {
                        Account: a,
                        Password: p
                    },
                    type: 'POST',
                    success: function (res) {
                        $('#addMagDlg').modal('hide');
                        var result = JSON.parse(res);
                        if(result.status =='OK'){
                            GetManagers();
                        }
                        else{
                            alert(result.status);
                        }
                    },
                    error: function (error) {
                        console.log(error);
                    }
                });
            }
            else{
                alert('密码强度不够！');
            }
        }
        else{
            alert('账户名不符合要求！');
        }
    }
}

/*确认删除框*/
function ConfirmDeleteMag(elem) {
    localStorage.setItem('deleteId', $(elem).attr('mag-id'));
    $('#deleteMagDlg').modal();
}

/*删除该管理员*/
function DeleteMag() {
    $.ajax({
        url: '/delete_manager',
        data: {Id: localStorage.getItem('deleteId')},
        type: 'POST',
        success: function(res) {
            $('#deleteMagDlg').modal('hide');
            var result = JSON.parse(res);
            if(result.status=='OK'){
                GetManagers();
            }
            else{
                alert(result.status);
            }
        },
        error: function(error) {
            console.log(error);
        }
    });
}

/*模糊查找获得管理员信息集合*/
function SearchManager() {
    $.ajax({
            url: '/search_manager',
            data: {keyword: $('#search_magkey').val()},
            type: 'POST',
            success: function (res) {
                var managerObj = JSON.parse(res);
                $('#list_manager').empty();
                $('#listMagtemp').tmpl(managerObj).appendTo('#list_manager');
            },
            error: function (error) {
                console.log(error);
            }
        });
}




 /*获得所有管理员信息，和当前管理员信息，网页加载完成后调用*/
$(function () {
    GetManagers();
    GetManagerInfo();  /*更新管理员信息，网页加载完成后就调用*/
});

 /*获得管理员信息*/
function GetManagerInfo(){
    $.ajax({
        url: '/get_manager_byid',
        type: 'GET',
        success: function (res) {
            var magObj = JSON.parse(res);
            $('#MAccount').html( "<label>账号:&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</label>"+magObj[0]['Account']);
            $('#MLevel').html("<label>权限:&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</label>"+magObj[0]['Level']);
        },
        error: function (error) {
            console.log(error);
        }
    });
}

/*获得所有的管理员信息*/
function GetManagers() {
    $.ajax({
        url: '/get_all_manager',
        type: 'GET',
        success: function (res) {
            var managerObj = JSON.parse(res);
            $('#list_manager').empty();
            $('#listMagtemp').tmpl(managerObj).appendTo('#list_manager');
        },
        error: function (error) {
            console.log(error);
        }
    });
}

/*修改密码*/
function EditMagPsw() {
    var O = $('#editOrdMagPsw').val();
    var N1 = $('#editNewMagPsw1').val();
    var N2 =$('#editNewMagPsw2').val();
    var req2=new RegExp(/^[0-9]*[a-zA-Z]+[0-9]+[A-Za-z]*$/); //监测密码的正则表达式
    if (N1!=N2){    //两次输入密码不一致,客户端做出检查
        alert('两次输入密码不一致！');
    }
    else if(req2.test(N1)&&N1.length>=6){
        $.ajax({
            url: '/update_manager_psw',
            data:{
                Oldpsw:O,
                Newpsw:N1
            },
            type: 'POST',
            success: function (res) {
                $('#editMagPswDlg').modal('hide');
                var result=JSON.parse(res);
                alert(result.status);
            },
            error: function (error) {
                console.log(error);
            }
        });
    }
    else{
        alert("密码强度太低！");
    }
}


