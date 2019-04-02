<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/jquery-easyui-1.3.3/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/jquery-easyui-1.3.3/themes/icon.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/all.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/jquery-easyui-1.3.3/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/jquery-easyui-1.3.3/validate.js"></script>

<style>
	.box {
		margin:200px;
	}
	
	body {
		background:url(${pageContext.request.contextPath}/resource/images/bg.jpg) no-repeat;
		background-size:100%;
	}

</style>
<title>注册页面</title>
</head>
<body>
	<div class='box'>
		<div id="p" class="easyui-panel" title="用户注册" style="width:700px;">
	 	<table cellspacing="20px">
	   		<tr>
	   			<td width="80px">用户名：</td>
	   			<td><input class="easyui-validatebox" data-options="prompt:'请输入用户名...',required:true,validType:'english'" id="username" name="username" style="width: 400px;"/></td>
	   		</tr>
	   		<tr>
	   			<td width="80px">密码：</td>
	   			<td><input class="easyui-validatebox" data-options="prompt:'请输入密码...',required:true" type="password" id="password" name="password" style="width: 400px;"/></td>
	   		</tr>
	   		<tr>
	   			<td width="80px">真实姓名：</td>
	   			<td><input class="easyui-validatebox" data-options="prompt:'请输入真实姓名...',required:true,validType:'CHS'" id="realname" name="realname" style="width: 400px;"/></td>
	   		</tr>
	   		<tr>
	   			<td width="80px">出生年月：</td>
	   			<td><input class='easyui-datetimebox' data-options="required:true"  id="birthdate" name="birthdate" style="width: 400px;"/></td>
	   		</tr>
	   		<tr>
	   			<td>性别：</td>
		   		<td>
		   			<select style="width: 154px"  id="sex" name="sex" editable="false" panelHeight="auto">
						<option value="">请选择性别...</option>
							<option value="男" selected="selected">男</option>
							<option value="女">女</option>
					</select>
				</td>
	   		</tr>
	   		<tr>
	   			<td></td>
	   			<td style="text-align:right;">
	   				<a href="javascript:submitData()" class="easyui-linkbutton">注册</a>
	   			</td>
	   		</tr>
	   	</table>
	 </div>
 	</div>
</body>
<script type="text/javascript">

	function submitData(){
		
		var username = $('#username').val();
		var password = $('#password').val();
		var realname = $('#realname').val();
		var birthdate = $('#birthdate').datetimebox('getValue');
		
		var sex = $('#sex').val();
		
		var obj = {username:username,password:password,realname:realname,birthdate:birthdate,sex:sex};
		
		for(data in obj){
			console.log(data);
			if(!obj[data]){
				$.messager.alert('错误','请将表单填写完整！');
				return;
			}
		}
		
		console.log(obj);
		
		$.post("${pageContext.request.contextPath}/reg/goReg.do",obj,function(data){
			console.log(data);
			
			if(data != '0'){
				$.messager.alert('错误',data);
			}else{
				alert("注册成功，即将回到登录页面！");
				window.location = "${pageContext.request.contextPath}/login/getLoginPage.do";
			}
			
		});
		
		
	}

</script>


</html>