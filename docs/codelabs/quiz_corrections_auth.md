# Fiche formateur - Corrige quiz Auth (V2)

Utilisation:
- Support rapide pendant la seance.
- Reponses courtes pour un niveau debutant.

## Corrige des questions

- **Quel fichier liste les dependances Flutter ?**
  - `pubspec.yaml`

- **Pourquoi ajouter `flutter_screenutil` ?**
  - Pour adapter tailles/espaces/textes selon l'ecran.

- **Pourquoi `ScreenUtilInit` dans `main.dart` ?**
  - On l'initialise une seule fois pour toute l'application.

- **A quoi sert `designSize` ?**
  - C'est la taille de reference pour calculer `.w`, `.h`, `.sp`, `.r`.

- **Pourquoi `StatefulWidget` pour la page connexion ?**
  - Parce que l'interface change (checkbox, oeil mot de passe).

- **Pourquoi appeler `dispose()` ?**
  - Pour liberer les `TextEditingController` et eviter les fuites memoire.

- **Pourquoi `ListView` au lieu de `Column` ?**
  - `ListView` permet le scroll et evite les debordements sur petits ecrans.

- **Role de `setState()` ?**
  - Redessiner l'UI quand une valeur d'etat change.

- **Difference `push` vs `pushReplacement` ?**
  - `push` empile une page, `pushReplacement` remplace la page courante.

- **Pourquoi plusieurs controllers dans inscription ?**
  - Un controller par champ pour recuperer chaque saisie.

- **Pourquoi `_obscurePassword` est un bool ?**
  - Deux etats possibles: cache (`true`) ou visible (`false`).

- **Pourquoi `Expanded` autour de Nom/Prenom dans un `Row` ?**
  - Pour donner une largeur bornee aux champs et eviter l'erreur "unbounded width".

- **Pourquoi utiliser `GestureDetector` sur un texte ?**
  - Pour rendre ce texte cliquable (navigation simple).

## Recap attendu (fin de seance)

- **Cite 3 widgets de structure utilises**
  - Exemple: `Scaffold`, `AppBar`, `ListView`.

- **Cite 2 etats geres avec `setState`**
  - Exemple: `_obscurePassword`, `_rememberMe`.

- **Pourquoi `dispose()` est important**
  - Nettoyage des ressources des controllers.

- **Pourquoi `ScreenUtilInit` a la racine**
  - Configuration responsive unique et coherente pour tous les ecrans.

## Barreme rapide (optionnel)

- +1 point par bonne reponse
- Total conseille: /10
- Objectif debutant: 7/10 minimum
