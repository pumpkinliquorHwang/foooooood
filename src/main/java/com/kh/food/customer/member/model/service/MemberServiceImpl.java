package com.kh.food.customer.member.model.service;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.kh.food.admin.notice.model.vo.MemberNotice;
import com.kh.food.customer.member.model.dao.MemberDao;
import com.kh.food.customer.member.model.vo.Member;
import com.kh.food.customer.member.model.vo.WishList;
import com.kh.food.mark.model.vo.Mark;
import com.kh.food.owner.menu.model.vo.Menu;
import com.kh.food.owner.onevsone.model.vo.OwnerQnaAttachment;
import com.kh.food.owner.order.model.vo.Pay;
import com.kh.food.owner.review.model.vo.OwnerReview;
import com.kh.food.owner.store.model.vo.Store;
import com.kh.food.qna.model.vo.MemberQna;
import com.kh.food.qna.model.vo.MemberQnaAttachment;
import com.kh.food.qna.model.vo.MemberQnaReview;
import com.kh.food.review.model.vo.Review;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberDao dao;
	
	
	
	@Override
	public int deleteReview(int no) {
		return dao.deleteReview(no);
	}

	@Override
	public Map<String, Object> selectReviewView(int no) {
		return dao.selectReviewView(no);
	}

	@Override
	public List<Map<String, Object>> selectReview(String memberId) {
		return dao.selectReview(memberId);
	}

	@Override
	public Map<String, Object> selectReviewCon(int payNum) {
		return dao.selectReviewCon(payNum);
	}

	// 회원 문의 첨부 파일
	@Override
	public List<Map<String, String>> selectMemberQnaAttach(int no) {
		return dao.selectMemberQnaAttach(no);
	}
	
	@Override
	public int reviewCount(int businessCode) {
		
		return dao.reviewCount(businessCode);
	}

	@Override
	public int ownerReviewCount(int businessCode) {
		
		return dao.ownerReviewCount(businessCode);
	}

	@Override
	public Store storeList(int businessCode) {
		
		return dao.storeList(businessCode);
	}

	@Override
	public String storeP(int businessCode) {
	
		return dao.storeP(businessCode);
	}

	@Override
	public int menuCount(Map<String, Object> maps) {
		return dao.menuCount(maps);
	}

	@Override
	public int reviewAvg(int businessCode) {
		
		return dao.reviewAvg(businessCode);
	}

	@Override
	public int insertReview(Map map) {
		
		return dao.insertReview(map);
	}

	@Override
	public 	int addQna(Map<String,Object> map, List<MemberQnaAttachment> files) {
		int result = 0;
		
		try {
			result=dao.addQna(map);
			if(result==0) {
				throw new Exception();
			}
			for(MemberQnaAttachment a : files) {
				a.setQnaCode(Integer.parseInt((String) map.get("qnaCode")));
				result=dao.addAttach(a);
				if(result==0) {
					throw new Exception("업로드 실패");
				}
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return result;
	}
	
	@Override
	public List<Review> selectReview(int businessCode) {
		
		return dao.selectReview(businessCode);
	}
	@Override
	public List<Map<String, String>> orderOne(Map<String,String> orList) {
		return dao.orderOne(orList);
	}
	@Override
	public int selectOrderCount(int memberNum) {
		return dao.selectOrderCount(memberNum);
	}
	@Override
	public List<Member> selectMemberOrder(int memberNum,int cPage,int numPerPage) {
		return dao.selectMemberOrder(memberNum,cPage,numPerPage);
	}
	
	@Override
	public int updateMemberQna(MemberQna mq,List<MemberQnaAttachment> files,int qnaCode) {
		int result = 0;
		
		try {
			result=dao.updateMemberQna(mq);
			if(result==0) {
				throw new Exception();
			}
			for(MemberQnaAttachment a : files) {
				a.setQnaCode(mq.getQnaCode());
				Map<String,Object> map= new HashMap();
				map.put("originalFileName",a.getOriginalFileName());
				map.put("qnacode",qnaCode);
				result=dao.updateAttach(map);
				if(result==0) {
					throw new Exception("수정 실패");
				}
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return result;
	}
	@Override
	public int backWish(String memberId) {
		return dao.backWish(memberId);
	}

	@Override
	public int deleteMemberQna(int no) {
		return dao.deleteMemberQna(no);
	}
	@Override
	public MemberQna memberDetailQna(int no) {
		return dao.memberDetailQna(no);
	}
	@Override
	public List<MemberQna> selectmemberQna(String memberId){
		return dao.selectmemberQna(memberId);
	}


	@Override
	public List<Menu> popularityMenu(int businessCode) {
		return dao.popularityMenu(businessCode);
	}
	@Override
	public int deleteMenuCode(int reMenuCode) {
		return dao.deleteMenuCode(reMenuCode);
	}
	@Override
	public List<WishList> selectSame(Map<String, Object> menuMap) {
		return dao.selectSame(menuMap);
	}


	@Override
	public List<Menu> refreshWishList(Map<String, Object> maps) {
		return dao.refreshWishList(maps);
	}


	@Override
	public int deleteWishList(Map<String, Object> maps) {
		return dao.deleteWishList(maps);
	}


	@Inject
	private JavaMailSender mailSender;

	

	
	@Override
	public List<Store> menuInfo(int businessCode) {
		return dao.menuInfo(businessCode);
	}
	
	@Override
	public int drop(String memberId) {
		return dao.drop(memberId);
	}

	
	
	@Override
	public List<Store> selectStore(Map<String,Object> map){
		return dao.selectStore(map);
	}
	
	@Override
	public Member selectMember(String memberId) {
		// TODO Auto-generated method stub
		return dao.selectMember(memberId);
	}
	
	@Override
	public int memberEnroll(Member m) {
		System.out.println("서비스"+m);
		return dao.memberEnroll(m);
	}
	
	@Override
	public int checkId(String memberId) {
		return dao.checkId(memberId);
	}
	
	@Override
	public int checkNick(String nickName) {
		return dao.checkNick(nickName);
	}
	
	

	@Override
	public int checkEmail(String memberEmail) {
		// TODO Auto-generated method stub
		return dao.checkEmail(memberEmail);
	}

	@Override
	public Map<String,Object> login(Map<String,String> map){
		return dao.login(map);
	}
	@Override
	public int update(Member m) {
		return dao.update(m);
	}

	@Override
	public List<Map<String,String>> selectCategoryList(int businessCode) {
		return dao.selectCategoryList(businessCode);
	}

	@Override
	public int insertWishList(Map<String, Object> menuMap) {
		return dao.insertWishList(menuMap);
	}
	
	@Override
	public List<WishList> selectWishList(Map<String, Object> maps) {
		return dao.selectWishList(maps);
	}
	
@Override
	public List<LinkedHashMap<String,String>> bigyoMenuCode(Map<String, Object> maps) {
		return dao.bigyoMenuCode(maps);
	}
	@Override
public Store minPrice(int businessCode) {
	return dao.minPrice(businessCode);
}
	//	@Override
//	public int plusMenuCount(Map<String,Object> upCount) {
//		return dao.plusMenuCount(upCount);
//	}
//	
//	@Override
//	public int minusMenuCount(Map<String, Object> upCount) {
//		return dao.minusMenuCount(upCount);
//	}
//	
//	@Override
//	public int menuCounts(int menuCode) {
//		return dao.menuCounts(menuCode);
//	}
	@Override
	public int deleteMenuCount(int menuCode) {
		return dao.deleteMenuCount(menuCode);
	}
	@Override
	public List<WishList> plusPrice(Map<String, Object> maps) {
		return dao.plusPrice(maps);
	}
	//아이디찾기
	@Override
	public Map<String, String> selectSearchId(Map<String, String> map) {
		// TODO Auto-generated method stub
		return dao.selectSearchId(map);
	}
	
	//비밀번호찾기
	@Override
	public Map<String, String> selectConfirmEmail(Map<String, String> map) {
		// TODO Auto-generated method stub
		return dao.selectConfirmEmail(map);
	}

	@Override
	public int updatePw(Map<String, String> map) {
		// TODO Auto-generated method stub
		return dao.updatePw(map);
	}
	

	@Override
	public List<Map<String, String>> selectMenuList(int menuCategoryCode,int businessCode) {
		return dao.selectMenuList(menuCategoryCode, businessCode);
	}


	@Override
	public Menu menuSelect(int menuCode) {
		return dao.menuSelect(menuCode);
	}

	@Override
	public int kakaoEnrollEnd(Member m) {
		return dao.kakaoEnrollEnd(m);
	}
	
	
	// 회원 공지사항
	@Override
	public List<MemberNotice> selectMemberNotice(int cPage,int numPerPage) {
		return dao.selectMemberNotice(cPage, numPerPage);
	}
	// 찜목록
	@Override
	public List<Store> selectMarkList(String memberId) {
		return dao.selectMarkList(memberId);
	}

	// 찜 했는지 안했는지 확인
	@Override
	public Mark isMark(Map<String, Object> maps) {
		return dao.isMark(maps);
	}

	@Override
	public List<OwnerReview> selectOwnerRevie(int businessCode) {
		
		return dao.selectOwnerRevie(businessCode);
	}

	@Override
	public MemberQnaReview selectMemberQnaReview(int no) {
		return dao.selectMemberQnaReview(no);
	}

	@Override
	public List<Map<String, String>> selectMemberOrderList(int memberNum, int cPage, int numPerPage) {
		return dao.selectMemberOrderList(memberNum,cPage,numPerPage);
	}

	@Override
	public int selectMemberOrderCount(int memberNum) {
		return dao.selectMemberOrderCount(memberNum);
	}

	@Override
	public int updateOrderState(String payOrderNum) {
		return dao.updateOrderState(payOrderNum);
	}
	
	

}
