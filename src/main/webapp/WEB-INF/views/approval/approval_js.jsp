<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <style>
  .radio1{
       float: left;margin-top: 5px;
}
 
  
   </style>
 <!-- Modal -->
		  <div class="modal fade" id="addapproval" role="dialog">
		    <div class="modal-dialog modal-sm">
			      <div class="modal-content">
			        <div class="modal-header" style="">
	
			          <h5 class="modal-title"><strong>결재양식 선택</strong></h5>
			           <button type="button" class="close" data-dismiss="modal">&times;</button>
			        </div>
			        <div class="modal-body" style="margin-left: 8px">
						<%-- <%@ include file="./fileorganization.jsp" %> --%>
							<label class="btn bg"style="width: 250px;background-color: #001f3f;color: white;">
								<input type="radio" value="SF000001" name="sFormNo" id="option_b1" autocomplete="off"  class="radio1" >업무기안
							</label>
							
							<label class="btn bg" style="width: 250px;background-color: #001f3f;color: white;">
								<input type="radio" value="SF000002" name="sFormNo" id="option_b2" autocomplete="off" class="radio1">업무협조
							</label>
							
							<label class="btn bg" style="width: 250px;background-color: #001f3f;color: white;">
								<input type="radio" value="SF000003" name="sFormNo" id="option_b2" autocomplete="off" class="radio1">일반품의서
							</label>
							
							<label class="btn bg" style="width: 250px;background-color: #001f3f;color: white;">
								<input  type="radio" value="SF000004" name="sFormNo" id="option_b3" autocomplete="off" class="radio1">보고서
							</label>
							<br>
							
							<label class="btn bg" style="width: 250px;background-color: #001f3f;color: white;">
								<input type="radio" value="SF000005" name="sFormNo" id="option_b3" autocomplete="off" class="radio1">휴가신청
							</label>
			        </div>
			        <div class="modal-footer">
			          <button type="button" class="btn btn-block btn-outline-secondary" style="width: 120px;margin-top: 5px" data-dismiss="modal">취소</button>
	<%-- 		          <button type="button" class="btn btn-info" data-dismiss="modal" onclick="goRegist('<%=request.getContextPath() %>/approval/registGo.do', '${menu.upcode }')">확인</button>
	 --%>		          <button type="submit" class="btn btn-block btn-outline-primary" style="width: 120px;margin-right: 13px" data-dismiss="modal" onclick="goApprovalForm()">확인</button>
			        </div>
			      </div>
		    </div>
		  </div>
			<!-- Modal 끝-->

 <script>
 
$(document).on('click', 'body > aside > div > ul > li:nth-child(2) > a', function(){
	$(this).attr({
		"href" : "#",
		"data-toggle" : "modal",
		"data-target" : "#addapproval",
		//"data-backdrop" : "false"
	});
});

function goApprovalForm(){
	var sFormNo = $('input[name="sFormNo"]:checked').val();
	goDetail('<%=request.getContextPath()%>/approval/registGo.do?sFormNo=' + sFormNo, '${menu.mcode}');
	//console.log("sFormNo",sFormNo)
}

</script> 