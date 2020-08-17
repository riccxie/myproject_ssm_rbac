<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <base href="<%=request.getContextPath()+"/"%>">
    <title>Title</title>

    <link rel="stylesheet" href="lib/layer/ui/css/layui.css" media="all">
    <script src="lib/layer/ui/layui.js"></script>

</head>


<body>

<div id="pageDemo"></div>

<script type="text/javascript">
    layui.use('laypage', function(){
        // 分页对象
        var laypage = layui.laypage;

        //完整功能
        laypage.render({
            elem: 'pageDemo'
            ,count: "${pageInfo.total}"
            ,curr: "${pageInfo.pageNum}"
            ,limit:"${pageInfo.pageSize}"
            ,limits:[5,10,20,30]
            ,layout: ['prev', 'page', 'next', 'limit', 'refresh', 'skip','count']
            ,jump: function(obj,first){
                if(!first){
                    // 进行下一页的查询
                    location.href="${url}"+"?pageNum="+obj.curr+"&pageSize="+obj.limit;
                }
            }
        });
    });
</script>
</body>
</html>
