package j1111;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Test12 extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		
		String name = request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));
		String gender = request.getParameter("gender"); 
		String hobbys[] = request.getParameterValues("hobby");
		String hob = "";
		
		System.out.println(name);
		System.out.println(age);
		System.out.println(gender);
		System.out.println("취미 : ");
		if(hobbys != null) {
			for(String ho : hobbys) {
				System.out.print(ho + " / ");
			}			
		}
		else System.out.println("취미가 선택되어 있지 않습니다.");
		
		//웹에 내용을 출력하기 위해서는 PrintWriter객체를 통해서 처리한다.
		PrintWriter out = response.getWriter(); //이렇게 선언하면 jsp에서 사용한 out과 똑같이 사용하면 된다.
		out.println("안녕... 이곳은 서블릿이얌....</br>");
		out.println("성명 : "+name+"<br/>");
		out.println("나이 : "+age+"<br/>");
		out.println("성별 : "+gender+"<br/>");
		out.println("취미 : ");
		if(hobbys != null) {
			for(String hobby : hobbys) {
				out.println(hobby + " / ");
			}
		}
		else {
			out.println("<script>");
			out.println("alert('취미는 하나 이상 선택하셔야 합니다.');");
			out.println("history.back();");
			//out.println("location.href='/javawjsp/study/1111/test12.jsp';");
			out.println("</script>");
		}
		//out.println("<p><a href='/javawjsp/study/1111/test12.jsp'>돌아가기</a></p>");
		out.println("<p><a href='"+request.getContextPath()+"/study/1111/test12.jsp'>돌아가기</a></p>");
	}
}
