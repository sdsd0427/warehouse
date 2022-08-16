package kr.or.warehouse.controller.view;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.warehouse.command.Criteria;
import kr.or.warehouse.controller.rest.GetAttachesByMultipartFileAdatpter;
import kr.or.warehouse.dto.AttachVO;
import kr.or.warehouse.dto.BoardVO;
import kr.or.warehouse.dto.EmployeeVO;
import kr.or.warehouse.service.BoardService;
import kr.or.warehouse.service.EmployeeService;

@Controller
@RequestMapping("/board")
public class BoardController {
	@Autowired
	private BoardService boardService;

	@Resource(name="fileUploadPath")
	private String fileUploadPath;

	@RequestMapping("/main")
	public ModelAndView boardMain(Criteria cri, ModelAndView mnv) throws Exception{
		String url="board/main";

		String temp = "n";
		Map<String, Object> dataMap = boardService.getBoardList(cri, temp, "no");
		mnv.addObject("dataMap", dataMap);

		String ftemp = "f";
		Map<String, Object> fdataMap = boardService.getBoardList(cri, ftemp, "viewCount");
		mnv.addObject("fdataMap", fdataMap);

		String etemp = "e";
		Map<String, Object> edataMap = boardService.getBoardList(cri, etemp, "no");
		mnv.addObject("edataMap", edataMap);

		mnv.setViewName(url);
		return mnv;

	}

	//공지사항----------------------------------------------------------------------------
	@RequestMapping("/notice/list")
	public ModelAndView noticeList(Criteria cri, ModelAndView mnv)throws Exception {
		//System.out.println("controller");
		String url="board/notice/list";
		String temp = "n";

		Map<String, Object> dataMap = boardService.getBoardList(cri, temp, "no");
		mnv.addObject("dataMap", dataMap);
		mnv.setViewName(url);
		return mnv;
	}
	@RequestMapping("/notice/registGo")
	public String noticeregistform(Model model)throws Exception {
		String url="board/notice/registForm";

		Map<String, Object> boardList = boardService.getBoardList(new Criteria(), "n", "no");
		List<BoardVO> fixBoardList = (List<BoardVO>) boardList.get("fixBoardList");

		model.addAttribute("fixBoardListSize", fixBoardList.size());
		return url;
	}
	@RequestMapping(value="/notice/noticeRegist",method=RequestMethod.POST,produces="text/plain; charset=utf-8")
	public String noticeRegist(BoardVO board, HttpServletRequest request, RedirectAttributes rttr)throws Exception {
		String url="redirect:/board/notice/list.do";

		String savePath = this.fileUploadPath;
		List<AttachVO> attachList = GetAttachesByMultipartFileAdatpter.save(board.getUploadFile(), savePath);
		board.setAttachList(attachList);

		if(request.getParameter("fix")==null) {
			board.setFix("0");
		}

		String name = board.getName();

		board.setBoardTitle((String)request.getAttribute("XSSboardTitle"));
		boardService.regist(board);
		rttr.addFlashAttribute("from", "regist");
		rttr.addAttribute("mCode", "M160000");
		return url;
	}
	@RequestMapping("/notice/modifyGo")
	public ModelAndView noticeModifyForm(String boardNo, ModelAndView mnv)throws Exception {
		String url="board/notice/modifyForm";

		Map<String, Object> boardList = boardService.getBoardList(new Criteria(), "n", "no");
		List<BoardVO> fixBoardList = (List<BoardVO>) boardList.get("fixBoardList");

		mnv.addObject("fixBoardListSize", fixBoardList.size());

		BoardVO board = boardService.getBoard(boardNo);

		if(board != null) {
			List<AttachVO> attachList = board.getAttachList();
			if(attachList!=null) {
				for(AttachVO attach : attachList) {
					String fileName = attach.getFileName().split("\\$\\$")[1];
					attach.setFileName(fileName);
				}
			}
		}

		mnv.addObject("board", board);
		mnv.setViewName(url);
		return mnv;
	}
	@RequestMapping(value="/notice/noticeModify",method=RequestMethod.POST)
	public String noticeModify(BoardVO board, HttpServletRequest request, RedirectAttributes rttr)throws Exception {
		String url="redirect:/board/notice/detailGo.do";

		// 파일 삭제
		if (board.getDeleteFile() != null && board.getDeleteFile().length > 0) {
			for (String attachNo : board.getDeleteFile()) {
				AttachVO attach = boardService.getAttachByAttachNo(attachNo);

				File deleteFile = new File(attach.getUploadPath(), attach.getFileName());

				if (deleteFile.exists()) {
					deleteFile.delete();
				}
				boardService.removeAttachByAttachNo(attachNo);
			}
		}

		// 파일 저장
		List<AttachVO> attachList = GetAttachesByMultipartFileAdatpter.save(board.getUploadFile(),fileUploadPath);
		board.setAttachList(attachList);

		if(request.getParameter("fix")==null) {
			board.setFix("0");
		}

		board.setBoardTitle((String)request.getAttribute("XSSboardTitle"));
		boardService.modify(board);
		rttr.addFlashAttribute("from", "modify");
		rttr.addAttribute("boardNo", board.getBoardNo());
		rttr.addAttribute("mCode", "M160000");
		return url;
	}
	@RequestMapping("/notice/detailGo")
	public ModelAndView noticeDetail(String boardNo, ModelAndView mnv)throws Exception {
		String url="board/notice/detail";
		BoardVO board = boardService.getBoard(boardNo);

		if(board != null) {
			List<AttachVO> attachList = board.getAttachList();
			if(attachList!=null) {
				for(AttachVO attach : attachList) {
					String fileName = attach.getFileName().split("\\$\\$")[1];
					attach.setFileName(fileName);
				}
			}
		}

		mnv.addObject("board", board);
		mnv.setViewName(url);
		return mnv;
	}
	@RequestMapping("/notice/detail")
	public ModelAndView homeNoticeDetail(String boardNo, ModelAndView mnv)throws Exception {
		String url="board/notice/detail";
		BoardVO board = boardService.getBoard(boardNo);

		if(board != null) {
			List<AttachVO> attachList = board.getAttachList();
			if(attachList!=null) {
				for(AttachVO attach : attachList) {
					String fileName = attach.getFileName().split("\\$\\$")[1];
					attach.setFileName(fileName);
				}
			}
		}

		mnv.addObject("board", board);
		mnv.setViewName(url);
		return mnv;
	}

	@RequestMapping("/notice/getFile")
	public String noticeGetFile(String attachNo,Model model) throws Exception {
		String url="downloadFile";

		AttachVO attach = boardService.getAttachByAttachNo(attachNo);
		model.addAttribute("savedPath", attach.getUploadPath());
		model.addAttribute("fileName", attach.getFileName());

		return url;
	}

	@RequestMapping(value="/notice/remove",method=RequestMethod.POST)
	public String noticeRemove(String boardNo, RedirectAttributes rttr) throws Exception{
		String url = "redirect:/board/notice/list.do";

		List<AttachVO> attachList = boardService.getBoard(boardNo).getAttachList();
		if (attachList != null) {
			for (AttachVO attach : attachList) {
				File target = new File(attach.getUploadPath(), attach.getFileName());
				if (target.exists()) {
					target.delete();
				}
			}
		}

		boardService.remove(boardNo);
		rttr.addAttribute("boardNo",boardNo);
		rttr.addFlashAttribute("from","remove");
		rttr.addAttribute("mCode", "M160000");
		return url;
	}

	//자유게시판----------------------------------------------------------------------------
	@RequestMapping("/free/list")
	public ModelAndView freeList(Criteria cri, ModelAndView mnv)throws Exception {
		//System.out.println("controller");
		String url="board/free/list";
		String temp = "f";

		cri.setPerPageNum(15);

		Map<String, Object> dataMap = boardService.getBoardList(cri, temp, "no");
		//System.out.println(dataMap);
		mnv.addObject("dataMap", dataMap);
		mnv.setViewName(url);
		return mnv;
	}
	@RequestMapping("/free/registGo")
	public String freeRegistForm()throws Exception {
		String url="board/free/registForm";
		return url;
	}
	@RequestMapping(value="/free/freeRegist",method=RequestMethod.POST,produces="text/plain; charset=utf-8")
	public String freeRegist(BoardVO board, HttpServletRequest request, RedirectAttributes rttr)throws Exception {
		//System.out.println("regist");
		String url="redirect:/board/free/list.do";

		String savePath = this.fileUploadPath;
		List<AttachVO> attachList = GetAttachesByMultipartFileAdatpter.save(board.getUploadFile(), savePath);
		board.setAttachList(attachList);

		if(request.getParameter("fix")==null) {
			board.setFix("0");
		}

		//board.setEno(14310056);
		String name = board.getName();
		board.setBoardTitle((String)request.getAttribute("XSSboardTitle"));
		boardService.regist(board);
		rttr.addFlashAttribute("from", "regist");
		rttr.addAttribute("mCode", "M160000");
		return url;
	}
	@RequestMapping("/free/modifyGo")
	public ModelAndView freeModifyForm(String boardNo, ModelAndView mnv)throws Exception {
		//System.out.println("modifyForm");
		String url="board/free/modifyForm";

		BoardVO board = boardService.getBoard(boardNo);

		if(board != null) {
			List<AttachVO> attachList = board.getAttachList();
			if(attachList!=null) {
				for(AttachVO attach : attachList) {
					String fileName = attach.getFileName().split("\\$\\$")[1];
					attach.setFileName(fileName);
				}
			}
		}

		mnv.addObject("board", board);
		mnv.setViewName(url);
		return mnv;
	}
	@RequestMapping(value="/free/freeModify",method=RequestMethod.POST)
	public String freeModify(BoardVO board, HttpServletRequest request, RedirectAttributes rttr)throws Exception {
		String url="redirect:/board/free/detailGo.do";

		// 파일 삭제
		if (board.getDeleteFile() != null && board.getDeleteFile().length > 0) {
			for (String attachNo : board.getDeleteFile()) {
				AttachVO attach = boardService.getAttachByAttachNo(attachNo);

				File deleteFile = new File(attach.getUploadPath(), attach.getFileName());

				if (deleteFile.exists()) {
					deleteFile.delete();
				}
				boardService.removeAttachByAttachNo(attachNo);
			}
		}

		// 파일 저장
		List<AttachVO> attachList = GetAttachesByMultipartFileAdatpter.save(board.getUploadFile(),fileUploadPath);
		board.setAttachList(attachList);

		if(request.getParameter("fix")==null) {
			board.setFix("0");
		}

		board.setBoardTitle((String)request.getAttribute("XSSboardTitle"));
		boardService.modify(board);
		rttr.addFlashAttribute("from", "modify");
		rttr.addAttribute("boardNo", board.getBoardNo());
		rttr.addAttribute("mCode", "M160000");
		return url;
	}
	@RequestMapping("/free/detailGo")
	public ModelAndView freeDetail(String boardNo, ModelAndView mnv)throws Exception {
		String url="board/free/detail";
		//System.out.println("con");
		BoardVO board = boardService.getBoard(boardNo);

		if(board != null) {
			List<AttachVO> attachList = board.getAttachList();
			if(attachList!=null) {
				for(AttachVO attach : attachList) {
					String fileName = attach.getFileName().split("\\$\\$")[1];
					attach.setFileName(fileName);
				}
			}
		}

		mnv.addObject("board", board);
		mnv.setViewName(url);
		//System.out.println("cont end");
		return mnv;
	}

	@RequestMapping("/free/getFile")
	public String freeGgetFile(String attachNo,Model model) throws Exception {
		//System.out.println("getFile");
		String url="downloadFile";

		AttachVO attach = boardService.getAttachByAttachNo(attachNo);
		model.addAttribute("savedPath", attach.getUploadPath());
		model.addAttribute("fileName", attach.getFileName());

		return url;
	}

	@RequestMapping(value="/free/remove",method=RequestMethod.POST)
	public String freeRemove(String boardNo, RedirectAttributes rttr) throws Exception{
		//System.out.println("remove");
		String url = "redirect:/board/free/list.do";

		List<AttachVO> attachList = boardService.getBoard(boardNo).getAttachList();
		if (attachList != null) {
			for (AttachVO attach : attachList) {
				File target = new File(attach.getUploadPath(), attach.getFileName());
				if (target.exists()) {
					target.delete();
				}
			}
		}

		boardService.remove(boardNo);
		rttr.addAttribute("boardNo",boardNo);
		rttr.addFlashAttribute("from","remove");
		rttr.addAttribute("mCode", "M160000");
		return url;
	}

	//경조사게시판----------------------------------------------------------------------------
	@RequestMapping("/event/list")
	public ModelAndView eventList(Criteria cri, ModelAndView mnv)throws Exception {
		//System.out.println("controller");
		String url="board/event/list";
		String temp = "e";

		cri.setPerPageNum(15);

		Map<String, Object> dataMap = boardService.getBoardList(cri, temp, "no");
		mnv.addObject("dataMap", dataMap);
		mnv.setViewName(url);
		return mnv;
	}
	@RequestMapping("/event/registGo")
	public String eventRegistForm()throws Exception {
		String url="board/event/registForm";
		return url;
	}
	@RequestMapping(value="/event/eventRegist",method=RequestMethod.POST,produces="text/plain; charset=utf-8")
	public String eventRegist(BoardVO board, HttpServletRequest request, RedirectAttributes rttr)throws Exception {
		String url="redirect:/board/event/list.do";

		String savePath = this.fileUploadPath;
		List<AttachVO> attachList = GetAttachesByMultipartFileAdatpter.save(board.getUploadFile(), savePath);
		board.setAttachList(attachList);

		if(request.getParameter("fix")==null) {
			board.setFix("0");
		}

		String name = board.getName();
		board.setBoardTitle((String)request.getAttribute("XSSboardTitle"));
		boardService.regist(board);
		rttr.addFlashAttribute("from", "regist");
		rttr.addAttribute("mCode", "M160000");
		return url;
	}
	@RequestMapping("/event/modifyGo")
	public ModelAndView eventModifyForm(String boardNo, ModelAndView mnv)throws Exception {
		String url="board/event/modifyForm";

		BoardVO board = boardService.getBoard(boardNo);

		if(board != null) {
			List<AttachVO> attachList = board.getAttachList();
			if(attachList!=null) {
				for(AttachVO attach : attachList) {
					String fileName = attach.getFileName().split("\\$\\$")[1];
					attach.setFileName(fileName);
				}
			}
		}

		mnv.addObject("board", board);
		mnv.setViewName(url);
		return mnv;
	}
	@RequestMapping(value="/event/eventModify",method=RequestMethod.POST)
	public String eventModify(BoardVO board, HttpServletRequest request, RedirectAttributes rttr)throws Exception {
		String url="redirect:/board/event/detailGo.do";

		// 파일 삭제
		if (board.getDeleteFile() != null && board.getDeleteFile().length > 0) {
			for (String attachNo : board.getDeleteFile()) {
				AttachVO attach = boardService.getAttachByAttachNo(attachNo);

				File deleteFile = new File(attach.getUploadPath(), attach.getFileName());

				if (deleteFile.exists()) {
					deleteFile.delete();
				}
				boardService.removeAttachByAttachNo(attachNo);
			}
		}

		// 파일 저장
		List<AttachVO> attachList = GetAttachesByMultipartFileAdatpter.save(board.getUploadFile(),fileUploadPath);
		board.setAttachList(attachList);

		if(request.getParameter("fix")==null) {
			board.setFix("0");
		}

		board.setBoardTitle((String)request.getAttribute("XSSboardTitle"));
		boardService.modify(board);
		rttr.addFlashAttribute("from", "modify");
		rttr.addAttribute("boardNo", board.getBoardNo());
		rttr.addAttribute("mCode", "M160000");
		return url;
	}
	@RequestMapping("/event/detailGo")
	public ModelAndView eventDetail(String boardNo, ModelAndView mnv)throws Exception {
		String url="board/event/detail";

		BoardVO board = boardService.getBoard(boardNo);

		if(board != null) {
			List<AttachVO> attachList = board.getAttachList();
			if(attachList!=null) {
				for(AttachVO attach : attachList) {
					String fileName = attach.getFileName().split("\\$\\$")[1];
					attach.setFileName(fileName);
				}
			}
		}

		mnv.addObject("board", board);
		mnv.setViewName(url);
		return mnv;
	}
	@RequestMapping("/event/detail")
	public ModelAndView homeEventDetail(String boardNo, ModelAndView mnv)throws Exception {
		String url="board/event/detail";

		BoardVO board = boardService.getBoard(boardNo);

		if(board != null) {
			List<AttachVO> attachList = board.getAttachList();
			if(attachList!=null) {
				for(AttachVO attach : attachList) {
					String fileName = attach.getFileName().split("\\$\\$")[1];
					attach.setFileName(fileName);
				}
			}
		}

		mnv.addObject("board", board);
		mnv.setViewName(url);
		return mnv;
	}

	@RequestMapping("/event/getFile")
	public String eventGgetFile(String attachNo,Model model) throws Exception {
		//System.out.println("getFile");
		String url="downloadFile";

		AttachVO attach = boardService.getAttachByAttachNo(attachNo);
		model.addAttribute("savedPath", attach.getUploadPath());
		model.addAttribute("fileName", attach.getFileName());

		return url;
	}

	@RequestMapping(value="/event/remove",method=RequestMethod.POST)
	public String eventRemove(String boardNo, RedirectAttributes rttr) throws Exception{
		String url = "redirect:/board/event/list.do";

		List<AttachVO> attachList = boardService.getBoard(boardNo).getAttachList();
		if (attachList != null) {
			for (AttachVO attach : attachList) {
				File target = new File(attach.getUploadPath(), attach.getFileName());
				if (target.exists()) {
					target.delete();
				}
			}
		}

		boardService.remove(boardNo);
		rttr.addAttribute("boardNo",boardNo);
		rttr.addFlashAttribute("from","remove");
		rttr.addAttribute("mCode", "M160000");
		return url;
	}
}
