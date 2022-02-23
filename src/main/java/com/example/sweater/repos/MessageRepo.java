package com.example.sweater.repos;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import com.example.sweater.domain.Message;

public interface MessageRepo extends CrudRepository<Message, Integer> {

	List<Message> findByTag(String tag);
}
