<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="public/top.jsp"></jsp:include>


	<!-- 列表 开始 -->

	<table id="grid0" title="部门管理" class="easyui-datagrid" fitColumns="true" pageSize="20"
	    pagination="true" singleSelect="true" rownumbers="true" url="${basePath}/admin/dept/list.do" fit="true" toolbar="#tb">
	    <thead>
	    	<tr>
	    		<th field="cb" checkbox="true" align="center"></th>
	    		<th field="deptid" width="50" align="center">编号</th>
	    		<th field="deptname" width="100" align="center">部门名称</th>
	    		<th field="userid" width="180" align="center" hidden="true">登记人ID(隐藏)</th>
	    		<th field="userName" width="100" align="center">登记人</th>
	    		<th field="create_time" width="150" align="center">创建时间</th>
	    		<th field="update_time" width="150" align="center">最后更新时间</th>
	    		<th field="is_delete" width="300" align="center"  hidden="true">是否删除</th>
	    	</tr>
	    </thead>
	</table>
	
	
	<div id="tb">
		<div>
			<a href="javascript:openAddDialog()" class="easyui-linkbutton" iconCls="icon-add" plain="true">添加</a>
			<a href="javascript:openModifyDialog()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
			<a href="javascript:deleteDatas()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
		</div>
		<div>
			&nbsp;部门名称：&nbsp;<input type="text" name="deptname_search" id="deptname_search" size="20" onkeydown="if(event.keyCode==13) search()"/>
			<a href="javascript:search()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a>
		</div>
	</div>
	
	<!-- 列表  结束 -->
	
	
	
	<!-- form表单   开始 -->
	
	<!-- 物资新增、修改页面 -->
	<div id="dialog0" class="easyui-dialog" style="width: 420px;height: 150px;padding: 10px 20px"
	  closed="true" buttons="#dlg-buttons">
	  <form id="form0" method="post">
	  	<table cellspacing="5px;">
	  		<tr>
	  			<td>部门名称：</td>
	  			<td><input type="text" id="deptname" name="deptname" class="easyui-validatebox" required="true"/></td>
	  		</tr>
	  	</table>
	  </form>
	</div>
	
	
	<div id="dlg-buttons">
		<a href="javascript:save()" class="easyui-linkbutton" iconCls="icon-ok" >保存</a>
	</div>
	
	<!-- form表单   结束 -->
	
	
	
	<script>
	
		var url = "";
		
		//打开新增窗口
		function openAddDialog(){
			url = "${basePath}/admin/dept/save.do";
			dialog0.open("添加物资信息");
		}
		
		//打开修改窗口
		function openModifyDialog(){
			if(grid0.getSelectedCount() != 1){
				$.messager.alert('系统提示','<font color=red>请选择一条要修改的数据！</font>');
				return;
			}
			var row = grid0.getSelections()[0];
			form0.fillData(row);
			
			url = "${basePath}/admin/dept/save.do?deptid=" + row.deptid;
			
			dialog0.open("修改物资信息");
			
		}
		
		
		function search(){
			var deptname_search = $("#deptname_search").val();
			var obj = {};
			obj.deptname = "%"+deptname_search+"%";
			grid0.reload(obj);
		}
		
		//保存物资信息
		function save(){
			form0.submit(url,function(data){
				if(data.errCode < 0){
					$.messager.alert('系统提示',"<font color=red>"+result.errMsg+"</font>");
					return;
				}else{
					$.messager.alert('系统提示','保存成功');
					dialog0.close();
					grid0.reload();
				}
				
			});
			
		}
		
		
		//删除数据
		function deleteDatas(){
			if(grid0.getSelectedCount() != 1){
				$.messager.alert('系统提示','<font color=red>请选择一条要删除的数据！</font>');
				return;
			}
			
			var row = grid0.getSelections()[0];
			var deptid = row.deptid; //这个就是要删除的数据对应的ID
			
			$.messager.confirm("系统提示","<font style='color:red;text-align:center;'>您确认要删除这条数据吗？</font>",function(r){
				
				if(!r) return;
				
				//需要把这个id传递到后台
				$.post("${basePath}/admin/dept/delete.do",{deptid:deptid},function(data){
					//console.log(data);
					if(data.errCode < 0){
						$.messager.alert('系统提示','<font color=red>'+data.errMsg+'</font>');
						return;
					}
					
					$.messager.alert('系统提示','<font color=green>删除成功！</font>');
					grid0.reload();
					
				},"json");
				
			});
			
			
			
			
		}
	
	
	</script>
	


<jsp:include page="public/foot.jsp"></jsp:include>