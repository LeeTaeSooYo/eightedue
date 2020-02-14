package lecture.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lecture.model.service.LectureService;
import lecture.model.vo.Lecture;
import lecture.model.vo.UserClass;
import user.model.service.userService;
import user.model.vo.User;

/**
 * Servlet implementation class LectureDetailServlet
 */
@WebServlet("/detail.le")
public class LectureDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LectureDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		User loginUser = (User)request.getSession().getAttribute("loginUser");
		
		
		if(loginUser != null) {
		int user_code = Integer.parseInt((String.valueOf(loginUser.getUserCode())));

		
		int l_code = Integer.parseInt(request.getParameter("l_code"));
		Lecture lecture = new LectureService().selectLecture(l_code);
		
		ArrayList<UserClass> list = new userService().buyLectureList(user_code);
		
		ArrayList<UserClass> list2 = new ArrayList();
		for(int i = 0; i < list.size(); i++) {
			if(list.get(i).getUser_code() == user_code) {
				list2.add(list.get(i));
			}
		}
		
		
		
		
		String page = "";
		if(lecture != null) {
			request.setAttribute("lecture", lecture);
			request.setAttribute("list", list2);
			page = "views/lectureAttendPage/lectureInformation.jsp";
			
		}else {
			request.setAttribute("msg", "상세보기에 실패했습니다.");
			page = "views/common/error.jsp";
		}
		
		request.getRequestDispatcher(page).forward(request, response);
		
		
		}else {
			int l_code = Integer.parseInt(request.getParameter("l_code"));
			Lecture lecture = new LectureService().selectLecture(l_code);
			
			
			String page = "";
			if(lecture != null) {
				request.setAttribute("lecture", lecture);
				page = "views/lectureAttendPage/lectureInformation.jsp";
				
			}else {
				request.setAttribute("msg", "상세보기에 실패했습니다.");
				page = "views/common/error.jsp";
			}
			
			request.getRequestDispatcher(page).forward(request, response);
			
			
			
			
		}
		

		
		
		
	}
		
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
