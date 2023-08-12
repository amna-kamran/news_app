// import 'package:flutter/material.dart';
// import 'package:news_app/screens/news_container.dart';
// import 'package:news_app/services/news_provider.dart';
// import '../model/news.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   late Future<News> newsFuture;

//   @override
//   void initState() {
//     super.initState();
//     newsFuture = NewsProvider.fetchNews();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: FutureBuilder<News>(
//         future: newsFuture,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else if (!snapshot.hasData) {
//             return Center(child: Text('No news data available.'));
//           } else {
//             News news = snapshot.data!;
//             return PageView.builder(
//               scrollDirection: Axis.vertical,
//               itemCount: 1,
//               itemBuilder: (context, index) {
//                 return Center(
//                   child: NewsContainer(
//                     news: news,
//                   ),
//                 );
//               },
//             );
//           }
//         },
//       ),
//     );
//   }
// }
