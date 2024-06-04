import 'package:flutter/material.dart';

// SliverAppBar - SearchBar 구성
class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({
    super.key,
    this.onSubmit,
  });

  final Function(String)? onSubmit;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      snap: true,
      floating: true,
      pinned: true,
      surfaceTintColor: Colors.white,
      backgroundColor: Colors.white,
      title: SearchBar(
        elevation: const WidgetStatePropertyAll(0),
        autoFocus: false,
        onSubmitted: (value) => {
          if (onSubmit != null) {onSubmit!(value)}
        },
      ),
    );
  }
}
