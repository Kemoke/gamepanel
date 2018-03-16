package com.folcike.gamepanelf.repository;

import com.folcike.gamepanelf.model.User;
import org.springframework.data.repository.CrudRepository;

public interface UserRepository extends CrudRepository<User, Long> {
    User findByEmail(String email);
}
