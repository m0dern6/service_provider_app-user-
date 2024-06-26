import 'package:flutter/material.dart';
import 'package:service_provide_app/ui/customer_elements/customer_portal.dart';
import 'package:service_provide_app/ui/customer_elements/customer_profile.dart';
import 'package:service_provide_app/ui/customer_elements/customer_settings.dart';
import 'package:service_provide_app/ui/customer_elements/services.dart';

class CustomerHomeScreen extends StatefulWidget {
  final String token;
  const CustomerHomeScreen({required this.token, Key? key}) : super(key: key);

  @override
  State<CustomerHomeScreen> createState() => _CustomerHomeScreenState();
}

class _CustomerHomeScreenState extends State<CustomerHomeScreen> {
  int _currentIndex = 0;
  Color _bodyColor = Colors.white;
  Color _textColor = Colors.black;
  Color _unselectedIconColor = Colors.orangeAccent;
  Color _selectedIconColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    late Widget _currentPage;
    switch (_currentIndex) {
      case 0:
        _currentPage = CustomerPortal(textColor: _textColor);
        break;
      case 1:
        _currentPage = Services(textColor: _textColor);
        break;
      case 2:
        _currentPage = const CustomerSettingScreen();
        break;
      case 3:
        _currentPage = CustomerProfile(token: widget.token);
    }
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                _bodyColor =
                    _bodyColor == Colors.white ? Colors.black : Colors.white;
                _textColor =
                    _textColor == Colors.black ? Colors.white : Colors.black;
              });
            },
            icon: Icon(Icons.brightness_2),
          ),
        ],
        backgroundColor: Theme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        title: const Text(
          'Service Pro',
          style: TextStyle(color: Colors.white),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Theme.of(context).primaryColor,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: 'Services'),
          BottomNavigationBarItem(
              icon: Icon(Icons.bookmark_border), label: 'Bookings'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        unselectedItemColor: _selectedIconColor,
        selectedItemColor: _unselectedIconColor,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      body: Container(color: _bodyColor, child: _currentPage),
    );
  }
}
