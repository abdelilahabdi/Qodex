ERD du Module Quiz (Qodex)

Ce document présente le schéma relationnel (ERD) du module Quiz de la plateforme Qodex.

---

1. Objectif du module

Le module Quiz permet :

- aux enseignants de créer des quiz (titre, description, durée, catégorie) et d’ajouter des questions ;
- aux étudiants de passer les quiz ;
- au système d’enregistrer des résultats (score, date de passage) pour le suivi et le classement.

---

2. Tables (entités)

-Utilisateurs-
Stocke les utilisateurs (enseignant ou étudiant).

- id_utilisateur (PK)
- nom
- email (UNIQUE)
- motdepasse (à stocker sous forme de hash : password_hash )
- role _(enseignant | etudiant)_

-CATEGORIES-
Stocke les catégories de quiz.

- id_categorie (PK)
- nom_categorie

  -QUIZ-
  Stocke les quiz créés par les enseignants.

- id_quiz (PK)
- titre_quiz
- description
- id_categorie (FK → CATEGORIES.id_categorie)
- id_enseignant (FK → USERS.id_utilisateur )
- duree_minutes

-QUESTIONS-
Stocke les questions d’un quiz.

- id_question (PK)
- texte_question
- reponse_correcte
- points
- id_quiz (FK : QUIZ.id_quiz)

-RESULTATS-
Stocke les résultats des étudiants après un quiz.

- id_resultat (PK)
- score
- date_passage
- id_etudiant (FK : USERS.id_utilisateur)
- id_quiz (FK : QUIZ.id_quiz )

---

3. Relations (cardinalités)

- Une catégorie contient plusieurs quiz (1 → N).
- Un enseignant crée plusieurs quiz (1 → N).
- Un quiz contient plusieurs questions (1 → N).
- Un étudiant peut avoir plusieurs résultats (1 → N).
- Un quiz peut avoir plusieurs résultats (1 → N).

---

4. Contraintes importantes

- USERS.email doit être unique .
- Les clés étrangères (FK) assurent l’intégrité entre :
  - QUIZ et CATEGORIES
  - QUIZ et USERS (enseignant)
  - QUESTIONS et QUIZ
  - RESULTATS et USERS (étudiant)
  - RESULTATS et QUIZ

---

5.  Sécurité

- Ne jamais stocker le mot de passe en clair.
- Stocker uniquement un hash (ex: bcrypt/argon2) dans un champ type -password_hash-.
- Contrôler les accès selon le role :
  - enseignant : gérer quiz + questions
  - étudiant : passer quiz + consulter ses résultats
