<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.ArrayList, lecture.model.vo.Lecture"%>
	
	
	<!-- 이부분을 추가해서 셀렉트 할수있게 수정할 예정 -->
	<%
	ArrayList<Lecture> list = (ArrayList<Lecture>)request.getAttribute("list");
	%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
#ingu {
	color: black;
	font-size: 24px;
}

.nav-link {
	color: rgb(154, 157, 160);
	font-size: 20px;
}

.nav-link : hover {
	color: black;
}

#line {
	border: 1px solid lightgray;
	width: 50%;
	height: 600px;
	margin-top: 10px;
	margin-left : 10%;
}


#info {
	background: black;
	padding: 1px 5px;
	color: white;
	margin: 0px 3px 0px 0px;
	border-top-right-radius: 5px;
	border-top-left-radius: 5px;
	border-bottom-right-radius: 5px;
	border-bottom-left-radius: 5px;
}

#info-line {
	margin: 10px;
	width: 700px;
}

#info-line2 {
	margin: 10px;
}

#subject, #satisfied {
	margin: 10px;
	margin-top: 1px;
	font-size: 20px;
	border-bottom: 2px solid #ccc;
	transition: all .2s ease-in-out;
	border-radius: 0;
	border: 0;
}

#board-content , #border-t_name {
	border: 1px solid white;
	margin: 10px;
	margin-top: 1px;
}

input-title:focus {
	border-color: #F9800B;
}

#center {
	width: 80%;
	height: 1000px;
}

#koko {
	position: relative;
	width: 16.5%;
	padding-right: 15px;
	padding-left: 15px;
}

#insert-btn {
	margin-top: 100px;
}

.nav-item ul{
	   padding: 0 10px;
       margin:0;
       height:0;
       overflow:hidden; /*내용이 넘치면 잘리게함 = 안보이게함 height가 0이므로 안보임!*/
       transition: height 0.5s ease-in;
}

.nav-item : ul{
	 overflow : auto; /*내용이 넘치면 스크롤을 통해서 아래로 출력하게함!*/
     height:100px;
}
</style>
</head>

<body>
   <%@ include file="../common/menuBar.jsp"%>
   <form action="<%= contextPath %>/insert.cl" method="post">
   <div class="container-fluid">
  <div class="row">
    <nav class="col-md-2 d-none d-md-block bg-white sidebar">
      <div class="sidebar-sticky">
        <ul class="nav flex-column">
          <li class="nav-item">
            <a class="nav-link active" href="<%=contextPath %>/views/lectureAttendPage/main.jsp" id="side_main">
              <span data-feather="home"></span>
             	교실 <span class="sr-only">(current)</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="<%=contextPath %>/views/lectureAttendPage/main.jsp">
              <span data-feather="file"></span>
            	  나의교실
            </a>
            	
          </li>
          
          
          <li class="nav-item">
            <a class="nav-link" href="#">
              <span data-feather="shopping-cart"></span>
              	영어교실</a>
          </li>

        </ul>

        <ul class="nav flex-column mb-2">
       
          <li class="nav-item">
            <a class="nav-link" href="#html5">
              <span data-feather="file-text"></span>
              	일본어교실
            </a>
     			<ul>
            		<li><p>초급반</p></li>
            		<li><p>중급반</p></li>
            	</ul>
          </li>
          
          
          <li class="nav-item">
            <a class="nav-link" href="#">
              <span data-feather="file-text"></span>
              	중국어교실
             
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">
              <span data-feather="file-text"></span>
              자료실 
                 <hr>
            </a>
          </li>
          <li class="nav-item">
           
          </li>
        </ul>
      </div>
    </nav>



			<div id="line">
			<div id="board-title">
					강의명 : 
					<input type="text" class="input-title" name="title"
						placeholder="강좌명을 입력하세요." style="width: 80%;">
						<br>
					강의수 :
					<input type="text" class="input-title" name="time"
						placeholder="강좌시간을 입력하세요." style="width: 80%;">
					<br>
					수강료 :
					<input type="text" class="input-title" name="next"
						placeholder="강좌목차를 입력하세요" style="width: 80%;">
				
					
					<br>
					강사명 :
					<input type="text" class="input-title" name="t_name"
						placeholder="해당 강사명를 입력하세요." style="width: 80%;">
					<br>

				</div>
				
		
		</div>
			</div>
				<div id="insert-btn" align="center">
					<hr>
					<button id="submit" type="submit">등록하기</button>
			 		<button type="button" onclick="javascript:history.back();">취소하기</button>	
		</div>
	</div>
	
	</form>
	<!-- FOOTER -->
	<div id="footer-wrapper">
		<div id="footer1"></div>
		<div id="footer2"></div>
		<div id="footer3">
			<a href="<%=contextPath %>/list.no?n_name=공지사항"> 공지사항 </a> <a href="<%=contextPath %>/list.no?n_name=문의내역"> 문의하기 </a> 
			<a href="https://open.kakao.com/o/s7Qic8Db">실시간 상담</a> <a href="<%=contextPath %>/list.no?n_name=qna"> 자주 찾는 질문 </a> <a href="<%=contextPath %>/views/customerPage/howToCome.jsp"> 찾아오시는 길 </a> 
			<a href="<%=contextPath %>/leclist.le"> 강의보기 </a> <a href="<%=contextPath %>/mainList.bo"> 커뮤니티 </a>
			<p>업체 및 기관 : 주식회사 에잇에듀 | 개인 : EIGHT.co</p>
			<p>Copyright ⓒ www.eightedu.com</p>
		</div>
		</div>
</body>
</html>