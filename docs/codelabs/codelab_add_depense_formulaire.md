summary: Flutter debutant - Ajouter une depense (formulaire + setState)
id: expenses-add-depense-formulaire-session
categories: Flutter,Mobile,UI
tags: flutter,setstate,formulaire,listview,beginner
authors: Formateur
status: Published

# Flutter debutant - Codelab seance Ajouter une depense (formulaire + setState)

## Introduction
Duration: 3:00

Objectif de la seance:
- Ajouter un formulaire pour creer une nouvelle depense.
- Mettre a jour la liste en direct avec `setState`.
- Recalculer automatiquement le total.

Resultat attendu:
- L'eleve peut ajouter une depense depuis l'UI.

## Etape 1 - Transformer la page accueil en StatefulWidget
Duration: 8:00

### Action
Dans `lib/accueil/page_accueil_depenses.dart`:
- Transformer `PageAccueilDepenses` de `StatelessWidget` vers `StatefulWidget`.
- Creer `_PageAccueilDepensesState`.

### Pourquoi
- On doit modifier la liste pendant l'execution (ajout de depense).

### Mini quiz
- Q1: Pourquoi `StatelessWidget` ne suffit plus ?

## Etape 2 - Rendre la liste modifiable
Duration: 8:00

### Action
- Remplacer la liste `static const` par une liste mutable dans l'etat:

```dart
final List<Depense> _depenses = <Depense>[
  // ... depenses de depart
];
```

### Pourquoi
- `const` empêche de modifier la liste.

### Mini quiz
- Q1: Quelle est la difference entre une liste `const` et une liste mutable ?

## Etape 3 - Ajouter un bouton + dans l'AppBar
Duration: 8:00

### Action
Dans `AppBar`, ajouter:

```dart
actions: <Widget>[
  IconButton(
    onPressed: _ouvrirFormulaireAjout,
    icon: const Icon(Icons.add),
    tooltip: 'Ajouter une depense',
  ),
],
```

### Pourquoi
- On ouvre le formulaire depuis le haut de page.

### Mini quiz
- Q1: Ou se place un bouton d'action global dans un `Scaffold` ?

## Etape 4 - Creer la methode d'ouverture du formulaire
Duration: 15:00

### Action
Dans `_PageAccueilDepensesState`, ajouter:

```dart
void _ouvrirFormulaireAjout() {
  final TextEditingController titreController = TextEditingController();
  final TextEditingController categorieController = TextEditingController();
  final TextEditingController montantController = TextEditingController();

  showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return Padding(
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
          top: 16,
          bottom: MediaQuery.of(context).viewInsets.bottom + 16,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextField(
              controller: titreController,
              decoration: const InputDecoration(labelText: 'Titre'),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: categorieController,
              decoration: const InputDecoration(labelText: 'Categorie'),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: montantController,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(labelText: 'Montant'),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  _ajouterDepense(
                    titre: titreController.text.trim(),
                    categorie: categorieController.text.trim(),
                    montantTexte: montantController.text.trim(),
                  );
                  Navigator.pop(context);
                },
                child: const Text('Valider'),
              ),
            ),
          ],
        ),
      );
    },
  );
}
```

### Pourquoi
- `showModalBottomSheet` est simple pour un formulaire debutant.

### Mini quiz
- Q1: Pourquoi `isScrollControlled: true` est utile sur mobile ?

## Etape 5 - Ajouter la logique `_ajouterDepense`
Duration: 15:00

### Action
Toujours dans `_PageAccueilDepensesState`, ajouter:

```dart
void _ajouterDepense({
  required String titre,
  required String categorie,
  required String montantTexte,
}) {
  final double? montant = double.tryParse(montantTexte.replaceAll(',', '.'));

  if (titre.isEmpty || categorie.isEmpty || montant == null || montant <= 0) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Veuillez remplir correctement le formulaire')),
    );
    return;
  }

  setState(() {
    _depenses.insert(
      0,
      Depense(
        titre: titre,
        categorie: categorie,
        montant: montant,
        date: '08/05/2026',
      ),
    );
  });
}
```

### Pourquoi
- `setState` force le rafraichissement de la liste et du total.

### Mini quiz
- Q1: Que se passe-t-il si on ajoute dans `_depenses` sans `setState` ?

## Etape 6 - Verifier le recalcul du total
Duration: 6:00

### Action
- Garder le calcul existant avec `fold` dans `build`.
- Ajouter une depense test via le formulaire.

### Verification
- Le total augmente.
- La nouvelle depense apparait en haut de liste.

### Mini quiz
- Q1: Pourquoi le total change automatiquement apres ajout ?

## Etape 7 - Amelioration visuelle (option rapide)
Duration: 8:00

### Action
- Vider les champs apres validation.
- Ajouter `TextInputAction.next` aux `TextField`.
- Ajouter un titre au bottom sheet (`Ajouter une depense`).

### Mini quiz
- Q1: Quelle petite amelioration UI a le plus d'impact pour debutant ?

## Etape 8 - Test final de la seance
Duration: 8:00

### Action
```bash
flutter analyze
flutter run
```

### Checklist
- [ ] Le bouton + est visible.
- [ ] Le formulaire s'ouvre.
- [ ] Les validations minimales fonctionnent.
- [ ] La depense s'ajoute en haut de liste.
- [ ] Le total se met a jour.

### Quiz recap
- Q1: Pourquoi la page est devenue `StatefulWidget` ?
- Q2: Quel est le role de `setState` dans cette seance ?
- Q3: Pourquoi utiliser `double.tryParse` ?

## Bonus (si temps)
Duration: 6:00

1) Ajouter une suppression avec `Dismissible`.
2) Ajouter un `DropdownButtonFormField` pour la categorie.
3) Mettre la date du jour automatiquement.

## Conclusion
Duration: 2:00

L'eleve sait maintenant:
- ouvrir un formulaire,
- valider des saisies,
- modifier une liste dans l'etat,
- voir l'UI se mettre a jour en direct.
