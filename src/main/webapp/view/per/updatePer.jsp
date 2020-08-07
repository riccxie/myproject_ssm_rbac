
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <base href="<%=request.getContextPath()+"/"%>">
    <title>Title</title>
    <link href="css/H-ui.min.css" rel="stylesheet" type="text/css" />
    <link href="css/H-ui.admin.css" rel="stylesheet" type="text/css" />
    <link href="lib/icheck/icheck.css" rel="stylesheet" type="text/css" />
    <link href="lib/Hui-iconfont/1.0.1/iconfont.css" rel="stylesheet" type="text/css" />

</head>
<body>
<div class="pd-20">
    <form action="xxxxx" method="post" class="form form-horizontal" id="form-per-add">

        <div class="row cl">
            <label class="form-label col-3"><span class="c-red">*</span>权限名称：</label>
            <div class="formControls col-5">
                <input type="text" class="input-text" value="${per.perName}" placeholder="" id="perName" name="perName" datatype="*2-8" nullmsg="用户名不能为空">
                <input type="hidden" name="id" value="${per.id}">
            </div>
            <div class="col-4"> </div>
        </div>

        <div class="row cl">
            <label class="form-label col-3"><span class="c-red">*</span>权限类型：</label>
            <div class="formControls col-5 skin-minimal">
                <div class="radio-box">
                    <input type="radio" id="perType-1" value="1" name="perType" datatype="*" nullmsg="请选择性别！" checked>
                    <label for="perType-1">目录</label>
                </div>
                <div class="radio-box">
                    <input type="radio" id="perType-2" value="2" name="perType">
                    <label for="perType-2">菜单</label>
                </div>
                <div class="radio-box">
                    <input type="radio" id="perType-3" value="3" name="perType">
                    <label for="perType-3">按钮</label>
                </div>
            </div>
            <div class="col-4"> </div>
        </div>
        <div class="row cl">
            <label class="form-label col-3">权限url：</label>
            <div class="formControls col-5">
                <input type="text" class="input-text" value="${per.perUrl}" placeholder="" id="perUrl" name="perUrl"  >
            </div>
            <div class="col-4"> </div>
        </div>

        <div class="row cl">
            <label class="form-label col-3">父目录：</label>
            <div class="formControls col-5">
                <input type="hidden" name="perPid" value="${per.perPid}" id="per_pid">
                <input type="text" class="input-text"  value="${per.perPname}" readonly placeholder="" id="per_pname" >
                <input type="text" style="width: 100px;" onclick="selectParentPer()" class="btn btn-primary radius" value="选择父权限"></input>
            </div>
            <div class="col-4"> </div>
        </div>

        <div class="row cl">
            <label class="form-label col-3">权限码：</label>
            <div class="formControls col-5">
                <input type="text" class="input-text" value="${per.perCode}" name="perCode" id="perCode" >

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
<script type="text/javascript" src="js/formutils.js"></script>
<script type="text/javascript" src="js/jquerysession.js"></script>
<script type="text/javascript" src="js/menuZtree.js"></script>

<script type="text/javascript">


    // 菜单类型
    var perType  = "${per.perType}";

    if(perType == 1){
        $("#perType-1").prop("checked",true);
    }else if(perType == 2){
        $("#perType-2").prop("checked",true);
    }else if(perType == 3){
        $("#perType-3").prop("checked",true);
    }

    function selectParentPer(){

        // 弹出一个层
        initMenuZtree("选择父权限","toMenuZtree","400","400");
    }

    $(function(){

        $('.skin-minimal input').iCheck({
            checkboxClass: 'icheckbox-blue',
            radioClass: 'iradio-blue',
            increaseArea: '20%'
        });

        $("#form-per-add").Validform({
            tiptype:2,
            callback:function(form){ // 表单验证成功后提交
                submit("per/updatePer",form)
                return false; // 返回false表单不会提交
            }
        });
    });
</script>
</body>
</html>
