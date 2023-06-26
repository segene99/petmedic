package com.spring.pet.map.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.pet.hospital.impl.HospitalDAO;
import com.spring.pet.map.MapService;
import com.spring.pet.map.MapVO;

@Service
public class MapServiceImpl implements MapService {

	@Autowired
	private MapDAO mapDAO;
	
	@Override
	public List<MapVO> getMapData(MapVO vo) {
		return mapDAO.getMapData(vo);
	}

}
