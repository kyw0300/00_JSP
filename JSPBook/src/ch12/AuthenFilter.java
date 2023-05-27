package ch12;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class AuthenFilter implements Filter {

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		System.out.println("Filter01 초기화...!");
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		System.out.println("Filter01 수행...!");
		
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("name");
		
		if(name == null || name.equals("")) {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter pw = response.getWriter();
			String msg = "<p>입력된 name값은 null입니다! 다시 입력해주세요!</p>";
				msg += "<a href='filter01.jsp'>Filter01 이동</a>";
				
			pw.println(msg);
			return;
		}
		
		chain.doFilter(request, response);
	}

	@Override
	public void destroy() {
		System.out.println("Filter01 해제...!");
	}
}
