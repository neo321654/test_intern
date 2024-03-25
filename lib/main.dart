import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:test_intern/s.dart';


void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const CustomForm(),
    );
  }
}

class CustomForm extends StatefulWidget {
  const CustomForm({super.key});

  @override
  CustomFormState createState() {
    return CustomFormState();
  }
}

class CustomFormState extends State<CustomForm> {
  final _formKey = GlobalKey<FormState>();
  final _controller = TextEditingController();
  String text = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: TextFormField(
                controller: _controller,
                decoration: InputDecoration(
                  hintText: S.of(context).enterText,
                  suffixIcon: IconButton(
                    onPressed: onPressClear,
                    icon: const Icon(Icons.clear),
                  ),
                ),
                validator: validate,
              ),
            ),
            ElevatedButton(
              onPressed: onPressButton,
              child: Text(S.of(context).sent),
            ),
          ],
        ),
      ),
    );
  }

  void onPressButton() {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        text = _controller.value.text;
      });
    }
  }

  String? validate(value) {
    if (value == null || value.isEmpty) {
      return S.of(context).enterField;
    }
    return null;
  }

  void onPressClear() {
    setState(() {
      _controller.clear();
      text = '';
    });
  }
}
