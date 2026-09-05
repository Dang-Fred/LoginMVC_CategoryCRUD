package hcmute.controllers;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import hcmute.models.User;

@SuppressWarnings("serial")
@WebServlet(urlPatterns="/waiting")
public class WaitingController extends HttpServlet {
    
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    HttpSession session = req.getSession(false);
	    if (session != null && session.getAttribute("account") != null) {
	        
	        // Lấy thông tin user từ Session ra
	        User account = (User) session.getAttribute("account");
	        
	        // Phân luồng theo RoleID
	        if (account.getRoleid() == 1) {
	            // Admin đi đường này
	            resp.sendRedirect(req.getContextPath() + "/admin/home");
	        } else {
	            // User thường (roleid = 5) đi đường này
	            resp.sendRedirect(req.getContextPath() + "/home");
	        }
	    } else {
	        resp.sendRedirect(req.getContextPath() + "/login");
	    }
	}
}