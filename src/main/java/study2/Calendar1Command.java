package study2;

import java.io.IOException;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Calendar1Command implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 오늘 날짜처리 (저장)
		Calendar calToday = Calendar.getInstance(); //싱글톤 형식이기에 생성이 아닌, 메모리에 로딩시키는 형식
		int toYear = calToday.get(Calendar.YEAR);
		int toMonth = calToday.get(Calendar.MONTH);
		int toDay = calToday.get(Calendar.DATE);
		
		// 화면에 보여줄 해당 '년/월'을 세팅
		Calendar calView = Calendar.getInstance();
		int yy = request.getParameter("yy") == null ?  calView.get(Calendar.YEAR) : Integer.parseInt(request.getParameter("yy"));
		int mm = request.getParameter("mm") == null ?  calView.get(Calendar.MONTH) : Integer.parseInt(request.getParameter("mm"));
		
		// 앞에서 넘어온 변수 (yy, mm) 값이 '1월' 이거나, '12월'이라면 아래와 같이 편집한다. 참고 ! 1월은 '0' 12월은 '11'로 넘어온다.
		if(mm < 0) {
			yy--;
			mm = 11;
		}
		if(mm > 11) {
			yy++;
			mm = 0;
		}
		
		// 해당 '년/월'의 1일을 기준으로 세팅시켜준다.
		calView.set(yy, mm, 1);
		
		// 앞에서 세팅한 해당 '년/월'의 1일에 해당하는 요일 값을 숫자로 가져온다 (일:1, 월:2, 화:3, 수:4, 목:5, 금:6, 토:7)
		int startWeek = calView.get(Calendar.DAY_OF_WEEK);
		int lastDay = calView.getActualMaximum(Calendar.DAY_OF_MONTH); //해당 월의 가장 큰 날짜를 가져온다.
		
		// 화면에 보여줄 달력의 해당 내역을 저장소에 저장한다.
		request.setAttribute("yy", yy);
		request.setAttribute("mm", mm);
		request.setAttribute("startWeek", startWeek);
		request.setAttribute("lastDay", lastDay);
		
		// 오늘 날짜를 저장소에 담아서 넘겨준다.
		request.setAttribute("toYear", toYear);
		request.setAttribute("toMonth", toMonth);
		request.setAttribute("toDay", toDay);
	}
}
