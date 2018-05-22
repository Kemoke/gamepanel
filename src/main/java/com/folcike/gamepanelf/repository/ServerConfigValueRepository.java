package com.folcike.gamepanelf.repository;

import com.folcike.gamepanelf.model.ServerConfigValue;
import org.springframework.data.repository.CrudRepository;

public interface ServerConfigValueRepository extends CrudRepository<ServerConfigValue, Long> {
    ServerConfigValue findByServer_IdAndConfigField_Field(Long id, String field);
}
