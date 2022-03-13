package com.example.demo;

import java.io.*;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class HomeController {

	Service service = new Service();
	
	//@RequestMapping("main/main")
	//String main() {

		
		//return "main/main";
	//}
	
	@RequestMapping("main/main") //top 리스트
	String getArticleTopList(HttpServletRequest req) {
				
				ArticleDao dao = new ArticleDao();
				List<Article> list = dao.getArticleTopList();
				req.setAttribute("articleTopList", list);
			
			return "main/main";
		}	
	
	@RequestMapping("login/goLogin")
	String goLogin() {
		return "login/login";
	}
	
	
	@RequestMapping("/login/doJoin") //회원가입 및 아이디 중복검사
	String doJoin(String loginId, String loginPw, String userName, HttpSession session, HttpServletResponse response) throws IOException {
		String result = "";
		
		UserDao dao = new UserDao();
		
		// 아이디 중복검사
		if(service.getloginIdCheck(loginId) && service.getuserNameCheck(userName)) {

			dao.insertUser(loginId, loginPw, userName);
			
			
			result = "redirect:/login/goLogin";
			
			response.setContentType("text/html; charset=UTF-8");
			response.getWriter().println("<script> alert('회원가입 되었습니다.'); window.location.replace('/login/goLogin'); </script>");
			response.getWriter().flush();
			
		}
		else if(!service.getloginIdCheck(loginId)) {		
			response.setContentType("text/html; charset=UTF-8");
			response.getWriter().println("<script> alert('아이디가 중복됩니다.'); history.back(); </script>");
			response.getWriter().flush();		
			result ="redirect:/login/goJoin";
		}
		else if(!service.getuserNameCheck(userName)) {		
			response.setContentType("text/html; charset=UTF-8");
			response.getWriter().println("<script> alert('닉네임이 중복됩니다.'); history.back(); </script>");
			response.getWriter().flush();

			System.out.println("아이디가 중복입니다.");
			
			result ="redirect:/login/goJoin";
		}

		
		return result;
	}
	
	@RequestMapping("/login/goJoin")
	String goJoin() {
				
		return "login/join";
	}
	
	@RequestMapping("/article/faq")
	String faq() {
				
		return "article/faq";
	}
	
	
	@RequestMapping("/login/doLogin") //로그인
	String doLogin(String loginId, String loginPw, HttpSession session, HttpServletResponse response) throws IOException{
		String result = "";
		
		// 로그인 체크 기능
		if(service.loginCheck(loginId, loginPw)) {
			
					
			UserDao dao = new UserDao();
			
			User u = dao.getUserById(loginId);
			
			session.setAttribute("userName", u.getUserName());
			session.setAttribute("loginId", u.getLoginId());
		
			result = "redirect:/main/main";
			
			response.setContentType("text/html; charset=UTF-8");
			response.getWriter().println("<script> alert('로그인 되었습니다.'); window.location.replace('/main/main');</script>");
			response.getWriter().flush();
			
		}
		else {
			response.setContentType("text/html; charset=UTF-8");
			response.getWriter().println("<script> alert('아이디 또는 비밀번호가 일치하지 않습니다.'); history.back(); </script>");
			response.getWriter().flush();
			
			result ="redirect:/login/goLogin";
		}
		
		return result;
	}

	@RequestMapping("/login/goLogout") //로그아웃
	String goLogout(String loginId, String loginPw, HttpSession session) {
		String result = "";
		session.invalidate();
		result = "redirect:/main/main";
			
		return result;
	}
	
	@RequestMapping("user/getUserId")//아이디 리스트 확인
	@ResponseBody
	List<String> getUserId() {
		
		UserDao dao = new UserDao();
		List<String> list = dao.getUserIdList();
		
		return list;
	}
	
	//공지사항 리스트
	@RequestMapping("/admin/admin")
	String getAdminList(HttpServletRequest req) {
		
		AdminDao dao = new AdminDao();
		List<Admin> list = dao.getAdminList();
		req.setAttribute("adminList", list);
		
		return "admin/admin";
	}
	
	//전체 리스트
	@RequestMapping("/article/list")
	String getArticleList(HttpServletRequest req) {
		
		ArticleDao dao = new ArticleDao();
		
		List<Article> Llist = dao.getArticleLimitList();
		req.setAttribute("articleLimitList", Llist);
		
		List<Article> Plist = dao.getArticleProgressList();
		req.setAttribute("articleProgressList", Plist);
		
		return "article/list";
	}
	
	//인기 순 리스트
	@RequestMapping("/article/viewsList")
	String getArticleViewsList(HttpServletRequest req) {
		
		ArticleDao dao = new ArticleDao();
		List<Article> list = dao.getArticleVeiwsList();
		req.setAttribute("articleViewsList", list);
		
		
		return "article/viewsList";
	}
	// 만료된 리스트
	@RequestMapping("/article/limitList")
	String getArticleLimitList(HttpServletRequest req) {
		
		ArticleDao dao = new ArticleDao();
		List<Article> list = dao.getArticleLimitList();
		req.setAttribute("articleLimitList", list);
		
		return "article/limitList";
	}
	// 진행중 리스트
	@RequestMapping("/article/progressList")
	String getArticleProgressList(HttpServletRequest req) {
		
		ArticleDao dao = new ArticleDao();
		List<Article> list = dao.getArticleProgressList();
		req.setAttribute("articleProgressList", list);
		
		return "article/progressList";
	}
	
	//게시물 쓰기
	@RequestMapping("/article/goWrite")
	String goWrite() {
				
		return "article/write";
	}
	//게시물 쓰기	
	@RequestMapping("/article/doWrite")
	String doWrite(String title, String content, String regUser) {
		
		ArticleDao dao = new ArticleDao();
		
		dao.insertArticle(title, content, regUser);
		
		return "redirect:/article/list";
	}
	
	//게시물 쓰기
	@RequestMapping("/admin/goadminWrite")
	String goadminWrite() {
				
		return "admin/adminwrite";
	}
	//게시물 쓰기	
	@RequestMapping("/admin/doadminWrite")
	String doadminWrite(String title, String content, String regUser) {
		
		AdminDao dao = new AdminDao();
		
		dao.insertAdmin(title, content, regUser);
		
		return "redirect:/admin/admin";
	}
	
	// 게시물 수정
	@RequestMapping("/article/goUpdate")
	String goUpdate(int articleId, HttpServletRequest req) {
		
		ArticleDao dao = new ArticleDao();
		
		Article a = dao.getArticleById(articleId);
		
		req.setAttribute("article", a);
		//System.out.println(a.getTitle()+a.getContent());
		return "article/update";
	}
	// 게시물 수정	
	@RequestMapping("/article/doUpdate")
	String doUpdate(String title, String content, String regUser, int articleId) {
		
		ArticleDao dao = new ArticleDao();
		
		dao.updateArticle(title, content, regUser, articleId);
		
		return "redirect:/article/post?articleId=" + articleId;
	}
	
	// 공지사항 수정
	@RequestMapping("/admin/goadminUpdate")
	String goadminUpdate(int adminId, HttpServletRequest req) {
		
		AdminDao dao = new AdminDao();
		
		Admin a = dao.getAdminById(adminId);
		
		req.setAttribute("admin", a);
		//System.out.println(a.getTitle()+a.getContent());
		
		return "admin/adminupdate";
	}
	// 공지사항 수정	
	@RequestMapping("/admin/doadminUpdate")
	String doadminUpdate(String title, String content, String regUser, int adminId) {
		
		AdminDao dao = new AdminDao();
		
		dao.updateAdmin(title, content, regUser, adminId);
		
		return "redirect:/admin/adminpost?adminId=" + adminId;
	}
	
	// 게시물 삭제
	@RequestMapping("/article/delete")
	String delete(int articleId) {
		
		ArticleDao dao = new ArticleDao();
		
		dao.deleteArticle(articleId);
		
		return "redirect:/article/list";
	}
	
	// 공지사항 삭제
	@RequestMapping("/admin/admindelete")
	String admindelete(int adminId) {
		
		AdminDao dao = new AdminDao();
		
		dao.deleteAdmin(adminId);
		
		return "redirect:/admin/admin";
	}
	
	@RequestMapping("/admin/adminpost") //adminpost
	String adminpost(int adminId, HttpServletRequest req) {
		
		AdminDao dao = new AdminDao();
		
		Admin a = dao.getAdminById(adminId);
		dao.updateAdminViews(adminId);
		
		req.setAttribute("admin", a);

		return "admin/adminpost";
	}
	
	@RequestMapping("/article/post") //post
	String post(int articleId, HttpServletRequest req) {
		
		ArticleDao dao = new ArticleDao();
		
		Article a = dao.getArticleById(articleId);
		///int c = dao.getArticleReplyCount(articleId);
		List<Article> list = dao.getArticleReplyList(articleId);
		dao.updateView(articleId);
		
		
		
		req.setAttribute("articleReplylist", list);
		req.setAttribute("article", a);
		//req.setAttribute("article", c);

		
		return "article/post";
	}
	
	//내가 쓴 게시물 리스트
	@RequestMapping("/article/mypostList")
	String getArticleMyPostList(String regUser, HttpServletRequest req) {
		
		ArticleDao dao = new ArticleDao();
		List<Article> list = dao.getArticleMyPostList(regUser);
		req.setAttribute("articleMyPostList", list);
		
		return "article/mypostList";
	}
	
		
	
	@RequestMapping("/article/doWriteReply")
	String doWriteReply(int articleId, String userName, String body) {
		
		ArticleDao dao = new ArticleDao();
		String url = "redirect:/article/post?articleId=" + articleId;
		dao.insertArticleReply(articleId, userName, body);
		
		return url;
	}
	
	
}
