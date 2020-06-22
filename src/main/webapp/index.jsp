<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/6/18
  Time: 16:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>
    <script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/jquery-3.5.1.js"></script>
    <link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <h1>SSM_CRUD</h1>
        </div>
    </div>
    <%--表格--%>
    <div class="row">
        <div class="col-md-4 col-md-offset-8">
            <button type="button" class="btn btn-info">增加</button>
            <button type="button" class="btn btn-warning">删除</button>
        </div>
    </div>

    <div class="row" >
        <div class="col-md-12">
            <table class="table table-hover" id="emps_table">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>empName</th>
                        <th>gender</th>
                        <th>email</th>
                        <th>deptName</th>
                        <th>操作</th>
                    </tr>
                </thead>
                <tbody>

                </tbody>

            </table>
        </div>

    </div>

    <%--   分页条     --%>
    <div class="row">
        <div class="col-md-6 col-md-offset-6" id="page_list_area">

        </div>
    </div>

    <div class="row">
        <div class="col-md-6" id="page_info_area">

        </div>
    </div>

</div>
<script type="text/javascript">
    $(function () {
        $.ajax({
            url:"${APP_PATH}/emps",
            data:"pn=1",
            type:"GET",
            success:function (result) {
                console.log(result);
                build_emps_table(result);
                build_page_msg(result);
                build_page_nav(result);
            }
        });
    });
</script>
<script>
    function build_emps_table(result) {
        var emps = result.extend.pageInfo.list;
        $.each(emps, function(index, item) {
            // alert(item.empName);
            var empIdTd = $("<td></td>").append(item.empId);
            var empNameTd = $("<td></td>").append(item.empName);
            var gender = item.gender=="1"?"男":"女";
            var genderTd = $("<td></td>").append(gender);
            var emailTd = $("<td></td>").append(item.email);
            var departmentTd = $("<td></td>").append(item.department.deptName);
            var deleteBtn =$("<button></button>").addClass("btn btn-warning").append("<span></span>")
                .addClass("glyphicon glyphicon-trash").append("删除");
            var editBtn =$("<button></button>").addClass("btn btn-info").append("<span></span>")
                .addClass("glyphicon glyphicon-pencil").append("编辑");
            var btnTd = $("<td></td>").append(editBtn).append(" ").append(deleteBtn);
            $("<tr></tr>").append(empIdTd).append(empNameTd).append(genderTd).append(emailTd)
                .append(departmentTd).append(btnTd).appendTo("#emps_table tbody");
        });
    }

    //分页条
    function build_page_nav(result) {

        var ul = $("<ul></ul>").addClass("pagination");
        var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href", "#"));
        var prePageLi = $("<li><li>").append($("<a></a>")).append("&laquo;");
        var nextPageLi = $("<li><li>").append($("<a></a>")).append("&raquo;");
        var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href", "#"));

        ul.append(firstPageLi).append(prePageLi)
        $.each(result.extend.pageInfo.navigatepageNums, function (index, item) {
           var numLi = $("<li><li>").append($("<a></a>")).append(item);
           ul.append(numLi);
        });
        ul.append(nextPageLi).append(lastPageLi);

        var navEle = $("<nav></nav>").append(ul);

        navEle.appendTo("#page_list_area");
    }


    //显示分页信息
    function build_page_msg(result) {
        $("#page_info_area").append("当前第"+result.extend.pageInfo.pageNum+"页,总"+result.extend.pageInfo.pages+"页，总" +
            result.extend.pageInfo.total+"条记录")
    }
</script>

</body>
</html>
