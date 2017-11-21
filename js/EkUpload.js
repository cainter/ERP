/*! EkUpload v1.0 | (c) 2015 Eking Soft, Inc. */
/**
* need jQuery and html5
* example:
* function testAler(msg){
*	alert(msg);
* }
* function testName(fileName){
* 	$("#nameDiv").text(fileName);
* }
* function testProc(total,curr){
* 	$("#procDiv").text(curr);
* }
* function testEnd(fileUrl,fileIndex){
* 	alert(fileUrl);
* }
* function doClick(){
* 	var objs=document.getElementById("files").files;
* 	EkUpload.upload(objs,testAler,testName,testProc,testEnd);
* }
*/
;(function(url){
	var servUrl=url;
	var currFileIndex=0;
	var pauseFlag="";
	
	var fileObjes;
	var alerCallback;
	var fnCallback;
	var procCallback;
	var endCallback;
	
	var EkUpload={
		upload:function(pFiles,pAlerCallback,pFnCallback,pProcCallback,pEndCallback){
			currFileIndex=0;
			fileObjes=pFiles;
			alerCallback=pAlerCallback;
			fnCallback=pFnCallback;
			procCallback=pProcCallback;
			endCallback=pEndCallback;
			
			if(fileObjes!=null && fileObjes.length>currFileIndex){
				start(fileObjes[currFileIndex]);
			}
			
			function start(file){
				var signId=(new Date()).getTime();
				var fd = new FormData();
				fd.append("comm_type", "INIT");
				fd.append("file_size", file.size);
				fd.append("sign_id", signId);
				fd.append("file_name", file.name);
				$.ajax({
	                    url: servUrl,
	                    type: "POST",
	                    data: fd,
	                    async: true,        //异步
	                    processData: false,  //很重要，告诉jquery不要对form进行处理
	                    contentType: false,  //很重要，指定为false才能形成正确的Content-Type
	                    error: function(xhr){
	                    	alerCallback("错误提示： " + xhr.status + " " + xhr.statusText);
	                    },
	                    success: function(result,status){
	                        if(status=="success"){
	                        	var jobj=$.parseJSON(result);
	                        	if(jobj.status=="ERROR"){
	                        		alerCallback(jobj.errMsg);
	                        	}else{
	                        		if(fnCallback){
	                        			fnCallback(file.name);
	                        		}
	                        		var shardSize = 500 * 1024;//分片大小
	                        		sendData(signId,file,0,shardSize);
	                        	}
	                        }else{
	                        	alerCallback("错误提示： " + status);
	                        }
	                    }
	            });
				fd=null;
			};
			
			//for setTimeout with parameters
			function _sendData(signId,file,index,shardSize){
				return function(){
					sendData(signId,file,index,shardSize);
				}
			};
			
			function sendData(signId,file,index,shardSize){
				if(pauseFlag=="PAUSE"){
					setTimeout(_sendData(signId,file,index,shardSize),1000);
					return;
				}
				var start = index * shardSize;
				var end = Math.min(file.size, start + shardSize);
				var data=file.slice(start,end);
				
				var data=file.slice(start,end);
				var fd = new FormData();
				fd.append("comm_type", "DATA");
				fd.append("data_inde", start);
				fd.append("sign_id", signId);
				fd.append("data", data);
				
				$.ajax({
		            url: servUrl,
		            type: "POST",
		            data: fd,
		            async: true,        //异步
		            processData: false,  //很重要，告诉jquery不要对form进行处理
		            contentType: false,  //很重要，指定为false才能形成正确的Content-Type
		            error: function(xhr){
		            	sendData(signId,file,index,shardSize);//重新发送
		            },
		            success: function(result,status){
		            	var reSend=true;
		            	if(status=="success"){
		                	var jobj=$.parseJSON(result);
		                	if(jobj.status=="OK"){
		                		reSend=false;
		                	}
		                }
		                
		                if(reSend){
		                	sendData(signId,file,index,shardSize);//重新发送
		                }else{
		                	if(procCallback){
		                		procCallback(file.size,end);
		                	}
		                	if(end==file.size){
			                	doEnd(signId,file.name);
			                }else{
			                	var nextIndex=index+1;
			                	sendData(signId,file,nextIndex,shardSize);//下一段
			                }
		                }
		                
		            }
		        });
		        fd=null;
			};
			
			function doEnd(signId,fileName){
				var fd = new FormData();
				fd.append("comm_type", "END");
				fd.append("sign_id", signId);
				fd.append("file_name", fileName);
				
				$.ajax({
		            url: servUrl,
		            type: "POST",
		            data: fd,
		            async: true,        //异步
		            processData: false,  //很重要，告诉jquery不要对form进行处理
		            contentType: false,  //很重要，指定为false才能形成正确的Content-Type
		            error: function(xhr){
		            	doEnd(signId,fileName);//重新发送
		            },
		            success: function(result,status){
		            	var reSend=true;
		            	if(status=="success"){
		                	var jobj=$.parseJSON(result);
		                	if(jobj.status=="OK"){
		                		if(endCallback){
		                			endCallback(jobj.fileUrl,currFileIndex);
		                		}
		                		currFileIndex++;
		                		if(currFileIndex<fileObjes.length){
		                			start(fileObjes[currFileIndex]);
		                		}
		                		reSend=false;
		                	}
		                }
		                
		                if(reSend){
		                	doEnd(signId,fileName);//重新发送
		                }
		            }
		        });
		        fd=null;
			};
		},
		pause:function(){
			pauseFlag="PAUSE";
		},
		restart:function(){
			pauseFlag="";
		}
	};
	window.EkUpload=EkUpload;
})("/Html5Upload.ihtm");//can change server url hear
