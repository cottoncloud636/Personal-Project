package com.xianzhou.stocksales.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xianzhou.stocksales.models.Listing;
import com.xianzhou.stocksales.repositories.ListRepository;

@Service
public class ListService {
	@Autowired
	private ListRepository listRepo;
	
	public Listing findById(Long id) {
		Optional <Listing> search = listRepo.findById(id);
		if (search.isPresent()) {
			return search.get();
		}
		return null;
	}
	
	/********* crud ********/
	public List <Listing> all(){
		return listRepo.findAll();
	}
	
	public Listing create (Listing list) {
		return listRepo.save(list);
	}
	
	public Listing update (Listing list) {
		return listRepo.save(list);
	}
	
	public void delete (Long id) {
		listRepo.deleteById(id);;
	}
	/********* end of crud ********/

}


