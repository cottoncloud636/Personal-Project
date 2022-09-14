package com.xianzhou.stocksales.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.xianzhou.stocksales.models.Listing;

@Repository
public interface ListRepository extends CrudRepository <Listing, Long>{
	List <Listing> findAll();
}
