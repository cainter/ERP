function  Window_Onload(){
	//ob_arr是通用查询列表的checkbox数组
  	ob_arr = document.getElementsByName("query_checkbox");
  	if ( ob_arr.length >0)  {//设置第一行选中
	  	if(ob_arr[0].disabled!=true){
	  		ob_arr[0].checked = true;
		    //设置选中时tr和td的css
		    ob_arr[0].parentElement.parentElement.className = "query_list_data_trSelected";
	  	}
  	}
}
//OnMouseOver改变底色
function mouseover(item){
  ob_arr = document.getElementsByName("query_checkbox");
  if (ob_arr.length<=item.getAttribute("index")-1 ){
    return;
  }
  item.className = "query_list_data_trOver";
}
//OnMouseOut改变底色
function mouseout(item){
  ob_arr = document.getElementsByName("query_checkbox");
  if (ob_arr.length<=item.getAttribute("index")-1 ){
    return;
  }
  
  if (ob_arr[item.getAttribute("index")-1].checked  == true){
    item.className = "query_list_data_trSelected";
  }else{
  	item.className = ( (item.getAttribute("index")-1)%2 == 0 ) ? "query_list_data_tr1" : "query_list_data_tr2";
  
  	var dcn=item.getAttribute("defaultFontColor");
  	if(dcn!=null && dcn!=""){
  		item.style.color = dcn;
  	}
  }
}
//OnClick改变底色，并Check.
function ClickCheck(it,multiSelect){
	if(it.type!=null){
	  	if(it.type=="checkbox" || it.type=="radio"){
	  		//checkbox和radio在执行click事件时，checked值已经改变
	  		//所以这里要将他恢复成原来的值，以便后面执行tr或td的click事件（在tr或td的click事件中会重新检查和设置他的值）
	  		if(it.checked==true){
	  			it.checked=false;
	  		}else{
	  			it.checked=true;
	  		}
	  		return;//return后所属的tr或td会执行自己的click事件
	  	}
	}
	
	ob_arr = document.getElementsByName("query_checkbox");

	if(ob_arr[it.getAttribute("index")-1] == null){
	  	return;
	}else if(ob_arr[it.getAttribute("index")-1].disabled==true){
		return;
	}
	
	if (multiSelect!=true){
	    for (i=0;i<ob_arr.length;i++){
	      parent_td = ob_arr[i].parentElement;
	      parent_tr = parent_td.parentElement;
	      
	      ob_arr[i].checked = false;
	      parent_tr.className = ( i%2 == 0 ) ? "query_list_data_tr1" : "query_list_data_tr2";

		  if(parent_tr.getAttribute("defaultFontColor")!=null && parent_tr.getAttribute("defaultFontColor")!=""){
		  	parent_tr.style.color=parent_tr.getAttribute("defaultFontColor");
		  }
	    }
	}
	
	if(ob_arr[it.getAttribute("index")-1].checked==true){
	    ob_arr[it.getAttribute("index")-1].checked = false;
	    it.className = ( (it.getAttribute("index")-1)%2 == 0 ) ? "query_list_data_tr1" : "query_list_data_tr2";
	    if(it.getAttribute("defaultFontColor")!=null && it.getAttribute("defaultFontColor")!=""){
		  	it.style.color=it.getAttribute("defaultFontColor");
		}
	}else{
	  	ob_arr[it.getAttribute("index")-1].checked = true;
	  	it.className = "query_list_data_trSelected";
	}
    
    if(window.ClickCheckCallBack!=null){
    	ClickCheckCallBack(ob_arr[it.getAttribute("index")-1]);
  	}
}

function checkall(obj){
	ob_arr = document.getElementsByName("query_checkbox");
	
	var i=0;
	for (i=0;i<ob_arr.length;i++){
		if(ob_arr[i].disabled!=true){
			if(obj.checked){
				ob_arr[i].checked=true;
				ob_arr[i].parentElement.parentElement.className = "query_list_data_trSelected";
			}else{
				ob_arr[i].checked=false;
				ob_arr[i].parentElement.parentElement.className = ( i%2 == 0 ) ? "query_list_data_tr1" : "query_list_data_tr2";
			}
			if(window.ClickCheckCallBack!=null){
				ClickCheckCallBack(ob_arr[i]);
			}
		}
	}
	
}