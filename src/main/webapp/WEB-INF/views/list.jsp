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
                <table class="table">
                    <tr>
                        <th>#</th>
                        <th>empName</th>
                        <th>gender</th>
                        <th>email</th>
                        <th>deptName</th>
                        <th>操作</th>
                    </tr>
                        <c:forEach items="${page.list }" var="emp">
                            <tr>
                                <td>${emp.empId }</td>
                                <td>${emp.empName }</td>
                                <td>${emp.gender=="1"?"男":"女" }</td>
                                <td>${emp.email }</td>
                                <td>${emp.department.deptName }</td>
                                <td>
                                    <button type="button" class="btn btn-info">
                                        <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> 编辑
                                    </button>
                                    <button type="button" class="btn btn-warning">
                                        <span class="glyphicon glyphicon-trash" aria-hidden="true"></span> 删除
                                    </button>
                                </td>
                            </tr>
                        </c:forEach>

                </table>
            </div>

        </div>

        <%--   分页条     --%>
        <div class="row">
            <div class="col-md-6 col-md-offset-6">
                <nav aria-label="Page navigation">
                    <ul class="pagination">

                        <li>
                            <a href="${APP_PATH}/emps?pn=1">首页</a>
                        </li>
                        <li>
                            <c:if test="${page.hasPreviousPage}">
                                <a href="${APP_PATH}/emps?pn=${page.pageNum - 1}" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </c:if>

                        </li>

                        <c:forEach items="${page.navigatepageNums}" var="page_Num">
                            <c:if test="${page_Num == page.pageNum }">
                                <li class="active"><a href="#">${page_Num}</a></li>
                            </c:if>
                            <c:if test="${page_Num != page.pageNum }">
                                <li><a href="${APP_PATH}/emps?pn=${page_Num}">${page_Num}</a></li>
                            </c:if>
                        </c:forEach>
                        <li>
                            <c:if test="${page.hasNextPage }">
                                <a href="${APP_PATH}/emps?pn=${page.pageNum + 1}" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </c:if>
                        </li>
                        <li>
                            <li>
                                <a href="${APP_PATH}/emps?pn=${page.pages}">末页</a>
                            </li>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>

        <div class="row">
            <div class="col-md-6">
                当前第${page.pageNum}页，总${page.pages}页，总${page.total}条记录
            </div>
        </div>

    </div>

</body>
</html>
