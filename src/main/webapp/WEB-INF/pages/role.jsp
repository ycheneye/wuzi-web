<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	int port = request.getServerPort();
	String basePath  = null;
	if(port==80){
		basePath = request.getScheme()+"://"+request.getServerName()+path;
	}else{
		basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
	}
	request.setAttribute("basePath", basePath);
%>  


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

<script type="text/javascript">
	function searchRole(){
		$('#dg').datagrid('load',{
			s_roleName:$("#s_roleName").val()
		});
	}
	
	function deleteRole(){
		var selectedRows=$("#dg").datagrid('getSelections');
		if(selectedRows.length==0){
			$.messager.alert('系统提示','请选择要删除的数据！');
			return;
		}
		var strIds=[];
		for(var i=0;i<selectedRows.length;i++){
			strIds.push(selectedRows[i].roleid);
		}
		var ids=strIds.join(",");
		$.messager.confirm("系统提示","您确认要删除这<font color=red>"+selectedRows.length+"</font>条数据吗？",function(r){
			if(r){
				$.post("${basePath}/role/delete.do",{delIds:ids},function(result){
					if(result.success){
						$.messager.alert('系统提示',"您已成功删除<font color=red></font>数据！");
						$("#dg").datagrid("reload");
					}else{
						$.messager.alert('系统提示','<font color=red>'+selectedRows[result.errorIndex].roleName+'</font>'+result.errorMsg);
					}
				},"json");
			}
		});
	}
	
	var url;
	
	function openRoleAddDialog(){
		$("#dlg").dialog("open").dialog("setTitle","添加角色信息");
		url="${basePath}/role/save.do";
	}
	
	function openRoleModifyDialog(){
		var selectedRows=$("#dg").datagrid('getSelections');
		if(selectedRows.length!=1){
			$.messager.alert('系统提示','请选择一条要编辑的数据！');
			return;
		}
		var row=selectedRows[0];
		$("#dlg").dialog("open").dialog("setTitle","修改角色信息");
		$("#fm").form("load",row);
		url="${basePath}/role/save.do?roleid="+row.roleid;
	}
	
	function saveRole(){
		$("#fm").form("submit",{
			url:url,
			onSubmit:function(){
				return $(this).form("validate");
			},
			success:function(result){
				var result=eval('('+result+')');
				if(result.errorMsg){
					$.messager.alert('系统提示',"<font color=red>"+result.errorMsg+"</font>");
					return;
				}else{
					$.messager.alert('系统提示','保存成功');
					closeRoleSaveDialog();
					$("#dg").datagrid("reload");
				}
			}
		});
	}
	
	function closeRoleSaveDialog(){
		$("#dlg").dialog("close");
		$("#fm").form('clear');
	}
	
	function openAuthDialog(){
		var selectedRows=$("#dg").datagrid('getSelections');
		if(selectedRows.length!=1){
			$.messager.alert('系统提示','请选择一条要授权的角色！');
			return;
		}
		var row=selectedRows[0];
		roleid=row.roleid;
		$("#dlg2").dialog("open").dialog("setTitle","角色授权");
		
		url="${basePath}/menu/getAuthMenu.do?parentId=-1&roleId="+roleid;
		
		$("#tree").tree({
			lines:true,
			url:url,
			checkbox:true,
			cascadeCheck:false,
			onLoadSuccess:function(){
				$("#tree").tree('expandAll');
			},
			onCheck:function(node,checked){
				if(checked){
					checkNode($('#tree').tree('getParent',node.target));
				}
			}
		});
	}
	
	function checkNode(node){
		if(!node){
			return;
		}else{
			checkNode($('#tree').tree('getParent',node.target));
			$('#tree').tree('check',node.target);
		}
	}
	
	function closeAuthDialog(){
		$("#dlg2").dialog("close");
	}
	
	function saveAuth(){
		var nodes=$('#tree').tree('getChecked');
		var authArrIds=[];
		for(var i=0;i<nodes.length;i++){
			authArrIds.push(nodes[i].id);
		}
		var authIds=authArrIds.join(",");
		
		
		$.post("${basePath}/role/auth.do",{authIds:authIds,roleid:roleid},function(result){
			if(result.success){
				$.messager.alert('系统提示','授权成功！');
				closeAuthDialog();
			}else{
				$.messager.alert('系统提示',result.errorMsg);
			}
		},"json");
	}
</script>
<title>角色管理</title>
</head>
<body style="margin: 1px;">
<table id="dg" title="角色管理" class="easyui-datagrid" fitColumns="true" 
    pagination="true" rownumbers="true" url="${basePath}/role/list.do" fit="true" toolbar="#tb">
    <thead>
    	<tr>
    		<th field="cb" checkbox="true" align="center"></th>
			<th field="roleid" width="50" align="center">编号</th>
			<th field="rolename" width="100" align="center">角色名称</th>
    		<th field="roledescription" width="200" align="center">备注</th>
    	</tr>
    </thead>
</table>
<div id="tb">
	<div>
		<a href="javascript:openRoleAddDialog()" class="easyui-linkbutton" iconCls="icon-add" plain="true">添加</a>
		<a href="javascript:openRoleModifyDialog()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
		<a href="javascript:deleteRole()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
		<a href="javascript:openAuthDialog()" class="easyui-linkbutton" iconCls="icon-roleManage" plain="true">角色授权</a>
	</div>
	<div>
		&nbsp;角色名称：&nbsp;<input type="text" name="s_roleName" id="s_roleName" size="20" onkeydown="if(event.keyCode==13) searchRole()"/>
		<a href="javascript:searchRole()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a>
	</div>
</div>

<div id="dlg" class="easyui-dialog" style="width: 570px;height: 350px;padding: 10px 20px"
  closed="true" buttons="#dlg-buttons">
  <form id="fm" method="post">
  	<table cellspacing="5px;">
  		<tr>
  			<td>角色名称：</td>
  			<td width="80%"><input type="text" id="rolename" name="rolename" class="easyui-validatebox" required="true"/></td>
  		</tr>
  		<tr>
  			<td valign="top">备注：</td>
  			<td colspan="2">
  				<textarea rows="7" cols="50" name="roledescription" id="roledescription"></textarea>
  			</td>
  		</tr>
  	</table>
  </form>
</div>

<div id="dlg-buttons">
	<a href="javascript:saveRole()" class="easyui-linkbutton" iconCls="icon-ok" >保存</a>
	<a href="javascript:closeRoleSaveDialog()" class="easyui-linkbutton" iconCls="icon-cancel" >关闭</a>
</div>

<div id="dlg2" class="easyui-dialog" style="width: 300px;height: 450px;padding: 10px 20px"
  closed="true" buttons="#dlg2-buttons">
	<ul id="tree" class="easyui-tree"></ul>
</div>

<div id="dlg2-buttons">
	<a href="javascript:saveAuth()" class="easyui-linkbutton" iconCls="icon-ok" >授权</a>
	<a href="javascript:closeAuthDialog()" class="easyui-linkbutton" iconCls="icon-cancel" >关闭</a>
</div>
</body>
</html>