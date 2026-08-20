package org.mql.freelance;

import org.mql.freelance.models.Freelancer;
import org.mql.freelance.models.Mission;
import org.mql.freelance.models.Skill;

/**
 * Fabrique de données de test partagées entre toutes les classes de test.
 * Tous les objets retournés sont des instances fraîches (pas de état partagé).
 */
public class TestDataFactory {

    public static Skill buildSkill(String name, String category) {
        Skill s = new Skill();
        s.setName(name);
        s.setCategory(category);
        return s;
    }

    public static Freelancer buildFreelancer(String name, String email,
                                              String specialty, double dailyRate) {
        Freelancer f = new Freelancer();
        f.setName(name);
        f.setEmail(email);
        f.setSpecialty(specialty);
        f.setDailyRate(dailyRate);
        return f;
    }

    public static Mission buildMission(String title, String client,
                                        double budget, String status) {
        Mission m = new Mission();
        m.setTitle(title);
        m.setClient(client);
        m.setBudget(budget);
        m.setStatus(status);
        return m;
    }

    // ── Objets prêts à l'emploi (fixtures) ──────────────────
    public static Freelancer aliBenali() {
        return buildFreelancer("Ali Benali", "ali@test.ma", "Backend Java", 650.0);
    }

    public static Freelancer saraMoussaoui() {
        return buildFreelancer("Sara Moussaoui", "sara@test.ma", "Frontend React", 580.0);
    }

    public static Skill springBootSkill() {
        return buildSkill("Spring Boot", "Backend");
    }

    public static Mission openMission() {
        return buildMission("API REST e-commerce", "RetailMa", 8500.0, "OPEN");
    }
}