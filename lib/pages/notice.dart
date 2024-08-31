import 'package:flutter/material.dart';

class NoticePage extends StatelessWidget {
  const NoticePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0,
        title: const Text(
          'Activity',
          style: TextStyle(fontWeight: FontWeight.w800, color: Colors.white),
        ),
        centerTitle: true,
        // actions: [
        //   IconButton(
        //     icon: const Icon(Icons.search, color: Colors.black),
        //     onPressed: () {},
        //   ),
        //   Stack(
        //     children: [
        //       IconButton(
        //         icon: const Icon(Icons.notifications, color: Colors.black),
        //         onPressed: () {},
        //       ),
        //       Positioned(
        //         right: 11,
        //         top: 11,
        //         child: Container(
        //           padding: const EdgeInsets.all(2),
        //           decoration: BoxDecoration(
        //             color: Colors.red,
        //             borderRadius: BorderRadius.circular(10),
        //           ),
        //           constraints: const BoxConstraints(
        //             minWidth: 18,
        //             minHeight: 18,
        //           ),
        //           child: const Text(
        //             '5',
        //             style: TextStyle(
        //               color: Colors.white,
        //               fontSize: 10,
        //             ),
        //             textAlign: TextAlign.center,
        //           ),
        //         ),
        //       )
        //     ],
        //   ),
        // ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Announcements',
              style: TextStyle(
                fontSize: 22,
                // fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            NoticeButton(
              date: 'May 23',
              time: '10:30 AM',
              name: 'Seema Dhami',
              update: 'posted Class Update',
              content:
                  'That timing for Tuesday will be the same i.e school timing for Tuesday will be the same...',
              daysAgo: '2 days ago',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NoticeDetailPage(
                      title: 'Class Update',
                      content:
                          'That timing for Tuesday will be the same i.e school timing for Tuesday with be the same...',
                      name: 'Seema Dhami',
                      date: 'May 23',
                      time: '10:30 AM',
                    ),
                  ),
                );
              },
            ),
            NoticeButton(
              date: 'May 23',
              time: '9:00 AM',
              name: 'Vijay Sharma',
              update: 'posted Message',
              content:
                  'Message content in Hindi or another language goes here...',
              daysAgo: '2 days ago',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NoticeDetailPage(
                      title: 'Message',
                      content:
                          'Message content in Hindi or another language goes here...',
                      name: 'Vijay Sharma',
                      date: 'May 23',
                      time: '9:00 AM',
                    ),
                  ),
                );
              },
            ),
            NoticeButton(
              date: 'May 23',
              time: '8:00 AM',
              name: 'Gazal',
              update: 'posted School Notice',
              content:
                  'The campaign to pay for SOF Olympiad is ongoing for today...',
              daysAgo: '2 days ago',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NoticeDetailPage(
                      title: 'School Notice',
                      content:
                          'The campaign to pay for SOF Olympiad is ongoing for today...',
                      name: 'Gazal',
                      date: 'May 23',
                      time: '8:00 AM',
                    ),
                  ),
                );
              },
            ),
            // const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: const Text('View more'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NoticeButton extends StatelessWidget {
  final String date;
  final String time;
  final String name;
  final String update;
  final String content;
  final String daysAgo;
  final VoidCallback onPressed;

  const NoticeButton({
    super.key,
    required this.date,
    required this.time,
    required this.name,
    required this.update,
    required this.content,
    required this.daysAgo,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          padding: const EdgeInsets.all(0),
          shadowColor: Colors.grey.withOpacity(0.3),
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: onPressed,
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundColor: Colors.green,
                child: Text(
                  name[0],
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$name $update',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 53, 133, 56),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      content,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      daysAgo,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
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

class NoticeDetailPage extends StatelessWidget {
  final String title;
  final String content;
  final String name;
  final String date;
  final String time;

  const NoticeDetailPage({
    super.key,
    required this.title,
    required this.content,
    required this.name,
    required this.date,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        title: Text(
          title,
          style: const TextStyle(color: Colors.white70),
        ),
        backgroundColor: Colors.green[800],
        elevation: 0,
      ),
      body: Container(
        color: Colors.green[50],
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.green[800],
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'From: $name',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        const Icon(Icons.calendar_today,
                            size: 18, color: Colors.white70),
                        const SizedBox(width: 8),
                        Text(
                          date,
                          style: const TextStyle(
                              fontSize: 16, color: Colors.white70),
                        ),
                        const SizedBox(width: 20),
                        const Icon(Icons.access_time,
                            size: 18, color: Colors.white70),
                        const SizedBox(width: 8),
                        Text(
                          time,
                          style: const TextStyle(
                              fontSize: 16, color: Colors.white70),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  content,
                  style: const TextStyle(
                    fontSize: 16,
                    height: 1.5,
                    color: Colors.black87,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add action here, e.g., share or bookmark the notice
        },
        backgroundColor: Colors.green[800],
        child: const Icon(Icons.share, color: Colors.white),
      ),
    );
  }
}
