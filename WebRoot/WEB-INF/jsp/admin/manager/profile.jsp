<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"    uri="http://java.sun.com/jsp/jstl/core" %>
<%
request.setCharacterEncoding("UTF-8");
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:include page="../header.jsp" flush="true">
  <jsp:param name="pageTitle" value="系统设置" />
</jsp:include>

<!------start content------->
            <div class="row">
                <div class="col-lg-12">
                <div class="ibox float-e-margins">
                    
                    <div class="ibox-content">
 
            <form class="am-form am-form-horizontal"   action="<%=basePath%>admin/manager/profile-save" method="post" enctype="multipart/form-data">
        
                    <table class="table table-striped table-bordered table-hover dataTables-example" >
                    
                    <tbody>

	                    <tr class="gradeX">
						  <td align="center"  >用户名</td>
						  <td align="left">
						    <input type="text"    value="${manager.username}" name="username">
						 </td>
						  
						</tr>
						
						<tr class="gradeX">
						  <td align="center"  >昵称</td>
						  <td align="left">
						    <input type="text"    value="${manager.nickname}" name="nickname">
						 </td>
						  
						</tr>
						
						<tr class="gradeX">
						  <td align="center"  >密码</td>
						  <td align="left">
						    <input type="password"   name="password">&nbsp;&nbsp;&nbsp;留空不修改
						 </td>
						  
						</tr>
						
						<tr class="gradeX">
						  <td align="center"  >头像</td>
						  <td align="left">
						  <c:if test="${manager.thumb!=null && manager.thumb!='' }">
						  <input type="hidden" id="thumb" name="thumb" value="${manager.thumb}">
						  <img src="<%=basePath %>${manager.thumb}" id="thumb_img" style="width: 150px; height: 150px;"  > 
						  </c:if>
						  <c:if test="${manager.thumb==null || manager.thumb=='' }">
						  <img src="<%=basePath %>Public/img/blank.jpg" id="thumb_img" style="width: 150px; height: 150px;">
						  <input type="hidden"  id="thumb"  name="thumb" value=""> 
						  </c:if>
						  <div>
						  	
						     <input type="file" id="file" name="file" />  
       						 <br />  
        					<input type="button" value="上传" onclick="return ajaxFileUpload();">  
        					</div>
						 </td>
						  
						</tr>
	                  
                    </tbody>
          
                    </table>
                    <div class="form-group">
                        <div class="col-sm-2 col-sm-offset-1">
                            <button type="submit" class="btn btn-primary">修改</button>
                        </div>
                    </div>
                    <div style="clear:both"></div>
			</form>
                    </div>
                </div>
            </div>
            </div>
<!------end content------->
<jsp:include page="../footer.jsp" /> 
<script type="text/javascript" src="<%=basePath%>Public/js/ajaxfileupload.js">  
</script>
<script type="text/javascript">  
function ajaxFileUpload() {  
  
   /*  $("#loading").ajaxStart(function() {  
        $(this).show();  
    })//开始上传文件时显示一个图片  
    .ajaxComplete(function() {  
        $(this).hide();  
    });//文件上传完成将图片隐藏起来   */
  
    $.ajaxFileUpload( {  
        url : "<%=basePath%>ajaxUpload",//用于文件上传的服务器端请求地址  
        secureuri : false,//一般设置为false  
        fileElementId : 'file',//文件上传控件的id属性  
        dataType : 'json',//返回值类型 一般设置为json  
        success : function(data, status) //服务器成功响应处理函数  
        {  
            if (data.status==1) {  
                $('#thumb_img').attr('src',"<%=basePath %>Uploads/"+data.msg);
            	$('#thumb').val("/Uploads/"+data.msg);
            }else{
                layer.msg(data.msg);
            	
            }  
        },  
        error : function(data, status, e)//服务器响应失败处理函数  
        {  
        	 alert(2);
            //layer.msg(e);  
        }  
    })  
    return false;  
}  
</script> 
  
</body>

</html>