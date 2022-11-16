package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

@WebFilter("/*") //얘는 필터야. 그리고 모든 경로에 있어 적용을 해줘. 라는 뚯
public class EncodingFilter implements Filter {

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");		
		//System.out.println("이곳은 Filter통과 전~~");
		chain.doFilter(request, response); //이상없으면 통과
		//System.out.println("이곳은 Filter통과 후~~");
	}

	
	
}
