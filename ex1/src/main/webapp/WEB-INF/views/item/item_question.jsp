<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 문의하기</title>

	<style>
		#item_question_wrap {
            margin: 0 auto;
            width: 480px;
            height: 350px;
            padding: 10px;
        }
        #item_question_title {
            height: 40px;
            border-bottom: 2px solid #459356;
        }
        #item_question_body {
            margin-top: 15px;
        }
        #item_question_table {
            border-collapse: collapse;
            width: 100%;
        }
        #item_question_th {
            border: 1px solid rgba(179, 178, 178, 0.507);
            width: 100px;
            text-align: center;
            color: rgb(120, 120, 120);
            font-size: 14px;
            height: 40px;
        }
        #item_question_td {
            border: 1px solid rgba(179, 178, 178, 0.507);
        }
        #item_question_td2 {
            border: 1px solid rgba(179, 178, 178, 0.507);
            color: rgb(120, 120, 120);
            font-weight: 700;
            font-size: 14px;
            padding-left: 10px;
        }
        #item_question_btnDiv {
            margin-top: 15px;
            text-align: center;
        }
        #item_question_submit {
            width: 100px;
            height: 40px;
            background-color: #459356;
            color: #fff;
            font-weight: 600;
            border: none;
        }
        #item_question_submit:hover {
            width: 100px;
            height: 40px;
            background-color: #fff;
            color: #459356;
            font-weight: 600;
            border: 1px solid #459356;
        }
        #item_question_cancel {
            width: 100px;
            height: 40px;
            background-color: #459356;
            color: #fff;
            font-weight: 600;
            border: none;
        }
        #item_question_cancel:hover {
            width: 100px;
            height: 40px;
            background-color: #fff;
            color: #459356;
            font-weight: 600;
            border: 1px solid #459356;
        }
	</style>

</head>
<body>

	<div id="item_question_wrap">
        <div id="item_question_title">
            <h3>상품 문의하기</h3>
        </div>
        <div id="item_question_body">
        	<c:forEach items="${ item_inform }" var="dto">
		          <table id="item_question_table">
		              <tr>
		                  <td id="item_question_th">상품명</td>
		                  <td id="item_question_td2">${ dto.item_name }</td>
		              </tr>
		              <tr>
		                  <td id="item_question_th">문의내용</td>
		                  <td id="item_question_td"><textarea cols="50" rows="10" id="content"></textarea></td>
		              </tr>
		          </table>
		          <div id="item_question_btnDiv">
		          	  <input type="hidden" value="${ dto.idx }" id="item_idx">
		          	  <input type="hidden" value="${ user_id }" id="user_id">
		              <button type="button" onclick="request_item();" id="item_question_submit">문의하기</button>
		              <button type="button" onclick="window.close();" id="item_question_cancel">취소</button>
		          </div>
            </c:forEach>
        </div>
    </div>
    
    <script>	
    	function request_item(){
    		/*
    		 * path : 전송 URL
    		 * params : 전송 데이터 {'q':'a','s':'b','c':'d'...}으로 묶어서 배열 입력
    		 * method : 전송 방식(생략가능)
    		 */
    		/*function post_to_url(path, params, method) {
    		    method = method || "post"; // Set method to post by default, if not specified.
    		    // The rest of this code assumes you are not using a library.
    		    // It can be made less wordy if you use one.
    		    var form = document.createElement("form");
    		    form.setAttribute("method", method);
    		    form.setAttribute("action", path);
    		    for(var key in params) {
    		        var hiddenField = document.createElement("input");
    		        hiddenField.setAttribute("type", "hidden");
    		        hiddenField.setAttribute("name", key);
    		        hiddenField.setAttribute("value", params[key]);
    		        form.appendChild(hiddenField);
    		    }
    		    document.body.appendChild(form);
    		    form.submit();
    		    
    		    
    		     var winName='MyWindow';
				  var winURL='search.action';
				  var windowoption='resizable=yes,height=600,width=800,location=0,menubar=0,scrollbars=1';
				  var params = { 'param1' : '1','param2' :'2'};         
				  var form = document.createElement("form");
				  form.setAttribute("method", "post");
				  form.setAttribute("action", winURL);
				  form.setAttribute("target",winName);  
				  for (var i in params) {
				    if (params.hasOwnProperty(i)) {
				      var input = document.createElement('input');
				      input.type = 'hidden';
				      input.name = i;
				      input.value = params[i];
				      form.appendChild(input);
				    }
				  }              
				  document.body.appendChild(form);                       
				  window.open('', winName,windowoption);
				  form.target = winName;
				  form.submit();                 
				  document.body.removeChild(form);      
    		}*/
    		var form = document.createElement("form");
    		form.setAttribute("method", "post");
    		form.setAttribute("action", "/item_question_ok");
    		
    		window.opener.name = "parentPage";
    		form.setAttribute("target", "parentPage");
    		
    		var user_id1 = document.getElementById("user_id").value;
    		var item_idx1 = document.getElementById("item_idx").value;
    		var content1 = document.getElementById("content").value;
    		
    		var params = {user_id:user_id1, item_idx:item_idx1, content:content1}; 

		    for(var key in params) {
		        var hiddenField = document.createElement("input");
		        hiddenField.setAttribute("type", "hidden");
		        hiddenField.setAttribute("name", key);
		        hiddenField.setAttribute("value", params[key]);
		        form.appendChild(hiddenField);
		    }   
    		document.body.appendChild(form);
			form.submit();
			window.close();
    	}
    </script>
	
</body>
</html>