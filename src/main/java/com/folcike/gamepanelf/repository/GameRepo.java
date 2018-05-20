package com.folcike.gamepanelf.repository;

import com.folcike.gamepanelf.model.Game;
import org.springframework.data.repository.CrudRepository;

public interface GameRepo extends CrudRepository<Game, Long> {
}
