package com.folcike.gamepanelf.model;

import lombok.*;
import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Machine {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;

    private String username;

    private String hostname;

    private String password;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id")
    private User user;

    @OneToMany(
            mappedBy = "machine",
            cascade = CascadeType.ALL,
            orphanRemoval = true
    )
    private List<Server> servers = new ArrayList<>();

    public void insertMachine() throws ClassNotFoundException, SQLException{
        Class.forName("com.mysql.jdbc.Driver");
        try(java.sql.Connection conn = DriverManager.getConnection("dbc:mysql://localhost:3306/gamepanel", "root", "")){
            Statement st = conn.createStatement();
            st.execute("insert into machine (name, username, hostname, password) values ('" + this.name + "','" +this.username +"','" + this.hostname + "','" + this.password+ "')");
        }catch(SQLException e){
            System.out.println(e.getMessage());
        }
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getHostname() {
        return hostname;
    }

    public void setHostname(String hostname) {
        this.hostname = hostname;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
