<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <base href="<%=request.getContextPath()+"/"%>">
    <title>Title</title>
    <link href="css/H-ui.min.css" rel="stylesheet" type="text/css" />
    <link href="css/H-ui.admin.css" rel="stylesheet" type="text/css" />
    <link href="lib/icheck/icheck.css" rel="stylesheet" type="text/css" />
    <link href="lib/Hui-iconfont/1.0.1/iconfont.css" rel="stylesheet" type="text/css" />
    <link href="lib/webuploader/0.1.5/webuploader.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="pd-20">
    <form action="xxxxx" method="post" class="form form-horizontal" id="form-user-add">

        <div class="row cl">
            <label class="form-label col-3"><span class="c-red">*</span>角色名：</label>
            <div class="formControls col-5">
                <input type="hidden" name="id" value="${role.id}">
                <input type="text" class="input-text" value="${role.roleName}" placeholder="" id="role_name" name="roleName" datatype="*2-8" nullmsg="角色名不能为空">
            </div>
            <div class="col-4"> </div>
        </div>
        <div class="row cl">
            <label class="form-label col-3"><span class="c-red">*</span>权限：</label>
            <div class="formControls col-5">
                <input type="hidden" name="id" value="${role.id}">
                <input type="text" class="input-text" value="${role.roleDesc}" placeholder="" id="role_desc" name="roleDesc" datatype="*2-20" nullmsg="权限不能为空">
            </div>
            <div class="col-4"> </div>
        </div>

        <div class="row cl">
            <div class="col-9 col-offset-3">
                <input class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
            </div>
        </div>
    </form>
</div>
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="lib/icheck/jquery.icheck.min.js"></script>
<script type="text/javascript" src="lib/Validform/5.3.2/Validform.min.js"></script>
<script type="text/javascript" src="lib/layer/1.9.3/layer.js"></script>
<script type="text/javascript" src="js/H-ui.js"></script>
<script type="text/javascript" src="js/H-ui.admin.js"></script>
<script type="text/javascript" src="lib/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="lib/webuploader/0.1.5/webuploader.js"></script>
<script type="text/javascript" src="js/formutils.js"></script>
<script type="text/javascript">

    $(function(){

        // checkbox的插件
        $('.skin-minimal input').iCheck({
            checkboxClass: 'icheckbox-red',
            radioClass: 'iradio-red',
            increaseArea: '20%'
        });

        $("#form-user-add").Validform({
            tiptype:2,
            callback:function(form){ // 表单验证成功后提交
                submit("role/updateRole",form)
                return false; // 返回false表单不会提交
            }
        });
    });
</script>
</body>
</html>
