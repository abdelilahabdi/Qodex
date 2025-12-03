README — Module Quiz (Qodex) | Base de données relationnelle

Qodex est une plateforme web dédiée à l’organisation et à la participation aux hackathons.
Ce projet a pour objectif la conception et la mise en place d’une base de données relationnelle robuste pour le module Quiz.

1) Objectif du module

 Le module Quiz permet :

    Aux enseignants : créer et gérer des quiz (catégorie, durée, questions, points)

    Aux étudiants : passer des quiz

    Au système : générer des résultats (score, date de passage) pour le suivi et le classement





  Contraintes clés : 
      Intégrité des données

      Performance (requêtes rapides, indexation)

      Sécurité (accès + protection des données)

      Évolutivité (support de nombreux quiz/utilisateurs)



2) Modèle relationnel (vision simple)
   Entités principales

     utilisateurs : id, nom, email (unique), password_hash, role (enseignant | étudiant)

     categories   :  id_categorie et nom_categorie (Mathématiques, Histoire, Informatique, etc.)

     quiz : id_quiz , titre , decription , id_ctegorie , id_enseignant , duree_minutes 


     questions : id_question , texte_question , reponse_correcte , points , id_quiz


     resultats : id_resultat , score , date_passage , id_etudiant , id_quiz


 

3) Relations

    Un enseignant cree plusieurs quizzes

    Un quiz appartient à une catégorie

    Un quiz contient plusieurs questions

    Un étudiant passe plusieurs quiz et obtient des résultats

4) Sécurité (accès + données sensibles)

   Les mots de passe ne doivent jamais être stockés en clair.

   Stockage autorisé : uniquement password_hash # Qodex
