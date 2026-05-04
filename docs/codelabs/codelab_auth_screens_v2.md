summary: Flutter debutant - Codelab V2 avec quiz
id: expenses-auth-screens-v2-quiz
categories: Flutter,Mobile,UI
tags: flutter,screenutil,navigation,formulaire,quiz
authors: Formateur
status: Published

# Flutter debutant - Connexion / Inscription (V2 + mini quiz)

## Introduction
Duration: 3:00

Cette V2 ajoute des mini quiz pour verifier la comprehension apres chaque bloc important.

## Etape 1 - Setup projet
Duration: 5:00

```bash
flutter create expenses_management_project
cd expenses_management_project
flutter pub add flutter_screenutil
```

Mini quiz:
- Q1: Quel fichier liste les dependances Flutter ?
- Q2: Pourquoi ajouter `flutter_screenutil` ?

## Etape 2 - Initialiser ScreenUtil dans `main.dart`
Duration: 10:00

```dart
import 'package:expenses_management_project/authentification/page_de_connexion.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const ExpensesTrainingApp());
}

class ExpensesTrainingApp extends StatelessWidget {
  const ExpensesTrainingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, __) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Expense Tracker - Debutant',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
          useMaterial3: true,
        ),
        home: const PageDeConnexion(),
      ),
    );
  }
}
```

Mini quiz:
- Q1: Pourquoi `ScreenUtilInit` se met dans `main.dart` et pas dans chaque page ?
- Q2: A quoi sert `designSize` ?

## Etape 3 - Page Connexion (structure)
Duration: 12:00

Creer `lib/authentification/page_de_connexion.dart` avec un `StatefulWidget`, deux `TextEditingController`, et `dispose()`.

Mini quiz:
- Q1: Pourquoi ici `StatefulWidget` est mieux que `StatelessWidget` ?
- Q2: Pourquoi appeler `dispose()` sur les controllers ?

## Etape 4 - Page Connexion (UI bloc par bloc)
Duration: 18:00

Ajouter progressivement:
1) Entete (avatar, titre, sous-titre)
2) Formulaire (telephone, mot de passe, checkbox)
3) Bouton principal
4) Boutons sociaux
5) Lien vers inscription

Snippet cle pour l'oeil du mot de passe:

```dart
TextFormField(
  controller: _passwordController,
  obscureText: _obscurePassword,
  decoration: InputDecoration(
    suffixIcon: IconButton(
      onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
      icon: Icon(_obscurePassword ? Icons.visibility_off_outlined : Icons.visibility_outlined),
    ),
  ),
)
```

Mini quiz:
- Q1: Quel est le role de `setState()` dans ce bloc ?
- Q2: Pourquoi `ListView` plutot que `Column` ?

## Etape 5 - Page Inscription (structure)
Duration: 12:00

Creer `lib/authentification/page_inscription.dart` avec:
- controllers: nom, prenom, telephone, mot de passe
- etat: `_obscurePassword`
- `dispose()`

Mini quiz:
- Q1: Quel champ necessite `keyboardType: TextInputType.phone` ?
- Q2: Pourquoi stocker `_obscurePassword` dans un bool ?

## Etape 6 - Page Inscription (UI bloc par bloc)
Duration: 20:00

Ajouter progressivement:
1) Entete
2) Formulaire (nom/prenom en `Row` + `Expanded`)
3) Telephone
4) Mot de passe + oeil
5) Bouton inscription
6) Lien retour connexion

Snippet cle pour `Expanded`:

```dart
Row(
  children: <Widget>[
    Expanded(child: TextFormField(...)),
    SizedBox(width: 10.w),
    Expanded(child: TextFormField(...)),
  ],
)
```

Mini quiz:
- Q1: Que se passe-t-il si on enleve `Expanded` autour des `TextFormField` dans un `Row` ?
- Q2: Pourquoi `pushReplacement` pour naviguer entre Connexion/Inscription ?

## Etape 7 - Verification finale
Duration: 8:00

```bash
flutter analyze
flutter run
```

Checklist:
- [ ] Connexion s'affiche au demarrage
- [ ] L'oeil du mot de passe fonctionne sur les 2 pages
- [ ] Navigation Connexion <-> Inscription OK
- [ ] Aucun overflow visible

Mini quiz final (recap):
- Q1: Cite 3 widgets de structure utilises dans ces pages.
- Q2: Cite 2 elements d'etat geres avec `setState`.
- Q3: Pourquoi `ScreenUtilInit` est place a la racine ?

## Corrige rapide (formateur)
Duration: 2:00

- Q typiques:
  - `ScreenUtilInit` a la racine -> config unique pour toute l'app.
  - `setState` -> redessiner l'UI quand un etat change.
  - `Expanded` dans `Row` -> donner une largeur bornee aux champs.
  - `dispose` -> liberer les ressources des controllers.

## Bonus V2
Duration: 5:00

Ajoute un mini score oral:
- +1 point par bonne reponse (10 points total).
- Objectif eleve: 7/10 minimum avant la suite (gestion des depenses).
