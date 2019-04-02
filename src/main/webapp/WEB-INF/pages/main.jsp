<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>系统主界面</title>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/jquery-easyui-1.3.3/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/jquery-easyui-1.3.3/themes/icon.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/all.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/jquery-easyui-1.3.3/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/jquery-easyui-1.3.3/validate.js"></script>
<style>
	
	/* .easyui-tree {
		transform: scale(1.5);
    	padding: 114px 41px 0px 36px;
	} */
	
	
	/*.tree-join,.tree-hit, .tree-expanded ,.tree-indent{background:none;}*/

</style>
<script type="text/javascript">
	$(function(){
		$("#tree").tree({
			lines:true,
			url:'/menu/getlist.do?parentId=-1',
			onLoadSuccess:function(){
				$("#tree").tree('expandAll');
				/* $(".tree-expanded").remove();
				$(".tree-indent.tree-join").remove(); */
			},
			onClick:function(node){
				if(node.id==16){
					logout();
				}else if(node.id==15){
					openPasswordModifyDialog();
				}else if(node.attributes.authPath){
					openTab(node);
				}
			}
		});
		
		
		
		
		function logout(){
			$.messager.confirm('系统提示','您确定要退出系统吗？',function(r){
				if(r){
					window.location.href='${pageContext.request.contextPath}/user/logout.do';
				}
			});
		}
		
		function openPasswordModifyDialog(){
			url="/user/modifyPassword.do";
			$("#dlg").dialog("open").dialog("setTitle","修改密码");
		}
		
		function openTab(node){
			if($("#tabs").tabs("exists",node.text)){
				$("#tabs").tabs("select",node.text);
			}else{
				var content="<iframe frameborder=0 scrolling='auto' style='width:100%;height:100%' src="+node.attributes.authPath+"></iframe>"
				$("#tabs").tabs("add",{
					title:node.text,
					iconCls:node.iconCls,
					closable:true,
					content:content
				});
			}
		}
	});
	
	
	function modifyPassword(){
		$("#fm").form("submit",{
			url:"${basePath}/user/modifyPassword.do",
			onSubmit:function(){
				var oldPassword=$("#oldPassword").val();
				var newPassword=$("#newPassword").val();
				var newPassword2=$("#newPassword2").val();
				if(!$(this).form("validate")){
					return false;
				}
				
				if(oldPassword!='${user.password}'){
					$.messager.alert('系统提示','用户名密码输入错误！');
					return false;
				}
				if(newPassword!=newPassword2){
					$.messager.alert('系统提示','确认密码输入错误！');
					return false;
				}
				return true;
			},
			success:function(result){
				var result=eval('('+result+')');
				if(result.errorMsg){
					$.messager.alert('系统提示',result.errorMsg);
					return;
				}else{
					$.messager.alert('系统提示','密码修改成功，下一次登录生效！');
					closePasswordModifyDialog();
				}
			}
		});
	}
	
	function closePasswordModifyDialog(){
		$("#dlg").dialog("close");
		$("#oldPassword").val("");
		$("#newPassword").val("");
		$("#newPassword2").val("");
	}
</script>
</head>
<body class="easyui-layout">
<div region="north" style="height: 88px;">
<div style="padding: 0px;margin: 0px;background-color: #f7faff;">
<table>
	<tr>
		<td height='78px' style='text-indent:1em'>
			<img alt="logo" src="${pageContext.request.contextPath}/resource/logo.gif">
			<font style='font-size: 14px;font-size: 14px;float: right;position: absolute;right: 18px;bottom: 12px;'> 欢迎您，${user.realname} ! </font>
		</td>
	</tr>
</table>
</div>
</div>
<div region="center">
	<div class="easyui-tabs" fit="true" border="false" id="tabs">
		<div title="首页" data-options="iconCls:'icon-home'">
			
		</div>
	</div>
</div>
<div region="west" style="width: 260px;padding: 5px;overflow-x: hidden;" title="导航菜单" split="true">
<ul id="tree" class="easyui-tree"></ul>
</div>
<div region="south" style="height: 25px;padding: 5px;" align="center">
	苏叶青版权所有 &nbsp;2018&nbsp;&nbsp;&nbsp; 
</div>

<div id="dlg" class="easyui-dialog" style="width: 400px;height: 220px;padding: 10px 20px" 
 closed="true" buttons="#dlg-buttons" data-options="iconCls:'icon-modifyPassword'">
 <form id="fm" method="post">
 	<table cellspacing="4px;">
 		<tr>
 			<td>用户名：</td>
 			<td><input type="hidden" name="userid" id="userid" value="${user.userid }"><input type="text" name="userid" id="userid" readonly="readonly" value="${user.username}" style="width: 200px;" /></td>
 		</tr>
 		<tr>
 			<td>原密码：</td>
 			<td><input type="password" class="easyui-validatebox" name="oldPassword" id="oldPassword" style="width: 200px;" required="true" /></td>
 		</tr>
 		<tr>
 			<td>新密码：</td>
 			<td><input type="password" class="easyui-validatebox" name="newPassword" id="newPassword" style="width: 200px;" required="true"  /></td>
 		</tr>
 		<tr>
 			<td>确认新密码：</td>
 			<td><input type="password" class="easyui-validatebox" name="newPassword2" id="newPassword2" style="width: 200px;" required="true" /></td>
 		</tr>
 	</table>
 </form>
</div>
<div id="dlg-buttons">
	<a href="javascript:modifyPassword()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
	<a href="javascript:closePasswordModifyDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
</div>
</body>
</html>