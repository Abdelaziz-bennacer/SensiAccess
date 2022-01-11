import 'dart:async';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sensi_access/utils/const.dart';
import 'package:sensi_access/widgets/app_drawer.dart';

class GoodForm extends StatefulWidget {
  static const String routeName = '/good_form';

  const GoodForm({Key? key}) : super(key: key);

  @override
  State<GoodForm> createState() => _GoodFormState();
}

class _GoodFormState extends State<GoodForm> {
  late bool darkMode;
  dynamic savedThemeMode;
  late Icon icon;
  ValueNotifier nomNotifier = ValueNotifier('Roger');

  final _controllerNom = TextEditingController();
  //final _focusNode = FocusNode();
  final _controllerPrenom = TextEditingController();
  //final _focusNode = FocusNode();
  final _controllerEmail = TextEditingController();
  //final _focusNode = FocusNode();
  final _controllerTel = TextEditingController();
  //final _focusNode = FocusNode();

  String textValueNom = 'Dupont';
  String textValuePrenom = 'Jean-Pierre';
  String textValueEmail = 'jeanpierre.dupont@gmail.com';
  String textValueTel = '0689754216';

  @override
  void initState() {
    super.initState();
    getCurrentTheme();
    darkMode = false;
    icon = const Icon(
      FontAwesomeIcons.eyeSlash,
      color: Colors.white,
      semanticLabel: 'Passez en thème invisible',
    );
    _controllerNom.text = textValueNom; //textValueNom;
    _controllerNom.selection =
        TextSelection(baseOffset: 0, extentOffset: textValueNom.length);
    /* _controllerNom.addListener(() {
      final newText = _controllerNom.text.toLowerCase();
      _controllerNom.value = _controllerNom.value.copyWith(
        text: newText,
        selection: TextSelection(
            baseOffset: newText.length, extentOffset: newText.length),
        composing: TextRange.empty,
      );
    });*/

    _controllerPrenom.text = textValuePrenom;
    _controllerPrenom.selection =
        TextSelection(baseOffset: 0, extentOffset: textValuePrenom.length);

    _controllerEmail.text = textValueEmail;
    _controllerEmail.selection =
        TextSelection(baseOffset: 0, extentOffset: textValueEmail.length);

    _controllerTel.text = textValueTel;
    _controllerTel.selection =
        TextSelection(baseOffset: 0, extentOffset: textValueTel.length);
  }

  @override
  void dispose() {
    super.dispose();
    _controllerNom.dispose();
    _controllerPrenom.dispose();
    _controllerEmail.dispose();
    _controllerTel.dispose();
  }

  Future getCurrentTheme() async {
    savedThemeMode = await AdaptiveTheme.getThemeMode();
    if (savedThemeMode.toString() == 'AdaptiveThemeMode.dark') {
      print('theme sombre');
      setState(() {
        darkMode = true;
      });
    } else {
      print('theme clair');
      setState(() {
        darkMode = false;
      });
    }
  }

  Future<void> _showMyDialog(String value) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          semanticLabel: 'Message de confirmation',
          title: Text(
            'La saisie $value a bien été enregistrée',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("J'ai Compris"),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    String? nomInter;
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        title: kGoodFormTitle,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              getCurrentTheme();
              Timer(const Duration(milliseconds: 20), () {
                if (darkMode == true) {
                  setState(() {
                    AdaptiveTheme.of(context).setLight();
                    darkMode = false;
                    icon = const Icon(
                      FontAwesomeIcons.eyeSlash,
                      color: Colors.white,
                      semanticLabel: 'Passez en thème invisible',
                    );
                  });
                } else {
                  setState(() {
                    AdaptiveTheme.of(context).setDark();
                    darkMode = true;
                    icon = const Icon(
                      FontAwesomeIcons.eye,
                      color: Colors.white,
                      semanticLabel: 'Passez en thème visible',
                    );
                  });
                }
              });
            },
            icon: icon,
          ),
        ],
      ),
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.all(10),
              width: double.infinity,
              child: const Text(
                '''Voici un exemple de formulaire accessible.
                
Veuillez répondre au formulaire.

Les champs marqués d'un astérisque sont obligatoires.''',
                style: TextStyle(fontSize: 17, letterSpacing: 0.4),
                textAlign: TextAlign.start,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Form(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Theme(
                      data: Theme.of(context).copyWith(
                        textSelectionTheme: const TextSelectionThemeData(
                            selectionColor: Colors.transparent),
                      ),
                      child: TextFormField(
                        enableInteractiveSelection: false,
                        controller: _controllerNom,
                        cursorColor: Colors.black,
                        onTap: () {
                          setState(() {
                            _controllerNom.text = textValueNom;
                            _controllerNom.selection = TextSelection(
                                baseOffset: 0,
                                extentOffset: textValueNom.length);
                          });
                        },
                        onChanged: (value) {
                          setState(() {
                            textValueNom = value;
                          });
                        },
                        decoration: const InputDecoration(
                          label: Text('NOM *'),
                          labelStyle: TextStyle(color: Colors.black),
                          icon: Icon(FontAwesomeIcons.addressCard,
                              color: Colors.black),
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          filled: true,
                          fillColor: null,
                          focusColor: Colors.white,
                          hoverColor: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Theme(
                      data: Theme.of(context).copyWith(
                        textSelectionTheme: const TextSelectionThemeData(
                            selectionColor: Colors.transparent),
                      ),
                      child: TextFormField(
                        enableInteractiveSelection: false,
                        controller: _controllerPrenom,
                        cursorColor: Colors.black,
                        onTap: () {
                          setState(() {
                            _controllerPrenom.text = textValuePrenom;
                            _controllerPrenom.selection = TextSelection(
                                baseOffset: 0,
                                extentOffset: textValuePrenom.length);
                          });
                        },
                        onChanged: (value) {
                          setState(() {
                            textValuePrenom = value;
                          });
                        },
                        decoration: const InputDecoration(
                          label: Text('PRÉNOM *'),
                          labelStyle: TextStyle(color: Colors.black),
                          icon: Icon(FontAwesomeIcons.addressCard,
                              color: Colors.black),
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          filled: true,
                          fillColor: null,
                          focusColor: Colors.white,
                          hoverColor: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Theme(
                      data: Theme.of(context).copyWith(
                        textSelectionTheme: const TextSelectionThemeData(
                            selectionColor: Colors.transparent),
                      ),
                      child: TextFormField(
                        enableInteractiveSelection: false,
                        keyboardType: TextInputType.emailAddress,
                        controller: _controllerEmail,
                        cursorColor: Colors.black,
                        onTap: () {
                          setState(() {
                            _controllerEmail.text = textValueEmail;
                            _controllerEmail.selection = TextSelection(
                                baseOffset: 0,
                                extentOffset: textValueEmail.length);
                          });
                        },
                        onChanged: (value) {
                          setState(() {
                            textValueEmail = value;
                          });
                        },
                        decoration: const InputDecoration(
                          label: Text('EMAIL *'),
                          labelStyle: TextStyle(color: Colors.black),
                          icon: Icon(FontAwesomeIcons.envelopeOpenText,
                              color: Colors.black),
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          filled: true,
                          fillColor: null,
                          focusColor: Colors.white,
                          hoverColor: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Theme(
                      data: Theme.of(context).copyWith(
                        textSelectionTheme: const TextSelectionThemeData(
                            selectionColor: Colors.transparent),
                      ),
                      child: TextFormField(
                        enableInteractiveSelection: false,
                        keyboardType: TextInputType.phone,
                        controller: _controllerTel,
                        cursorColor: Colors.black,
                        onTap: () {
                          setState(() {
                            _controllerTel.text = textValueTel;
                            _controllerTel.selection = TextSelection(
                                baseOffset: 0,
                                extentOffset: textValueTel.length);
                          });
                        },
                        onChanged: (value) {
                          setState(() {
                            textValueTel = value;
                          });
                        },
                        decoration: const InputDecoration(
                          label: Text('N° de TELEPHONE'),
                          labelStyle: TextStyle(color: Colors.black),
                          icon: Icon(
                            FontAwesomeIcons.phone,
                            color: Colors.black,
                          ),
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          filled: true,
                          fillColor: null,
                          focusColor: Colors.white,
                          hoverColor: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Semantics(
                      //button: true,
                      label: "Faites suivant pour pouvoir entrer votre ",
                      child: Container(
                        decoration: BoxDecoration(border: Border.all()),
                        child: ListTile(
                          leading: const Text('Date de naissance'),
                          trailing: Semantics(
                            label: "calendrier",
                            child: IconButton(
                              onPressed: () {
                                showDatePicker(
                                  //locale: const Locale('fr', 'FR'),
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1920),
                                  lastDate: DateTime(2023),
                                );
                              },
                              icon: const Icon(FontAwesomeIcons.calendarDay),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 100,
                          decoration: BoxDecoration(border: Border.all()),
                          //color: Colors.red,
                          child: TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Annuler',
                              style:
                                  TextStyle(fontSize: 15, color: Colors.black),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        Container(
                          width: 100,
                          decoration: BoxDecoration(border: Border.all()),
                          //color: Colors.yellow,
                          child: TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Valider',
                              style:
                                  TextStyle(fontSize: 15, color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
