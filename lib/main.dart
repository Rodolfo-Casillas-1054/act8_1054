import 'package:flutter/material.dart';
import 'download_button.dart';

void main() {
  runApp(const DownloadApp());
}

class DownloadApp extends StatelessWidget {
  const DownloadApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Botones de Descarga',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF9F9F9),
      ),
      home: const DownloadPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class DownloadPage extends StatelessWidget {
  const DownloadPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            DownloadButton(
              color: Color(0xff002aff),
              downloadedColor: Color(0xff919fcd),
            ),
            SizedBox(height: 16),
            DownloadButton(
              color: Color(0xffffab00),
              downloadedColor: Color(0xffd9b66e),
            ),
            SizedBox(height: 16),
            DownloadButton(
              color: Color(0xff42de17),
              downloadedColor: Color(0xff90dc66),
            ),
            SizedBox(height: 16),
            DownloadButton(
              color: Color(0xffe81a08),
              downloadedColor: Color(0xfff18884),
            ),
          ],
        ),
      ),
    );
  }
}
