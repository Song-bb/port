<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 수입과일 -->


	<c:import url="../header.jsp"></c:import>

	    <div id="importedpage_wrap">
        <div id="importedpage_top">
            <h2>수입 과일</h2>
            <p>등록된 제품 : 20개</p>
        </div>
        <div id="importedpage_top_nav"><a href="">최신순 </a> | <a href="">낮은 가격 순 </a> | <a href="">높은 가격 순 </a></div>
        <div id="importedpage_mid">
            <table class="item_table">
              		<tr>
                  		<td>
                  		<c:forEach items="${ imported_listview }" var="dto">
                      		<div class="fallenpage_item">
                      			<div class="item_img_250320">
								<div class="item_img">
									<a href="/item_detail"><img src="${ dto.item_img }" width="250px" height="320px"></a>	
								</div>
							</div>
                          		<div class="item_desc">
                               	<p><a href="/item_detail">${ dto.item_name }</a></p>
                               	<p>${ dto.item_real_price }</p>
                          		</div>
                      		</div>
                      	</c:forEach>
                 		</td>
               		</tr>
            </table>
       		</div>
        <div id="importedpage_btm">
            <table class="importedpage_table">
                <tr class="importedpage_table_tr">
                    <td class="importedpage_table_td"><a href="">&laquo;</a></td>
                    <td class="importedpage_table_td"><a href="">&lt;</a></td>
                    <td class="importedpage_table_td"><a href="">1</a></td>
                    <td class="importedpage_table_td"><a href="">2</a></td>
                    <td class="importedpage_table_td"><a href="">3</a></td>
                    <td class="importedpage_table_td"><a href="">4</a></td>
                    <td class="importedpage_table_td"><a href="">5</a></td>
                    <td class="importedpage_table_td"><a href="">&gt;</a></td>
                    <td class="importedpage_table_td"><a href="">&raquo;</a></td>
                </tr>
            </table>
        </div>
    </div>
	
	
	
	
	<c:import url="../footer.jsp"></c:import>