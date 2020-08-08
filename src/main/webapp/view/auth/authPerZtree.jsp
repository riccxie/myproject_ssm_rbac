
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <base href="<%=request.getContextPath()+"/"%>">
    <title>Title</title>
    <link href="lib/zTree/v3/css/zTreeStyle/zTreeStyle.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
    <script type="text/javascript" src="lib/zTree/v3/js/jquery.ztree.all-3.5.js"></script>
    <script type="text/javascript" src="lib/layer/1.9.3/layer.js"></script>
    <script type="text/javascript" src="js/formutils.js"></script>
    <script type="text/javascript" src="js/auth.js"></script>
</head>
<body>
<div>
       <button onclick="closeZtreePage()">确定</button>
    <ul id="treeDemo" class="ztree"></ul>
</div>
<SCRIPT LANGUAGE="JavaScript">

    // 1.获取角色id
    var roleId = "${roleId}";

    var zTreeObj;

    var setting = {
        check: {
            enable: true,
            chkStyle: "checkbox",
            chkboxType: { "Y": "ps", "N": "ps" }
        }
    };

    var zNodes = [];

    function closeZtreePage() {

        //2.获取用户勾选的数据
        var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
        var nodesArray = treeObj.getCheckedNodes(true);

        // 3.创建一个数组，把用户选择的节点id放到数组中
        var array = [];
        for(var i =0;i<nodesArray.length;i++){
            array.push(nodesArray[i].id);
        }

        // 4.封装对象
        var param = new Object();
        param.roleId =roleId;
        param.perIds =array;

        // 5.发送请求
        sendRequest("auth/addPerByRoleId",param);

    }

    $(document).ready(function(){


        var roleId = "${roleId}";

        // 1.发送请求根据角色Id查询所有权限
        $.post("auth/getPerListByRoleId/"+roleId,"",function(data){

            // 把简单的json转成标准的json
            var jsonArray = format(data);

            zNodes =jsonArray;

            // 初始化树插件
            zTreeObj = $.fn.zTree.init($("#treeDemo"), setting, zNodes);
        },"JSON");

    });
</SCRIPT>
</body>
</html>
