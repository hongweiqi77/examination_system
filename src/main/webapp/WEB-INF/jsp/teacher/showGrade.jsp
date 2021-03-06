<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<title>查看成绩</title>
<link rel="bookmark" type="image/x-icon" href="${pageContext.request.contextPath}/images/favicon.ico"/>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/images/favicon.ico">
<link rel="icon" href="${pageContext.request.contextPath}/images/favicon.ico">

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- 引入bootstrap -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<!-- 引入JQuery  bootstrap.js-->
<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

<%--<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">--%>

</head>
<body>
	<!-- 顶栏 -->
	<jsp:include page="top.jsp"></jsp:include>
	<!-- 中间主体 -->
	<div class="container" id="content">
		<div class="row">
			<jsp:include page="menu.jsp"></jsp:include>
			<div class="col-md-10">
				<div class="panel panel-default">
					<div class="panel-heading">
						<div class="row">
							<h1 class="col-md-7">学生名单<font size="4"><b>（${courseCustom.coursename}-第${session}届）</b></font></h1>
							
							<c:if test="${session == courseCustom.session}">
								<button class="btn btn-default" style="margin-top:25px;margin-right:20px;float:right"
								onClick="location.href='${pageContext.request.contextPath}/teacher/endTheCourse?courseid=${courseCustom.courseid}'">结课</button>
							</c:if>
							
							<div class="btn-group" style="margin: 25px 20px 10px 0;float:right;">
									<button class="btn btn-default">历届成绩</button>
									<button data-toggle="dropdown" class="btn dropdown-toggle">
										<span class="caret" ></span>
									</button>
									<ul class="dropdown-menu">
										<c:forEach var="i" begin="1" end="${courseCustom.session}">
											<li><a href="${pageContext.request.contextPath}/teacher/gradeCourse?id=${courseCustom.courseid}&session=${i}">第${i}届</a></li>
									    </c:forEach>
									</ul>
							</div>
							<div class="btn-group" style="margin: 25px 20px 10px 0;float:right;">
									<button class="btn btn-default">导入导出成绩</button>
									<button data-toggle="dropdown" class="btn dropdown-toggle">
										<span class="caret" ></span>
									</button>
									<ul class="dropdown-menu">
										<li><a href="${pageContext.request.contextPath}/teacher/scoresUpload?courseid=${courseCustom.courseid}&session=${session}">导入</a></li>
										<li><a href="${pageContext.request.contextPath}/exportCourseGrade?courseid=${courseCustom.courseid}&session=${session}">导出</a></li>
									</ul>
							</div>
						
						</div>
					</div>
					<table class="table table-bordered">
						<thead>
							<tr>
								<th>学号</th>
								<th>姓名</th>
								<th>考试成绩</th>
								<th>作业成绩</th>
								<th>出勤成绩</th>
								<th>实验成绩</th>
								<th>总成绩</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${selectedCourseList}" var="item">
								<tr>
									<td>${item.studentCustom.userid}</td>
									<td>${item.studentCustom.username}</td>
									<td>${item.boardscores}</td>
									<td>${item.homeworkscores}</td>
									<td>${item.attendancescores}</td>
									<td>${item.experimentalscores}</td>
									<td>${item.mark}</td>
									<td>
									<button class="btn btn-default btn-xs btn-info" onClick="location.href='${pageContext.request.contextPath}/teacher/mark?studentid=${item.studentid}&courseid=${item.courseid}&session=${session}'">打分</button>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="panel-footer">
						<c:if test="${pagingVO != null}">
							<nav style="text-align: center">
								<ul class="pagination">
									<li><a
										href="${pageContext.request.contextPath}/student/showCourse?page=${pagingVO.upPageNo}">&laquo;上一页</a></li>
									<li class="active"><a href="">${pagingVO.curentPageNo}</a></li>
									<c:if test="${pagingVO.curentPageNo+1 <= pagingVO.totalCount}">
										<li><a
											href="${pageContext.request.contextPath}/student/showCourse?page=${pagingVO.curentPageNo+1}">${pagingVO.curentPageNo+1}</a></li>
									</c:if>
									<c:if test="${pagingVO.curentPageNo+2 <= pagingVO.totalCount}">
										<li><a
											href="${pageContext.request.contextPath}/student/showCourse?page=${pagingVO.curentPageNo+2}">${pagingVO.curentPageNo+2}</a></li>
									</c:if>
									<c:if test="${pagingVO.curentPageNo+3 <= pagingVO.totalCount}">
										<li><a
											href="${pageContext.request.contextPath}/student/showCourse?page=${pagingVO.curentPageNo+3}">${pagingVO.curentPageNo+3}</a></li>
									</c:if>
									<c:if test="${pagingVO.curentPageNo+4 <= pagingVO.totalCount}">
										<li><a
											href="${pageContext.request.contextPath}/student/showCourse?page=${pagingVO.curentPageNo+4}">${pagingVO.curentPageNo+4}</a></li>
									</c:if>
									<li><a
										href="${pageContext.request.contextPath}/student/showCourse?page=${pagingVO.totalCount}">最后一页&raquo;</a></li>
								</ul>
							</nav>
						</c:if>
					</div>
				</div>

			</div>
		</div>
	</div>
	<div class="container" id="footer">
		<div class="row">
			<div class="col-md-12"></div>
		</div>
	</div>
	<%@include file="Footer.jsp"%>
</body>
<script type="text/javascript">
		<%--设置菜单中--%>
		$("#nav li:nth-child(1)").addClass("active")
        <c:if test="${pagingVO != null}">
        if (${pagingVO.curentPageNo} == ${pagingVO.totalCount}) {
            $(".pagination li:last-child").addClass("disabled")
        };

        if (${pagingVO.curentPageNo} == ${1}) {
            $(".pagination li:nth-child(1)").addClass("disabled")
        };
        </c:if>

        function confirmd() {
            var msg = "您真的确定要删除吗？！";
            if (confirm(msg)==true){
                return true;
            }else{
                return false;
            }
        }

        $("#sub").click(function () {
            $("#form1").submit();
        });
	</script>
</html>