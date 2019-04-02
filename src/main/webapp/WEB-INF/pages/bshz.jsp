<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="public/top.jsp"></jsp:include>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/echarts.min.js"></script>
	<div id="cc" class="easyui-layout" style="width:100%;height:400px;">
		<div data-options="region:'west',title:'请选择部门'" style="width:400px;padding:5px;background:#eee;">
	    	<table id="grid0" class="easyui-datagrid" fitColumns="true" pageSize="20"
			    pagination="true" singleSelect="true" rownumbers="true" url="${basePath}/admin/dept/list.do" fit="true" toolbar="#tb">
			    <thead>
			    	<tr>
			    		<th field="cb" checkbox="true" align="center"></th>
			    		<th field="deptid" width="50" align="center">编号</th>
			    		<th field="deptname" width="100" align="center">部门名称</th>
			    	</tr>
			    </thead>
			</table>
	    </div>
	    
	    <div data-options="region:'center',title:'汇总情况'" style="padding:5px;background:#eee;">
	    	<table id="grid1" autoload="false" title="报损查询" class="easyui-datagrid" fitColumns="true" pageSize="20"
			    pagination="true" singleSelect="true" rownumbers="true" fit="true" toolbar="#tb">
			    <thead>
			    	<tr>
			    		<th field="cb" checkbox="true" align="center"></th>
			    		<th field="id" width="50" align="center">编号</th>
			    		<th field="deptname" width="100" align="center">部门名称</th>
			    		<th field="goodsName" width="180" align="center">报损物资名称</th>
			    		<th field="userid" width="180" align="center" hidden="true">登记人ID(隐藏)</th>
			    		<th field="userName" width="100" align="center">登记人</th>
			    		<th field="count" width="150" align="center">报损数量</th>
			    		<th field="create_time" width="150" align="center">报损时间</th>
			    		<th field="reason" width="200" align="center">报损原因</th>
			    		<th field="is_delete" width="300" align="center"  hidden="true">是否删除</th>
			    	</tr>
			    </thead>
			</table>
	    </div>
	    
	</div>


<script>
	
	
	$(function(){
		grid0.click(function(index, row){
			
			var deptid = row.deptid;
			
			var url =" ${basePath}/admin/dept/listBscx.do";
	
			grid1.query(url,{deptid:deptid});
			
		});
	});
	
	
</script>
	


<jsp:include page="public/foot.jsp"></jsp:include>