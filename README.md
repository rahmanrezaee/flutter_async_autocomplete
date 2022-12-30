# Flutter Async Autocomplete

A Flutter plugin make easy to dynamic autocomplete input

# Preview
<img src="[https://i.imgur.com/ZWnhY9T.png](https://raw.githubusercontent.com/rahmanrezaee/flutter_async_autocomplete/master/preview/preview.gif)" height="280">


## ToDo
* Add validation functionality
* Add possibility to show empty message when no suggestion is found
## Done
* Add asynchronous suggestions fetch

## Installation

In the `pubspec.yaml` of your flutter project, add the following dependency:

``` yaml
dependencies:
  ...
  flutter_async_autocomplete: ^0.0.1
```

## Basic example

You can create a simple autocomplete input widget as shown in first preview with the following example:

``` dart
import 'package:flutter/material.dart';
import 'package:flutter_async_autocomplete/flutter_async_autocomplete.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var autoController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Example',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(title: Text('Example')),
          body: Container(
            padding: EdgeInsets.all(10),
            alignment: Alignment.center,
            child: AsyncAutocomplete<Country>(
              controller: autoController,
              onTapItem: (Country country) {
                autoController.text = country.name;
                print("selected Country ${country.name}");
              },
              suggestionBuilder: (data) => ListTile(
                title: Text(data.name),
                subtitle: Text(data.code),
              ),
              asyncSuggestions: (searchValue) => getCountry(searchValue),
            ),
          ),
        ),
      ),
    );
  }

  Future<List<Country>> getCountry(String search) async {
    List<Country> countryList = [
      Country(name: 'Afghanistan', code: 'AF'),
      Country(name: 'Åland Islands', code: 'AX'),
    
    ];

    await Future.delayed(const Duration(microseconds: 500));
    return countryList
        .where((element) =>
            element.name.toLowerCase().startsWith(search.toLowerCase()))
        .toList();
  }

  onChange(value) {
    //  <Country>(value) {
    setState(() {
      autoController.text = value.name;
    });
    print('onChanged value: ${value.name}');
  }
}

class Country {
  String name;
  String code;

  Country({required this.code, required this.name});
}
```

## Example with customized style

You can customize other aspects of the autocomplete widget such as the suggestions text style, background color and others as shown in example below:

``` dart
    EasyAutocomplete(
        ...
        ,
        cursorColor: Colors.purple,
            decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(
                color: Colors.purple,
                style: BorderStyle.solid
                )
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(
                color: Colors.purple,
                style: BorderStyle.solid
                )
            )
        ),       
    )
       
```
The above example will generate something like below preview:

## Issues & Suggestions
If you encounter any issue you or want to leave a suggestion you can do it by filling an [issue](https://github.com/rahmanrezaee/flutter_async_autocomplete/issues).

### Thank you for the support!
