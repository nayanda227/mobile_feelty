import 'package:flutter/material.dart';
import 'package:uts_feelty/Updateprofile.dart';
import 'package:uts_feelty/gnavbar.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Profile',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(
                    'https://pannkpop.com/wp-content/uploads/2023/10/BTS-Jungkooks-solo-album-GOLDEN-concept-photo-SOLID-4-768x751.jpg',
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Jeon Jungkook',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'jeonjungkook@gmail.com',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.edit, color: Colors.orange),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildInfoCard('68 kg', 'Weight'),
                _buildInfoCard('27', 'Years Old'),
                _buildInfoCard('181 cm', 'Height'),
              ],
            ),
            const SizedBox(height: 20),
            _buildSectionTitle('Account'),
            _buildListTile(Icons.person, 'Your profile', () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const UpdateProfilePage(),
                ),
              );
            }),
            _buildListTile(Icons.settings, 'Settings', () {}),
            _buildListTile(Icons.help_outline, 'Help center', () {}),
            _buildListTile(Icons.notifications, 'Notifications', () {}),
            _buildListTile(Icons.language, 'Change language', () {}),
            _buildListTile(Icons.account_circle, 'Manage accounts', () {}),
            const SizedBox(height: 20),
            _buildSectionTitle('General'),
            _buildListTile(Icons.privacy_tip, 'Privacy Policy', () {}),
            _buildListTile(Icons.article, 'Terms of Service', () {}),
            _buildListTile(Icons.star, 'Rate Feelty App', () {}),
            const SizedBox(height: 20),
            const Text(
              'PT. Feelty Indonesia',
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const NavBar(),
    );
  }

  Widget _buildInfoCard(String value, String label) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.orange),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.orange,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(fontSize: 12, color: Colors.grey),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _buildListTile(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.orange),
      title: Text(title),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}
