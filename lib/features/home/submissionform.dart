import 'package:flutter/material.dart';

class SubmissionForm extends StatefulWidget {
  const SubmissionForm({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SubmissionFormState createState() => _SubmissionFormState();
}

class _SubmissionFormState extends State<SubmissionForm> {
  final _formKey = GlobalKey<FormState>();
  String _perihal = 'Surat Pengantar'; // Default selected value
  bool _isOtherSelected = false; // To check if "Other" is selected

  // List of options for "Perihal"
  final List<String> _perihalOptions = [
    'Surat Pengantar',
    'Surat Perizinan',
    'Surat Keterangan',
    'Laporan',
    'Lainnya'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 80),
              // Title "Form Pengajuan"
              const Text(
                'Form Pengajuan',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),

              // Form starts here
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Input for Name
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Nama',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(color: Colors.lightBlue),
                        ),
                      ),
                      onSaved: (value) {},
                    ),
                    const SizedBox(height: 16),

                    // Input for NIK
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'NIK',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(color: Colors.lightBlue),
                        ),
                      ),
                      onSaved: (value) {},
                    ),
                    const SizedBox(height: 16),

                    // Dropdown for Perihal
                    DropdownButtonFormField<String>(
                      value: _perihal,
                      decoration: InputDecoration(
                        labelText: 'Perihal',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(color: Colors.lightBlue),
                        ),
                      ),
                      items: _perihalOptions.map((String option) {
                        return DropdownMenuItem<String>(
                          value: option,
                          child: Text(option),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          _perihal = newValue!;
                          _isOtherSelected = newValue == 'Lainnya';
                        });
                      },
                    ),

                    // If "Other" is selected, show a text field for additional input
                    if (_isOtherSelected) ...[
                      const SizedBox(height: 16),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Masukkan Detail',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide:
                                const BorderSide(color: Colors.lightBlue),
                          ),
                        ),
                      ),
                    ],

                    const SizedBox(height: 32),

                    // Submit Button
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          // Handle form submission logic here
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Form Submitted!')),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF4FC8ED),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text(
                        'KIRIM',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Cancel Button
                    TextButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Cancel'),
                              content: const Text(
                                  'Are you sure you want to cancel?'),
                              actions: <Widget>[
                                TextButton(
                                  child: const Text('Yes'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                                TextButton(
                                  child: const Text('No'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.grey,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: const Text(
                        'BATAL',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
