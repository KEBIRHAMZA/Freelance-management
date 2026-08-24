package org.mql.freelance.repositories;

import java.util.List;
import java.util.Optional;

import org.mql.freelance.models.Freelancer;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface FreelancerRepository extends JpaRepository<Freelancer, Integer> {

    List<Freelancer> findBySpecialty(String specialty);

    Optional<Freelancer> findByEmail(String email);

    List<Freelancer> findByDailyRateLessThanEqual(double maxRate);

    @Query("SELECT f FROM Freelancer f WHERE f.name LIKE %:keyword%")
    List<Freelancer> findByKeyword(String keyword);

    @Query("SELECT f FROM Freelancer f JOIN f.skills s WHERE s.name = :skillName")
    List<Freelancer> findBySkillName(String skillName);
    
}