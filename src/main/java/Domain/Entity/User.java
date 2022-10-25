package Domain.Entity;

import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import java.sql.Blob;
import java.time.LocalDate;

@Entity
@Table(name = "User")
@Getter
@Setter
@Builder
@AllArgsConstructor
@JsonIdentityInfo(generator = ObjectIdGenerators.PropertyGenerator.class, property = "id")
public class User {
    @Id
    @Column(name = "id")
    @GeneratedValue( strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "firstName")
    private String firstName;

    @Column(name = "lastName")
    private String lastName;

    @Column(name = "E-mail", unique = true)
    private String email;

    @Column(name = "Password")
    private String password;

    @Column(name = "contactNumber")
    private String contactNumber;

    @Column(name = "Image")
    private Blob image;

    @Column(name = "CV")
    private Blob cv;

    @Column(name = "dateOfBirth")
    private LocalDate dateOfBirth;

    @Column(name = "role")
    private UserRole role;


    public User() {
    }


}
