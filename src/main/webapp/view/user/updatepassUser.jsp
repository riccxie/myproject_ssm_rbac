<%--
  Created by IntelliJ IDEA.
  User: dashixin
  Date: 2020/8/4
  Time: 14:24
  To change this template use File | Settings | File Templates.
--%>
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
            <label class="form-label col-3"><span class="c-red"></span>id： ${user.id}</label>
        </div>

        <div class="row cl">
            <label class="form-label col-3"><span class="c-red"></span>姓名： ${user.username}</label>
        </div>


        <div class="row cl">
            <label class="form-label col-3"><span class="c-red">*</span>密码：</label>
            <div class="formControls col-5">
                <input type="password" placeholder="密码" id="password" name="password" autocomplete="off" value="qfAdmin" class="input-text" datatype="*6-10" nullmsg="密码不能为空">
            </div>
            <div class="col-4"> </div>
        </div>

        <div class="row cl">
            <label class="form-label col-3"><span class="c-red">*</span>确认密码：</label>
            <div class="formControls col-5">
                <input type="password" placeholder="密码"  recheck="password"   autocomplete="off" value="qfAdmin" class="input-text" datatype="*6-10" nullmsg="密码不能为空">
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


    // 初始化Web Uploader
    var uploader = WebUploader.create({
        auto: true, // 是否自动上传
        server: 'http://localhost:8080/file/uploadFile', // 上传服务的地址
        pick: '#filePicker', // 上传按钮的id
        fileNumLimit:1, // 只允许上传一个文件
        accept: {
            title: 'Images',
            extensions: 'gif,jpg,jpeg,bmp,png',
            mimeTypes: 'image/*'
        }
    });


    // 当有文件添加进来的时候
    uploader.on( 'fileQueued', function( file ) {
        var $li = $(
            '<div id="' + file.id + '" class="file-item thumbnail">' +
            '<img>' +
            '<div class="info">' + file.name + '</div>' +
            '</div>'
            ),

            $img = $li.find('img');


        // $list为容器jQuery实例
        $("#fileList").append( $li );

        // 创建缩略图
        // 如果为非图片文件，可以不用调用此方法。
        // thumbnailWidth x thumbnailHeight 为 100 x 100
        uploader.makeThumb( file, function( error, src ) {
            if ( error ) {
                $img.replaceWith('<span>不能预览</span>');
                return;
            }

            $img.attr( 'src', src );
        }, 100, 100);
    });

    // 文件上传成功，给item添加成功class, 用样式标记上传成功。
    uploader.on( 'uploadSuccess', function( file,data) {
        //$( '#'+file.id ).addClass('upload-state-done');
        $("#png").val(data.data);
    });

    $(function(){

        var sex = "${user.sex}";

        if(sex == 1){ // 男
            $("#sex-1").prop("checked",true);
        }else{
            $("#sex-2").prop("checked",true);
        }


        // checkbox的插件
        $('.skin-minimal input').iCheck({
            checkboxClass: 'icheckbox-red',
            radioClass: 'iradio-red',
            increaseArea: '20%'
        });

        $("#form-user-add").Validform({
            tiptype:2,
            callback:function(form){ // 表单验证成功后提交
                submit("user/updateUser",form)
                return false; // 返回false表单不会提交
            }
        });
    });
</script>
</body>
</html>