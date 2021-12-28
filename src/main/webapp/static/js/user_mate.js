/*管理班级成员信息*/

/*获得当前班级的成员信息*/
function ShowClassmateNext(){
    $('#ShowClassMate').html("<h4>"+localStorage.getItem('classNo')+"->成员信息</h4>");  /*获得直接下标label名*/
    $.ajax({
        url: '/get_user_by_class',
        data:{
            Id:localStorage.getItem('classId')
        },
        type: 'POST',
        success: function (res) {
           var mateObj = JSON.parse(res);
           $('#list_UMate').empty();
           $('#list_UMate_Temp').tmpl(mateObj).appendTo('#list_UMate');
        },
        error: function (error) {
            console.log(error);
            alert('获得当前成员信息出错！')
        }
    });
}

/* 默认调用函数*/
$(function () {
     if(localStorage.getItem('classId')){
        ShowClassmateNext();
    }
})

/*第一次获得当前班级的成员信息*/
function ShowClassmateFirst(elem){
    localStorage.setItem('classId', $(elem).attr('class-id'));
    localStorage.setItem('classNo', $(elem).children().text()); //存储当前班级信息
    ShowClassmateNext();
}

/*复选框选择搜索信息*/
function SearchClassmate(){
    $('#list_UMate').empty();     //清空当前列表
    if($('#search_by_name').prop('checked')){  //如果选中则将查询结果插入列表
        SearchClassmateByName();
    }
    if($('#search_by_sex').prop('checked')){
        SearchClassmateBySex();
    }
    if($('#search_by_loc').prop('checked')){
        SearchClassmateByLoc();
    }
    if($('#search_by_mail').prop('checked')){
        SearchClassmateByEmail();
    }
}

/*模糊按姓名查找获得成员信息集合*/
function SearchClassmateByName() {
    $.ajax({
            url: '/search_user_by_name',
            data: {
                Id:localStorage.getItem('classId'),
                keyword: $('#search_user_key').val()
            },
            type: 'POST',
            success: function (res) {
               var mateObj = JSON.parse(res); //添加入无序列表
               //$('#list_UMate').empty();
               $('#list_UMate_Temp').tmpl(mateObj).appendTo('#list_UMate');
            },
            error: function (error) {
                console.log(error);
            }
        });
}

/*模糊按性别查找获得成员信息集合*/
function SearchClassmateBySex() {
    $.ajax({
            url: '/search_user_by_sex',
            data: {
                Id:localStorage.getItem('classId'),
                keyword: $('#search_user_key').val()
            },
            type: 'POST',
             success: function (res) {
               var mateObj = JSON.parse(res);
               //$('#list_UMate').empty();
               $('#list_UMate_Temp').tmpl(mateObj).appendTo('#list_UMate');
            },
            error: function (error) {
                console.log(error);
            }
        });
}

/*模糊按居住地查找获得成员信息集合*/
function SearchClassmateByLoc() {
    $.ajax({
            url: '/search_user_by_loc',
            data: {
                Id:localStorage.getItem('classId'),
                keyword: $('#search_user_key').val()
            },
            type: 'POST',
             success: function (res) {
               var mateObj = JSON.parse(res);
               //$('#list_UMate').empty();
               $('#list_UMate_Temp').tmpl(mateObj).appendTo('#list_UMate');
            },
            error: function (error) {
                console.log(error);
            }
        });
}

/*精确按电子邮箱查找获得成员信息集合*/
function SearchClassmateByEmail(elem) {
    $.ajax({
            url: '/search_user_by_email',
            data: {
                Id:localStorage.getItem('classId'),
                keyword: $('#search_user_key').val()
            },
            type: 'POST',
             success: function (res) {
               var mateObj = JSON.parse(res);
               //$('#list_UMate').empty();
               $('#list_UMate_Temp').tmpl(mateObj).appendTo('#list_UMate');
            },
            error: function (error) {
                console.log(error);
            }
        });
}

