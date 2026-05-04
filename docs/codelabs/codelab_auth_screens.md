summary: Flutter debutant - Codelab ultra guide (auth)
id: expenses-auth-screens-ultra-guide
categories: Flutter,Mobile,UI
tags: flutter,screenutil,navigation,formulaire,debutant
authors: Formateur
status: Published

# Flutter debutant - Connexion / Inscription (version ultra guidee)

## Avant de commencer
Duration: 3:00

Ce codelab est pense pour un eleve debutant:
- 1 etape = 1 objectif.
- Petit bloc de code a la fois.
- Verification immediate.
- Question formateur a poser.

Regle d'or:
- **On ne code pas vite. On code clair.**

## Etape 1 - Creer le projet
Duration: 5:00

### Objectif
Avoir un projet Flutter propre.

### Action
```bash
flutter create expenses_management_project
cd expenses_management_project
flutter pub get
```

### Verification
- Le dossier `lib/` existe.
- `flutter run` lance l'app de base.

### Question formateur
- A quoi sert le dossier `lib/` ?

## Etape 2 - Installer ScreenUtil
Duration: 5:00

### Objectif
Ajouter le package responsive.

### Action
```bash
flutter pub add flutter_screenutil
```

### Verification
- Dans `pubspec.yaml`, `flutter_screenutil` apparait dans `dependencies`.

### Question formateur
- Pourquoi adapter tailles/espaces selon l'ecran ?

## Etape 3 - Creer le dossier auth
Duration: 2:00

### Objectif
Structurer le code par fonctionnalite.

### Action
Creer:
- `lib/authentification/`

### Verification
- Le dossier est visible dans l'IDE.

### Question formateur
- Pourquoi separer l'authentification dans son propre dossier ?

## Etape 4 - Initialiser ScreenUtil dans `main.dart`
Duration: 10:00

### Objectif
Initialiser `ScreenUtilInit` **une seule fois** au niveau racine.

### Action
Remplacer `lib/main.dart` par:

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

### Verification
- Pas d'erreur d'import (la page sera creee juste apres).

### Question formateur
- Pourquoi on n'initialise pas ScreenUtil dans chaque page ?

## Etape 5 - Creer le squelette de Connexion
Duration: 10:00

### Objectif
Creer la classe + etat local.

### Action
Creer `lib/authentification/page_de_connexion.dart`:

```dart
import 'package:expenses_management_project/authentification/page_inscription.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PageDeConnexion extends StatefulWidget {
  const PageDeConnexion({super.key});

  @override
  State<PageDeConnexion> createState() => _PageDeConnexionState();
}

class _PageDeConnexionState extends State<PageDeConnexion> {
  final TextEditingController _telephoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _rememberMe = false;
  bool _obscurePassword = true;

  @override
  void dispose() {
    _telephoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Connexion', style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w700)),
        centerTitle: true,
      ),
      body: const Center(child: Text('Etape suivante: contenu')), 
    );
  }
}
```

### Verification
- L'app compile.
- Le titre "Connexion" apparait.

### Question formateur
- Pourquoi `StatefulWidget` et pas `StatelessWidget` ?

## Etape 6 - Ajouter le layout principal Connexion
Duration: 12:00

### Objectif
Construire la structure visuelle de la page.

### Action
Remplacer `body` par:

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
      // Formulaire a ajouter a l'etape suivante
    ],
  ),
),
```

### Verification
- Avatar + titre + sous-titre visibles.
- L'ecran reste scrollable.

### Question formateur
- Pourquoi on utilise `ListView` au lieu de `Column` ici ?

## Etape 7 - Ajouter le formulaire Connexion
Duration: 18:00

### Objectif
Ajouter telephone, mot de passe, checkbox, bouton.

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
      TextFormField(
        controller: _passwordController,
        obscureText: _obscurePassword,
        decoration: InputDecoration(
          labelText: 'Mot de passe',
          hintText: '********',
          prefixIcon: const Icon(Icons.lock_outline_rounded),
          suffixIcon: IconButton(
            onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
            icon: Icon(_obscurePassword ? Icons.visibility_off_outlined : Icons.visibility_outlined),
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(14.r)),
        ),
      ),
      SizedBox(height: 8.h),
      Row(
        children: <Widget>[
          Checkbox(
            value: _rememberMe,
            onChanged: (bool? value) => setState(() => _rememberMe = value ?? false),
          ),
          Expanded(child: Text('Se souvenir de moi', style: TextStyle(fontSize: 13.sp))),
          TextButton(onPressed: () {}, child: Text('Mot de passe oublie ?', style: TextStyle(fontSize: 13.sp))),
        ],
      ),
      SizedBox(height: 4.h),
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
- Le mot de passe est masquable avec l'icone oeil.
- La checkbox change d'etat.

### Question formateur
- A quoi sert `setState()` dans ce bloc ?

## Etape 8 - Ajouter les boutons sociaux + lien inscription
Duration: 12:00

### Objectif
Completer le bas de la page et la navigation.

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
    Expanded(
      child: OutlinedButton.icon(
        onPressed: () {},
        icon: Icon(Icons.facebook, size: 18.sp),
        label: Text('Facebook', style: TextStyle(fontSize: 13.sp)),
      ),
    ),
    SizedBox(width: 12.w),
    Expanded(
      child: OutlinedButton.icon(
        onPressed: () {},
        icon: Icon(Icons.g_mobiledata_rounded, size: 22.sp),
        label: Text('Google', style: TextStyle(fontSize: 13.sp)),
      ),
    ),
  ],
),
SizedBox(height: 18.h),
Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: <Widget>[
    Text("Vous n'avez pas de compte ? ", style: TextStyle(fontSize: 13.sp)),
    GestureDetector(
      onTap: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute<void>(builder: (BuildContext context) => const PageInscription()),
        );
      },
      child: Text(
        'Inscrivez-vous',
        style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w700, color: Colors.indigo),
      ),
    ),
  ],
),
```

### Verification
- Le texte "Inscrivez-vous" est cliquable.
- La navigation essaie d'aller vers inscription.

### Question formateur
- Difference entre `push` et `pushReplacement` ?

## Etape 9 - Creer le squelette Inscription
Duration: 10:00

### Objectif
Preparer la deuxieme page avec ses controllers.

### Action
Creer `lib/authentification/page_inscription.dart`:

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
      body: const Center(child: Text('Etape suivante: contenu')),
    );
  }
}
```

### Verification
- L'app compile.

### Question formateur
- Pourquoi on a plusieurs controllers sur cette page ?

## Etape 10 - Ajouter le formulaire Inscription
Duration: 20:00

### Objectif
Ajouter nom, prenom, telephone, mot de passe et bouton.

### Action
Remplacer `body` par:

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
      Center(
        child: CircleAvatar(
          radius: 38.r,
          backgroundColor: Colors.indigo.shade50,
          child: Icon(Icons.app_registration_rounded, size: 34.sp, color: Colors.indigo),
        ),
      ),
      SizedBox(height: 16.h),
      Center(child: Text('Creer un compte', style: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.w700))),
      SizedBox(height: 6.h),
      Center(
        child: Text(
          'Rejoignez votre espace de gestion des depenses',
          style: TextStyle(fontSize: 14.sp, color: Colors.grey.shade700),
        ),
      ),
      SizedBox(height: 24.h),
      Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: <BoxShadow>[
            BoxShadow(color: Colors.black.withValues(alpha: 0.06), blurRadius: 16.r, offset: Offset(0, 6.h)),
          ],
        ),
        child: Column(
          children: <Widget>[
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

### Verification
- Les champs sont bien alignes.
- L'icone oeil fonctionne sur mot de passe.

### Question formateur
- Pourquoi `Expanded` autour de Nom/Prenom ?

## Etape 11 - Ajouter le lien retour Connexion
Duration: 8:00

### Objectif
Permettre le retour vers la page connexion.

### Action
Ajoute en bas de la liste:

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
      child: Text(
        'Connectez-vous',
        style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w700, color: Colors.indigo),
      ),
    ),
  ],
),
```

### Verification
- Inscription -> Connectez-vous renvoie bien a Connexion.

### Question formateur
- Pourquoi ce lien n'est pas un `ElevatedButton` ?

## Etape 12 - Test final
Duration: 6:00

### Action
```bash
flutter analyze
flutter run
```

### Checklist eleve
- [ ] Ecran Connexion s'affiche.
- [ ] Mot de passe Connexion: afficher/masquer OK.
- [ ] Navigation Connexion -> Inscription OK.
- [ ] Navigation Inscription -> Connexion OK.
- [ ] Responsive OK (pas de debordement visible).

### Question de recap
- Cite 3 choses gerees par `setState` dans ce mini-projet.

## Bonus pour progresser
Duration: 5:00

Exercices:
1. Ajouter un champ "Confirmer mot de passe".
2. Valider: telephone obligatoire.
3. Transformer les textes cliquables en `TextButton`.
4. Ajouter un `SnackBar` au clic sur Connexion.

## Conclusion
Duration: 2:00

Tu as construit l'authentification **pas a pas**, avec:
- structure claire,
- navigation,
- responsive,
- logique UI de base.
