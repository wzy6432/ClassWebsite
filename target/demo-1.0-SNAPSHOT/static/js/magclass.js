/*管理班级信息*/
function AddClassShow() {
    $('#addClassDlg').modal();
}

/*增加一条班级信息*/
function AddClass(){
    var t=$('#addClassTitle').val();
    if (t==""){
        alert("班级名称不能为空！");
    }
    else {
        $.ajax({
            url: '/add_class',
            data: {
                classTitle: t
            },
            type: 'POST',
            success: function (res) {
                $('#addClassDlg').modal('hide');
                var result=JSON.parse(res);
                if(result.status=='OK'){
                    GetClasses();
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

/*确认删除班级信息框*/
function ConfirmDeleteClass(elem) {
    localStorage.setItem('deleteId', $(elem).attr('class-id'));
    $('#deleteClassDlg').modal();
}

/*删除该班级信息*/
function DeleteClass() {
    $.ajax({
        url: '/delete_class',
        data: {Id: localStorage.getItem('deleteId')},
        type: 'POST',
        success: function(res) {
            $('#deleteClassDlg').modal('hide');
            var result = JSON.parse(res);
            if(result.status=='OK'){           // 删除班级信息，删除成功时才需要刷新
                GetClasses();
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

/*模糊查找获得班级信息集合*/
function SearchClass() {
    $.ajax({
            url: '/search_class',
            data: {keyword: $('#search_class_key').val()},
            type: 'POST',
            success: function (res) {
                var classObj = JSON.parse(res);
                $('#list_class').empty();
                $('#list_Class_Temp').tmpl(classObj).appendTo('#list_class');
            },
            error: function (error) {
                console.log(error);
            }
        });
}

/*编辑当前班级信息*/
function EditClass(elme) {
   localStorage.setItem('editId', $(elme).attr('class-id'));
    $.ajax({
        url: '/get_class_byid',
        data: {
            Id: $(elme).attr('class-id')
        },
        type: 'POST',
        success: function (res) {
            var data = JSON.parse(res);
            $('#editClassTitle').val(data[0]['Title']);
            $('#editClassDlg').modal();
        },
        error: function (error) {
            console.log(error);
        }
    });
}

// 匿名函数
$(function () {
    GetClasses();   /*获得所有班级信息和班级公告信息*/
    $('#btnUpdateClass').click(function () {   //点击了更新班级信息的按钮
        var t=$('#editClassTitle').val();
        if(t==""){
            alert("班级名称不能为空！");
        }
        else {
            $.ajax({
                url: '/update_class',
                data: {
                    Title: t,
                    Id: localStorage.getItem('editId')
                },
                type: 'POST',
                success: function (res) {
                    $('#editClassDlg').modal('hide');
                    var result = JSON.parse(res);
                    if(result.status=='OK'){
                        GetClasses();
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

/*获得所有班级的信息*/
function GetClasses() {
    $.ajax({
        url: '/get_all_class',
        type: 'GET',
        success: function (res) {
             var classObj = JSON.parse(res);
                $('#list_class').empty();
                $('#list_Class_Temp').tmpl(classObj).appendTo('#list_class');
        },
        error: function (error) {
            console.log(error);
            alert('获取班级信息出错！');
        }
    });
}


