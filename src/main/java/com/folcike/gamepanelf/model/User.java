package com.folcike.gamepanelf.model;

import lombok.*;

import javax.persistence.*;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Getter
@Setter
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    private String username;

    private String email;

    private String role;

    private String password;

    public String getUsername() {
        return username;
    }
}
