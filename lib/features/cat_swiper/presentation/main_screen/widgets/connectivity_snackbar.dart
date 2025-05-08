import 'package:flutter/material.dart';

class ConnectivitySnackBar extends StatefulWidget {
  final bool isOnline;
  final VoidCallback onDismissed;

  const ConnectivitySnackBar({
    super.key,
    required this.isOnline,
    required this.onDismissed,
  });

  @override
  State<ConnectivitySnackBar> createState() => _ConnectivitySnackBarState();
}

class _ConnectivitySnackBarState extends State<ConnectivitySnackBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );

    _animationController.forward().then((_) {
      Future.delayed(const Duration(seconds: 2), () {
        if (mounted) {
          _animationController.reverse().then((_) {
            if (mounted) {
              widget.onDismissed();
            }
          });
        }
      });
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  String get _message =>
      widget.isOnline
          ? "Back online! You can now swipe cats again."
          : "You're offline. You can still view your liked cats.";

  Color get _backgroundColor =>
      widget.isOnline ? Colors.green.shade700 : Colors.orange.shade700;

  IconData get _icon => widget.isOnline ? Icons.wifi : Icons.wifi_off;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 16,
      right: 16,
      bottom: MediaQuery.of(context).size.height * 0.1,
      child: SlideTransition(
        position: _slideAnimation,
        child: Material(
          elevation: 6,
          borderRadius: BorderRadius.circular(8),
          color: _backgroundColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                Icon(_icon, color: Colors.white, size: 24),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    _message,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
