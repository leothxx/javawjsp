package j1116;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/j1116/Test2/4")
public class Test2_4 extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String name = request.getParameter("name")==null ? "":request.getParameter("name");
		String schoolNumber = request.getParameter("schoolNumber")==null ? "":request.getParameter("schoolNumber");
		int kor = request.getParameter("kor")==null ? 0: Integer.parseInt(request.getParameter("kor"));
		int eng = request.getParameter("eng")==null ? 0: Integer.parseInt(request.getParameter("eng"));
		int mat = request.getParameter("mat")==null ? 0: Integer.parseInt(request.getParameter("mat"));
		int soc = request.getParameter("soc")==null ? 0: Integer.parseInt(request.getParameter("soc"));
		int sci = request.getParameter("sci")==null ? 0: Integer.parseInt(request.getParameter("sci"));
		
		int tot = kor+eng+mat+soc+sci;
		double avg = tot / 5.0;
		int intAvg = (int)(avg / 10.0);
		String grade;
		switch (intAvg) {
			case 10:
			case 9:
				grade = "A";
				break;
			case 8:
				grade = "B";
				break;
			case 7:
				grade = "C";
				break;
			case 6:
				grade = "D";
				break;
			default:
				grade = "F";
		}
		
		Test2VO vo = new Test2VO(name,schoolNumber,kor,eng,mat,soc,sci,tot,avg,grade);
		System.out.println("vo : "+vo);
		
		 
		
		
		// 서버에서 get방식으로의 전송방법 
		// response.sendRedirect(request.getContextPath()+"/study/1116/test2Ok3.jsp?name="+name+"&schoolNumber="+schoolNumber+"&kor="+kor+"&eng="+eng+"&mat="+mat+"&soc="+soc+"&sci="+sci+"&tot="+tot+"&avg="+avg+"&grade="+grade);
		// response.sendRedirect(request.getContextPath()+"/study/1116/test2Ok3.jsp?vo="+vo); //절대 잃어버리지 말 것.
		
		// 저장소(request)를 활용한 forwarding 
		request.setAttribute("vo", vo); //뒤에 있는 변수는 vo와 같이 처리가 끝난 객체 변수이고, 앞에 있는 변수는 그 객체 변수를 담아갈 변수명. (request라는 저장소에 저장)
		// RequestDispatcher dispatcher = request.getRequestDispatcher("/study/1116/test2Ok4_2.jsp"); //포워딩. 포워딩 하는 곳의 주소르 넣는다.
		// dispatcher.forward(request, response); //64,63번의 행동이 헤더에 담는 것임. 헤더를 통해 클라이언트로 보내는것. dispatcher로 보내는 것이 웹서버에 보내는 것임.
		String viewPage = "/study/1116/test2Ok4_2.jsp"; //프론트 컨트롤러 라고함. 이렇게 컨트롤러의 경로를 변수로 빼서 조건문에 속해서 해당 조건은 어디, 해당 조건은 어디 이런식으로 컨트롤러를 이용하여 다른 페이지로 보내는 기법이다.
		request.getRequestDispatcher(viewPage).forward(request, response); //위에 두줄과 현재의 한줄과 같다.
	}
}
