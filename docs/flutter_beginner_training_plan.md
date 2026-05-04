# Formation Flutter debutant - Expense Tracker

## Objectif de la formation
Permettre a un debutant de construire une application Flutter complete de gestion de depenses en 8 semaines, avec une progression simple, pratique, et mesurable.

## Public cible
- Debutant en Flutter (aucune experience requise).
- Notions de base en programmation recommandees (variables, fonctions, conditions).

## Methode d'apprentissage
- 30% theorie utile, 70% pratique.
- Chaque semaine suit la meme structure:
  - Comprendre les concepts cibles.
  - Realiser un mini exercice guide.
  - Livrer un resultat concret verifiable.

## Progression detaillee (8 semaines)

### Semaine 1 - Bases Flutter et environnement
- **Objectifs valides**
  - Installer Flutter SDK, configurer emulateur, lancer un projet.
  - Expliquer le role de `main()`, `runApp()`, `MaterialApp`, `Scaffold`.
  - Construire un ecran statique avec widgets de base.
- **Mapping Expense Tracker**
  - Initialiser l'application avec une page d'accueil neutre.
  - Poser une structure visuelle simple (titre, sous-titre, bouton "Se connecter").
- **Exercice pratique**
  - Reproduire une page d'accueil statique "Expense Tracker".
- **Mini livrable**
  - Application qui demarre sans erreur et affiche un ecran d'accueil personnalise.

### Semaine 2 - Connexion et inscription (UI + formulaires)
- **Objectifs valides**
  - Construire des ecrans Login et Sign Up propres.
  - Utiliser `Form`, `TextFormField` et validations de base (email, mot de passe, confirmation).
  - Gerer les messages d'erreur et de succes.
- **Mapping Expense Tracker**
  - Ajouter `LoginScreen` et `RegisterScreen`.
  - Preparer un flux d'authentification local (sans backend complexe).
- **Exercice pratique**
  - Implementer inscription + connexion avec validation et bascule entre ecrans.
- **Mini livrable**
  - Parcours inscription/connexion fonctionnel en local.

### Semaine 3 - Session, navigation protegee et deconnexion
- **Objectifs valides**
  - Naviguer entre ecrans auth et ecran principal.
  - Gerer un etat de session simple (connecte/deconnecte).
  - Proteger l'acces a l'ecran principal si non connecte.
- **Mapping Expense Tracker**
  - Creer un `AuthGate` simple.
  - Ajouter bouton deconnexion.
- **Exercice pratique**
  - Implementer redirection vers login si session absente.
- **Mini livrable**
  - Navigation complete: login -> app -> logout -> login.

### Semaine 4 - Widgets essentiels et liste de depenses
- **Objectifs valides**
  - Utiliser `ListView`, `Card`, `Padding`, `Expanded`, `SizedBox` correctement.
  - Afficher des donnees de depenses mockees.
  - Construire des composants reutilisables pour la liste.
- **Mapping Expense Tracker**
  - Construire l'ecran principal des depenses.
  - Ajouter un composant `ExpenseCard`.
- **Exercice pratique**
  - Integrer 8 transactions fictives et les afficher dans des cartes.
- **Mini livrable**
  - Ecran liste lisible avec style coherent.

### Semaine 5 - Etat local et formulaire d'ajout de depense
- **Objectifs valides**
  - Comprendre `StatefulWidget` et `setState`.
  - Creer un formulaire d'ajout de depense avec validation.
  - Mettre a jour la liste en temps reel.
- **Mapping Expense Tracker**
  - Ajouter un formulaire de creation (`title`, `amount`, `category`, `date`).
  - Inserer la nouvelle depense en local.
- **Exercice pratique**
  - Valider montant positif + categorie obligatoire + date valide.
- **Mini livrable**
  - Ajout d'une depense visible immediatement avec feedback utilisateur.

### Semaine 6 - Donnees locales et relation utilisateur-depenses
- **Objectifs valides**
  - Definir les modeles `UserSession` et `Expense`.
  - Persister les depenses localement (`shared_preferences` ou Hive).
  - Isoler les depenses par utilisateur connecte (niveau debutant).
- **Mapping Expense Tracker**
  - Sauvegarder/relire les depenses selon l'utilisateur courant.
  - Conserver la session locale entre redemarrages (option simple).
- **Exercice pratique**
  - Creer 2 utilisateurs de test et verifier la separation de leurs depenses.
- **Mini livrable**
  - Donnees d'auth et depenses persistantes et coherentes.

### Semaine 7 - Architecture legere, UX et qualite
- **Objectifs valides**
  - Organiser le projet en dossiers (`models`, `screens`, `widgets`, `services`).
  - Separer presentation, etat et persistence.
  - Gerer les etats vide, chargement, erreur.
  - Ecrire des tests widgets simples.
- **Mapping Expense Tracker**
  - Refactoriser la logique hors des ecrans.
  - Tester les parcours critiques (auth + ajout depense).
- **Exercice pratique**
  - Ecrire 3 tests: login valide, liste vide, ajout depense.
- **Mini livrable**
  - Application plus robuste et testee sur parcours critiques.

### Semaine 8 - Projet final guide
- **Objectifs valides**
  - Assembler les competences dans une mini app complete.
  - Finaliser un flux utilisateur simple et stable.
  - Presenter et justifier les choix de structure.
- **Mapping Expense Tracker**
  - Fonctions finales: inscription, connexion, logout, ajout, suppression, filtre simple, total mensuel.
  - Nettoyage UI, verifications finales, demo.
- **Exercice pratique**
  - Session "build from scratch" guidee en 2 parties (core puis finition).
- **Mini livrable**
  - Version finale prete a etre demontree.

## Checklist de competences (evaluation fin de formation)

### A. Fondamentaux Flutter
- [ ] Lancer un projet et expliquer la structure minimale.
- [ ] Utiliser correctement les widgets de layout principaux.
- [ ] Construire des ecrans lisibles et coherents.

### B. Authentification debutant
- [ ] Implementer inscription et connexion avec validation de formulaire.
- [ ] Gerer une session locale simple (connecte/deconnecte).
- [ ] Restreindre l'acces aux ecrans de depenses si non connecte.

### C. Navigation et reutilisabilite
- [ ] Implementer une navigation entre ecrans.
- [ ] Creer des widgets reutilisables sans duplication excessive.

### D. Etat et formulaires
- [ ] Mettre a jour l'UI via `setState` de facon correcte.
- [ ] Valider un formulaire et afficher des erreurs utiles.

### E. Donnees et structure
- [ ] Modeliser une depense (`id`, `title`, `amount`, `date`, `category`).
- [ ] Associer les depenses a l'utilisateur connecte.
- [ ] Persister localement et restaurer l'etat de l'application.
- [ ] Organiser le code dans une architecture legere.

### F. Qualite logicielle
- [ ] Gerer les etats vide/erreur/chargement.
- [ ] Ecrire et executer des tests widgets de base.
- [ ] Expliquer les principales decisions techniques.

## Criteres de validation finale
- L'application Expense Tracker est fonctionnelle de bout en bout (auth incluse).
- Les fonctionnalites promises sont presentes et stables.
- Le code est lisible pour un niveau debutant/intermediaire.
- Les tests minimaux passent.

## Rythme recommande par semaine
- Session 1 (90 min): introduction + demonstration.
- Session 2 (90 min): pratique guidee.
- Session 3 (60 min): exercice autonome + revue.

## Resultat attendu de la formation
A la fin, l'apprenant peut creer une application Flutter simple multi-ecrans avec inscription/connexion, manipuler l'etat local, persister des donnees locales, et structurer un petit projet proprement.
