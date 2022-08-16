package kr.or.warehouse.security;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import kr.or.warehouse.dto.EmployeeVO;

public class User implements UserDetails{
	private EmployeeVO employee;
	public User(EmployeeVO employee) {
		this.employee = employee;
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		List<GrantedAuthority> roles = new ArrayList<GrantedAuthority>();
		List<String> anames = employee.getAname();
		System.out.println("anames : " + anames);
		for(String aname : anames) {
			roles.add(new SimpleGrantedAuthority(aname));
		}
		return roles;
	}

	@Override
	public String getPassword() {
		return employee.getPwd();
	}

	@Override
	public String getUsername() {
		return employee.getEno()+"";
	}

	@Override
	public boolean isAccountNonExpired() { //계정의 만료 여부 (true:만료안됨)
		return true;
	}

	@Override
	public boolean isAccountNonLocked() { //계정의 잠김 여부
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() { //비밀번호 만료 여부
		return true;
	}

	@Override
	public boolean isEnabled() { //퇴사여부(퇴사:enabled=0,휴직:enabled=2)
		return employee.getEnabled()==1;
	}
	
	public EmployeeVO getEmployee() {
		return this.employee;
	}

}
