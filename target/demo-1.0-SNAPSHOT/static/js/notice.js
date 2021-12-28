/*管理公告信息*/

/*获得当前班级的公告信息*/
function GetNoticeNext(){
    $('#ShowClassTitle').html("<h4>"+localStorage.getItem('classNo')+"->公告栏</h4>");  /*获得直接下标label名*/
    $.ajax({
        url: '/get_notice_by_class',
        data:{
            Id:localStorage.getItem('classId')
        },
        type: 'POST',
        success: function (res) {
           var noticeObj = JSON.parse(res);
           $('#list_notice').empty();
           $('#list_Notice_Temp').tmpl(noticeObj).appendTo('#list_notice');
        },
        error: function (error) {
            console.log(error);
        }
    });
}


/*第一次获得当前班级的公告信息*/
function GetNoticeFirst(elem){
    localStorage.setItem('classId', $(elem).attr('class-id'));   //获得当前元素带有的班级id信息
    localStorage.setItem('classNo', $(elem).children().text());  //获得当前元素带有的班级名称信息
    GetNoticeNext();
}

/*每次刷新后显示的页面*/
$(function () {
    if(localStorage.getItem('classId')){
        GetNoticeNext();
    }
})

/*显示添加公告对话框*/
function AddNoticeShow() {
    $('#addNoticeDlg').modal();
}

/*增加一条公告*/
function AddNotice() {
    var t=$('#addNoticeTitle').val();
    var d=$('#addNoticeDesc').val();
    if(t==""||d==""){
        alert("公告信息不能为空！");
    }
    else {
        $.ajax({
            url: '/add_notice',
            data: {
                Title: t,
                Desc: d,
                ClassId: localStorage.getItem('classId')
            },
            type: 'POST',
            success: function (res) {
                var result = JSON.parse(res);
                if(result.status =='OK'){
                    $('#addNoticeDlg').modal('hide');
                    GetNoticeNext();
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
}


/*编辑当前公告信息，获取原来公告信息并显示在对话框里*/
function EditNotice(elm) {
   localStorage.setItem('editId', $(elm).attr('no-id'));
    $.ajax({
        url: '/get_notice_byid',
        data: {
            Id: $(elm).attr('no-id')
        },
        type: 'POST',
        success: function (res) {
            var data = JSON.parse(res);
            $('#editNoticeTitle').val(data[0]['Title']);
            $('#editNoticeDesc').val(data[0]['Desc']);
            $('#editNoticeDlg').modal();
        },
        error: function (error) {
            console.log(error);
             var data = JSON.parse(error);
             alert(data.message);
        }
    });
}


/*确认更新公告信息，更改完后点击提交按钮*/
function UpdateNotice() {
    var t=$('#editNoticeTitle').val();
    var d=$('#editNoticeDesc').val();
    if(t==""||d==""){
        alert("公告信息不能为空！");
    }
    else {
        $.ajax({
            url: '/update_notice',
            data: {
                Title: t,
                Desc: d,
                Id: localStorage.getItem('editId'),
            },
            type: 'POST',
            success: function (res) {
                $('#editNoticeDlg').modal('hide');
                var result = JSON.parse(res);
                if (result.status=='OK'){
                    GetNoticeNext();
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
}


/*模糊查找获得公告信息集合*/
function SearchNotice() {
    $.ajax({
            url: '/search_notice',
            data: {
                Id:localStorage.getItem('classId'),
                keyword: $('#search_notice_key').val()
            },
            type: 'POST',
            success: function (res) {
                var noticeObj = JSON.parse(res);
                $('#list_notice').empty();
                $('#list_Notice_Temp').tmpl(noticeObj).appendTo('#list_notice');
            },
            error: function (error) {
                console.log(error);
            }
        });
}


/*确认删除框*/
function ConfirmDeleteNotice(elem) {
    localStorage.setItem('deleteId', $(elem).attr('no-id'));
    $('#deleteNoticeDlg').modal();
}


/*删除本条公告*/
function DeleteNotice() {
    $.ajax({
        url: '/delete_notice',
        data: {
            Id: localStorage.getItem('deleteId')
        },
        type: 'POST',
        success: function(res) {
            $('#deleteNoticeDlg').modal('hide');
            var result = JSON.parse(res);
            if(result.status=='OK'){
                GetNoticeNext();
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