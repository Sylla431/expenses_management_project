summary: Flutter debutant - Codelab page d'accueil depenses
id: expenses-home-depenses-session
categories: Flutter,Mobile,UI
tags: flutter,screenutil,listview,beginner,codelab
authors: Formateur
status: Published

# Flutter debutant - Codelab seance Page d'accueil (liste des depenses)

## Introduction
Duration: 3:00

Objectif de la seance:
- Creer une page d'accueil "Mes depenses".
- Afficher une liste de depenses mockees.
- Calculer et afficher le total.
- Naviguer depuis la page de connexion.

Niveau:
- Debutant (explications simples, etape par etape).

## Etape 1 - Preparer les fichiers
Duration: 5:00

### Action
Creer le dossier:
- `lib/accueil/`

Creer le fichier:
- `lib/accueil/page_accueil_depenses.dart`

### Verification
- Le fichier existe dans l'IDE.

### Mini quiz
- Q1: Pourquoi separer `authentification` et `accueil` en dossiers differents ?

## Etape 2 - Ajouter les imports et le modele Depense
Duration: 10:00

### Action
Dans `lib/accueil/page_accueil_depenses.dart`, colle ce bloc:

```dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Modele simple pour representer une depense.
class Depense {
  const Depense({
    required this.titre,
    required this.categorie,
    required this.montant,
    required this.date,
  });

  final String titre;
  final String categorie;
  final double montant;
  final String date;
}
```

### Explication
- Une classe `Depense` regroupe les infos d'une transaction.
- `const` permet de creer des objets immuables.

### Mini quiz
- Q1: Pourquoi `montant` est en `double` et pas en `String` ?

## Etape 3 - Creer la page d'accueil + donnees mockees
Duration: 12:00

### Action
Ajoute ce bloc sous le modele:

```dart
class PageAccueilDepenses extends StatelessWidget {
  const PageAccueilDepenses({super.key});

  // Donnees mockees pour la seance.
  static const List<Depense> _depenses = <Depense>[
    Depense(
      titre: 'Courses alimentaires',
      categorie: 'Alimentation',
      montant: 45.90,
      date: '05/05/2026',
    ),
    Depense(
      titre: 'Taxi',
      categorie: 'Transport',
      montant: 12.50,
      date: '04/05/2026',
    ),
    Depense(
      titre: 'Recharge internet',
      categorie: 'Abonnement',
      montant: 20.00,
      date: '03/05/2026',
    ),
    Depense(
      titre: 'Cafe coworking',
      categorie: 'Loisirs',
      montant: 6.75,
      date: '03/05/2026',
    ),
  ];
```

### Explication
- On utilise des donnees mockees pour apprendre l'UI avant la base de donnees.

### Mini quiz
- Q1: Que signifie `static const` pour `_depenses` ?

## Etape 4 - Calculer le total des depenses
Duration: 8:00

### Action
Ajoute la methode `build` et le calcul du total:

```dart
  @override
  Widget build(BuildContext context) {
    final double totalDepenses = _depenses.fold<double>(
      0,
      (double total, Depense depense) => total + depense.montant,
    );
```

### Explication
- `fold` parcourt la liste et additionne les montants.

### Mini quiz
- Q1: Quelle est la valeur de depart dans `fold` ?
- Q2: Pourquoi on retourne `double` ?

## Etape 5 - Construire le Scaffold (AppBar + ListView)
Duration: 12:00

### Action
Toujours dans `build`, ajoute:

```dart
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Mes depenses',
          style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(16.w),
        children: <Widget>[
          // Carte resume (total du mois en cours).
          Container(
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: Colors.indigo,
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Total depenses',
                  style: TextStyle(color: Colors.white70, fontSize: 13.sp),
                ),
                SizedBox(height: 6.h),
                Text(
                  '${totalDepenses.toStringAsFixed(2)} EUR',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 18.h),
          Text(
            'Liste des transactions',
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700),
          ),
          SizedBox(height: 10.h),
```

### Explication
- Le haut de page affiche le resume.
- Puis on prepare la liste detaillee.

### Mini quiz
- Q1: Pourquoi `ListView` est pratique ici ?

## Etape 6 - Afficher chaque depense avec map()
Duration: 15:00

### Action
Ajoute ce bloc dans les `children` apres `SizedBox(height: 10.h),`:

```dart
          ..._depenses.map((Depense depense) {
            return Card(
              elevation: 1.5,
              margin: EdgeInsets.only(bottom: 10.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.indigo.shade50,
                  child: Icon(Icons.payments_outlined, color: Colors.indigo),
                ),
                title: Text(
                  depense.titre,
                  style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
                ),
                subtitle: Text(
                  '${depense.categorie} • ${depense.date}',
                  style: TextStyle(fontSize: 12.sp),
                ),
                trailing: Text(
                  '- ${depense.montant.toStringAsFixed(2)} EUR',
                  style: TextStyle(
                    fontSize: 13.sp,
                    color: Colors.red,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
```

### Explication
- `map()` transforme chaque `Depense` en widget `Card`.
- `...` (spread operator) injecte tous les widgets dans la liste.

### Mini quiz
- Q1: A quoi sert `...` devant `_depenses.map(...)` ?
- Q2: Difference entre `title`, `subtitle`, `trailing` dans `ListTile` ?

## Etape 7 - Relier Connexion -> Accueil
Duration: 10:00

### Action
Dans `lib/authentification/page_de_connexion.dart`:
1) ajoute l'import:

```dart
import 'package:expenses_management_project/accueil/page_accueil_depenses.dart';
```

2) dans le bouton `Connexion`, remplace `onPressed` par:

```dart
onPressed: () {
  Navigator.push(
    context,
    MaterialPageRoute<void>(
      builder: (BuildContext context) => const PageAccueilDepenses(),
    ),
  );
},
```

### Explication
- Au clic, on ouvre la page d'accueil des depenses.

### Mini quiz
- Q1: Pourquoi `Navigator.push` ici est suffisant pour la seance ?

## Etape 8 - Test final de la seance
Duration: 8:00

### Action
```bash
flutter analyze
flutter run
```

### Checklist
- [ ] Le bouton `Connexion` ouvre la page `Mes depenses`.
- [ ] La carte du total est visible.
- [ ] La liste affiche au moins 4 depenses.
- [ ] Aucun overflow visuel.

### Quiz recap
- Q1: Cite 3 widgets utilises pour afficher la liste.
- Q2: Cite 2 choses gerees par `ScreenUtil` dans cette page.
- Q3: Explique en une phrase `fold`.

## Bonus (si temps)
Duration: 6:00

1) Ajouter une 5eme depense dans la liste mockee.
2) Changer la couleur de la categorie selon son nom.
3) Ajouter une icone differente selon la categorie.

## Conclusion
Duration: 2:00

Tu as construit une vraie page d'accueil de depenses:
- donnees mockees,
- total calcule,
- liste lisible,
- navigation depuis connexion.
