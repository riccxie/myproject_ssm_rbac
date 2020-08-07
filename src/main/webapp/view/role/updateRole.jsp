
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
            <label class="form-label col-3"><span class="c-red">*</span>姓名：</label>
            <div class="formControls col-5">
                <input type="hidden" name="id" value="${user.id}">
                <input type="text" class="input-text" value="${user.username}" placeholder="" id="username" name="username" datatype="*2-8" nullmsg="用户名不能为空">
            </div>
            <div class="col-4"> </div>
        </div>

        <div class="row cl">
            <label class="form-label col-3"><span class="c-red">*</span>性别：</label>
            <div class="formControls col-5 skin-minimal">
                <div class="radio-box">
                    <input type="radio" id="sex-1" value="1" name="sex" datatype="*" nullmsg="请选择性别！">
                    <label for="sex-1">男</label>
                </div>
                <div class="radio-box">
                    <input type="radio" id="sex-2" value="0" name="sex">
                    <label for="sex-2">女</label>
                </div>
            </div>
            <div class="col-4"> </div>
        </div>
        <div class="row cl">
            <label class="form-label col-3"><span class="c-red">*</span>年龄：</label>
            <div class="formControls col-5">
                <input type="text" class="input-text" value="${user.age}" placeholder="" id="age" name="age"  datatype="n" nullmsg="手机不能为空">
            </div>
            <div class="col-4"> </div>
        </div>
        <div class="row cl">
            <label class="form-label col-3"><span class="c-red">*</span>邮箱：</label>
            <div class="formControls col-5">
                <input type="text" class="input-text" placeholder="@" value="${user.email}" name="email" id="email" datatype="e" nullmsg="请输入邮箱！">

            </div>
            <div class="col-4"> </div>
        </div>
        <div class="row cl">
            <label class="form-label col-3"><span class="c-red">*</span>生日：</label>
            <div class="formControls col-5">

                <input type="text" class="input-text" value="<fmt:formatDate value="${user.birthday}" pattern="yyyy-MM-dd"/>" onClick="WdatePicker({readOnly:true})" name="birthday" id="birthday" datatype="*" nullmsg="请输入生日！">
            </div>
            <div class="col-4"> </div>
        </div>
        <div class="row cl">
            <label class="form-label col-3"><span class="c-red">*</span>头像：</label>
            <input type="hidden" name="png" id="png" value="${user.png}">
            <div class="formControls col-5">

                <div id="uploader-demo">
                    <div id="fileList" class="uploader-list">

                        <div id="file_${user.id}" class="file-item thumbnail">
                            <img src="/file/showFile/${user.id}" style="width: 100px;height: 100px" >
                            <div class="info">fileName</div>
                        </div>

                    </div>

                    <div id="filePicker">修改图片</div>
                </div>

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
