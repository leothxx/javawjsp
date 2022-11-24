package guest;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GuListCommand implements GuestInterface {
	/*
	 	페이징처리
	 	1. 페이지(pag)를 결정한다. 처음 접속시의 페이지는 무조건 1pag이다. : pag = 1; 
	  2. 한페이지의 분량을 결정한다. : (사용자가 결정함.) 이곳에서는 한페이지 분량을 5로 설정했다. pageSize = 5;
	  3. 총 레코드 건수를 구한다. totRecCnt => SQL 함수 중 count(*)를 사용한다.
	  4. 총 페이지 건수를 구한다. totPage => totRecCnt % pageSize 값이 0이면 '몫' 0이 아니면 '몫'+1
	  5. 현재 페이지의 시작 인덱스 번호를 구한다. startIndexNo => (pag-1) * pageSize [현재페이지 -1 * 한페이지 분량]
	  6. 현재 화면에 보여주는 시작번호를 구한다. curScrStartNo = totRecCnt - startIndexNo; 총 건수 - 해당페이지 시작 인덱스 번호
	 */

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		GuestDAO dao = new GuestDAO();
		
		// 1. 페이지(pag)를 결정한다. //처음엔 페이지가 null이기에 초기값을 1로 준다.
		int pag = request.getParameter("pag")==null ? 1 : Integer.parseInt(request.getParameter("pag"));
		// 2. 한 페이지의 분량을 결정함.
		int pageSize = request.getParameter("pageChekBox")==null ? 5 : Integer.parseInt(request.getParameter("pageCheckBox"));
		// 3. 총 레코드 건수를 구한다.
		int totRecCnt = dao.totRecCnt();
		// 4. 총 페이지 건수를 구한다.
		int totPage = (totRecCnt % pageSize)==0 ? totRecCnt / pageSize : (totRecCnt / pageSize) + 1;
		// 5. 페이지 마다의 시작 인덱스 번호 구하기.
		int startIndexNo = (pag-1) * pageSize;
		// 6. 현재 화면에 보여주는 시작번호를 구한다.
		int curScrStartNo = totRecCnt - startIndexNo;
		
		// =========================================================== //
		// 블록 페이징 처리 (3단계) -> [블록의 시작번호를 0번부터 처리함.]
		// 1. 블록의 크기(size)를 결정함. (여기선 3으로 지정)
		int blockSize = 3;
		// 2. 현재 페이지가 위치하고 있는 블록 번호를 구한다. ex) 1페이지는 0블록, 3페이지는 0블록, 5페이지는 1블록
		// int curBlock = (pag % blockSize)==0 ? (pag / blockSize) -1 : (pag / blockSize); 혹은
		int curBlock = (pag - 1) / blockSize;
		// 3. 마지막 블록을 구한다. [다음블록의 시작위치는 표시할때 계산할 것임.]
		// int lastBlock = (totPage % blockSize)==0 ? (totPage / blockSize) -1 : (totPage / blockSize);
		int lastBlock = (totPage - 1) / blockSize;
		
		
		
		// ArrayList<GuestVO> vos = dao.getGuestList();
		ArrayList<GuestVO> vos = dao.getGuestList(startIndexNo, pageSize);
		request.setAttribute("vos", vos);
		request.setAttribute("pag", pag);
		request.setAttribute("totPage", totPage);
		request.setAttribute("curScrStartNo", curScrStartNo);
		
		request.setAttribute("blockSize", blockSize);
		request.setAttribute("curBlock", curBlock);
		request.setAttribute("lastBlock", lastBlock);
	}

}
