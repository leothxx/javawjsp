package j1115work;

import java.io.IOException;
import java.io.PrintWriter;

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
		
		String productNames[] = request.getParameterValues("productName");
		String productPrices[] = request.getParameterValues("productPrice");
		String productSus[] = request.getParameterValues("productSu");
		String buyername = request.getParameter("name");
		String category = request.getParameter("category")==null?"":request.getParameter("category");
		String sw = request.getParameter("sw");
	
		WorkVO vo;
		int productTot=0;
		String name="";
		String priceVO ="";
		String suVO ="";
		String totVO ="";
		String productTotVO ="";
		for(int i=0; i<productNames.length; i++) {
			name += productNames[i] + "/";
			int price = Integer.parseInt(productPrices[i]);
			int su = Integer.parseInt(productSus[i]);
			int tot = price * su;
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
		out.println("alert('상품이 정상적으로 등록되었습니다!')");
		out.println("</script>");
		
		request.setAttribute("vo", vo);
		String viewPage = "/study/1115work";
		if(sw.equals("main")) viewPage += "/main.jsp";
		else if(sw.equals("input")) viewPage += "/input.jsp";
		else if(sw.equals("list")) viewPage += "/list.jsp";
		request.getRequestDispatcher(viewPage).forward(request, response);
		
		
		
	}
}

