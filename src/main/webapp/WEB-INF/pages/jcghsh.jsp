<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="public/top.jsp"></jsp:include>

	<div id="tb">
		<div>
			&nbsp;部门名称：&nbsp;<input type="text" name="deptname_search" id="deptname_search" size="20" onkeydown="if(event.keyCode==13) search()"/>
			&nbsp;借用物资名称：&nbsp;<input type="text" name="goodsName_search" id="goodsName_search" size="20" onkeydown="if(event.keyCode==13) search()"/>
			<a href="javascript:search()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a>
		</div>
	</div>


	<table id="grid0" title="借用查询" class="easyui-datagrid" fitColumns="true" pageSize="20"
	    pagination="true" singleSelect="true" rownumbers="true" fit="true" toolbar="#tb">
	    <thead>
	    	<tr>
	    		<th field="cb" checkbox="true" align="center"></th>
	    		<th field="id" width="50" align="center">编号</th>
	    		<th field="deptname" width="100" align="center">部门名称</th>
	    		<th field="goodsid" width="50" align="center">物资ID</th>
	    		<th field="goodsName" width="180" align="center">借用物资名称</th>
	    		<th field="userid" width="180" align="center" hidden="true">登记人ID(隐藏)</th>
	    		<th field="userName" width="100" align="center">登记人</th>
	    		<th field="count" width="50" align="center">借用数量</th>
	    		<th field="state" width="150" align="center" formatter = "formatterState">状态</th>
	    		<th field="create_time" width="150" align="center">借用时间</th>
	    		<th field="op" width="150" align="center" formatter = "recessionAuditOp">管理员操作</th>
	    		<th field="is_delete" width="300" align="center"  hidden="true">是否删除</th>
	    	</tr>
	    </thead>
	</table>
	
	<script>
		
		function search(){
			var deptname = $("#deptname_search").val();
			var goodsName = $("#goodsName_search").val();
			
			var obj = {state:5};
			if(deptname) obj.deptname = "%" + deptname + "%";
			if(goodsName) obj.goodsName = "%" + goodsName + "%";
			
			grid0.query("${basePath}/admin/dept/listJccx.do",obj);
		}
		
		$(function(){
			search();
		});
		
		function recessionAudit(id,goodsid,count){
			if(grid0.getSelections()[0].state == 6){
				$.messager.alert('系统提示','<font color=red>已处归还成功，请勿重复审核！</font>');
				return;
				
			}
			
			$.post("${basePath}/admin/dept/recessionAudit.do",{id:id,goodsid:goodsid,count:count },function(data){
				if(data.errCode < 0){
					$.messager.alert('系统提示','<font color=red>'+data.errMsg+'</font>');
					return;
				}
				
				$.messager.alert('系统提示','<font color=green>审核成功！</font>');
				grid0.reload();
				
			},"json");
		}
	
	
	</script>


<jsp:include page="public/foot.jsp"></jsp:include>