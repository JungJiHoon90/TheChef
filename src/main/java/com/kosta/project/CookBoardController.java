package com.kosta.project;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.kosta.project.dao.ICookRecipeDao;
import com.kosta.project.dto.CookRecipeDto;

@Controller
public class CookBoardController {

	@Autowired
	private SqlSession sqlSession;

	// 레시피테마insert//////////////////////////////////////////////////////////////////////////////////////////////////
	@RequestMapping("/cookRegister")
	public String cookRecipewriteView(Locale locale, Model model, HttpServletRequest request) {
		System.out.println("/cookRegister()");
		return "front.cookboard.cookRegister";
	}

	@RequestMapping("/cookRecipewrite")
	public String cookRecipewrite(HttpServletRequest request, Model model, CookRecipeDto dto, Principal principal) {
		System.out.println("cookRecipewrite()");
		dto.setId(principal.getName());
		// k_regdate는 insert할때 직접 sysdate로 넣는다.

		List<CommonsMultipartFile> files = dto.getFiles();
		List<String> fileNames = new ArrayList<String>();
		if (files != null && files.size() > 0) {
			// 이 경우라면 최소 한개는 파일첨부

			for (CommonsMultipartFile multipartFile : files) {
				// 파일명 고유한 값 넣어주기 위해 파일명에 현재시간 넣기
				Calendar calendar = Calendar.getInstance();
				SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmssSSS");
				String fname = dateFormat.format(calendar.getTime()) + multipartFile.getOriginalFilename();
				String path = request.getSession().getServletContext().getRealPath("/upload/CookRecipe");
				String fullpath = path + "\\" + fname;
				if (!fname.equals("")) {
					// 서버에 물리적 경로 파일쓰기작업
					try {	
						FileOutputStream fs = new FileOutputStream(fullpath);
						fs.write(multipartFile.getBytes());
						fs.close();
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
				fileNames.add(fname); // 파일의 이름만 별도 관리
			}
			// DB insert (파일명)
			dto.setK_contentFile(fileNames.get(0));
			dto.setK_thumbFile(fileNames.get(1));
		}
		ICookRecipeDao dao = sqlSession.getMapper(ICookRecipeDao.class);
		dao.Cook_write(dto); // 쿡테이블에 insert
		return "redirect:/";
	}// Cook write() end

	// 쿡테이블 delete
	// ///////////////////////////////////////////////////////////////////////////////////////////
	@RequestMapping("/cookRecipedelete")
	public String cookRecipedelete(HttpServletRequest request, Model model) {
		System.out.println("cookRecipedelete(" + request.getParameter("k_no") + ")"); // Cook_delete(k_no)
		String k_no = request.getParameter("k_no"); // id값 id변수에 저장

		// k_no에 해당하는 파일 실제 경로에서 삭제
		ICookRecipeDao dao = sqlSession.getMapper(ICookRecipeDao.class);
		CookRecipeDto dto = new CookRecipeDto();
		dto = dao.Cook_selectAll(k_no);
		String k_contentFile = dto.getK_contentFile();// 삭제할 k_contentFile명
		String k_thumbFile = dto.getK_thumbFile();// 삭제할 k_thumbFile명
		String path = request.getSession().getServletContext().getRealPath("/upload/CookRecipe");// 삭제할
																							// 파일
																							// 경로
		String fullpath1 = path + "\\" + k_contentFile;
		String fullpath2 = path + "\\" + k_thumbFile;
		File file = new File(fullpath1);
		if (file.exists() == true)
			file.delete();
		file = new File(fullpath2);
		if (file.exists() == true)
			file.delete();

		// k_no에 해당하는 데이터 삭제
		dao.Cook_delete(k_no); // 쿡테이블에서 삭제 delete

		model.addAttribute("searchRange", request.getParameter("searchRange"));
		model.addAttribute("searchNo", request.getParameter("searchNo"));
		model.addAttribute("searchTitle", request.getParameter("searchTitle"));
		model.addAttribute("searchWriter", request.getParameter("searchWriter"));
		model.addAttribute("searchCategory", request.getParameter("searchCategory"));
		model.addAttribute("searchKeyword", request.getParameter("searchKeyword"));
		model.addAttribute("startRegdate", request.getParameter("startRegdate"));
		model.addAttribute("endRegdate", request.getParameter("endRegdate"));

        return "redirect:/productSelect_Modify";
	}	// update//////////////////////////////////////////////////////////////////////////////////////////

	@RequestMapping("/cook_updateView")
	public String cookRecipe_updateView(Model model, HttpServletRequest request) {
		System.out.println("cook_updateView()");
		ICookRecipeDao dao = sqlSession.getMapper(ICookRecipeDao.class);
		CookRecipeDto dto = dao.Cook_selectAll(request.getParameter("k_no"));
		model.addAttribute("updateList", dto); // 뽑은 데이터 updateList라는 이름으로 보내기

		model.addAttribute("searchRange", request.getParameter("searchRange"));
		model.addAttribute("searchNo", request.getParameter("searchNo"));
		model.addAttribute("searchTitle", request.getParameter("searchTitle"));
		model.addAttribute("searchWriter", request.getParameter("searchWriter"));
		model.addAttribute("searchCategory", request.getParameter("searchCategory"));
		model.addAttribute("searchKeyword", request.getParameter("searchKeyword"));
		model.addAttribute("startRegdate", request.getParameter("startRegdate"));
		model.addAttribute("endRegdate", request.getParameter("endRegdate"));

		return "front.cookboard.cookUpdate";
	}

	@RequestMapping("/cook_update")
	public String cook_update(HttpServletRequest request, CookRecipeDto dto, Model model) {
		System.out.println("cooks_update()");

		List<CommonsMultipartFile> files = dto.getFiles();
		List<String> fileNames = new ArrayList<String>();
		if (files != null && files.size() > 0) {
			// 이 경우라면 최소 한개는 파일첨부
			for (CommonsMultipartFile multipartFile : files) {
				// 파일명 고유한 값 넣어주기 위해 파일명에 현재시간 넣기
				Calendar calendar = Calendar.getInstance();
				SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmssSSS");
				String fname = dateFormat.format(calendar.getTime()) + multipartFile.getOriginalFilename();
				String path = request.getSession().getServletContext().getRealPath("/upload/CookRecipe");
				String fullpath = path + "\\" + fname;

				if (!fname.equals("")) {
					// 서버에 물리적 경로 파일쓰기작업
					try {
						FileOutputStream fs = new FileOutputStream(fullpath);
						fs.write(multipartFile.getBytes());
						fs.close();
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
				fileNames.add(fname); // 파일의 이름만 별도 관리
			}
		}
		// k_regdate는 update시간으로 넣어야할지... 그냥시간으로 넣어야할지 고민이군!
		dto.setK_contentFile(fileNames.get(0));
		dto.setK_thumbFile(fileNames.get(1));

		ICookRecipeDao dao = sqlSession.getMapper(ICookRecipeDao.class);
		dao.Cook_update(dto); // 레시피/테마 테이블에 insert

		model.addAttribute("searchRange", request.getParameter("searchRange"));
		model.addAttribute("searchNo", request.getParameter("searchNo"));
		model.addAttribute("searchTitle", request.getParameter("searchTitle"));
		model.addAttribute("searchWriter", request.getParameter("searchWriter"));
		model.addAttribute("searchCategory", request.getParameter("searchCategory"));
		model.addAttribute("searchKeyword", request.getParameter("searchKeyword"));
		model.addAttribute("startRegdate", request.getParameter("startRegdate"));
		model.addAttribute("endRegdate", request.getParameter("endRegdate"));

		return "redirect:/productSelect_Modify";
	}// Cook_update() end

	@RequestMapping("/cook_list")
	public String Cook_list(Model model, HttpServletRequest request) {
		String k_category = request.getParameter("k_category");
		String categoryValue = null;
		ICookRecipeDao dao = sqlSession.getMapper(ICookRecipeDao.class);

		List<CookRecipeDto> cook_list = new ArrayList<CookRecipeDto>();
		List<CookRecipeDto> cook_onePageList = new ArrayList<CookRecipeDto>();

		/// 페이징처리/////////////////////////////////////////////////////////
		int pageSize = 16;// 한페이지에 나오는 최대 데이터 갯수
		int allCount = 0; // 선택한 데이터 총 갯수
		int count = 0;// 선택된 한페이지에 있는 데이터 총 갯수
		String pageNum = request.getParameter("pageNum"); // 페이지번호
		// 카테고리 버튼 누를때 기본값 1로 get방식으로 받음
		if (pageNum == null) { // null인경우 1로 지정
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum); // currentPage : 현재 보고 있는
														// 페이지
		int startRow = (currentPage * pageSize) - (pageSize - 1); // 현재페이지의 시작행
		int endRow = currentPage * pageSize; // 현재페이지의 끝행

		System.out.println("pageNum : " + pageNum);
		System.out.println("currentPage : " + currentPage);
		System.out.println("startRow : " + startRow);
		System.out.println("endRow : " + endRow);

		if (k_category == null) {// 레시피 리스트 전체뽑기 - category순으로 정렬
			System.out.println("cook_list()");
			categoryValue = "no";
			cook_list = dao.Cook_listAll();
			cook_onePageList = dao.Cook_onePageList(startRow, endRow);
		} else {// k_category에 해당하는 리스트 뽑기
			System.out.println("cook_listCategory()");
			categoryValue = k_category;
			cook_list = dao.Cook_listCategory(k_category);
			cook_onePageList = dao.Cook_onePageListCategory(k_category, startRow, endRow);
		}
		allCount = cook_list.size(); // 선택한 데이터 총 갯수
		count = cook_onePageList.size();// 한페이지에 보여줄 데이터 총 갯수

		System.out.println("allCount : " + allCount);
		System.out.println("count : " + count);

		model.addAttribute("categoryValue", categoryValue);

		model.addAttribute("count", new Integer(count));
		model.addAttribute("currentPage", new Integer(currentPage));
		model.addAttribute("startRow", new Integer(startRow));
		model.addAttribute("endRow", new Integer(endRow));
		model.addAttribute("allCount", new Integer(allCount));
		model.addAttribute("pageSize", new Integer(pageSize));
		model.addAttribute("cook_list", cook_list); // 해당하는 전체리스트
		model.addAttribute("cook_onePageList", cook_onePageList); // 한페이지에
																		// 출력될
																		// 리스트

		return "front.cookboard_cook_list";
	}
}