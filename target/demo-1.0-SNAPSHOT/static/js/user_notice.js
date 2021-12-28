/*管理公告信息*/

/*获得当前班级的公告信息*/
function ShowNoticeNext(){
    $('#ShowClassTitle').html("<h4>"+localStorage.getItem('cNo')+"->公告栏</h4>");  /*获得直接下标label名*/
    $.ajax({
        url: '/get_notice_by_class',
        data:{
            Id:localStorage.getItem('cId')
        },
        type: 'POST',
        success: function (res) {
           var noticeObj = JSON.parse(res);
           $('#list_UNotice').empty();
           $('#list_UNotice_Temp').tmpl(noticeObj).appendTo('#list_UNotice');
        },
        error: function (error) {
            console.log(error);
            var result = JSON.parse(error);
            alert(result.message);
        }
    });
}

/* 默认调用函数*/
$(function () {
     if(localStorage.getItem('cId')){
        ShowNoticeNext();
    }
})

/*第一次获得当前班级的公告信息*/
function ShowNoticeFirst(elem){
    localStorage.setItem('cId', $(elem).attr('class-id'));
    localStorage.setItem('cNo', $(elem).children().text());
    ShowNoticeNext();
}


/*展示当前公告信息，获取公告信息并显示在对话框里*/
function ShowNotice(elm) {
   localStorage.setItem('viewId', $(elm).attr('no-id'));
    $.ajax({
        url: '/get_notice_byid',
        data: {
            Id: $(elm).attr('no-id')
        },
        type: 'POST',
        success: function (res) {
            var data = JSON.parse(res);
            $('#viewNoticeTitle').val(data[0]['Title']);
            $('#viewNoticeDesc').val(data[0]['Desc']);
            $('#showNoticeDlg').modal();
        },
        error: function (error) {
            console.log(error);
            var result = JSON.parse(error);
            alert(result.message);
        }
    });
}

/*模糊查找获得公告信息集合*/
function Search_UNotice() {
    $.ajax({
            url: "http://localhost:8080/demo_war_exploded/noticeAjaxServlet",
            data: {
                action:"jQueryForClassNotice",
                classId: $('#search_notice_key').val()
            },
            type: 'GET',
            success: function (res) {
                // var noticeObj = JSON.parse(res);
                // $('#list_UNotice').empty();
                // $('#list_UNotice_Temp').tmpl(noticeObj).appendTo('#list_UNotice');
                // alert("服务器返回的公告是:"+res);

                console.log(res);
                console.log(res.classId);
                console.log(res.notice);
                $("#classId").html(res.classId);
                $("#notice").html(res.notice);
            },
            error: function (error) {
                console.log("请求班级公告失败");
                console.log(error);
                var result = JSON.parse(error);
                alert(result.message);
            },
            dataType:"json"
        });
}




