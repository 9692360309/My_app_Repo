package com.csmtech.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.csmtech.model.Role;
import com.csmtech.repository.RoleRepository;

@Service
public class RoleServiceImpl implements RoleService{

	@Autowired
	private RoleRepository roleRepo;
	
	@Override
	public Role findById(int roleid) {
		
		return roleRepo.findById(roleid).get();
	}

	@Override
	public List<Role> findAllRole() {
		
		return roleRepo.findAll();
	}

}
