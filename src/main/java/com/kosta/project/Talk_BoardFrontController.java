package com.kosta.project;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kosta.project.dao.ITalk_BoardDao;
import com.kosta.project.dto.TalkBoardDto;
import com.kosta.project.dto.TalkCommentDTO;

@Controller
public class Talk_BoardFrontController {

	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/TB_list")
	public String list(HttpServletRequest request, Model model){
		
		int pg = 1;
		String strPg = request.getParameter("pg");
		if (strPg != null) {
			pg = Integer.parseInt(strPg);
		}
		int rowSize = 10;
		int start = (pg * rowSize) - (rowSize - 1);
		int end = pg * rowSize;

		ITalk_BoardDao dao = sqlSession.getMapper(ITalk_BoardDao.class);
		int total = dao.getListCount(); // 총 게시물수

		int allPage = (int) Math.ceil(total / (double) rowSize); // 페이지수
		// int totalPage = total/rowSize + (total%rowSize==0?0:1);

		int block = 5; // 한페이지에 보여줄 범위 << [1] [2] [3] [4] [5] >>
		int fromPage = ((pg - 1) / block * block) + 1; // 보여줄 페이지의 시작
		// ((1-1)/10*10)
		int toPage = ((pg - 1) / block * block) + block; // 보여줄 페이지의 끝
		if (toPage > allPage) {
			toPage = allPage;
		}

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);

		List<TalkBoardDto> list = dao.list(map);
		Calendar calendar = Calendar.getInstance();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String fname = dateFormat.format(calendar.getTime());   
        System.out.println("fname"+fname);
		
		
		System.out.println("list()");
	    model.addAttribute("fname",fname);
		model.addAttribute("list", list);
		model.addAttribute("pg", pg);
		model.addAttribute("allPage", allPage);
		model.addAttribute("block", block);
		model.addAttribute("fromPage", fromPage);
		model.addAttribute("toPage", toPage);
		return "front.talkboard.TB_list";
	
	}
	
	@RequestMapping("/TB_write_view")
	public String write_view(Model model){
		System.out.println("write_view()");
		return "back.talkboard.write_view";				// /WEB-INF/views/write_view.jsp
	}// write_view() end
		
	
	@RequestMapping("/TB_write")
	public String write(HttpServletRequest request, Model model){
		System.out.println("write()");
		TalkBoardDto dto = new TalkBoardDto();
		dto.setT_title(request.getParameter("t_title"));
		dto.setT_writer(request.getParameter("t_writer"));
		dto.setT_contents(request.getParameter("t_content"));
		ITalk_BoardDao dao = sqlSession.getMapper(ITalk_BoardDao.class); // IBDao에서 Mapper를 얻어올거야
		dao.write(dto);
		return "redirect:/talkManage"; 
//		return "redirect:NB_list";				// /WEB-INF/views/list.jsp
	}// write() end
	
	@RequestMapping("/TB_content_view")
	public String content_view(HttpServletRequest request, Model model){
		System.out.println("content_view()");
		String t_no = request.getParameter("t_no");
		System.out.println("title받아오는고");
		ITalk_BoardDao dao = sqlSession.getMapper(ITalk_BoardDao.class);
		dao.readcount(t_no);	//조회수 1증가
		System.out.println("조회수 1증가했는고");
		
		Calendar calendar = Calendar.getInstance();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String fname = dateFormat.format(calendar.getTime());   
        System.out.println("fname"+fname);
        model.addAttribute("fname",fname);
		model.addAttribute("content_view",dao.contentView(t_no));
		
		System.out.println("listcomment");
		model.addAttribute("ListComment",dao.ListComment(t_no));
		
		return "front.talkboard.content_view";
	}
	
	@RequestMapping("/TB_content_view_comment")
	public String insertComment(HttpServletRequest request ,Model model ){
		
	    System.out.println("insertComment");
		String t_no = request.getParameter("t_no");
        String comment_name = request.getParameter("comment_name");
        String comment_comm = request.getParameter("comment_comm");
        
		TalkCommentDTO cdto = new TalkCommentDTO();
		cdto.setT_no(request.getParameter("t_no"));
		cdto.setComment_name(request.getParameter("comment_name"));
		cdto.setComment_comm(request.getParameter("comment_comm"));
		
		System.out.println(t_no);
		System.out.println(comment_name);
		System.out.println(comment_comm);

        System.out.println("setComment");
		ITalk_BoardDao dao = sqlSession.getMapper(ITalk_BoardDao.class);
		dao.insertComment(cdto);
		
        System.out.println("insertComment ok");
        model.addAttribute("t_no",t_no);
		
		
		
		return "redirect:/TB_content_view";

	}
	
	@RequestMapping("/TB_delete")
	public String delete(HttpServletRequest request){
		System.out.println("delete()");
		String t_no = request.getParameter("t_no");
		ITalk_BoardDao dao = sqlSession.getMapper(ITalk_BoardDao.class);
		dao.deletecomment(t_no);
		dao.delete(t_no);
		return "redirect:/talkManage";
	}
	
	@RequestMapping("/TCM_delete")
	public String commentDelete(HttpServletRequest request,Model model){
		
		String t_no = request.getParameter("t_no");
		System.out.println(t_no);
		System.out.println("commentS delete()");
		String comment_seq = request.getParameter("comment_seq");
		System.out.println(comment_seq);
		ITalk_BoardDao dao = sqlSession.getMapper(ITalk_BoardDao.class);
		dao.commentDelete(comment_seq);
		System.out.println("comment delete ok??");
		
        model.addAttribute("comment_seq",comment_seq);
        model.addAttribute("t_no",t_no);

		return "redirect:/TB_content_view?t_no="+t_no;
	}
	
	@RequestMapping("/TB_modify_view")
	public String modify_view(HttpServletRequest request, Model model, TalkBoardDto dto){
		System.out.println("modify_view()");
		String t_no = request.getParameter("t_no");
		ITalk_BoardDao dao = sqlSession.getMapper(ITalk_BoardDao.class);
		model.addAttribute("content_view",dao.contentView(t_no));
		System.out.println("여까지잘오나?");
		return "back.talkboard.modify_view";
	}
	
	@RequestMapping(value="/TB_modify",method=RequestMethod.POST)
	public String modify(HttpServletRequest request){
		System.out.println("modify()");
		TalkBoardDto dto = new TalkBoardDto();
		dto.setT_writer(request.getParameter("T_writer"));
		dto.setT_title(request.getParameter("T_title"));
		dto.setT_contents(request.getParameter("T_contents"));
		dto.setT_no(Integer.parseInt(request.getParameter("T_no")));
		ITalk_BoardDao dao = sqlSession.getMapper(ITalk_BoardDao.class);
		dao.modify(dto);
		return "redirect:/talkManage";
	}
	
	@RequestMapping(value="/TB_TalkManage")
	public String backpage_search(HttpServletRequest request, Model model){
		System.out.println("backpage-search()");
		
		ITalk_BoardDao dao = sqlSession.getMapper(ITalk_BoardDao.class);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("dataFrom", request.getParameter("dataFrom"));
		map.put("dataTo", request.getParameter("dataTo"));
		map.put("category_selector", request.getParameter("category_selector"));
		map.put("dataForSearch", request.getParameter("dataForSearch"));
		String flag = (String)map.get("category_selector");
		System.out.println("flag값:"+flag);
		
		int pg = 1;
		String strPg = request.getParameter("pg");
		if (strPg != null) {
			pg = Integer.parseInt(strPg);
		}
		int rowSize = 10;
		int start = (pg * rowSize) - (rowSize - 1);
		int end = pg * rowSize;
		
		map.put("start", start);
		map.put("end", end);
		
		
		List<TalkBoardDto> list =null;
		int total=0;
		if(flag.equals("sub")){
			System.out.println("내가실행되나?");
			list = dao.backpage_search_bytitle(map);
			total = dao.getListCount_back1(map);
		} else{
			System.out.println("눼가실행되나");
			list = dao.backpage_search_byno(map);
			total = dao.getListCount_back2(map);
		}
		
		System.out.println("total.size:"+total);
		int allPage = (int) Math.ceil(total / (double) rowSize); // 페이지수
		// int totalPage = total/rowSize + (total%rowSize==0?0:1);

		int block = 5; // 한페이지에 보여줄 범위 << [1] [2] [3] [4] [5] >>
		int fromPage = ((pg - 1) / block * block) + 1; // 보여줄 페이지의 시작
		// ((1-1)/10*10)
		int toPage = ((pg - 1) / block * block) + block; // 보여줄 페이지의 끝
		if (toPage > allPage) {
			toPage = allPage; 
		}
		
		Calendar calendar = Calendar.getInstance();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String fname = dateFormat.format(calendar.getTime());
		
		model.addAttribute("fname",fname);
		model.addAttribute("list", list);
		model.addAttribute("pg", pg);
		model.addAttribute("allPage", allPage);
		model.addAttribute("block", block);
		model.addAttribute("fromPage", fromPage);
		model.addAttribute("toPage", toPage);
		
		return "back.storeManage.talkManage";
	}
}
