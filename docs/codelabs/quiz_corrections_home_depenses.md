# Fiche formateur - Corrige quiz Home Depenses

Support de correction pour le codelab:
- `docs/codelabs/codelab_home_depenses.md`

## Corrige des questions

- **Pourquoi separer `authentification` et `accueil` en dossiers differents ?**
  - Pour organiser le code par fonctionnalite et faciliter la maintenance.

- **Pourquoi `montant` est en `double` et pas en `String` ?**
  - Parce qu'on fait des calculs (somme, total) avec les montants.

- **Que signifie `static const` pour `_depenses` ?**
  - `static`: appartient a la classe.
  - `const`: valeur fixe/immuable.

- **Quelle est la valeur de depart dans `fold` ?**
  - `0`.

- **Pourquoi `fold` retourne un `double` ?**
  - Parce que les montants sont decimaux (`double`).

- **Pourquoi `ListView` est pratique ici ?**
  - Permet le scroll et evite les debordements si la liste est longue.

- **A quoi sert `...` devant `_depenses.map(...)` ?**
  - C'est le spread operator: il injecte tous les widgets dans `children`.

- **Difference `title`, `subtitle`, `trailing` dans `ListTile` ?**
  - `title`: texte principal.
  - `subtitle`: texte secondaire.
  - `trailing`: element a droite (souvent montant/action).

- **Pourquoi `Navigator.push` est suffisant pour cette seance ?**
  - On veut simplement ouvrir la page d'accueil depuis connexion.

## Recap attendu (fin de seance)

- **Cite 3 widgets utilises pour afficher la liste**
  - Exemple: `ListView`, `Card`, `ListTile`.

- **Cite 2 choses gerees par `ScreenUtil` dans cette page**
  - Exemple: dimensions (`.w`, `.h`) et texte/radius (`.sp`, `.r`).

- **Explique `fold` en une phrase**
  - `fold` parcourt une liste et accumule une valeur finale (ici le total).

## Reponses bonus (si temps)

- **Ajouter une 5eme depense**
  - Ajouter un nouvel objet `Depense(...)` dans la liste `_depenses`.

- **Changer la couleur de categorie selon le nom**
  - Utiliser une fonction simple qui retourne une couleur selon la categorie.

- **Ajouter une icone selon la categorie**
  - Utiliser une fonction qui mappe categorie -> `IconData`.

## Barreme rapide (optionnel)

- +1 point par bonne reponse
- Total conseille: /10
- Objectif debutant: 7/10 minimum
