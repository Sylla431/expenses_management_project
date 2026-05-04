summary: Flutter debutant - Codelab V2 ultra guide + quiz
id: expenses-auth-screens-v2-quiz
categories: Flutter,Mobile,UI
tags: flutter,screenutil,navigation,formulaire,quiz,debutant
authors: Formateur
status: Published

# Flutter debutant - Connexion / Inscription (V2 ultra guidee + quiz)

## Introduction
Duration: 3:00

Objectif:
- Construire 2 ecrans (`Connexion` et `Inscription`) pas a pas.
- Comprendre la syntaxe Flutter grace aux **commentaires dans le code**.
- Verifier la comprehension avec des mini quiz.

Regle de travail:
- 1 bloc de code a la fois
- 1 verification a la fois

## Etape 1 - Setup projet
Duration: 5:00

### Action
```bash
flutter create expenses_management_project
cd expenses_management_project
flutter pub add flutter_screenutil
```

### Verification
- Le projet compile avec `flutter run`.

### Mini quiz
- Q1: Quel fichier contient les dependances ?
- Q2: Pourquoi on ajoute `flutter_screenutil` ?

## Etape 2 - Initialiser ScreenUtil dans `main.dart`
Duration: 10:00

### Action
Remplace `lib/main.dart` par ce code **commente**:

```dart
import 'package:expenses_management_project/authentification/page_de_connexion.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Point d'entree de l'application.
void main() {
  // Lance le widget racine.
  runApp(const ExpensesTrainingApp());
}

// Widget racine (pas d'etat local ici).
class ExpensesTrainingApp extends StatelessWidget {
  const ExpensesTrainingApp({super.key});

  @override
  Widget build(BuildContext context) {
    // ScreenUtilInit: initialise le responsive UNE seule fois pour toute l'app.
    return ScreenUtilInit(
      // Taille de reference utilisee pour calculer .w / .h / .sp / .r.
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
        // Premier ecran affiche.
        home: const PageDeConnexion(),
      ),
    );
  }
}
```

### Verification
- `main.dart` compile.

### Mini quiz
- Q1: Pourquoi `ScreenUtilInit` dans `main.dart` ?
- Q2: A quoi sert `designSize` ?

## Etape 3 - Creer le squelette de Connexion
Duration: 12:00

### Action
Cree `lib/authentification/page_de_connexion.dart`:

```dart
import 'package:expenses_management_project/authentification/page_inscription.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// StatefulWidget: on a des valeurs qui changent (checkbox, oeil mot de passe).
class PageDeConnexion extends StatefulWidget {
  const PageDeConnexion({super.key});

  @override
  State<PageDeConnexion> createState() => _PageDeConnexionState();
}

class _PageDeConnexionState extends State<PageDeConnexion> {
  // Controllers: recuperent le texte saisi dans les champs.
  final TextEditingController _telephoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Etats locaux de la page.
  bool _rememberMe = false;
  bool _obscurePassword = true;

  @override
  void dispose() {
    // Important: liberer les controllers pour eviter les fuites memoire.
    _telephoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Connexion',
          style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: const Center(child: Text('Etape suivante: contenu de la page')),
    );
  }
}
```

### Verification
- L'ecran affiche "Connexion".

### Mini quiz
- Q1: Pourquoi `StatefulWidget` ?
- Q2: Pourquoi appeler `dispose()` ?

## Etape 4 - Bloc entete Connexion
Duration: 10:00

### Action
Dans `build`, remplace `body` par ce premier bloc:

```dart
body: Container(
  // Fond degrade simple.
  decoration: const BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: <Color>[Color(0xFFF3F7FF), Color(0xFFFFFFFF)],
    ),
  ),
  // ListView pour autoriser le scroll sur petits ecrans.
  child: ListView(
    padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
    children: <Widget>[
      Center(
        child: CircleAvatar(
          radius: 38.r,
          backgroundColor: Colors.indigo.shade50,
          child: Icon(Icons.account_balance_wallet_rounded, size: 36.sp, color: Colors.indigo),
        ),
      ),
      SizedBox(height: 16.h),
      Center(child: Text('Bienvenue', style: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.w700))),
      SizedBox(height: 6.h),
      Center(
        child: Text(
          'Connectez-vous a votre compte',
          style: TextStyle(fontSize: 14.sp, color: Colors.grey.shade700),
        ),
      ),
      SizedBox(height: 24.h),
      // Formulaire a ajouter a l'etape suivante.
    ],
  ),
),
```

### Verification
- Avatar + titre + sous-titre visibles.

### Mini quiz
- Q1: Pourquoi `ListView` et pas `Column` ?

## Etape 5 - Bloc formulaire Connexion
Duration: 18:00

### Action
Ajoute ce bloc a la place du commentaire:

```dart
Container(
  padding: EdgeInsets.all(16.w),
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(16.r),
    boxShadow: <BoxShadow>[
      BoxShadow(
        color: Colors.black.withValues(alpha: 0.06),
        blurRadius: 16.r,
        offset: Offset(0, 6.h),
      ),
    ],
  ),
  child: Column(
    children: <Widget>[
      // Champ telephone.
      TextFormField(
        controller: _telephoneController,
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          labelText: 'Telephone',
          hintText: 'Ex: 0600000000',
          prefixIcon: const Icon(Icons.phone_outlined),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(14.r)),
        ),
      ),
      SizedBox(height: 12.h),

      // Champ mot de passe avec bouton oeil.
      TextFormField(
        controller: _passwordController,
        obscureText: _obscurePassword,
        decoration: InputDecoration(
          labelText: 'Mot de passe',
          hintText: '********',
          prefixIcon: const Icon(Icons.lock_outline_rounded),
          suffixIcon: IconButton(
            onPressed: () {
              // setState: redessine l'UI avec la nouvelle valeur.
              setState(() => _obscurePassword = !_obscurePassword);
            },
            icon: Icon(
              _obscurePassword ? Icons.visibility_off_outlined : Icons.visibility_outlined,
            ),
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(14.r)),
        ),
      ),
      SizedBox(height: 8.h),

      // Checkbox + lien mot de passe oublie.
      Row(
        children: <Widget>[
          Checkbox(
            value: _rememberMe,
            onChanged: (bool? value) {
              setState(() => _rememberMe = value ?? false);
            },
          ),
          Expanded(child: Text('Se souvenir de moi', style: TextStyle(fontSize: 13.sp))),
          TextButton(onPressed: () {}, child: Text('Mot de passe oublie ?', style: TextStyle(fontSize: 13.sp))),
        ],
      ),
      SizedBox(height: 4.h),

      // Bouton principal.
      SizedBox(
        width: double.infinity,
        height: 50.h,
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.indigo,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14.r)),
          ),
          child: Text('Connexion', style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700)),
        ),
      ),
    ],
  ),
),
```

### Verification
- L'icone oeil affiche/masque le mot de passe.
- La checkbox change bien d'etat.

### Mini quiz
- Q1: Quel widget declenche le changement visuel de l'oeil ?
- Q2: Pourquoi `Expanded` autour du texte checkbox ?

## Etape 6 - Bas de page + navigation vers Inscription
Duration: 10:00

### Action
Ajoute apres le formulaire:

```dart
SizedBox(height: 18.h),
Row(
  children: <Widget>[
    const Expanded(child: Divider()),
    Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Text('Ou continuer avec', style: TextStyle(fontSize: 12.sp, color: Colors.grey.shade600)),
    ),
    const Expanded(child: Divider()),
  ],
),
SizedBox(height: 14.h),
Row(
  children: <Widget>[
    Expanded(child: OutlinedButton.icon(onPressed: () {}, icon: Icon(Icons.facebook, size: 18.sp), label: Text('Facebook', style: TextStyle(fontSize: 13.sp)))),
    SizedBox(width: 12.w),
    Expanded(child: OutlinedButton.icon(onPressed: () {}, icon: Icon(Icons.g_mobiledata_rounded, size: 22.sp), label: Text('Google', style: TextStyle(fontSize: 13.sp)))),
  ],
),
SizedBox(height: 18.h),
Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: <Widget>[
    Text("Vous n'avez pas de compte ? ", style: TextStyle(fontSize: 13.sp)),
    GestureDetector(
      onTap: () {
        // pushReplacement: remplace la page actuelle dans la pile de navigation.
        Navigator.pushReplacement(
          context,
          MaterialPageRoute<void>(builder: (BuildContext context) => const PageInscription()),
        );
      },
      child: Text('Inscrivez-vous', style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w700, color: Colors.indigo)),
    ),
  ],
),
```

### Verification
- Le lien "Inscrivez-vous" ouvre la page inscription (quand elle existera).

### Mini quiz
- Q1: Difference entre `push` et `pushReplacement` ?

## Etape 7 - Creer la structure de la page Inscription
Duration: 12:00

### Action
Cree `lib/authentification/page_inscription.dart` et colle ce code commente:

```dart
import 'package:expenses_management_project/authentification/page_de_connexion.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PageInscription extends StatefulWidget {
  const PageInscription({super.key});

  @override
  State<PageInscription> createState() => _PageInscriptionState();
}

class _PageInscriptionState extends State<PageInscription> {
  // Controllers pour chaque champ.
  final TextEditingController _nomController = TextEditingController();
  final TextEditingController _prenomController = TextEditingController();
  final TextEditingController _telephoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _obscurePassword = true;

  @override
  void dispose() {
    _nomController.dispose();
    _prenomController.dispose();
    _telephoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inscription', style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w700)),
        centerTitle: true,
      ),
      body: const Center(child: Text('Etape suivante: contenu de la page')),
    );
  }
}
```

### Mini quiz
- Q1: Pourquoi 4 controllers ici ?

## Etape 8 - Bloc formulaire Inscription
Duration: 20:00

### Action
Remplace `body` par:

```dart
body: Container(
  decoration: const BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: <Color>[Color(0xFFF3F7FF), Color(0xFFFFFFFF)],
    ),
  ),
  child: ListView(
    padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
    children: <Widget>[
      Center(child: CircleAvatar(radius: 38.r, backgroundColor: Colors.indigo.shade50, child: Icon(Icons.app_registration_rounded, size: 34.sp, color: Colors.indigo))),
      SizedBox(height: 16.h),
      Center(child: Text('Creer un compte', style: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.w700))),
      SizedBox(height: 6.h),
      Center(child: Text('Rejoignez votre espace de gestion des depenses', style: TextStyle(fontSize: 14.sp, color: Colors.grey.shade700))),
      SizedBox(height: 24.h),
      Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: <BoxShadow>[BoxShadow(color: Colors.black.withValues(alpha: 0.06), blurRadius: 16.r, offset: Offset(0, 6.h))],
        ),
        child: Column(
          children: <Widget>[
            // Ligne Nom/Prenom.
            Row(
              children: <Widget>[
                Expanded(
                  child: TextFormField(
                    controller: _nomController,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      labelText: 'Nom',
                      prefixIcon: const Icon(Icons.person_outline),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(14.r)),
                    ),
                  ),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: TextFormField(
                    controller: _prenomController,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      labelText: 'Prenom',
                      prefixIcon: const Icon(Icons.person_2_outlined),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(14.r)),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 12.h),
            TextFormField(
              controller: _telephoneController,
              keyboardType: TextInputType.phone,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                labelText: 'Telephone',
                hintText: 'Ex: 0600000000',
                prefixIcon: const Icon(Icons.phone_outlined),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(14.r)),
              ),
            ),
            SizedBox(height: 12.h),
            TextFormField(
              controller: _passwordController,
              obscureText: _obscurePassword,
              decoration: InputDecoration(
                labelText: 'Mot de passe',
                hintText: 'Au moins 6 caracteres',
                prefixIcon: const Icon(Icons.lock_outline_rounded),
                suffixIcon: IconButton(
                  onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
                  icon: Icon(_obscurePassword ? Icons.visibility_off_outlined : Icons.visibility_outlined),
                ),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(14.r)),
              ),
            ),
            SizedBox(height: 16.h),
            SizedBox(
              width: double.infinity,
              height: 50.h,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14.r)),
                ),
                child: Text("S'inscrire", style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700)),
              ),
            ),
          ],
        ),
      ),
    ],
  ),
),
```

### Mini quiz
- Q1: Pourquoi utiliser `Expanded` dans la `Row` Nom/Prenom ?

## Etape 9 - Lien retour vers Connexion
Duration: 8:00

### Action
Ajoute en bas de la `ListView` inscription:

```dart
SizedBox(height: 18.h),
Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: <Widget>[
    Text('Vous avez deja un compte ? ', style: TextStyle(fontSize: 13.sp)),
    GestureDetector(
      onTap: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute<void>(builder: (BuildContext context) => const PageDeConnexion()),
        );
      },
      child: Text('Connectez-vous', style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w700, color: Colors.indigo)),
    ),
  ],
),
```

### Verification
- Navigation Inscription -> Connexion OK.

### Mini quiz
- Q1: Pourquoi ce texte est cliquable avec `GestureDetector` ?

## Etape 10 - Validation finale
Duration: 6:00

```bash
flutter analyze
flutter run
```

Checklist:
- [ ] Connexion s'affiche au demarrage
- [ ] Oeil mot de passe fonctionne sur les 2 pages
- [ ] Navigation Connexion <-> Inscription OK
- [ ] Pas de bug de layout visible

## Quiz recap (formateur)
Duration: 4:00

- Q1: Cite 3 widgets de structure utilises
- Q2: Cite 2 etats geres avec `setState`
- Q3: Pourquoi `dispose()` est important
- Q4: Pourquoi `ScreenUtilInit` a la racine

## Corrige express
Duration: 2:00

- `ScreenUtilInit` a la racine: config unique.
- `setState`: redessine l'interface.
- `dispose`: libere les controllers.
- `Expanded` dans `Row`: evite largeur infinie pour les champs.
