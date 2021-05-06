package com.kh.food.customer.member.model.service;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.kh.food.admin.notice.model.vo.MemberNotice;
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

public interface MemberService {
	
	// 리뷰 삭제
	int deleteReview(int no);
	Map<String, Object> selectReviewView(int no);
	List<Map<String, Object>> selectReview(String memberId);
	Map<String, Object> selectReviewCon(int payNum);
	List<Map<String, String>> selectMemberQnaAttach(int no);	
	//회원 문의
	int addQna(Map<String,Object> map, List<MemberQnaAttachment> files);
	//상세 주문내역
	List<Map<String, String>> orderOne(Map<String,String> orList);
	//고객 문의 수정
	int updateMemberQna(MemberQna mq,List<MemberQnaAttachment> files,int qnaCode);
	//고객 문의 삭제
	int deleteMemberQna(int no);
	//고객 문의상세내용
	MemberQna memberDetailQna(int no);
	//고객 문의 보기
	List<MemberQna> selectmemberQna(String memberId);
	//회원가입
	int memberEnroll(Member m);
	//주문내역
	List<Member> selectMemberOrder(int memberNum,int cPage,int numPerPage);
	//주문내역 페이징 카운트
	int selectOrderCount(int memberNum);
	int checkId(String memberId);
	Map<String,Object> login(Map<String,String> map);
	int checkNick(String nickName);
	Member selectMember(String memberId);
	int update(Member m);
	List<Store> selectStore(Map<String,Object> map);
	int drop(String memberId);
	List<Store> menuInfo(int businessCode);
	List<Map<String,String>> selectCategoryList(int businessCode);
//	List<Map<String,String>> selectMenuList(int menuCategoryCode,int businessCode);
	int insertWishList(Map<String,Object> menuMap);
	List<WishList> selectWishList(Map<String,Object> maps);
	List<LinkedHashMap<String,String>> bigyoMenuCode(Map<String,Object> maps);
//	int plusMenuCount(Map<String,Object> upCount);
//	int minusMenuCount(Map<String,Object> upCount);
//	int menuCounts(int menuCode);
	int deleteMenuCount(int menuCode);
	List<WishList> plusPrice(Map<String,Object> maps);
	Store minPrice(int businessCode);
	List<WishList> selectSame(Map<String,Object> menuMap);
	int deleteMenuCode(int reMenuCode);
	List<Menu> popularityMenu(int businessCode);
	List<Menu> refreshWishList(Map<String,Object> maps);
	int deleteWishList(Map<String,Object> maps);
	Store storeList(int businessCode);
	int backWish(String memberId);
	Map<String,String>selectSearchId(Map<String,String> map); //아이디찾기
	Map<String,String>selectConfirmEmail(Map<String,String>map);
	int updatePw(Map<String, String> map);
	int reviewAvg(int businessCode);
	List<Map<String,String>> selectMenuList(int menuCategoryCode,int businessCode);
	Menu menuSelect(int menuCode);
	int kakaoEnrollEnd(Member m);
	String storeP(int businessCode);
	List<OwnerReview> selectOwnerRevie(int businessCode);
	int reviewCount(int businessCode);
	int ownerReviewCount(int businessCode);
	MemberQnaReview selectMemberQnaReview(int no);
	int menuCount(Map<String,Object> maps);
	
	// 회원 공지사항
	List<MemberNotice> selectMemberNotice(int cPage,int numPerPage);
	// 찜 목록
	List<Store> selectMarkList(String memberId);
	List<Review> selectReview(int businessCode);
	Mark isMark(Map<String, Object> maps);

	int insertReview(Map map);
	List<Map<String, String>> selectMemberOrderList(int memberNum, int cPage, int numPerPage);
	int selectMemberOrderCount(int memberNum);
	int updateOrderState(String payOrderNum);
	//이메일중복
	int checkEmail(String memberEmail);

}
