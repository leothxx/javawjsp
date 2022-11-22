package study2.mapping2;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CalcOkCommand implements MappingInterface {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int su1 = request.getParameter("su1")==null ? 0 : Integer.parseInt(request.getParameter("su1"));
		int su2 = request.getParameter("su2")==null ? 0 : Integer.parseInt(request.getParameter("su2"));
		String opt = request.getParameter("opt")==null ? "" : request.getParameter("opt");
		
		int answer = 0;
		if(opt.equals("+")) answer = su1 + su2;
		else if(opt.equals("-")) answer = su1 - su2;
		else if(opt.equals("*")) answer = su1 * su2;
		else if(opt.equals("/")) answer = su1 / su2;
		else answer = su1 % su2;
		
		request.setAttribute("su1", su1);
		request.setAttribute("su2", su2);
		request.setAttribute("opt", opt);
		request.setAttribute("answer", answer);
	}
}
