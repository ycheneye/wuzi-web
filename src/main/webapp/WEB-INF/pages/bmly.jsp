<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="public/top.jsp"></jsp:include>

	
	<div id="cc" class="easyui-layout" style="width:100%;height:400px;">
	    <div data-options="region:'east',title:'领用',split:true" style="width:500px;">
	    	<table id="grid1" class="easyui-datagrid" fitColumns="true" pageSize="20"
			    pagination="true" singleSelect="true" rownumbers="true" url="${basePath}/admin/goods/list.do" fit="true" toolbar="#tb">
			    <thead>
			    	<tr>
			    		<th field="cb" checkbox="true" align="center"></th>
			    		<th field="id" width="50" align="center">编号</th>
			    		<th field="goodsName" width="100" align="center">物资名称</th>
			    		<th field="kc" width="100" align="center">库存</th>
			    	</tr>
			    </thead>
			</table>
	    </div>
	    <div data-options="region:'center',title:'请选择部门'" style="padding:5px;background:#eee;">
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
	</div>
	<a style="float:right;" onclick="ly()" class="css-3d-btn">领用</a>
	
	<script>
	
		function ly(){
			if(!grid0.getSelectedCount()){
				$.messager.alert('系统提示','<font color=red>请选择部门！</font>');
				return;
			}
			
			if(!grid1.getSelectedCount()){
				$.messager.alert('系统提示','<font color=red>请选择要领用的物资！</font>');
				return;
			}
			
			var obj = {};
			obj.deptid = grid0.getSelections()[0].deptid;
			obj.deptname = grid0.getSelections()[0].deptname;
			obj.goodsid = grid1.getSelections()[0].id;
			obj.goodsName = grid1.getSelections()[0].goodsName;
			
			var count = parseInt(prompt("请填写领用数量！"));
			if(!checknum(count)){
				$.messager.alert('系统提示','<font color=red>请填写数字！</font>');
				return;
			}
			
			obj.count = count;
			
			
			$.post("${basePath}/admin/dept/ly.do",obj,function(data){
				
				if(data.errCode < 0){
					$.messager.alert('系统提示','<font color=red>'+data.errMsg+'</font>');
					return;
				}
				
				$.messager.alert('系统提示','<font color=green>领用成功！</font>');
				
			},"json");
			
		}
	
		
		function checknum(o) { 
			var r = /^\+?[1-9][0-9]*$/; //正整数 
		     return r.test(o);
		}
	
	</script>


<jsp:include page="public/foot.jsp"></jsp:include>