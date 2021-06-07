<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<meta charset="UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="root" value="${pageContext.request.contextPath}" scope="session" />

<style>

</style>
<hr>

<!-- <div class="accordion" id="accordionExample">
  
</div> -->
<%-- <table class="table table-hover">
	<thead>
		<tr class="info"> <!-- css 안먹혔음 -->
			<th>번호</th>		
			<th>제목</th>		
			<th>작성자</th>
			<th>일시</th>			
			<c:if test="${userinfo.id == 'ssafy'}">
				<th>관리</th>	
			</c:if>
		</tr>
	</thead>
	<tbody id="notice_row">
		
	</tbody>
</table> --%>

<div id="ModalExample" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content" style="width:30%; margin-left:300px">
            <div class="modal-header" style="text-align:center">
                <h4 class="modal-title text-xs-center">공지사항 등록하기</h4>
            </div>
            <div class="modal-body">
                <form role="form" method="POST" action="${root}/notice/board">
                <input type="hidden" name="writer" value="${userinfo.id}">
                    <div class="form-group">
                        <label class="control-label">제목</label>
                        <div>
                            <input
					            type="text"
					            class="form-control"
					            id="title"
					            placeholder="제목을 입력하세요"
					          />
                        </div>
                    </div>
                    <div class="form-group">
			           <label class="control-label">내용</label>
			          <textarea
				            class="form-control"
				            id="content"
				            placeholder="내용을 입력하세요"
				            rows=5
				          ></textarea>
			          </div>
                    <div class="form-group">
                        <div>
                            <button type="button" class="btn btn-info btn-block" onclick="insertNotice()">등록하기</button>
                        </div>
                    </div>
                </form>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<div class="container">
    <table class="table table-condensed"  id="myTable">
    <thead>
        <tr>
            <th>번호</th>		
			<th>제목</th>		
			<th>작성자</th>
			<th>일시</th>			
			<c:if test="${userinfo.id == 'ssafy'}">
				<th>관리</th>	
			</c:if>
        </tr>
    </thead>
    <tbody id="panel">
        
        
    </tbody>
</table>
</div>
		
<script>
function getNotice(){
	
	$.ajax({
		url : "${root}/notice/board",
		type : "get",
		success : function(data) {
			// 아파트 이름을 통하여 데이터를 가져왔을 때
			$("#panel").empty();
			// 표 만들기
			// 관리자 계정일 때
			if('${userinfo.id}' == 'ssafy'){
				$.each(data, function(idx, notice){
					let date = notice.regtime.substring(0,10);
					let dataTarget = "num" + notice.no;
					$("#panel").append(`
							<tr data-toggle="collapse" data-target="#num\${notice.no}" data-parent="#myTable">
							<th scope="row">\${notice.no}</th>
						      <td>\${notice.title}</td>
						      <td>\${notice.writer}</td>
						      <td>\${date}</td>
						      <td>
							      <button class="btn btn-danger ml-2" title="Delete Product" onclick="deleteNotice('\${notice.no}')">
							      	<i class="fas fa-trash"></i>
							      </button>
				      		  </td>
				        </tr>
				        <tr id="\${dataTarget}" class="collapse">
				            <td colspan="6" class="hiddenRow"><div>\${notice.content}</div> </td>
				        </tr>
				    `);
				});
			}
			// 일반 계정일 때
			else{
				$.each(data, function(idx, notice){
					let date = notice.regtime.substring(0,10);
					let dataTarget = "num" + notice.no;
					$("#panel").append(`
						<tr data-toggle="collapse" data-target="#num\${notice.no}" data-parent="#myTable">
							<th scope="row">\${notice.no}</th>
					      	<td>\${notice.title}</td>
					      	<td>\${notice.writer}</td>
					      	<td>\${date}</td>
				        </tr>
				        <tr id="\${dataTarget}" class="collapse">
				            <td colspan="6" class="hiddenRow"><div>\${notice.content}</div> </td>
				        </tr>
				    `);
				});
			}
		},
		error : function(xhr,status,msg) {
			alert("요청 실패");
		}
	});
} 
function insertNotice(){
	
	var title = $('#title').val();
	var content = $('#content').val();
	$.ajax({
		url : "${root}/notice/board" + "/" + title + "/" + content + "/" + "${userinfo.id}",
		type : "get",
		success : function(data) {
			alert("등록 성공");
			getNotice();
			$('#ModalExample').modal("hide");
		},
		error : function(xhr,status,msg) {
			alert("요청 실패");
		},
	});
}

function deleteNotice(no){
	console.log("hihi");
	$.ajax({
		url : "${root}/notice/board/del" + "/" + no,
		type : "get",
		success : function(data) {
			alert("삭제 성공");
			getNotice();
		},
		error : function(xhr,status,msg) {
			alert("요청 실패");
		}
	});
}
</script>