<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <base href="<%=request.getContextPath()+"/"%>">
    <title>Title</title>
    <link href="lib/zTree/v3/css/zTreeStyle/zTreeStyle.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
    <script type="text/javascript" src="lib/zTree/v3/js/jquery.ztree.core-3.5.js"></script>
    <script type="text/javascript" src="js/formutils.js"></script>
    <script type="text/javascript" src="js/jquerysession.js"></script>
</head>
<body>
<div>
    <input type="text" id="perName"><button onclick="closeZtreePage()">确定</button>
    <input type="hidden" id="perId">
    <!--准备一个容器用来显示树插件-->
    <ul id="treeDemo" class="ztree"></ul>
</div>
<SCRIPT LANGUAGE="JavaScript">

    var zTreeObj;

//    zTree 的参数配置，深入使用请参考 API 文档（setting 配置详解）
    var setting = {
        async: {
            enable: true, // 开启异步加载
            url: "per/getPerListByPid", // url
            autoParam: ["id"] // 节点传递的参数
        },
        callback: {
            onClick: zTreeOnClick // 点击节点的事件
        }
    };

    // zTree 的数据属性，深入使用请参考 API 文档（zTreeNode 节点数据详解）
    var zNodes = [];


    function zTreeOnClick(event, treeId, treeNode) {
        $("#perName").val(treeNode.name);
        $("#perId").val(treeNode.id);
    };

    function closeZtreePage() {

        // 获取用户选择父权限
        var name = $("#perName").val();
        var id = $("#perId").val();

        // 把id和name保存到session中
        $.session.set("p_id",id);
        $.session.set("p_name",name);

        // 关闭层
        layer_close();
    }

    $(document).ready(function(){
        // 初始化树插件
        zTreeObj = $.fn.zTree.init($("#treeDemo"), setting, zNodes);
    });
</SCRIPT>
</body>
</html>
