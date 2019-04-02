<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="public/top.jsp"></jsp:include>


	<!-- 列表 开始 -->

	<table id="grid0" title="物资管理" class="easyui-datagrid" fitColumns="true" pageSize="20"
	    pagination="true" singleSelect="true" rownumbers="true" url="${basePath}/admin/goods/wzpd.do" fit="true" toolbar="#tb">
	    <thead>
	    	<tr>
	    		<th field="id" width="5" align="center" hidden="true">编号</th>
	    		<th field="goodsName" width="100" align="center">物资名称</th>
	    		<th field="kc" width="10" align="center">库存</th>
	    		<th field="jiechuCount" width="10" align="center">借出数量</th>
	    		<th field="lyCount" width="10" align="center">领用数量</th>
	    	</tr>
	    </thead>
	</table>
	
	
	<div id="tb">
		
		<div>
			&nbsp;物资名称：&nbsp;<input type="text" name="goodsName_search" id="goodsName_search" size="20" onkeydown="if(event.keyCode==13) search()"/>
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
	  			<td>物资名称：</td>
	  			<td><input type="text" id="goodsName" name="goodsName" class="easyui-validatebox" required="true"/></td>
	  		</tr>
	  	</table>
	  </form>
	</div>
	
	
	<div id="dlg-buttons">
		<a href="javascript:save()" class="easyui-linkbutton" iconCls="icon-ok" >保存</a>
	</div>
	
	<!-- form表单   结束 -->
	
	
	
	<script>
	
		function search(){
			var goodsName_search = $("#goodsName_search").val();
			var obj = {};
			obj.goodsName = "%"+goodsName_search+"%";
			grid0.reload(obj);
		}
	
	</script>
	


<jsp:include page="public/foot.jsp"></jsp:include>