
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <div class="text-c">
        <div class="row cl ">
            <div class="formControls col-3">
                <label class="form-label col-3">角色：</label>
                <div class="formControls col-5">
				<span class="select-box" style="width:150px;">
					<select class="select" name="role" id="role" size="1">
                        <option value="">==请选择==</option>
                        <c:forEach items="${roleList}" var="role">
						    <option value="${role.id}">${role.roleName}</option>
                        </c:forEach>
					</select>
				</span>
                </div>
            </div>
            <div class="formControls col-4">
                <label class="form-label col-3"><span class="c-red"></span>授权类型：</label>
                <div class="formControls col-5 skin-minimal">
                    <div class="radio-box">
                        <input type="radio" id="sex-1" value="1" name="auth_type">
                        <label for="sex-1">人员</label>
                    </div>
                    <div class="radio-box">
                        <input type="radio" id="sex-2" value="0" name="auth_type">
                        <label for="sex-2">权限</label>
                    </div>
                </div>
            </div>
        </div>

        <div class="row cl">
            <div class="cl pd-5">
                <button type="button"
                        class="btn btn-success radius" id="search_auth" name="">
                    <i class="Hui-iconfont">&#xe665;</i> 查询
                </button>
            </div>
        </div>
    </div>

    <div class="cl pd-5 bg-1 bk-gray mt-20">
        <span class="l">
            <a href="javascript:;" id="auth_user" class="btn btn-primary radius">
                <i class="Hui-iconfont">&#xe62d;</i> 授权人员
            </a>

            <a href="javascript:;" id="auth_per" class="btn btn-primary radius">
                <i class="Hui-iconfont">&#xe62d;</i> 授权菜单
            </a>
        </span>
    </div>

    <table class="table table-border table-bordered table-bg" id="auth_table">
    </table>

</div>
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="lib/layer/1.9.3/layer.js"></script>
<script type="text/javascript" src="js/H-ui.js"></script>
<script type="text/javascript" src="js/H-ui.admin.js"></script>
<script type="text/javascript" src="js/formutils.js"></script>
<script type="text/javascript" src="js/auth.js"></script>
<script type="text/javascript">

    $(function () {

        $("#auth_user").click(function(){
            // 1.获取用户选择的角色
            var roleId = $("#role").val();

           if(isChcked(roleId,"请选择角色")){
               // 弹出一个层
               my_layer_show("选择用户","auth/getUserPage/"+roleId,600,500);
           }

        });

        $("#search_auth").click(function(){
            // 1.获取用户选择的角色
            var roleId = $("#role").val();

            // 2.获取用户选择的授权类型
            var auth_type = $("input[name='auth_type']:checked").val();

            if(isChcked(roleId,"请选择角色") && isChcked(auth_type,"请选择类型")){

                // 3.判断用户选择的的类型
                if(auth_type == 1){ // 查询人员

                    $("#auth_table").load("auth/getUserListByRoleId/"+roleId);
                }else if(auth_type == 0){ //  查询权限
                    $("#auth_table").load("auth/getPerListByRoleId/"+roleId);
                }
            }
        });

        $("#auth_per").click(function(){
            // 1.获取用户选择的角色
            var roleId = $("#role").val();

            if(isChcked(roleId,"请选择角色")){
                // 弹出一个层
                my_layer_show("选择权限","auth/toAuthPerZtree/"+roleId,600,500);
            }
        });
    })

    function isChcked(val,msg){
        if(!val){
            layer.msg(msg,{icon:3,time:1000})
            return false;
        }
        return true;
    }
</script>
</body>
</html>
