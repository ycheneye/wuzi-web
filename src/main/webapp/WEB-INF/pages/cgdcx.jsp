<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="public/top.jsp"></jsp:include>

	<div id="tb">
		<div>
			&nbsp;采购物资名称：&nbsp;<input type="text" name="goodsName_search" id="goodsName_search" size="20" onkeydown="if(event.keyCode==13) search()"/>
			<a href="javascript:search()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a>
		</div>
	</div>

	<table id="grid0" title="采购单查询" class="easyui-datagrid" fitColumns="true" pageSize="20"
	    pagination="true" singleSelect="true" rownumbers="true" url="${basePath}/admin/procurement_registration/list.do" fit="true" toolbar="#tb">
	    <thead>
	    	<tr>
	    		<th field="cb" checkbox="true" align="center"></th>
	    		<th field="id" width="50" align="center">编号</th>
	    		<th field="goodsid" width="50" align="center" hidden="true">物资编号</th>
	    		<th field="goodsName" width="100" align="center">采购物资名称</th>
	    		<th field="count" width="100" align="center">采购数量</th>
	    		<th field="userid" width="180" align="center" hidden="true">登记人ID(隐藏)</th>
	    		<th field="userName" width="100" align="center">登记人</th>
	    		<th field="create_time" width="150" align="center">创建时间</th>
	    		<th field="update_time" width="150" align="center">最后更新时间</th>
	    		<th field="is_delete" width="300" align="center"  hidden="true">是否删除</th>
	    	</tr>
	    </thead>
	</table>
	
	
	<script>
	
		function search(){
			var goodsName_search = $("#goodsName_search").val();
			var obj = {};
			if(goodsName_search) obj.goodsName = "%"+goodsName_search+"%";
			grid0.reload(obj);
		}
	
	</script>


<jsp:include page="public/foot.jsp"></jsp:include>