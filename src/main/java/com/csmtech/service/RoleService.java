package com.csmtech.service;

import java.util.List;

import com.csmtech.model.Role;

public interface RoleService {

	Role findById(int roleid);

	List<Role> findAllRole();

}
