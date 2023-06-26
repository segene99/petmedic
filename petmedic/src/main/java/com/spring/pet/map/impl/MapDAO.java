package com.spring.pet.map.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.pet.map.MapVO;

@Repository
public class MapDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	//지도검색
	public List<MapVO> getMapData(MapVO vo) {
		return mybatis.selectList("mapDAO.getMapData", vo);
	}
}
