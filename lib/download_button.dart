import 'package:flutter/material.dart';

class DownloadButton extends StatefulWidget {
  final Color color;
  final Color downloadedColor;

  const DownloadButton({
    super.key,
    required this.color,
    required this.downloadedColor,
  });

  @override
  State<DownloadButton> createState() => _DownloadButtonState();
}

class _DownloadButtonState extends State<DownloadButton>
    with SingleTickerProviderStateMixin {
  bool downloaded = false;
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(-1.5, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  void handleDownload() {
    if (!downloaded) {
      _controller.forward().then((_) {
        setState(() {
          downloaded = true;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: handleDownload,
      child: Container(
        width: 200,
        height: 50,
        decoration: BoxDecoration(
          color: downloaded ? widget.downloadedColor : widget.color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: downloaded
                ? SlideTransition(
                    position: _slideAnimation,
                    child: const Text(
                      "Descargado",
                      key: ValueKey("descargado"),
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                : Row(
                    key: const ValueKey("download"),
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Text(
                        "Download",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 8),
                      Icon(
                        Icons.download_rounded,
                        color: Colors.white,
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
