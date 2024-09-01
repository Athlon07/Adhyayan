import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final String name;
  final String schoolName;
  final String className;
  final String gender;
  final String? photoUrl;

  const ProfilePage({
    super.key,
    required this.name,
    required this.schoolName,
    required this.className,
    required this.gender,
    this.photoUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0,
        title: const Text(
          'Student Profile',
          style: TextStyle(fontWeight: FontWeight.w800, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Stack(
                        children: [
                          CircleAvatar(
                            radius: 60,
                            backgroundColor: Colors.green[100],
                            backgroundImage: photoUrl != null
                                ? NetworkImage(photoUrl!)
                                : null, // Use photo if available
                            child: photoUrl == null
                                ? Icon(
                                    Icons.person,
                                    size: 60,
                                    color: Colors.green[700],
                                  )
                                : null, // Show icon if no photo
                          ),
                          Positioned(
                            bottom: 0,
                            right: 4,
                            child: Container(
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              child: const Icon(
                                Icons.camera_alt,
                                color: Colors.green,
                                size: 28,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),

                    // Name Field
                    ProfileDetailField(
                      label: 'Name',
                      value: name,
                    ),
                    const SizedBox(height: 20),

                    // Class Field
                    ProfileDetailField(
                      label: 'Class',
                      value: className,
                    ),
                    const SizedBox(height: 20),

                    // School Name Field
                    ProfileDetailField(
                      label: 'School Name',
                      value: schoolName,
                    ),
                    const SizedBox(height: 20),

                    // Gender Field
                    ProfileDetailField(
                      label: 'Gender',
                      value: gender,
                    ),
                  ],
                ),
              ),
            ),
            // LogOut Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'LOGOUT',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 2,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileDetailField extends StatelessWidget {
  final String label;
  final String value;

  const ProfileDetailField({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: true, // Makes the field uneditable
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(
          color: Colors.green,
          fontWeight: FontWeight.bold,
        ),
        
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
      controller: TextEditingController(text: value),
      style: const TextStyle(
        color: Colors.black54,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    );
  }
}
