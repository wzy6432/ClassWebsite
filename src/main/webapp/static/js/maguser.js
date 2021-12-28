/*管理班级成员信息*/

/*获得当前班级的成员信息*/
function GetUserNext(){
    $('#ShowClassMate').html("<h4>"+localStorage.getItem('classNo')+"->成员信息</h4>");  /*获得直接下标label名*/
    $.ajax({
        url: '/get_user_by_class',
        data:{
            Id:localStorage.getItem('classId')
        },
        type: 'POST',
        success: function (res) {
           var userObj = JSON.parse(res);
           $('#list_user').empty();
           $('#list_User_Temp').tmpl(userObj).appendTo('#list_user');
        },
        error: function (error) {
            console.log(error);
        }
    });
}


/*第一次获得当前班级的成员信息*/
function GetUserFirst(elem){
    localStorage.setItem('classId', $(elem).attr('class-id'));
    localStorage.setItem('classNo', $(elem).children().text());
    GetUserNext();
}


/*复选框选择搜索信息*/
function SearchUser(){
    $('#list_user').empty();     //清空当前列表
    if($('#search_by_name').prop('checked')){  //如果选中则将查询结果插入列表
        SearchUserByName();
    }
    if($('#search_by_sex').prop('checked')){
        SearchUserBySex();
    }
    if($('#search_by_loc').prop('checked')){
        SearchUserByLoc();
    }
    if($('#search_by_mail').prop('checked')){
        SearchUserByEmail();
    }
}

/*模糊按姓名查找获得成员信息集合*/
function SearchUserByName() {
    $.ajax({
            url: '/search_user_by_name',
            data: {
                Id:localStorage.getItem('classId'),
                keyword: $('#search_user_key').val()
            },
            type: 'POST',
            success: function (res) {
                var userObj = JSON.parse(res);
                $('#list_User_Temp').tmpl(userObj).appendTo('#list_user');
            },
            error: function (error) {
                console.log(error);
            }
        });
}

/*模糊按性别查找获得成员信息集合*/
function SearchUserBySex() {
    $.ajax({
            url: '/search_user_by_sex',
            data: {
                Id:localStorage.getItem('classId'),
                keyword: $('#search_user_key').val()
            },
            type: 'POST',
            success: function (res) {
                var userObj = JSON.parse(res);
                $('#list_User_Temp').tmpl(userObj).appendTo('#list_user');
            },
            error: function (error) {
                console.log(error);
            }
        });
}

/*模糊按居住地查找获得成员信息集合*/
function SearchUserByLoc() {
    $.ajax({
            url: '/search_user_by_loc',
            data: {
                Id:localStorage.getItem('classId'),
                keyword: $('#search_user_key').val()
            },
            type: 'POST',
            success: function (res) {
                var userObj = JSON.parse(res);
                $('#list_User_Temp').tmpl(userObj).appendTo('#list_user');
            },
            error: function (error) {
                console.log(error);
            }
        });
}

/*精确按电子邮箱查找获得成员信息集合*/
function SearchUserByEmail() {
    $.ajax({
            url: '/search_user_by_email',
            data: {
                Id:localStorage.getItem('classId'),
                keyword: $('#search_user_key').val()
            },
            type: 'POST',
            success: function (res) {
                var userObj = JSON.parse(res);
                $('#list_User_Temp').tmpl(userObj).appendTo('#list_user');
            },
            error: function (error) {
                console.log(error);
            }
        });
}

/*确认删除框*/
function ConfirmDeleteUser(elem) {
    localStorage.setItem('deleteId', $(elem).attr('u-id'));
    $('#deleteUserDlg').modal();
}


/*删除本条备忘录*/
function DeleteUser() {
    $.ajax({
        url: '/delete_user_from_class',
        data: {
            Uid:localStorage.getItem('deleteId'),
            Cid:localStorage.getItem('classId')
        },
        type: 'POST',
        success: function(res) {
            $('#deleteUserDlg').modal('hide');
            var result = JSON.parse(res);
            if(result.status=='OK'){
                GetUserNext();
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
