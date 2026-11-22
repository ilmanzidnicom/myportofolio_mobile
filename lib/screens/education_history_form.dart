import 'package:material_ui/material_ui.dart';
import 'package:flutter/services.dart';
import 'package:myportofolio_mobile/widgets/left_drawer.dart';
import 'package:myportofolio_mobile/widgets/main_app_bar.dart';

class EducationHistoryFormPage extends StatefulWidget {
  const EducationHistoryFormPage({super.key});

  @override
  State<EducationHistoryFormPage> createState() => _EducationHistoryFormPageState();
}

class _EducationHistoryFormPageState extends State<EducationHistoryFormPage> {
  final _formKey = GlobalKey<FormState>();

  String _educationTitle = "";
  String _school = "";
  String _description = "";
  int _startedAtYear = 0;
  int? _endedAtYear;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(title: "Add Education History", centerTitle: true),
      drawer: LeftDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // === Education Title ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "High School",
                    labelText: "Education Title",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _educationTitle = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Education Title tidak boleh kosong!";
                    }
                    return null;
                  },
                ),
              ),

              // === School ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "SMAN 8 Bekasi",
                    labelText: "School",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _school = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return "School tidak boleh kosong!";
                    }
                    return null;
                  },
                ),
              ),

              // === Description ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: "Deskripsikan pengalamanmu",
                    labelText: "Description",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _description = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Deskripsi tidak boleh kosong!";
                    }
                    return null;
                  },
                ),
              ),

              // === Started at Year ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  // https://stackoverflow.com/questions/50123742/how-to-use-inputformatter-on-flutter-textfield
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  decoration: InputDecoration(
                    hintText: "2025",
                    labelText: "Started at Year",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String value) {
                    setState(() {
                      _startedAtYear = int.tryParse(value) ?? 0;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Started at Year tidak boleh kosong!";
                    }
                    if (int.tryParse(value) == null) {
                      return "Started at Year harus valid!";
                    }
                    return null;
                  },
                ),
              ),

              // === Ended at Year ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  decoration: InputDecoration(
                    hintText: "2030",
                    labelText: "Ended at Year",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String value) {
                    setState(() {
                      _endedAtYear = int.tryParse(value);
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return null;
                    }

                    final endedAtValue = int.tryParse(value);
                    if (endedAtValue == null) {
                      return "Ended at Year harus valid!";
                    }
                    if (endedAtValue < _startedAtYear) {
                      return "Ended at Year tidak boleh lebih kecil dari Started at Year!";
                    }

                    return null;
                  },
                ),
              ),



              // === Tombol Simpan ===
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          WidgetStateProperty.all(Colors.indigo),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Education History berhasil ditambahkan!'),
                              content: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Education Title: $_educationTitle'),
                                    Text('School: $_school'),
                                    Text('Deskripsi: $_description'),
                                    Text('Started at Year: $_startedAtYear'),
                                    Text('Ended at Year: ${_endedAtYear ?? "Present"}'),
                                  ],
                                ),
                              ),
                              actions: [
                                TextButton(
                                  child: const Text('OK'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                    _formKey.currentState!.reset();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                    child: const Text(
                      "Save",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}