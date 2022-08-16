<%@ page contentType="text/html; charset=UTF-8"%>

<head>


<!-- jQuery EasyUi API -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/themes/default/style.min.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<style type="text/css">
/* Remove the navbar's default rounded borders and increase the bottom margin */
.navbar {
	margin-bottom: 50px;
	border-radius: 0;
}

/* Remove the jumbotron's default bottom margin */
.jumbotron {
	margin-bottom: 0;
}

/* Add a gray background color and some padding to the footer */
#footer {
	margin-top: 50px;
	background-color: #f2f2f2;
	padding: 25px;
}

#content {
	margin-left: 50px;
	margin-right: 50px;
	overflow: hidden;
}

/*  */
#title {
	border-bottom: 2px solid #727377;
}

#rightMenu {
	margin-top: 10px;
}

.profileImg {
	height: 128px;
	width: 96px;
}

#officerList > thead > tr > th, #officerList > tbody > tr > td {
	text-align: center;
}











.page-link {
    line-height: 1;
    color: #17a2b8;
    background-color: #fff;
    border: 1px solid #dee2e6;
}
.page-item.active .page-link {
    z-index: 3;
    color: #fff;
    background-color: #17a2b8;
    border-color: #17a2b8;
}

	.upWord .word{
	    list-style-type: none;
	    float: left;
	    margin: 5px;
	}

.btn_submenu {
    display: inline-block;
}

	span#RecName{
		margin-left: 120px;
	}


	pribut{
	 border:1px solid;

	}
	div#chart {
    padding-top: 10px;
}
/* 	div#b {
	    width: 150px;
	    height: 40px;
	} */

	select#perPageNum ,select#searchType {
	list-style-type: none;
    width: 140px;
    float: left;
}

input.form-control{
list-style-type: none;
    width: 180px;
    float: left;
}

div#inName {
 	width: 290px;
 	height:40px;
    margin-left: 8px;
     margin-top: 3px;
     background-color: #ffc107;
         padding-top: 8px;
}

div#botle {
    margin-left: 500px;

}
div#b {
    border-radius: 5px;
}
.sename{
color:black;"
}
div#bottom {
    margin-left: 40px;
    margin-top: -30PX;
}
ul.upWord {
    margin-left: -30px;
}
.emailcur{
cursor:pointer;
}
div#chart {
    width: 310px;
}


</style>

</head>

		<div id="chart" >
			<!-- <div id="inName"><span id="RecName"><strong>조직도</strong></span></div> -->
				<div id="inAll" style="margin: 30px">

				<div id="wrap">
		<!-- header 시작 -->
		<!-- nav 종료 -->
		<div id="container" style="height: 150px;overflow: scroll;overflow-x: hidden;">
		  <ul>
		   <li>보고
		    	<ul>
		        <li>회의록</li>
		        <li>개선검토보고서</li>
		        <li>불만발생보고서</li>
		      </ul>
		    </li>
		    <li>일반
		    	<ul>
		        <li>업무기안</li>
		        <li>업무협조</li>
		      </ul>
		    </li>
		    <li>지원
		    	<ul>
		        <li>해외출장신청</li>
		        <li>경조화 신청</li>
		        <li>하도급계약 요청서</li>
		      </ul>
		    </li>
		     <li>인사
		    	<ul>
		        <li>조퇴신청서</li>
		        <li>자율출퇴근 신청서</li>
		        <li>휴직원</li>
		      </ul>
		    </li>
		     <li>휴가
		    	<ul>
		        <li>휴가신청서</li>
		      </ul>
		    </li>
		  </ul>
		</div>
		<!-- content 종료 -->
	</div>
	<script>
/*
	 $('#container').jstree({   //문서 없는 버전
			"types" : {
			      "default" : {
			        "icon" : "glyphicon glyphicon-flash"
			      },
			      "demo" : {
			        "icon" : "glyphicon glyphicon-ok"
			      }
			    },
			    "plugins" : [ "types" ]
		});
*/

			   /*
			   <i class="fa-solid fa-file"></i>
			   "icon" : "fas fa-user"


			   */


			  $('#container').jstree({     //문서 버전

			});

	</script>
	</div>
</div> <!-- chart -->







