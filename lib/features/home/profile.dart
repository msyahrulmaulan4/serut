import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? _profileImage;
  final _picker = ImagePicker();

  // Form Controllers
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _nikController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();

  // Function to pick image from gallery
  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

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

              // Title "Profile" centered
              const Text(
                "Profile",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center, // Centered text
              ),
              const SizedBox(height: 32),

              // Profile Picture
              Center(
                child: GestureDetector(
                  onTap: _pickImage,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: const Color(0xFF4FC8ED),
                    child: _profileImage == null
                        ? const Icon(
                            Icons.camera_alt,
                            size: 40,
                            color: Colors.white,
                          )
                        : ClipOval(
                            child: Image.file(
                              _profileImage!,
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Form Fields
              Form(
                child: Column(
                  children: [
                    buildTextField(
                        controller: _emailController, label: 'Email'),
                    const SizedBox(height: 16),
                    buildTextField(controller: _nameController, label: 'Nama'),
                    const SizedBox(height: 16),
                    buildTextField(controller: _nikController, label: 'NIK'),
                    const SizedBox(height: 16),
                    buildTextField(
                      controller: _dobController,
                      label: 'Tanggal Lahir',
                      isDate: true,
                    ),
                    const SizedBox(height: 32),

                    // Save Button (matches style from other screens)
                    ElevatedButton(
                      onPressed: () {
                        // Handle save action
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text("Profile updated successfully!")),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color(0xFF4FC8ED), // Consistent color
                        padding: const EdgeInsets.symmetric(
                            horizontal: 100, vertical: 15), // Padding style
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(30), // Rounded corners
                        ),
                        elevation: 5, // Slight elevation for effect
                      ),
                      child: const Text(
                        'Simpan',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold, // Consistent bold text
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Sign Out Text with Underline
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          // Handle sign out action
                        },
                        child: const Text(
                          'Sign Out',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                            decoration: TextDecoration.underline,
                          ),
                        ),
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

  // Function to build form fields
  Widget buildTextField({
    required TextEditingController controller,
    required String label,
    bool isDate = false,
  }) {
    return TextField(
      controller: controller,
      keyboardType: isDate ? TextInputType.datetime : TextInputType.text,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius:
              BorderRadius.circular(30), // Same style as other screens
          borderSide: const BorderSide(color: Colors.lightBlue),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      ),
      readOnly: isDate,
      onTap: isDate
          ? () async {
              DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1900),
                lastDate: DateTime.now(),
              );
              if (pickedDate != null) {
                setState(() {
                  _dobController.text =
                      "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
                });
              }
            }
          : null,
    );
  }
}
