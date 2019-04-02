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
<title>菜单管理</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/jquery-easyui-1.3.3/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/jquery-easyui-1.3.3/themes/icon.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/all.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/jquery-easyui-1.3.3/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/jquery-easyui-1.3.3/validate.js"></script>


<div class='overlay'>
	<img alt="" src="${pageContext.request.contextPath}/resource/loading.gif" />
</div>
<script>

	setTimeout(function(){
		
		$(".overlay").hide();
		
	},600);

</script>

<script type="text/javascript">
	var url;
	
	$(function(){
		$('#treeGrid').treegrid({
			url:'${basePath}/menu/authTreeGridMenu.do?parentId=-1',
			onLoadSuccess:function(){
				$("#treeGrid").treegrid('expandAll');
			}
		});
		
		
		
	});
	
	function formatIconCls(value,row,index){
		return "<div class="+value+">&nbsp;</div>";
	}
	
	//新增
	function openAuthAddDialog(){
		var node=$('#treeGrid').treegrid('getSelected');
		if(node==null){
			$.messager.alert('系统提示','请选择一个父菜单节点！');
			return;
		}
		$("#dlg").dialog("open").dialog("setTitle","添加菜单");
		

		url="${basePath}/menu/saveAuth.do?parentid="+node.id;
	}
	
	
	//修改
	function openAuthModifyDialog(){
		var node=$('#treeGrid').treegrid('getSelected');
		if(node==null){
			$.messager.alert('系统提示','请选择一个要修改的菜单！');
			return;
		}
		$("#dlg").dialog("open").dialog("setTitle","修改菜单");
		
		
		console.log({
			authdescription : node.authDescription ,
			authpath : node.authPath ,
			iconcls : node.iconCls ,
			id : node.id ,
			state : node.state ,
			authname : node.text ,
			parentid : node._parentId ,
		});
		$("#fm").form("load",{
			authdescription : node.authDescription ,
			authpath : node.authPath ,
			iconcls : node.iconCls ,
			id : node.id ,
			state : node.state ,
			authname : node.text ,
			parentid : node._parentId ,
		});
		$("#authName").val(node.text);
		url="${basePath}/menu/saveAuth.do?authid="+node.id + "&parentid=" + node._parentId;
	}
	
	function deleteAuth(){
		var node=$("#treeGrid").treegrid('getSelected');
		if(node==null){
			$.messager.alert('系统提示','请选择一个要删除的菜单节点！');
			return;
		}
		var parentNode=$("#treeGrid").treegrid('getParent',node.id);
		$.messager.confirm("系统提示","您确认要删除这个菜单节点吗?",function(r){
			if(r){
				$.post("${basePath}/menu/delete.do",{authId:node.id,parentId:parentNode.id},function(result){
					if(result.success){
						$.messager.alert('系统提示',"您已成功删除这个菜单节点！");
						$("#treeGrid").treegrid("reload");
					}else{
						$.messager.alert('系统提示',result.errorMsg);
					}
				},"json");
			}
		});
	}
	
	//保存
	function saveAuth(){
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
					closeAuthDialog();
					$("#treeGrid").treegrid("reload");
				}
			}
		});
	}
	
	function closeAuthDialog(){
		$("#dlg").dialog("close");
		$("#fm").form('clear');
		$("#iconCls").val("icon-item");
	}
</script>
</head>
<body style="margin: 1px;">
<table id="treeGrid" title="菜单管理" class="easyui-treegrid" 
  toolbar="#tb" data-options="idField:'id',treeField:'text',fit:true,fitColumns:true,rownumbers:true">
    <thead>
    	<tr>
    		<th field="id" width="30" align="center">菜单编号</th>
    		<th field="text" width="80">菜单名称</th>
    		<th field="iconCls" width="35" align="center" formatter="formatIconCls" >图标</th>
    		<th field="authPath" width="100" align="center">链接地址</th>
    		<th field="authDescription" width="100" align="center">备注</th>
    	</tr>
    </thead>
</table>
<div id="tb">
	<div>
		<a href="javascript:openAuthAddDialog()" class="easyui-linkbutton" iconCls="icon-add" plain="true">添加</a>
		<a href="javascript:openAuthModifyDialog()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
		<a href="javascript:deleteAuth()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
	</div>
</div>

<div id="dlg" class="easyui-dialog" style="width: 670px;height: 350px;padding: 10px 20px"
  closed="true" buttons="#dlg-buttons">
  <form id="fm" method="post">
  	<table cellspacing="5px;">
  		<tr>
  			<td>菜单名称：</td>
  			<td><input type="text" id="authname" name="authname" class="easyui-validatebox" required="true"/></td>
  			<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
  			<td>菜单样式：</td>
  			<td>
  				<input type="text" id="iconcls" name="iconcls" value="icon-item" class="easyui-validatebox" required="true"/>
  				<a href="javascript:openIconChooseDialog()" class="easyui-linkbutton" >选择图标</a>
  			</td>
  		</tr>
  		<tr>
  			<td>链接路径：</td>
  			<td colspan="4"><input type="text" size="58" id="authpath" name="authpath" class="easyui-validatebox" required="true"/></td>
  		</tr>
  		<tr>
  			<td valign="top">备注：</td>
  			<td colspan="4">
  				<textarea rows="7" cols="50" name="authdescription" id="authdescription"></textarea>
  			</td>
  		</tr>
  	</table>
  </form>
</div>

<div id="dlg-buttons">
	<a href="javascript:saveAuth()" class="easyui-linkbutton" iconCls="icon-ok" >保存</a>
	<a href="javascript:closeAuthDialog()" class="easyui-linkbutton" iconCls="icon-cancel" >关闭</a>
</div>


<!-- 选择图标的菜单 -->
<div id="dlg2" class="easyui-dialog" iconCls="icon-search" style="width: 600px;height: 320px;padding: 10px 20px"
  closed="true" buttons="#dlg2-buttons">

  <div style="height: 350px;">
  	<table id="dg2"  class="easyui-datagrid" fitColumns="true" 
    pagination="false" rownumbers="true" url="${basePath}/menu/listIcons.do" singleSelect="true" fit="true" >
    <thead>
    	<tr>
    		<th field="icon" width="50" align="center">图标样式</th>
    		<th field="id" width="50" align="center">class</th>
    	</tr>
    </thead>
</table>
  </div>
</div>



<div id="dlg2-buttons">
	<a href="javascript:chooseIcon()" class="easyui-linkbutton" iconCls="icon-ok" >确定</a>
	<a href="javascript:closeRoleDialog()" class="easyui-linkbutton" iconCls="icon-cancel" >关闭</a>
</div>


<script>

	function chooseIcon(){
		var selectedRows=$("#dg2").datagrid('getSelections');
		if(selectedRows.length!=1){
			$.messager.alert('系统提示','请选择一个图标！');
			return;
		}
		var row=selectedRows[0];
		$("#iconcls").val(row.id);
		$("#dlg2").dialog("close");
	}
	
	function openIconChooseDialog(){
		$("#dlg2").dialog("open").dialog("setTitle","选择图标");
	}
	
	

</script>

</body>
</html>