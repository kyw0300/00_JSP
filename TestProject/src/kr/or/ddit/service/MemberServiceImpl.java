package kr.or.ddit.service;

import kr.or.ddit.dao.IMemberDao;
import kr.or.ddit.dao.MemberDaoImpl;
import kr.or.ddit.vo.MemberVO;

public class MemberServiceImpl implements IMemberService {
	private IMemberDao dao;
	private static IMemberService instance;
	
	private MemberServiceImpl() {
		dao = MemberDaoImpl.getInstance();
	}
	
	public static IMemberService getInstance() {
		if(instance == null) instance = new MemberServiceImpl();
		return instance;
	}
	
	@Override
	public int insertMember(MemberVO memberVO) {
		return dao.insertMember(memberVO);
	}

	@Override
	public MemberVO selectMember(MemberVO memberVO) {
		return dao.selectMember(memberVO);
	}

}
