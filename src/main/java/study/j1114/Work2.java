package study.j1114;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/j1114_Work2")
public class Work2 extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		PrintWriter out = response.getWriter();
		
		String productNames[] = request.getParameterValues("productName");
		String productPlaces[] = request.getParameterValues("productPlace");
		String productSus[] = request.getParameterValues("productSu");
		String buyername = request.getParameter("name");
		String category = request.getParameter("category");
		
		out.println("<link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css\">");
		out.println("<script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js\"></script>");
		out.println("<style>");
		out.println("th,td{text-align:center}");
		out.println("</style>");
		out.println("<p><br/></p>");
		out.println("<h2 class='text-center'>등록된 상품 안내</h2>");
		out.println("<div class='container'>");
		out.println("<table class='table table-bordered'><tr class='table-info text-info'>");
		out.println("<th>품명</th><th>가격</th><th>수량</th><th>금액</th>");
		
		int productTot=0;
		for(int i=0; i<productNames.length; i++) {
			String name = productNames[i];
			int place = Integer.parseInt(productPlaces[i]);
			int su = Integer.parseInt(productSus[i]);
			int tot = place * su;
			productTot += tot;
			
			out.println("<tr>");
			out.println("<td>"+name+"</td>");
			out.println("<td>"+place+"</td>");
			out.println("<td>"+su+"</td>");
			out.println("<td>"+tot+"</td>");
			out.println("</tr>");
		}
		out.println("<tr class='table-info text-info'><td>총가격</td><td colspan='3'>" + productTot + "</td></tr>");
		out.println("</table>");
		out.println("<hr/>");
		out.println("<a href='"+request.getContextPath()+"/study/1114work/work2.jsp' class='btn btn-success form-control'>돌아가기</a>");

	}
}
