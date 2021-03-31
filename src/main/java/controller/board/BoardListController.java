package controller.board;//package controller.board ;
//
//import java.util.List;
//
//import javax.servlet.http.HttpServletRequest;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.beans.factory.annotation.Qualifier;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.GetMapping; 
//import org.springframework.web.servlet.ModelAndView;
//
//import bean.Board;
//import controller.common.SuperClass;
//import dao.BoardDao;
//import utility.FlowParameters;
//import utility.Paging;
//
//@Controller
//public class BoardListController extends SuperClass{
//	private final String command = "/list.bo" ; 
//	private ModelAndView mav = null ;
//	private String redirect = "redirect:/list.bo" ;
//	
//	@Autowired
//	@Qualifier("bdao")
//	private BoardDao dao ;
//	
//	public BoardListController() {
//		// getpage, postpage
//		super("boList", "boList");
//		this.mav = new ModelAndView();
//	}
//	
//	@GetMapping(command)
//	public ModelAndView doGet(
//			HttpServletRequest request,
//			FlowParameters param){
//		
//		// 페이징과 필드 검색을 위한 파라미터를 우선 챙깁니다.		
//		// 파라미터 확인을 위한 출력
//		System.out.println(this.getClass() + " : " + param.toString());
//		
//		int totalCount 
//		= dao.SelectTotalCount(
//				param.getMode(), 
//				param.getKeyword());
//	
//		System.out.println("totalCount : " + totalCount );
//		
//		String contextpath = request.getContextPath() + "/" ;
//		String myurl = contextpath +  this.command ;
//		
//		Paging pageInfo 
//			= new Paging(
//					param.getPageNumber(), 
//					param.getPageSize(), 
//					totalCount, 
//					myurl, 
//					param.getMode(), 
//					param.getKeyword());
//		
//		List<Board> lists = dao.SelectDataList(
//				pageInfo.getOffset(),
//				pageInfo.getLimit(),
//				param.getMode(), 
//				param.getKeyword()) ;
//				// "%" 문자열은 like 연산자 때문에 넣었습니다.
//		
//		// 바인딩해야 할 목록들
//		mav.addObject("lists", lists); // 게시물 목록
//		
//		// 페이징 관련 항목들
//		mav.addObject("pagingHtml", pageInfo.getPagingHtml());
//		mav.addObject("pagingStatus", pageInfo.getPagingStatus());
//		
//		// 검색 필드의 상태 값 저장을 위한 항목들  
//		mav.addObject("mode", param.getMode());
//		mav.addObject("keyword", param.getKeyword());
//		
//		// 상세 보기, 수정, 삭제, 답글 등의 링크에 사용될 parameter list 문자열
//		mav.addObject("parameters", param.toString());		
//			
//		this.mav.setViewName(super.postpage);
//		return this.mav ;
//	}	
//}