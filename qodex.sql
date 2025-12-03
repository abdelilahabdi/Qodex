



USE qodex;
GO

DROP TABLE IF EXISTS Resultats;
DROP TABLE IF EXISTS Questions;
DROP TABLE IF EXISTS Quiz;
DROP TABLE IF EXISTS Categories;
DROP TABLE IF EXISTS Utilisateurs;



GO


create table Utilisateurs ( 
id_utilisateur INT identity (1,1) primary key , 
nom varchar (100) not null ,
email varchar (150) not null unique ,


motdepasse varbinary (32) not null,
role varchar (20) not null check (role in ('enseignant' , 'etudiant')) 

 
);



create table Categories (
id_categorie int identity (1,1) primary key ,
nom_categorie varchar(100) not null 
);



create table Quiz (
id_quiz int identity (1,1) primary key ,
titre_quiz varchar (150) not null ,
description varchar(max) ,
duree_minutes int not null ,
id_categorie int not null ,
id_enseignant int not null ,

constraint fk_quiz_Categories foreign key (id_categorie) references Categories (id_categorie),
constraint FK_Quiz_Utilisateurs foreign key (id_enseignant) references Utilisateurs (id_utilisateur),

constraint ck_quiz_duree check (duree_minutes > 0 )
);


create table Questions ( 
id_question int identity (1,1) primary key ,
texte_question varchar(max) not null ,
reponse_correcte varchar (150) not null ,
points int not null ,
id_quiz int not null ,
constraint fk_questions_quiz foreign key (id_quiz) references quiz(id_quiz),
constraint ck_questions_points check ( points > 0 )
);


create table Resultats (
   id_resultat int identity (1,1) primary key ,
   score int not null ,
   date_passage date not null ,
   id_etudiant int not null ,
   id_quiz int not null ,

   constraint fk_resultats_Utilisateurs foreign key (id_etudiant) references Utilisateurs (id_utilisateur),
   constraint fk_resultats_quiz foreign key (id_quiz) references Quiz (id_quiz) ,

   constraint ck_resultats_score check (score between 0 and 100)
   );





   

   


   create index ix_quiz_id_categorie on Quiz(id_categorie);
   create index ix_quiz_id_enseignant on Quiz(id_enseignant);
   create index ix_questions_id_quiz on Questions(id_quiz);
   create index ix_resultats_id_etudiant on Resultats(id_etudiant);
   create index ix_resultats_id_quiz on Resultats(id_quiz);
   create index ix_resultats_score on Resultats(score);








   insert into Utilisateurs (nom, email, motdepasse, role) values
   ('ahmed prof' , 'ahmed.prof@example.com' , HASHBYTES ('SHA2_256' , 'pass123') , 'enseignant'),
   ('sara prof' , 'sara.prof@example.com' , HASHBYTES ('SHA2_256' , 'pass123') , 'enseignant'),
   ('samir prof' , 'samir.prof@example.com' , HASHBYTES ('SHA2_256' , 'pass123') , 'enseignant'),
   ('alae prof' , 'alae.prof@example.com' , HASHBYTES ('SHA2_256' , 'pass123') , 'enseignant'),
   ('ossama prof' , 'ossama.prof@example.com' , HASHBYTES ('SHA2_256' , 'pass123') , 'enseignant'),

   ('yassine' , 'yassine@student.com' , HASHBYTES ('SHA2_256' , 'pass123') , 'etudiant'),
   ('hanae' , 'hanae@student.com' , HASHBYTES ('SHA2_256' , 'pass123') , 'etudiant'),
   ('adil' , 'adil@student.com' , HASHBYTES ('SHA2_256' , 'pass123') , 'etudiant'),
   ('mohammed' , 'mohammed@student.com' , HASHBYTES ('SHA2_256' , 'pass123') , 'etudiant'),
   ('abdelilah' , 'abdelilah@student.com' , HASHBYTES ('SHA2_256' , 'pass123') , 'etudiant'),
   ('israe' , 'israe@student.com' , HASHBYTES ('SHA2_256' , 'pass123') , 'etudiant'),
   ('salma' , 'salma@student.com' , HASHBYTES ('SHA2_256' , 'pass123') , 'etudiant'),
   ('ihssane' , 'ihssane@student.com' , HASHBYTES ('SHA2_256' , 'pass123') , 'etudiant'),
   ('youssef' , 'youssef@student.com' , HASHBYTES ('SHA2_256' , 'pass123') , 'etudiant'),
   ('karim' , 'karim@student.com' , HASHBYTES ('SHA2_256' , 'pass123') , 'etudiant'),
   ('aymene' , 'aymene@student.com' , HASHBYTES ('SHA2_256' , 'pass123') , 'etudiant'),
   ('jamal' , 'jamal@student.com' , HASHBYTES ('SHA2_256' , 'pass123') , 'etudiant'),
   ('hakim' , 'hakim@student.com' , HASHBYTES ('SHA2_256' , 'pass123') , 'etudiant'),
   ('amine' , 'amine@student.com' , HASHBYTES ('SHA2_256' , 'pass123') , 'etudiant'),
   ('mehdi' , 'mehdi@student.com' , HASHBYTES ('SHA2_256' , 'pass123') , 'etudiant') ;








   insert into Categories (nom_categorie) values 
  ('mathematiques'),
  ('informatique'),
  ('physique'),
  ('chimie'),
  ('biologie'),
  ('geographie'),
  ('philosophie'),
  ('economie'),
  ('litterature'),
  ('langue_francaise'),
  ('langue_arabe'),
  ('anglais'),
  ('education_civique'),
  ('arts'),
  ('histoire');



   insert into Quiz (titre_quiz , description , duree_minutes , id_categorie, id_enseignant) values
   


('Quiz mathematiques 1', 'calcul et logique', 45, 1, 1),
('Quiz informatique 1', 'bases et programmation', 40, 2, 1),
('Quiz physique 1', 'mecanique et forces', 15, 3, 2),
('Quiz chimie 1', 'atome et reactions', 30, 4, 2),
('Quiz biologie 1', 'cellules et genes', 10, 5, 1),
('Quiz geographie 1', 'climats et cartes', 25, 6, 1),
('Quiz philosophie 1', 'notions de base', 5, 7, 2),
('Quiz economie 1', 'offre et demande', 30, 8, 2),
('Quiz litterature 1', 'genres litteraires', 50, 9, 1),
('Quiz langue francaise 1', 'grammaire et conjugaison', 30, 10, 1),
('Quiz langue arabe 1', 'nahw et sarf', 30, 11, 2),
('Quiz anglais 1', 'vocabulaire et grammaire', 30, 12, 1),
('Quiz education civique 1', 'droits et devoirs', 20, 13, 2),
('Quiz arts 1', 'art et culture', 10, 14, 1),
('Quiz histoire 1', 'dates et civilisations', 30, 15, 2);

   insert into Questions (texte_question , reponse_correcte, points , id_quiz) values
   
   ('Quel est le resultat de 7 + 5 ?', '12', 2, 1),
('Quel langage est principalement utilise pour structurer une page web ?', 'HTML', 4, 2),
('Quelle est l unite de la force dans le Systeme International ?', 'Newton', 6, 3),
('Quel est le symbole chimique de l eau ?', 'H2O', 10, 4),
('Quelle est l unite de base du vivant ?', 'Cellule', 7, 5),
('Quel est le plus grand ocean du monde ?', 'Ocean Pacifique', 8, 6),
('Qui a dit : "Je pense donc je suis" ?', 'Descartes', 1, 7),
('Que signifie le PIB ?', 'Produit Interieur Brut', 3, 8),
('Qui a ecrit "Les Miserables" ?', 'Victor Hugo', 4, 9),
('Quel est le pluriel de "cheval" ?', 'chevaux', 9, 10),
('Combien y a-t-il de lettres dans l alphabet arabe ?', '28', 1, 11),
('Quel est le passe de "go" en anglais ?', 'went', 2, 12),
('Quel document definit les droits fondamentaux d un pays ?', 'Constitution', 6, 13),
('Quel art utilise principalement le son ?', 'Musique', 5, 14),
('En quelle annee a commence la Premiere Guerre mondiale ?', '1914', 4, 15);



   insert into Resultats (score,date_passage, id_etudiant,id_quiz) values
   

 (78, '2025-11-01', 1, 1),
(64, '2025-11-01', 2, 2),
(92, '2025-11-02', 3, 3),
(55, '2025-11-02', 4, 4),
(83, '2025-11-03', 5, 5),
(47, '2025-11-03', 1, 6),
(69, '2025-11-04', 2, 7),
(88, '2025-11-04', 3, 8),
(73, '2025-11-05', 4, 9),
(60, '2025-11-05', 5, 10),
(95, '2025-11-06', 1, 11),
(39, '2025-11-06', 2, 12),
(81, '2025-11-07', 3, 13),
(58, '2025-11-07', 4, 14),
(76, '2025-11-08', 5, 15);

   SELECT * FROM Utilisateurs;
   SELECT * FROM Categories;
   SELECT * FROM Quiz;
   SELECT * FROM Questions;
   SELECT * FROM Resultats;



   
   --Requete 1   Ajouter un nouveau quiz créé par un enseignant
   insert into Quiz (titre_quiz, description, duree_minutes, id_categorie, id_enseignant)
   values ('Quiz reseaux 1', 'bases reseaux', 35, 2, 1);




   --Requete 2   Modifier la durée d'un quiz existant
   UPDATE Quiz
   SET duree_minutes = 60
   WHERE id_quiz = 1;



   --Requete 3   Afficher tous les utilisateurs

   SELECT *
   FROM Utilisateurs;


   --Requete 4   Afficher uniquement les noms et emails des utilisateurs

   SELECT nom, email
   FROM Utilisateurs;


   
   --Requete 5   Afficher tous les quiz
   SELECT *
   FROM Quiz;



   --Requete  6   Afficher uniquement les titres des quiz

   SELECT titre_quiz
   FROM Quiz;




   --Requete 7    Afficher toutes les catégories
   SELECT *
   FROM Categories;





   --Requete  8    Afficher les utilisateurs qui sont enseignants

   SELECT *
   FROM Utilisateurs
   WHERE role = 'enseignant';



   --Requete  9    Afficher les utilisateurs qui sont étudiants
   SELECT *
   FROM Utilisateurs
   WHERE role = 'etudiant';




   --Requete 10     Afficher les quiz de durée supérieure à 30 minutes
   
   SELECT *
   FROM Quiz
   WHERE duree_minutes > 30;





   --Requete  11    Afficher les quiz de durée inférieure ou égale à 45 minutes

   SELECT *
   FROM Quiz
   WHERE duree_minutes <= 45;





   --Requete  12      Afficher les questions valant plus de 5 points

   SELECT *
   FROM Questions
   WHERE points > 5;




   --Requete  13     Afficher les quiz de durée entre 20 et 40 minutes

   SELECT *
   FROM Quiz
   WHERE duree_minutes BETWEEN 20 AND 40;




   --Requete 14     Afficher les résultats avec un score supérieur ou égal à 60

   SELECT *
   FROM Resultats
   WHERE score >= 60;
 


   --Requete  15    Afficher les résultats avec un score inférieur à 50

   SELECT *
   FROM Resultats
   WHERE score < 50;




   --Requete  16    Afficher les questions valant entre 5 et 15 points

   SELECT *
   FROM Questions
   WHERE points BETWEEN 5 AND 15;




   --Requete  17    Afficher les quiz créés par l'enseignant avec id_enseignant = 1

   SELECT *
   FROM Quiz
   WHERE id_enseignant = 1;




   --Requete  18    Afficher tous les quiz triés par durée (du plus court au plus long)

   SELECT *
   FROM Quiz
   ORDER BY duree_minutes ASC;



   --Requete  19    Afficher tous les résultats triés par score (du plus élevé au plus faible)

   SELECT *
   FROM Resultats
   ORDER BY score DESC;



  --Requete  20     Afficher les 5 meilleurs scores

   SELECT TOP 5 *
   FROM Resultats
   ORDER BY score DESC;


   --Requete 21      Afficher les questions triées par points (du plus faible au plus élevé)

   SELECT *
   FROM Questions
   ORDER BY points ASC;


    --Requete 22     Afficher les 3 derniers résultats (triés par date_passage décroissante)    

  SELECT TOP 3 *
  FROM Resultats
  ORDER BY date_passage DESC;


   --Requete 23    Afficher le nom de chaque quiz avec sa catégorie

   SELECT Quiz.titre_quiz, Categories.nom_categorie
   FROM Quiz
   JOIN Categories ON Quiz.id_categorie = Categories.id_categorie;











   -- Maintenance pour test de performance
   SET STATISTICS TIME ON;
   SET STATISTICS IO ON;

   SELECT Quiz.titre_quiz, Categories.nom_categorie
   FROM Quiz
   INNER JOIN Categories ON Quiz.id_categorie = Categories.id_categorie;

   SET STATISTICS IO OFF;
   SET STATISTICS TIME OFF;
