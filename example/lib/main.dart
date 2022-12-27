import 'package:flutter/material.dart';
import 'package:flutter_async_autocomplete/flutter_async_autocomplete.dart';

void main() {
  runApp(MyApp());
}

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
      Country(name: 'Albania', code: 'AL'),
      Country(name: 'Algeria', code: 'DZ'),
      Country(name: 'American Samoa', code: 'AS'),
      Country(name: 'AndorrA', code: 'AD'),
      Country(name: 'Angola', code: 'AO'),
      Country(name: 'Anguilla', code: 'AI'),
      Country(name: 'Antarctica', code: 'AQ'),
      Country(name: 'Antigua and Barbuda', code: 'AG'),
      Country(name: 'Argentina', code: 'AR'),
      Country(name: 'Armenia', code: 'AM'),
      Country(name: 'Aruba', code: 'AW'),
      Country(name: 'Australia', code: 'AU'),
      Country(name: 'Austria', code: 'AT'),
      Country(name: 'Azerbaijan', code: 'AZ'),
      Country(name: 'Bahamas', code: 'BS'),
      Country(name: 'Bahrain', code: 'BH'),
      Country(name: 'Bangladesh', code: 'BD'),
      Country(name: 'Barbados', code: 'BB'),
      Country(name: 'Belarus', code: 'BY'),
      Country(name: 'Belgium', code: 'BE'),
      Country(name: 'Belize', code: 'BZ'),
      Country(name: 'Benin', code: 'BJ'),
      Country(name: 'Bermuda', code: 'BM'),
      Country(name: 'Bhutan', code: 'BT'),
      Country(name: 'Bolivia', code: 'BO'),
      Country(name: 'Bosnia and Herzegovina', code: 'BA'),
      Country(name: 'Botswana', code: 'BW'),
      Country(name: 'Bouvet Island', code: 'BV'),
      Country(name: 'Brazil', code: 'BR'),
      Country(name: 'British Indian Ocean Territory', code: 'IO'),
      Country(name: 'Brunei Darussalam', code: 'BN'),
      Country(name: 'Bulgaria', code: 'BG'),
      Country(name: 'Burkina Faso', code: 'BF'),
      Country(name: 'Burundi', code: 'BI'),
      Country(name: 'Cambodia', code: 'KH'),
      Country(name: 'Cameroon', code: 'CM'),
      Country(name: 'Canada', code: 'CA'),
      Country(name: 'Cape Verde', code: 'CV'),
      Country(name: 'Cayman Islands', code: 'KY'),
      Country(name: 'Central African Republic', code: 'CF'),
      Country(name: 'Chad', code: 'TD'),
      Country(name: 'Chile', code: 'CL'),
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
