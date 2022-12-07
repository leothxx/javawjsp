package pds;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardDAO;
import board.BoardVO;

public class PdsSearchCommand implements PdsInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String search = request.getParameter("search")==null ? "" : request.getParameter("search");
		String searchString = request.getParameter("searchString")==null ? "" : request.getParameter("searchString");
		int pag = request.getParameter("pag")==null ? 1 : Integer.parseInt(request.getParameter("pag"));
		int pageSize = request.getParameter("pageSize")==null ? 5 : Integer.parseInt(request.getParameter("pageSize"));
		
		PdsDAO dao = new PdsDAO();
		
		ArrayList<PdsVO> vos = dao.getPdsContentSearch(search,searchString);
		
		String searchTitle = "";
		if(search.equals("title")) searchTitle = "제목";
		else if(search.equals("nickName")) searchTitle = "작성자";
		else searchTitle = "내용";
		
		request.setAttribute("vos", vos);
		request.setAttribute("search", search);
		request.setAttribute("searchString", searchString);
		request.setAttribute("searchCount", vos.size());
		request.setAttribute("searchTitle", searchTitle);
		request.setAttribute("pag", pag);
		request.setAttribute("pageSize", pageSize);
	}
}
