package kca.cbt.notice;

import ...;
import .....;

@Controller
public class UpdateNoticeController {
	@RequestMapping("/updateUser.do")
	public String updateUser(UserVO vo, UserDAO userDAO) {
		
		userDAO.updateUser(vo);
		return "getUserList.do";
	}

}
