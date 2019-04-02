<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="public/top.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/bootstrap/css/bootstrap.min.css">
<script src="${pageContext.request.contextPath}/resource/bootstrap/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resource/bootstrap/Hmodal.js"></script>


  <form name="form0" onsubmit="return AllSubmit()" style="margin:20px;" class="form-horizontal" method="GET" action="/admin/procurement_registration/save.do">
    <fieldset>
      <div id="legend" class="">
        <legend class="">采购单登记</legend>
      </div>


    <div class="control-group">

          <!-- Text input-->
          <label class="control-label" for="input01">请输入物资编号：</label>
          <div class="controls">
            <input type="text" placeholder="" class="input-xlarge" name="goodsid" onkeyup="this.value=this.value.replace(/[^\d.]/g,'').replace(/^(\-)*(\d+)\.(\d\d).*$/,'$1$2')" 
onafterpaste="this.value=this.value.replace(/[^\d.]/g,'').replace(/^(\-)*(\d+)\.(\d\d).*$/,'$1$2')">
            <p class="help-block"></p>
          </div>
          
           <label class="control-label" for="input02">请输入采购数量：</label>
          <div class="controls">
            <input type="text" placeholder="" class="input-xlarge" name="count" onkeyup="this.value=this.value.replace(/[^\d.]/g,'').replace(/^(\-)*(\d+)\.(\d\d).*$/,'$1$2')" 
onafterpaste="this.value=this.value.replace(/[^\d.]/g,'').replace(/^(\-)*(\d+)\.(\d\d).*$/,'$1$2')">
            <p class="help-block"></p>
          </div>
        </div>

    
	    <div class="controls">
            <button class="btn btn-success">提交采购单</button>
          </div>
        </div>
	
    

    </fieldset>
  </form>

<table id="grid0" title="物资管理" class="easyui-datagrid" fitColumns="true" pageSize="20"
	    pagination="true" singleSelect="true" rownumbers="true" url="${basePath}/admin/goods/list.do">
	    <thead>
	    	<tr>
	    		<th field="cb" checkbox="true" align="center"></th>
	    		<th field="id" width="50" align="center">编号</th>
	    		<th field="goodsName" width="100" align="center">物资名称</th>
	    		<th field="userid" width="180" align="center" hidden="true">登记人ID(隐藏)</th>
	    		<th field="userName" width="100" align="center">登记人</th>
	    		<th field="create_time" width="150" align="center">创建时间</th>
	    		<th field="update_time" width="150" align="center">最后更新时间</th>
	    		<th field="is_delete" width="300" align="center"  hidden="true">是否删除</th>
	    		<th field="kc" width="50" align="center">库存</th>
	    	</tr>
	    </thead>
	</table>
	
	
	<script>
	
		function AllSubmit(){
			if(!form0.goodsid.value){
				$.Hconfirm({
			        height:"230px",
			        width:"360px",
			        body:"<span style='height: 100px;line-height: 100px;'>物资编号不能为空！</span>",
			        callback:function(){}
			    })
				return false;
			}
			
			if(!form0.count.value){
				$.Hconfirm({
			        height:"230px",
			        width:"360px",
			        body:"<span style='height: 100px;line-height: 100px;'>采购数量不能为空！</span>",
			        callback:function(){}
			    })
				return false;
			}
		}
		
		
		function checknum(o) { 
			var r = /^\+?[1-9][0-9]*$/; //正整数 
		     return r.test(o);
		}
	
	</script>


<jsp:include page="public/foot.jsp"></jsp:include>