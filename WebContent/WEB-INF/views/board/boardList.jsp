<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>list</title>
</head>
<script type="text/javascript">

	$j(document).ready(function(){
		
		
		$j("#submit").on("click",function(){
			var lists = [];
			$("input[name='boardType']:checked").each(function(i){   //jQuery�� for�� ���鼭 check �Ȱ� �迭�� ��´�
			   lists.push($(this).val());
			});
			
			$j.ajax({
			    url : "/board/boardSearch.do",
			    dataType: "json",
			    type: "GET",
			    data : lists,
			    success: function(data, textStatus, jqXHR)
			    {
					location.href = "/board/boardList.do?pageNo="+${pageNo};
			    },
			    error: function (jqXHR, textStatus, errorThrown)
			    {
			    	alert("����");
			    }
			});
		});
	});

</script>
<body>
<form class="bList">
	<table align="center">
		<tr>
			<td align="right">total : ${totalCnt}</td>
		</tr>
		<tr>
			<td>
				<table id="boardTable" border="1">
					<tr>
						<td width="80" align="center">Type</td>
						<td width="40" align="center">No</td>
						<td width="300" align="center">Title</td>
					</tr>
					<c:forEach items="${boardList}" var="list">
						<tr>
							<td align="center">${list.codeName}</td>
							<td>${list.boardNum}</td>
							<td><a
								href="/board/${list.boardType}/${list.boardNum}/boardView.do?pageNo=${pageNo}">${list.boardTitle}</a>
							</td>
						</tr>
					</c:forEach>
				</table>
			</td>
		</tr>
		<tr>
			<td align="right"><a href="/board/boardWrite.do">�۾���</a></td>
		</tr>
			<tr>
			<td align="left">
				<input type="checkbox" name="searchType" value="checkAll"/>��ü
				<input type="checkbox" name="boardType" value="a01"/>�Ϲ�
				<input type="checkbox" name="boardType" value="a02"/>Q&A
				<input type="checkbox" name="boardType" value="a03"/>�͸�
				<input type="checkbox" name="boardType" value="a04"/>����
				<input type="button" id="submit" value="��ȸ"></td>
			</tr>
	</table>
</form>
</body>
</html>