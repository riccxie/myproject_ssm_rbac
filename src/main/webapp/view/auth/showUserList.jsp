
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <base href="<%=request.getContextPath()+"/"%>">
    <title>Title</title>
    <link href="css/H-ui.min.css" rel="stylesheet" type="text/css" />
    <link href="css/H-ui.admin.css" rel="stylesheet" type="text/css" />
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <link href="lib/Hui-iconfont/1.0.1/iconfont.css" rel="stylesheet" type="text/css" />
</head>

<body>
<div class="pd-20">

    <div class="cl pd-5 bg-1 bk-gray mt-20">
        <span class="l">
            <a href="javascript:;" onclick="auth_user()" class="btn btn-primary radius">
                <i class="Hui-iconfont">&#xe6e2;</i> 授权
            </a>
        </span>
    </div>

    <table class="table table-border table-bordered table-bg">
        <thead>
            <tr class="text-c">
                <th width="25"><input type="checkbox" name="" value=""></th>
                <th width="40">ID</th>
                <th width="150">用户名</th>
                <th width="90">邮箱</th>
            </tr>
        </thead>
        <tbody>
        <c:forEach items="${pageInfo.list}" var="user">
            <tr class="text-c">
                <td><input type="checkbox" class="user_id" value="${user.id}" name=""></td>
                <td>${user.id}</td>
                <td>${user.username}</td>
                <td>${user.email}</td>
            </tr>
        </c:forEach>

        </tbody>
    </table>
    <jsp:include page="/view/common/page.jsp"/>
</div>
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="lib/layer/1.9.3/layer.js"></script>
<script type="text/javascript" src="lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript" src="js/H-ui.js"></script>
<script type="text/javascript" src="js/H-ui.admin.js"></script>
<script type="text/javascript" src="js/formutils.js"></script>
<script type="text/javascript">

    function auth_user(){

        // 1.创建一个对象
        var param = new Object();

        // 2.获取用户选择的用户Id
        var array = $(".user_id:checked");

        var idsArray = [];

        for(var i =0;i<array.length;i++){
            idsArray.push(array[i].value);
        }

        // 2.角色iD
        var roleId = "${roleId}";

        // 3.把数组放到param对象中
        param.ids = idsArray;
        param.roleId = roleId;

        // 4.发送请求
        console.info(param);
        sendRequest("auth/addUserRole",param);

    }
</script>
</body>
</html>
