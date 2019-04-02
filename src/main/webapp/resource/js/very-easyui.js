/**
 *  对easyui进行进一步封装，达到快速开发的目的
 *  作者：Jack
 */

;$(document).ready(function(){
	
	var count = 0;

	while($("#grid" + count ).get(0)){
		//window["_grid" + count ] = $("#grid" + count );
		window["grid" + count ] = {
				
			_grid : $("#grid" + count ),
			
			query : function(url,obj){
				this._grid.datagrid({
					url:url,
					queryParams:obj
				});
			},
			
			/**
			 * 获取选中的所有行，返回js数组对象
			 */
			getSelections : function (){
				var selectedRows = this._grid.datagrid('getSelections');
				return selectedRows;
			},
			
			//获取选中的行数
			getSelectedCount : function (){
				var rows = this.getSelections();
				return rows.length;
				
			},
			
			//刷新
			reload : function(obj){
				if(obj){
					this._grid.datagrid("load",obj);
				}else{
					this._grid.datagrid("reload");
				}
			} ,
			
			dbclick : function(callback){
				this._grid.datagrid({  
			        //双击事件  
			        onDblClickRow: function (index, row) {  
			        	callback(index,row);
			        }  
			    });  
				
			},
			
			click : function(callback){
				this._grid.datagrid({  
			        //双击事件  
					onClickRow: function (index, row) {  
			        	callback(index,row);
			        }  
			    });  
				
			}
			
			
			
			
			
		};
		count++;
	}
	
	
	
	count = 0;
	
	while($("#dialog" + count).get(0)){
		
		window["dialog" + count] = {
			
				_dialog : $("#dialog" + count) ,
				
				//打开窗体
				open : function(title){
					this._dialog.dialog("open").dialog("setTitle",title?title:"新窗口");
				} ,
				
				//关闭窗体
				close : function(){
					this._dialog.dialog("close");
				}
				
				
		}
		
		count++;
	}
	
	count = 0;
	
	while($("#form" + count).get(0)){
		
		window["form" + count] = {
				_form : $("#form" + count) ,
				
				submit : function(url,callback){
					this._form.form("submit",{
						url:url,
						onSubmit:function(){
							return $(this).form("validate");
						},
						success:function(result){
							callback(result);
						}
					});
				} ,
				
				fillData : function(row){
					this._form.form("load",row);
				}
				
		}
		
		count++;
	}
	
	
	
});

//业务组件
function formatterState(value, row, index){  
    if(row.state==0){  
        return "<font style='color:orange'>已登记</font>";  
    }else if(row.state==1){  
        return "<font style='color:green'>已入库</font>";  
    }else if(row.state==2){
    	return "<font style='color:red'>已借出</font>";  
    }else if(row.state==3){
    	return "<font style='color:red'>申请借出，待审核</font>";  
    }else if(row.state==4){
    	return "<font style='color:green'>已借出</font>";  
    }else if(row.state==5){
    	return "<font style='color:red'>申请归还，待审核</font>";  
    }else if(row.state==6){
    	return "<font style='color:green'>归还成功</font>";  
    }
}  


function auditOp(value, row, index){
	return "<a href=\"javascript:audit('"+row.id+"','"+row.goodsid+"','"+row.count+"')\">审核通过</a>";
}

function recessionOp(value, row, index){
	return "<a href=\"javascript:recession('"+row.id+"','"+row.goodsid+"','"+row.count+"')\">申请归还</a>";
}

function recessionAuditOp(value, row, index){
	return "<a href=\"javascript:recessionAudit('"+row.id+"','"+row.goodsid+"','"+row.count+"')\">审核</a>";
}

