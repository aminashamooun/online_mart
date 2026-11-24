
import 'package:flutter/material.dart';

void main() {
  runApp(const MyProfileApp());
}

class MyProfileApp extends StatelessWidget {
  const MyProfileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Profile',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFFF0055),
        ),
      ),
      home:  ProfilePage(),
    );
  }
}


class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  static  Color pink = Color(0xFFFF0055);
  static  Color dark = Color(0xFF170D29);

  static  List<Map<String, dynamic>> menuItems = [
    {'title': 'My Orders', 'icon': Icons.shopping_bag_outlined},
    {'title': 'My Wishlist', 'icon': Icons.favorite_border},
    {'title': 'My Addresses', 'icon': Icons.location_on_outlined},
    {'title': 'Payment Methods', 'icon': Icons.credit_card_outlined},
    {'title': 'Notifications', 'icon': Icons.notifications_none},
    {'title': 'Settings', 'icon': Icons.settings_outlined},
    {'title': 'Help & Support', 'icon': Icons.help_outline},
    {'title': 'About Us', 'icon': Icons.info_outline},
  ];

  void openPage(BuildContext context, String title, IconData icon) {
    if (title == 'Notifications') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) =>  NotificationPage(),
        ),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => DetailPage(title: title, icon: icon),
        ),
      );
    }
  }

  void showEditDialog(BuildContext context) {
    final nameController =
    TextEditingController(text: 'Amina Shamoon');
    final emailController =
    TextEditingController(text: 'aminashamoon@gmail.com');

    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title:  Text('Edit Profile'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration:  InputDecoration(
                  labelText: 'Full Name',
                  border: OutlineInputBorder(),
                ),
              ),
               SizedBox(height: 12),
              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration:  InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child:  Text('Cancel'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: pink,
              foregroundColor: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(dialogContext);
              ScaffoldMessenger.of(context).showSnackBar(
                 SnackBar(
                  content: Text('Profile changes submitted!'),
                ),
              );
            },
            child:  Text('Save'),
          ),
        ],
      ),
    );
  }

  void logout(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title:  Text('Logout'),
        content:  Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child:  Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(dialogContext);
              ScaffoldMessenger.of(context).showSnackBar(
                 SnackBar(
                  content: Text('Logged out successfully'),
                ),
              );
            },
            child:  Text(
              'Logout',
              style: TextStyle(color: pink),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isWide = constraints.maxWidth > 600;
            final horizontalPadding = isWide ? 28.0 : 16.0;

            return Center(
              child: ConstrainedBox(
                constraints:  BoxConstraints(maxWidth: 600),
                child: SingleChildScrollView(
                  physics:  AlwaysScrollableScrollPhysics(),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: horizontalPadding,
                      vertical: 10,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.maybePop(context);
                              },
                              icon:  Icon(
                                Icons.arrow_back_ios,
                                size: 20,
                                color: Colors.pink,
                              ),
                            ),
                             Expanded(
                              child: Center(
                                child: Text(
                                  'My Profile',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.pink,
                                  ),
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () => openPage(
                                context,
                                'Settings',
                                Icons.settings_outlined,
                              ),
                              icon:  Icon(
                                Icons.settings_outlined,
                                color: Colors.pink,
                              ),
                            ),
                          ],
                        ),

                         SizedBox(height: 15),
                        Stack(
                          children: [
                            Container(
                              height: 105,
                              width: 105,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color:  Color(0xFFF4E3F2),
                                border: Border.all(
                                  color:  Color(0xFFFFD5E2),
                                  width: 3,
                                ),
                              ),
                              child:  Icon(
                                Icons.person,
                                size: 68,
                                color: Color(0xFF9C6C78),
                              ),
                            ),
                            Positioned(
                              right: 0,
                              bottom: 0,
                              child: InkWell(
                                onTap: () => showEditDialog(context),
                                borderRadius: BorderRadius.circular(30),
                                child: Container(
                                  padding:  EdgeInsets.all(8),
                                  decoration:  BoxDecoration(
                                    color: Colors.pink,
                                    shape: BoxShape.circle,
                                  ),
                                  child:  Icon(
                                    Icons.edit,
                                    size: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),

                         SizedBox(height: 12),

                         Text(
                          'Amina Shamoon',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.pink,
                          ),
                        ),

                         SizedBox(height: 5),

                         Text(
                          'aminashamoon@gmail.com',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey,
                          ),
                        ),

                         SizedBox(height: 22),
                         Divider(color: Color(0xFFEDE8F0)),
                         SizedBox(height: 8),


                        ...menuItems.map((item) {
                          return menuItem(
                            context,
                            item['icon'] as IconData,
                            item['title'] as String,
                          );
                        }),

                         Divider(color: Color(0xFFEDE8F0)),

                        menuItem(
                          context,
                          Icons.logout,
                          'Log Out',
                          isLogout: true,
                        ),

                         SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget menuItem(
      BuildContext context,
      IconData icon,
      String title, {
        bool isLogout = false,
      }) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 2),
      child: Material(
        color: Colors.white,
        child: InkWell(
          onTap: () {
            if (isLogout) {
              logout(context);
            } else {
              openPage(context, title, icon);
            }
          },
          child: Padding(
            padding:  EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 13,
            ),
            child: Row(
              children: [
                Icon(
                  icon,
                  size: 22,
                  color: isLogout ? pink : dark,
                ),
                 SizedBox(width: 16),
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: isLogout ? pink : dark,
                    ),
                  ),
                ),
                Icon(
                  Icons.chevron_right,
                  size: 21,
                  color: isLogout ? pink : Colors.grey,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DetailPage extends StatefulWidget {
  final String title;
  final IconData icon;

   DetailPage({
    super.key,
    required this.title,
    required this.icon,
  });

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  static const Color pink = Color(0xFFFF0055);
  static const Color dark = Color(0xFF170D29);

  final List<Map<String, String>> items = [];

  final TextEditingController firstController =
  TextEditingController();
  final TextEditingController secondController =
  TextEditingController();

  bool darkMode = false;
  bool emailNotifications = true;

  String get firstLabel {
    switch (widget.title) {
      case 'My Orders':
        return 'Order / Product Name';
      case 'My Wishlist':
        return 'Product Name';
      case 'My Addresses':
        return 'Address Name';
      case 'Payment Methods':
        return 'Payment Method';
      default:
        return 'Name';
    }
  }

  String get secondLabel {
    switch (widget.title) {
      case 'My Orders':
        return 'Order Details / Status';
      case 'My Wishlist':
        return 'Price / Details';
      case 'My Addresses':
        return 'Full Address';
      case 'Payment Methods':
        return 'Details (e.g. Visa **** 1234)';
      default:
        return 'Details';
    }
  }

  String get emptyMessage {
    switch (widget.title) {
      case 'My Orders':
        return 'No orders found';
      case 'My Wishlist':
        return 'Your wishlist is empty';
      case 'My Addresses':
        return 'No addresses added';
      case 'Payment Methods':
        return 'No payment methods added';
      default:
        return 'No data found';
    }
  }

  bool get canManage => [
    'My Orders',
    'My Wishlist',
    'My Addresses',
    'Payment Methods',
  ].contains(widget.title);

  @override
  void dispose() {
    firstController.dispose();
    secondController.dispose();
    super.dispose();
  }

  void addItem() {
    firstController.clear();
    secondController.clear();

    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text('Add ${widget.title}'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: firstController,
                decoration: InputDecoration(
                  labelText: firstLabel,
                  border:  OutlineInputBorder(),
                ),
              ),
               SizedBox(height: 14),
              TextField(
                controller: secondController,
                maxLines: 3,
                decoration: InputDecoration(
                  labelText: secondLabel,
                  border:  OutlineInputBorder(),
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child:  Text('Cancel'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: pink,
              foregroundColor: Colors.white,
            ),
            onPressed: () {
              if (firstController.text.trim().isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                   SnackBar(
                    content: Text('Please enter a name'),
                  ),
                );
                return;
              }

              setState(() {
                items.add({
                  'name': firstController.text.trim(),
                  'details': secondController.text.trim(),
                });
              });

              Navigator.pop(dialogContext);
              ScaffoldMessenger.of(context).showSnackBar(
                 SnackBar(content: Text('Added successfully!')),
              );
            },
            child:  Text('Save'),
          ),
        ],
      ),
    );
  }

  void deleteItem(int index) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title:  Text('Delete Item'),
        content:  Text('Are you sure you want to delete this item?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child:  Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              setState(() => items.removeAt(index));
              Navigator.pop(dialogContext);
              ScaffoldMessenger.of(context).showSnackBar(
                 SnackBar(content: Text('Deleted successfully!')),
              );
            },
            child:  Text(
              'Delete',
              style: TextStyle(color: pink),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color(0xFFFCFAFD),
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: dark,
        elevation: 0,
        centerTitle: true,
        title: Text(
          widget.title,
          style:  TextStyle(
            color: dark,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Center(
              child: ConstrainedBox(
                constraints:  BoxConstraints(maxWidth: 650),
                child: SingleChildScrollView(
                  physics:  AlwaysScrollableScrollPhysics(),
                  padding:  EdgeInsets.all(16),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight - 32,
                    ),
                    child: pageContent(),
                  ),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: canManage
          ? FloatingActionButton(
        backgroundColor: pink,
        foregroundColor: Colors.white,
        onPressed: addItem,
        child:  Icon(Icons.add),
      )
          : null,
    );
  }

  Widget pageContent() {
    switch (widget.title) {
      case 'Settings':
        return settingsContent();
      case 'Help & Support':
        return supportContent();
      case 'About Us':
        return aboutContent();
      default:
        return listContent();
    }
  }
  Widget listContent() {
    if (items.isEmpty) {
      return Center(
        child: Padding(
          padding:  EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(widget.icon, size: 65, color: pink),
               SizedBox(height: 15),
              Text(
                emptyMessage,
                textAlign: TextAlign.center,
                style:  TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: dark,
                ),
              ),
               SizedBox(height: 8),
               Text(
                'Tap the + button to add new data.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      );
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(items.length, (index) {
        final item = items[index];

        return Card(
          color: Colors.white,
          elevation: 1,
          margin:  EdgeInsets.only(bottom: 12),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor:  Color(0xFFFFE6EF),
              child: Icon(widget.icon, color: pink),
            ),
            title: Text(
              item['name'] ?? '',
              style:  TextStyle(
                color: dark,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              (item['details'] ?? '').isEmpty
                  ? 'No details'
                  : item['details']!,
            ),
            trailing: IconButton(
              onPressed: () => deleteItem(index),
              icon:  Icon(
                Icons.delete_outline,
                color: pink,
              ),
            ),
          ),
        );
      }),
    );
  }
  Widget settingsContent() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Card(
          color: Colors.white,
          child: SwitchListTile(
            secondary:  Icon(
              Icons.dark_mode_outlined,
              color: pink,
            ),
            title:  Text('Dark Mode'),
            subtitle:  Text('Enable dark mode preference'),
            activeColor: pink,
            value: darkMode,
            onChanged: (value) {
              setState(() => darkMode = value);
            },
          ),
        ),
        Card(
          color: Colors.white,
          child: SwitchListTile(
            secondary:  Icon(
              Icons.email_outlined,
              color: pink,
            ),
            title:  Text('Email Notifications'),
            subtitle:  Text('Receive email updates'),
            activeColor: pink,
            value: emailNotifications,
            onChanged: (value) {
              setState(() => emailNotifications = value);
            },
          ),
        ),
      ],
    );
  }
  Widget supportContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
         Icon(
          Icons.support_agent,
          size: 75,
          color: pink,
        ),
         SizedBox(height: 10),
         Text(
          'How can we help you?',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: dark,
          ),
        ),
         SizedBox(height: 22),
         Text(
          'Frequently Asked Questions',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
         SizedBox(height: 10),
         ExpansionTile(
          title: Text('How can I place an order?'),
          children: [
            Padding(
              padding: EdgeInsets.all(12),
              child: Text(
                'Select your product and follow the checkout process.',
              ),
            ),
          ],
        ),
         ExpansionTile(
          title: Text('How can I delete my wishlist item?'),
          children: [
            Padding(
              padding: EdgeInsets.all(12),
              child: Text(
                'Open My Wishlist and tap the delete icon.',
              ),
            ),
          ],
        ),
         ExpansionTile(
          title: Text('How can I update my address?'),
          children: [
            Padding(
              padding: EdgeInsets.all(12),
              child: Text(
                'Open My Addresses and add your new address.',
              ),
            ),
          ],
        ),
         SizedBox(height: 20),
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            backgroundColor: pink,
            foregroundColor: Colors.white,
            padding:  EdgeInsets.all(14),
          ),
          onPressed: contactSupport,
          icon:  Icon(Icons.message),
          label:  Text('Contact Support'),
        ),
      ],
    );
  }

  void contactSupport() {
    final controller = TextEditingController();

    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title:  Text('Contact Support'),
        content: TextField(
          controller: controller,
          maxLines: 4,
          decoration:  InputDecoration(
            hintText: 'Write your message...',
            border: OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child:  Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              if (controller.text.trim().isEmpty) return;
              Navigator.pop(dialogContext);
              ScaffoldMessenger.of(context).showSnackBar(
                 SnackBar(
                  content: Text('Message submitted (demo)'),
                ),
              );
            },
            child:  Text('Submit'),
          ),
        ],
      ),
    ).then((_) => controller.dispose());
  }
  Widget aboutContent() {
    return Center(
      child: Padding(
        padding:  EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
             CircleAvatar(
              radius: 45,
              backgroundColor: Color(0xFFFFE6EF),
              child: Icon(
                Icons.shopping_bag_outlined,
                color: pink,
                size: 50,
              ),
            ),
             SizedBox(height: 20),
             Text(
              'My Shopping App',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: dark,
              ),
            ),
             SizedBox(height: 12),
             Text(
              'Welcome to our shopping app. We provide a simple '
                  'and easy shopping experience for our customers.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
                height: 1.6,
              ),
            ),
             SizedBox(height: 20),
             Text(
              'Version 1.0.0',
              style: TextStyle(color: pink),
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationPage extends StatefulWidget {
   NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  bool notificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color(0xFFFCFAFD),
      appBar: AppBar(
        title:  Text('Notifications'),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: ListView(
        padding:  EdgeInsets.all(16),
        children: [
          Card(
            color: Colors.white,
            child: SwitchListTile(
              secondary:  Icon(
                Icons.notifications_active_outlined,
                color: Color(0xFFFF0055),
              ),
              title:  Text('Push Notifications'),
              subtitle:  Text(
                'Enable or disable notifications',
              ),
              activeColor:  Color(0xFFFF0055),
              value: notificationsEnabled,
              onChanged: (value) {
                setState(() {
                  notificationsEnabled = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
