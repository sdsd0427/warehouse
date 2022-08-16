<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>

    <script type="text/javascript">

    function getDepartMentList() {
	$.ajax({
            type:'get',
            url:'<%=request.getContextPath()%>/departMent/list.do',
            dataType:'json',
            success: function(data) {
            	console.log(data)
                var company = new Array();
                        // 데이터 받아옴
                $.each(data, function(idx, item){
                        company[idx] = {dno:item.dno, updno:item.updno, dname:dname};
                });

                        // 트리 생성
                $('#container').jstree({
                    core: {
                             data: company    //데이터 연결
                        },
                        types: {
                               'default': {
                                    'icon': 'jstree-folder'
                                }
                        },
                        plugins: ['wholerow', 'types']
                 })
                 .bind('loaded.jstree', function(event, data){
                        //트리 로딩 롼료 이벤트
                        console.log(data.dname);
                 })
                 .bind('select_node.jstree', function(event, data){
                	// console.log(data.dname);
                       //노드 선택 이벤트
                 })

            },
            error:function (data) {
                alert("에러");
            }
       });
    }



    </script>
</head>
<body>
    <div id="tree"></div>
</body>
</html>