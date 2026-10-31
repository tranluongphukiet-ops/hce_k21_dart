import 'package:flutter/material.dart';

class Trang1 extends StatelessWidget {
  const Trang1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Image.asset(
            'images/anh1.jpg',
            width: 300,
            height: 200,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return const SizedBox(
                width: 120,
                height: 120,
                child: Center(child: Text('Khong tai duoc anh')),
              );
            },
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('images/anh2.jpg'),
          ),
          const Text(
            'Xin chào Việt Nam',
            style: TextStyle(fontSize: 20),
            softWrap: true,
          ),
          Row(
            children: [
              Image.asset(
                'images/anh1.jpg',
                width: 150,
                height: 100,
                fit: BoxFit.cover,
              ),
              const SizedBox(width: 50),
              Image.asset(
                'images/anh2.jpg',
                width: 150,
                height: 100,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
