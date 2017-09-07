<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8"/>
        <title>分布式文件系统</title>
        <link href="http://cdn.bootcss.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="css/default.css">
        <link href="css/fileinput.css" media="all" rel="stylesheet" type="text/css" />
        <script src="http://cdn.bootcss.com/jquery/1.11.0/jquery.min.js" type="text/javascript"></script>
        <script>window.jQuery || document.write('<script src="js/jquery-1.11.0.min.js"><\/script>')</script>
        <script src="js/fileinput.js" type="text/javascript"></script>
        <!--简体中文-->
        <script src="js/locales/zh.js" type="text/javascript"></script>
        <script src="http://cdn.bootcss.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script>
	$(function() {
		//给修改按钮绑定事件
		$("#update").click(function() {
			var roleids = $("input[id=roleids]:checked");
			if (roleids.length == 1) {
				//提交表单
				var f1 = $("#f1");
				f1.attr("action", "xiazai");
				f1.submit();
				return true;
			} else {
				alert("必须选自一个（只能有一个）进行修改");
				return false;
			}
		});
		$("#delete").click(function() {
			var roleids = $("input[id=roleids]:checked");
			if (roleids.length == 1) {
				//提交表单
				var f1 = $("#f2");
				f1.attr("action", "shanchu");
				f1.submit();
				return true;
			} else {
				alert("必须选自一个（只能有一个）进行删除");
				return false;
			}
		});
		$("#sub").click(
			function() {
				// 请求的URL ,请求的内容，回调函数
				$.get("chakan",function(data) {
				var html = "";
				$.each(data,function(index,value) {
				var va = value;
				html += '<tr><td><input type="checkbox" id="roleids" value="'+va+'" name="name"/>'+ va+ '</td></tr>';
						});
				$("#ta").html(html);
					});
				});
		$("#sub1").click(
			function() {
				// 请求的URL ,请求的内容，回调函数
				$.get("chakan",function(data) {
				var html = "";
				$.each(data,function(index,value) {
				var va = value;
				html += '<tr><td><input type="checkbox" id="roleids" value="'+va+'" name="name"/>'+ va+ '</td></tr>';
						});
				$("#ta1").html(html);
					});
				});
			})
</script>
</head>
    <body>
            <div class="htmleaf-container">
                <div class="container kv-main">
                    <div class="page-header">
                    <h2>Bootstrap File Input Example</h2>
                    </div>
                    <form enctype="multipart/form-data" action="shangchuan" method="post" >
                        <input id="file-0a" class="file" type="file" multiple data-min-file-count="1" name="file">
                        <br>
                        <button type="submit" class="btn btn-primary">Submit</button>
                        <button type="reset" class="btn btn-default">Reset</button>
                    </form>
                    <br>
                        <button class="btn btn-primary" id="sub">下载列表</button>
					<br>
				<form action="xiazai" id="f1" method="post">
					<table id="ta">
						
					</table>
					<br>
					<input type="submit" value="下载" id="update" class="btn btn-primary">
				</form>
				<br>
                       <button class="btn btn-primary" id="sub1">删除列表</button>
				<br>
				<form action="shanchu" id="f2" method="post">
					<table id="ta1">
						
					</table>
					<br>
					<input type="submit" value="删除" id="delete" class="btn btn-primary">
				</form>
				<hr>
                </div>
            </div>
    </body>
	<script>
    $('#file-zh').fileinput({
        language: 'zh',
        uploadUrl: '#',
        allowedFileExtensions : ['jpg', 'png','gif'],
    });
    $('#file-zh-TW').fileinput({
        language: 'zh-TW',
        uploadUrl: '#',
        allowedFileExtensions : ['jpg', 'png','gif'],
    });
    $("#file-0").fileinput({
        'allowedFileExtensions' : ['jpg', 'png','gif'],
    });
    $("#file-1").fileinput({
        uploadUrl: '#', // you must set a valid URL here else you will get an error
        allowedFileExtensions : ['jpg', 'png','gif'],
        overwriteInitial: false,
        maxFileSize: 1000,
        maxFilesNum: 10,
        slugCallback: function(filename) {
            return filename.replace('(', '_').replace(']', '_');
        }
	});
	$("#file-3").fileinput({
		showUpload: false,
		showCaption: false,
		browseClass: "btn btn-primary btn-lg",
		fileType: "any",
        previewFileIcon: "<i class='glyphicon glyphicon-king'></i>"
	});
	$("#file-4").fileinput({
		uploadExtraData: {kvId: '10'}
	});
    $(".btn-warning").on('click', function() {
        if ($('#file-4').attr('disabled')) {
            $('#file-4').fileinput('enable');
        } else {
            $('#file-4').fileinput('disable');
        }
    });    
    $(".btn-info").on('click', function() {
        $('#file-4').fileinput('refresh', {previewClass:'bg-info'});
    });
    $(document).ready(function() {
        $("#test-upload").fileinput({
            'showPreview' : false,
            'allowedFileExtensions' : ['jpg', 'png','gif'],
            'elErrorContainer': '#errorBlock'
        });
    });
	</script>
</html>