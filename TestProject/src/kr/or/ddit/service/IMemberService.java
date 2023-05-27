package kr.or.ddit.service;

import kr.or.ddit.vo.MemberVO;

public interface IMemberService {
	
	/**
	 * 회원가입 처리
	 * @param memberVO
	 * @return
	 */
	public int insertMember(MemberVO memberVO);
	
	/**
	 * 로그인 확인
	 * @param memberVO
	 * @return
	 */
	public MemberVO selectMember(MemberVO memberVO);
}
