import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/First")
public class First extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            String username = request.getParameter("userName");
            out.print("Welcome " + username);
            out.print("<form action='Second'>");
            out.print("<input type='hidden' name='username' value='" + username + "'>");
            out.print("<input type='submit' value='submit'>");
            out.print("</form>");
            out.close();
        }
        catch (Exception e) {
            System.out.println(e);
        }
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
