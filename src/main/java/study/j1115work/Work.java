package study.j1115work;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/j1115_Work")
public class Work extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		String sw = request.getParameter("sw")==null ? "main" : request.getParameter("sw");
		
		String productNames[] = request.getParameterValues("productName")==null ? null : request.getParameterValues("productName");
		String productPrices[] = request.getParameterValues("productPrice")==null ? null : request.getParameterValues("productPrice");
		String productSus[] = request.getParameterValues("productSu")==null ? null : request.getParameterValues("productSu");
		String buyername = request.getParameter("name")==null ? "noname" : request.getParameter("name");
		String category = request.getParameter("category")==null ? "nocategory" : request.getParameter("category");
		
	
		WorkVO vo;
		int productTot=0;
		String name="";
		String priceVO ="";
		String suVO ="";
		String totVO ="";
		String productTotVO ="";
		String price = "";
		String su = "";
		for(int i=0; i<productNames.length; i++) {
			name += productNames[i] + "/";
			if(!productPrices[i].equals(null)) {
				price = productPrices[i];				
			}
			if(!productSus[i].equals(null)) {
				su = productSus[i];				
			}
			int tot = Integer.parseInt(price) * Integer.parseInt(su);
			productTot += tot;
			priceVO += price + "/";
			suVO += su + "/";
			totVO += tot +"/";
			if(i == productNames.length-1) {
				productTotVO = productTot + "";
			}
		}
		
		vo = new WorkVO(name,priceVO,suVO,totVO,productTotVO,buyername,category,sw);
		out.println("<script>");
		out.println("alert('????????? ??????????????? ?????????????????????!')");
		out.println("</script>");
		
		String viewPage = "/study/1115work";
		if(sw.equals("input")) viewPage += "/input.jsp";
		else if(sw.equals("list")) viewPage += "/list.jsp";
		else viewPage += "/main.jsp";
		
		request.setAttribute("vo", vo);
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
		
		
	}
}

