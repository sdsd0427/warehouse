package kr.or.warehouse.security;

import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UserDetails;

import kr.or.warehouse.controller.advisor.InvalidPasswordException;
import kr.or.warehouse.controller.advisor.NotFoundIdException;
import kr.or.warehouse.dto.EmployeeVO;
import kr.or.warehouse.service.EmployeeService;

public class CustomAuthenticationProvider implements AuthenticationProvider{

	private EmployeeService employeeService;
	public void setEmployeeService(EmployeeService employeeService) {
		this.employeeService = employeeService;
	}

	@Override
	public Authentication authenticate(Authentication auth) throws AuthenticationException {
		String login_eno = (String) auth.getPrincipal(); // 로그인 시도한 ID를 가져온다
		String login_pwd = (String) auth.getCredentials(); // 로그인 시도한 Password를 가져온다.
//		System.out.println(login_eno);
//		System.out.println(Integer.parseInt(login_eno));
//		System.out.println(employeeService);

		try {
			employeeService.login(Integer.parseInt(login_eno), login_pwd);
			EmployeeVO employee = employeeService.getEmployee(Integer.parseInt(login_eno));

			UserDetails authUser = new User(employee);
			boolean invalidCheck = authUser.isAccountNonExpired()
					&& authUser.isAccountNonLocked()
					&& authUser.isCredentialsNonExpired()
					&& authUser.isEnabled();

			if (invalidCheck) {
				// 스프링 시큐리티 내부 클래스로 인증 토큰 생성한다.
				UsernamePasswordAuthenticationToken result
							= new UsernamePasswordAuthenticationToken(
						authUser.getUsername(), authUser.getPassword(),
						authUser.getAuthorities());
				// 전달할 내용을 설정한 후 리턴한다. successHandler로 전송된다.
				result.setDetails(authUser);
				
				return result;
			}
			throw new BadCredentialsException("상태변경으로 로그인이 불가합니다.");
		} catch (NotFoundIdException e) { // id 불일치
			throw new BadCredentialsException("존재하지 않는 사번입니다.");
		} catch (InvalidPasswordException e) { // pwd 불일치
			throw new BadCredentialsException("비밀번호가 일치하지 않습니다.");
		} catch (Exception e) { // 에러
			e.printStackTrace();
			throw new BadCredentialsException("서버 장애로 서비스가 불가합니다.");
		}
	}

	@Override
	public boolean supports(Class<?> auth) {
		return auth.equals(UsernamePasswordAuthenticationToken.class);
	}

}
