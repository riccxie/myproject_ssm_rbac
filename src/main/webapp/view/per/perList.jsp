
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
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 管理员管理 <span class="c-gray en">&gt;</span> 管理员列表 <a class="btn btn-success radius r mr-20" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="pd-20">

    <div class="cl pd-5 bg-1 bk-gray mt-20">
        <span class="l">
            <a href="javascript:;" onclick="batchDel()" class="btn btn-danger radius">
                <i class="Hui-iconfont">&#xe6e2;</i> 批量删除
            </a>

            <a href="javascript:;" onclick="admin_add('添加权限','toAddPerPage','800','500')" class="btn btn-primary radius">
                <i class="Hui-iconfont">&#xe600;</i> 添加权限
            </a>
        </span>
    </div>

    <table class="table table-border table-bordered table-bg">
        <thead>
            <tr>
                <th scope="col" colspan="8">员工列表</th>
            </tr>
            <tr class="text-c">
                <th width="25"><input type="checkbox" name="" value=""></th>
                <th width="40">ID</th>
                <th width="150">权限名称</th>
                <th width="90">权限码</th>
                <th width="150">权限的类型</th>
                <th width="50">权限url</th>
                <th width="130">父权限</th>
                <th width="100">操作</th>
            </tr>
        </thead>
        <tbody>
        <c:forEach items="${pageInfo.list}" var="per">
            <tr class="text-c">
                <td><input type="checkbox" class="user_id" value="${per.id}" name=""></td>
                <td>${per.id}</td>
                <td>${per.perName}</td>
                <td>${per.perCode}</td>
                <td  class="td-status">
                    <c:if test="${per.perType == 1}">
                         <span class="label label-success radius">目录</span>
                    </c:if>
                    <c:if test="${per.perType == 2}">
                        <span class="label label-danger radius">菜单</span>
                    </c:if>
                    <c:if test="${per.perType == 3}">
                        <span class="label radius">按钮</span>
                    </c:if>
                </td>
                <td>${per.perUrl}</td>
                <td>${per.perPname}</td>
                <td class="td-manage">
                    <a title="编辑" href="javascript:;" onclick="admin_edit('权限编辑','per/getPerById/${per.id}','1','800','500')" class="ml-5" style="text-decoration:none">
                        <i class="Hui-iconfont">&#xe6df;</i>
                    </a>

                    <a title="删除" href="javascript:;" onclick="admin_del(this,'${user.id}')" class="ml-5" style="text-decoration:none">
                        <i class="Hui-iconfont">&#xe6e2;</i>
                    </a>
                </td>
            </tr>
        </c:forEach>

        </tbody>
    </table>
    <jsp:include page="/view/common/page.jsp"/>
</div>
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="lib/layer/1.9.3/layer.js"></script>
<script type="text/javascript" src="lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript" src="lib/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="js/H-ui.js"></script>
<script type="text/javascript" src="js/H-ui.admin.js"></script>
<script type="text/javascript" src="js/formutils.js"></script>
<script type="text/javascript">
    /*
        参数解释：
        title	标题
        url		请求的url
        id		需要操作的数据id
        w		弹出层宽度（缺省调默认值）
        h		弹出层高度（缺省调默认值）
    */
    /*管理员-增加*/
    function admin_add(title,url,w,h){

        layer_show(title,url,w,h);
    }
    /*管理员-删除*/
    function admin_del(obj,id){

        layer.confirm('确认要删除吗？',function(index){
            //此处请求后台程序，下方是成功后的前台处理……
            layer.msg(id);
            // 异步异步请求,把id传递服务端
            layer.msg('已删除!',{icon:1,time:1000},function(){
                location.reload();
            });
        });
    }
    /*管理员-编辑*/
    function admin_edit(title,url,id,w,h){
        layer_show(title,url,w,h);
    }
    
    function batchDel() {

        // 1.获取用户勾选的数据
        var array = $(".user_id:checked");

        // 2.创建一个对象
        var param = new Object();
        var idsArray = [];

        for(var i =0;i<array.length;i++){
            idsArray.push(array[i].value);
        }

        // 3.把数组放到param对象中
        param.ids = idsArray;

        // 4.发送请求
        sendRequestFlush("user/batchDel",param);

    }
    /*管理员-停用*/
    function admin_stop(obj,id){
        layer.confirm('确认要停用吗？',function(index){
            //此处请求后台程序，下方是成功后的前台处理……

            $(obj).parents("tr").find(".td-manage").prepend('<a onClick="admin_start(this,id)" href="javascript:;" title="启用" style="text-decoration:none"><i class="Hui-iconfont">&#xe615;</i></a>');
            $(obj).parents("tr").find(".td-status").html('<span class="label label-default radius">已禁用</span>');
            $(obj).remove();
            layer.msg('已停用!',{icon: 5,time:1000});
        });
    }

    /*管理员-启用*/
    function admin_start(obj,id){
        layer.confirm('确认要启用吗？',function(index){
            //此处请求后台程序，下方是成功后的前台处理……


            $(obj).parents("tr").find(".td-manage").prepend('<a onClick="admin_stop(this,id)" href="javascript:;" title="停用" style="text-decoration:none"><i class="Hui-iconfont">&#xe631;</i></a>');
            $(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已启用</span>');
            $(obj).remove();
            layer.msg('已启用!', {icon: 6,time:1000});
        });
    }
</script>
</body>
</html>
