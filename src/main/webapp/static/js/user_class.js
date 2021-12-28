/*管理班级信息*/

/*获得所有班级信息和班级公告信息*/
$(function () {
    Get_UClasses();
});


/*获得所有班级的信息*/
function Get_UClasses() {
    $.ajax({
        url: '/get_all_class',
        type: 'GET',
        success: function (res) {
             var classObj = JSON.parse(res);
                $('#list_UClass').empty();
                $('#list_UClass_Temp').tmpl(classObj).appendTo('#list_UClass');
        },
        error: function (error) {
            console.log(error);
            // var result = JSON.parse(error);
            // alert(result.message);
        }
    });
}

/*模糊查找获得班级信息集合*/
function Search_UClass() {
    $.ajax({
            url: '/search_class',
            data: {keyword: $('#search_class_key').val()},
            type: 'POST',
            success: function (res) {
                var classObj = JSON.parse(res);
                $('#list_UClass').empty();
                $('#list_UClass_Temp').tmpl(classObj).appendTo('#list_UClass');
            },
            error: function (error) {
                console.log(error);
                var result = JSON.parse(error);
                alert(result.message);
            }
        });
}

/*加入该班级*/
function UserAddIntoClass(elem) {
     $.ajax({
         url: '/user_add_into_class',
         data:{
             Cid:$(elem).attr('class-id')
         },
        type: 'POST',
        success: function (res) {
            var result = JSON.parse(res);
            alert(result.message);
        },
        error: function (error) {
            console.log(error);
            var result = JSON.parse(error);
            alert(result.message);;
        }
    });
}


