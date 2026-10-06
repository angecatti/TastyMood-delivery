import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../services/backend_service.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  ProfileScreenState createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {
  String? _name;
  String? _email;
  String? _address;
  String? _profileImage;
  final _addressController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadProfile();
  }

  @override
  void dispose() {
    _addressController.dispose();
    super.dispose();
  }

  Future<void> _loadProfile() async {
    final prefs = await SharedPreferences.getInstance();
    if (!mounted) {
      return;
    }
    setState(() {
      _name = prefs.getString('name') ?? prefs.getString('email') ?? 'Guest';
      _email = prefs.getString('email');
      _address = prefs.getString('address');
      _profileImage = prefs.getString('profileImage');
      _addressController.text = _address ?? '';
    });
  }

  Future<void> _saveAddress() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('address', _addressController.text.trim());
    if (!mounted) {
      return;
    }
    setState(() {
      _address = _addressController.text.trim();
    });
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Address saved')));
  }

  Future<void> _pickProfileImage() async {
    // Open bottom sheet and load available asset images inside a FutureBuilder
    showModalBottomSheet<void>(
      context: context,
      builder: (ctx) {
        return FutureBuilder<List>(
          future: BackendService.fetchMenu(),
          builder: (c, snap) {
            if (snap.connectionState == ConnectionState.waiting) {
              return const SizedBox(
                height: 200,
                child: Center(child: CircularProgressIndicator()),
              );
            }
            final images = (snap.data ?? [])
                .map((m) => (m as dynamic).imagePath as String)
                .toSet()
                .toList();
            return GridView.count(
              crossAxisCount: 3,
              children: images.map((path) {
                return GestureDetector(
                  onTap: () {
                    final selected = path;
                    setState(() {
                      _profileImage = selected;
                    });
                    // persist without awaiting to avoid using context across async gaps
                    SharedPreferences.getInstance().then(
                        (prefs) => prefs.setString('profileImage', selected));
                    Navigator.pop(ctx);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(path,
                        fit: BoxFit.cover,
                        errorBuilder: (c, e, s) =>
                            const Icon(Icons.broken_image)),
                  ),
                );
              }).toList(),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Center(
              child: GestureDetector(
                onTap: _pickProfileImage,
                child: CircleAvatar(
                  radius: 48,
                  backgroundColor: Colors.grey.shade200,
                  backgroundImage:
                      _profileImage != null ? AssetImage(_profileImage!) : null,
                  child: _profileImage == null
                      ? const Icon(Icons.person, size: 48)
                      : null,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Center(
                child: Text(_name ?? '',
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold))),
            const SizedBox(height: 4),
            Center(child: Text(_email ?? '')),
            const SizedBox(height: 20),
            TextFormField(
              controller: _addressController,
              decoration: const InputDecoration(labelText: 'Address'),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
                onPressed: _saveAddress, child: const Text('Save Address')),
            const SizedBox(height: 24),
            const Text('Profile pictures from assets',
                style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            ElevatedButton(
                onPressed: _pickProfileImage,
                child: const Text('Choose Image')),
          ],
        ),
      ),
    );
  }
}
