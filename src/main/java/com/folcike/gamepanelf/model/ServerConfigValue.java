package com.folcike.gamepanelf.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Table(indexes = {@Index(columnList = "server_config_field_id,server_id", unique = true)})
public class ServerConfigValue {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String value;

    private Long server_id;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "server_config_field_id")
    private ServerConfigField configField;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "server_id", insertable = false, updatable = false)
    private Server server;
}
