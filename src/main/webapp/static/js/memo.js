function AddMemoShow() {   /*添加一条备忘录信息*/
    $('#addModal').modal();
}

/*增加一条备忘录信息*/
function AddMemo() {
    var t = $('#addTitle').val();
    var a = $('#addDesc').val();
    if (t==""||a==""){         //客户端脚本检查添加信息是否有效
        alert("添加信息不能为空！");
    }
    else {
        $.ajax({
            url: '/add_memo',
            data: {
                Title: $('#addTitle').val(),
                Desc: $('#addDesc').val()
            },
            type: 'POST',
            success: function (res) {
                var mes = JSON.parse(res);
                $('#addModal').modal('hide');
                if(mes.status=='OK'){
                    GetMemos();
                }
                else {
                    alert(mes.status);
                }
            },
            error: function (error) {
                console.log(error);
            }
        });
    }
}

/*备忘录信息，网页加载完成后调用*/
$(function () {
    GetMemos();
    $('#btnUpdate').click(function() {
        var t = $('#editTitle').val();
        var a = $('#editDesc').val();
        if (t==""||a==""){         //客户端脚本检查添加信息是否有效
            alert("编辑信息不能为空！");
        }
        else {
            $.ajax({
                url: '/update_memo',
                data: {
                    Title: $('#editTitle').val(),
                    Desc: $('#editDesc').val(),
                    Id: localStorage.getItem('editId')
                },
                type: 'POST',
                success: function (res) {
                    $('#editModal').modal('hide');
                    var result = JSON.parse(res);
                    if(result.status=='OK'){
                        GetMemos();
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
    });
});

/*编辑当前备忘录信息*/
function EditMemo(elm) {
   localStorage.setItem('editId', $(elm).attr('data-id'));
    $.ajax({
        url: '/get_memo_byid',
        data: {
            Id: $(elm).attr('data-id')
        },
        type: 'POST',
        success: function (res) {
            var data = JSON.parse(res);
            $('#editTitle').val(data[0]['Title']);
            $('#editDesc').val(data[0]['Desc']);
            $('#editModal').modal();
        },
        error: function (error) {
            console.log(error);
        }
    });
}

/*确认删除框*/
function ConfirmDelete(elem) {
    localStorage.setItem('deleteId', $(elem).attr('data-id'));
    $('#deleteModal').modal();
}

/*删除本条备忘录*/
function Delete() {
    $.ajax({
        url: '/delete_memo',
        data: {
            Id: localStorage.getItem('deleteId')
        },
        type: 'POST',
        success: function(res) {
            $('#deleteModal').modal('hide');
            var result = JSON.parse(res);
            if(result.status=='OK'){
                GetMemos();
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


/*模糊查找获得备忘录信息集合*/
function SearchMemo() {
    $.ajax({
            url: '/search_memo',
            data: {keyword: $('#search_key').val()},
            type: 'POST',
            success: function (res) {
                var memoObj = JSON.parse(res);
                $('#list_memo').empty();
                $('#list_memo_Temp').tmpl(memoObj).appendTo('#list_memo');
            },
            error: function (error) {
                console.log(error);
            }
        });
}


/*获得所有的备忘录*/
function GetMemos() {
    $.ajax({
        url: '/get_user_memo',
        type: 'GET',
        success: function (res) {
            var memoObj = JSON.parse(res);
            $('#list_memo').empty();
            $('#list_memo_Temp').tmpl(memoObj).appendTo('#list_memo');
        },
        error: function (error) {
            console.log(error);
        }
    });
}


$(function () {                /*更新个人信息，网页加载完成后就调用*/
     GetUserInfo();
    $('#btnUpdateUser').click(function() {
        var n = $('#editName').val();
        var s = $('#editSex').val();
        var l = $('#editLoc').val();
        var e = $('#editEmail').val();
        if(n==""||s==""||l==""||e==""){
            alert("输入信息不能为空！");
        }
        else {
            $.ajax({
                url: '/update_user_info',
                data: {
                    Name: n,
                    Sex: s,
                    Loc: l,
                    Email: e
                },
                type: 'POST',
                success: function (res) {
                    $('#editUserDlg').modal('hide');
                    var result = JSON.parse(res);
                    if(result.status=='OK'){
                        GetUserInfo();
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
    });
});

function EditUser() {       /*编辑当前用户个人信息*/
    $.ajax({
        url: '/get_user_info',  /*获取用户原来信息*/
        type: 'GET',
        success: function (res) {
            var userObj = JSON.parse(res);
            $('#editName').val(userObj[0]['Name']);
            $('#editSex').val(userObj[0]['Sex']);
            $('#editLoc').val(userObj[0]['Loc']);
            $('#editEmail').val(userObj[0]['Email']);
            $('#editUserDlg').modal();
        },
        error: function (error) {
            console.log(error);
        }
    });
}

function GetUserInfo(){          /*获得用户信息*/
    $.ajax({
        url: '/get_user_info',  /*获取用户原来信息*/
        type: 'GET',
        success: function (res) {
            var userObj = JSON.parse(res);
            $('#UName').html( "<label>姓名:&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</label>"+userObj[0]['Name']);
            $('#USex').html("<label>性别:&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</label>"+userObj[0]['Sex']);
            $('#ULoc').html("<label>居住地:&nbsp&nbsp&nbsp&nbsp</label>"+userObj[0]['Loc']);
            $('#UEmail').html(userObj[0]['Email']);
        },
        error: function (error) {
           console.log(error);
        }
    });
}
$(function () {
    $('#btnEditUserPsw').click(function () {
        $('#editUserPswDlg').modal();
    })
})

/*修改用户密码*/
function EditUserPsw() {
    var O = $('#editOrdUserPsw').val();
    var N1 = $('#editNewUserPsw1').val();
    var N2 =$('#editNewUserPsw2').val();
    var req2=new RegExp(/^[0-9]*[a-zA-Z]+[0-9]+[A-Za-z]*$/); //监测密码的正则表达式
    if (N1!=N2){    //两次输入密码不一致,客户端做出检查
        alert('两次输入密码不一致！');
    }
    else if(req2.test(N1)&&N1.length>=6){
        $.ajax({
            url: '/update_user_psw',
            data:{
                Oldpsw:O,
                Newpsw:N1
            },
            type: 'POST',
            success: function (res) {
                $('#editUserPswDlg').modal('hide');
                var result = JSON.parse(res);
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

