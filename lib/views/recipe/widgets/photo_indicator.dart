import 'package:flutter/material.dart';

class PhotoIndicator extends StatelessWidget {
  final int photoIndex;
  final int photoCount;

  const PhotoIndicator({
    super.key,
    required this.photoIndex,
    required this.photoCount,
  });

  Widget _buildInactiveIndicator() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2.0),
        child: Container(
          height: 3.0,
          decoration: BoxDecoration(
            color: Colors.black38,
            borderRadius: BorderRadius.circular(2.5),
          ),
        ),
      ),
    );
  }

  Widget _buildActiveIndicator() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2.0),
        child: Container(
          height: 3.0,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(2.5),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 2.0,
                spreadRadius: 0.0,
                offset: Offset(0.0, 1.0),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> indicators = [];
    for (int i = 0; i < photoCount; i++) {
      indicators.add(i == photoIndex
          ? _buildActiveIndicator()
          : _buildInactiveIndicator());
    }
    return Row(
      children: indicators,
    );
  }
}
