# Slides - Expliquer les widgets et classes (version debutant)

Ce document est pret a etre copie dans Google Slides, PowerPoint ou Canva.
Astuce: 1 section = 1 slide.

## Slide 1 - Titre
**Expense Tracker Flutter - Comprendre les classes et widgets**

- Objectif: comprendre le "pourquoi" de chaque bloc du code.
- Niveau: debutant.
- Resultat attendu: savoir lire et modifier `lib/main.dart`.

---

## Slide 2 - Vue globale de l'application
- Le code suit ce flux:
  1. `main()` lance l'application.
  2. `ExpensesTrainingApp` configure le style global.
  3. `AuthFlowPage` decide entre ecran d'auth ou ecran d'accueil.
  4. `AuthScreen` gere connexion/inscription.
  5. `HomeScreen` affiche l'utilisateur connecte.

Message formateur:
"On se concentre d'abord sur le parcours utilisateur avant d'ajouter les depenses."

---

## Slide 3 - Classe `main()` et `runApp()`
Code a montrer:
- `void main() { runApp(const ExpensesTrainingApp()); }`

Explication simple:
- `main()` = point d'entree de toute app Dart.
- `runApp(...)` = demarre l'interface Flutter.
- `const` = optimise et indique un widget immuable.

Question a poser:
"Que se passe-t-il si on ne met pas `runApp` ?"

---

## Slide 4 - Classe `ExpensesTrainingApp` (`StatelessWidget`)
Role:
- Configuration globale de l'app.

Widgets utilises:
- `MaterialApp` : conteneur principal Material Design.
- `ThemeData` : style commun.
- `ColorScheme.fromSeed` : palette de couleurs auto.
- `home` : ecran de depart (`AuthFlowPage`).

Pourquoi `StatelessWidget` ici ?
- Pas d'etat a modifier dans cette classe.

---

## Slide 5 - `AuthFlowPage` (`StatefulWidget`)
Role:
- Cerveau de navigation simple selon session.

Variables importantes:
- `_users` (`Map<String, String>`) : stocke email/mot de passe en memoire.
- `_currentUserEmail` : utilisateur connecte (ou `null`).

Methodes:
- `_register(...)` : enregistre un utilisateur.
- `_login(...)` : verifie les identifiants.
- `_startSession(...)` : connecte l'utilisateur.
- `_logout()` : deconnecte l'utilisateur.

Pourquoi `StatefulWidget` ?
- Car l'ecran change quand `_currentUserEmail` change.

---

## Slide 6 - `setState()` (concept cle)
Exemple:
- Dans `_startSession` et `_logout`.

Explication:
- `setState()` dit a Flutter: "l'etat a change, rebuild l'UI".
- Sans `setState`, l'affichage ne se met pas a jour.

Analog ie:
- "Tu modifies une fiche, puis tu demandes de rafraichir le tableau."

---

## Slide 7 - Classe `AuthScreen` (formulaire)
Role:
- Afficher le formulaire de connexion/inscription.

Elements de gestion de formulaire:
- `GlobalKey<FormState>` : permet de valider tout le formulaire.
- `TextEditingController` : recupere le texte saisi.
- `dispose()` : nettoie les controllers (bonne pratique).

Etat local:
- `_isLoginMode` : login vs inscription.
- `_message` : message de feedback utilisateur.

---

## Slide 8 - Widgets de structure
Widgets a expliquer:
- `Scaffold` : squelette de page (app bar + body).
- `AppBar` : barre du haut.
- `Center` : centre son enfant.
- `Padding` : ajoute des marges internes.
- `Column` : aligne verticalement.
- `SizedBox` : espace vertical/horizontal.
- `ConstrainedBox` : limite la largeur du formulaire.

Message formateur:
"Ces widgets organisent l'ecran; ils ne portent pas la logique metier."

---

## Slide 9 - Widgets de saisie
Widgets a expliquer:
- `Form` : groupe de champs validables.
- `TextFormField` : champ texte + validation.
- `InputDecoration` + `OutlineInputBorder` : style visuel du champ.

Validations:
- `_validateEmail` : non vide + contient `@`.
- `_validatePassword` : non vide + min 6 caracteres.

---

## Slide 10 - Widgets d'action
Widgets a expliquer:
- `FilledButton` : action principale (soumettre).
- `TextButton` : action secondaire (basculer mode).

Logique:
- `_submit()` fait:
  1. validation du formulaire,
  2. login ou inscription,
  3. affichage des erreurs/succes.

---

## Slide 11 - Conditionnel dans l'UI
Code cle a montrer:
- `if (!_isLoginMode) ...<Widget>[ ... ]`
- `if (_message.isNotEmpty) Text(...)`

Explication:
- Flutter permet d'afficher/cacher des widgets selon une condition.
- Pratique pour garder un seul ecran pour 2 modes (login/signup).

---

## Slide 12 - Classe `HomeScreen` (`StatelessWidget`)
Role:
- Ecran affiche apres connexion.
- Montre l'email connecte.
- Permet de se deconnecter.

Widgets utilises:
- `IconButton` dans `AppBar.actions`.
- `Text` pour message de bienvenue.

Pourquoi `StatelessWidget` ?
- L'etat est gere par le parent (`AuthFlowPage`).

---

## Slide 13 - `StatelessWidget` vs `StatefulWidget`
- `StatelessWidget`:
  - UI fixe selon les parametres recus.
  - Ex: `ExpensesTrainingApp`, `HomeScreen`.
- `StatefulWidget`:
  - UI change pendant l'execution.
  - Ex: `AuthFlowPage`, `AuthScreen`.

Regle simple:
"Si tu modifies des valeurs qui impactent l'ecran, pense `StatefulWidget`."

---

## Slide 14 - Limites de cette version (volontairement debutant)
- Pas de backend reel.
- Les utilisateurs sont stockes en memoire (temporaire).
- Pas de chiffrement mot de passe.
- Pas de persistance de session.

Message formateur:
"C'est volontaire pour apprendre les bases sans complexite serveur."

---

## Slide 15 - Prochaine etape pedagogique
- Ajouter la liste de depenses mockee apres login.
- Ajouter formulaire "Nouvelle depense".
- Puis persistance locale (`shared_preferences`/Hive).

Mini exercice en classe:
"Ajoutez une validation: mot de passe doit contenir au moins un chiffre."

---

## Slide 16 - Recap final
- On a vu:
  - point d'entree app,
  - organisation des classes,
  - etat + formulaires,
  - widgets d'interface.
- Competence atteinte:
  - lire et expliquer le `main.dart` actuel.

Question finale a l'apprenant:
"Quelle classe controle le changement Auth -> Home et pourquoi ?"
