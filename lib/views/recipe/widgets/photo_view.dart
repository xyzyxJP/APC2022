import 'package:apc2022/views/recipe/widgets/photo_indicator.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PhotoView extends StatefulWidget {
  final List<String> photoPaths;
  final int photoIndex = 0;

  const PhotoView({super.key, required this.photoPaths});

  @override
  State<PhotoView> createState() => _PhotoViewState();
}

class _PhotoViewState extends State<PhotoView> {
  late int photoIndex;

  @override
  void initState() {
    super.initState();
    photoIndex = widget.photoIndex;
  }

  void _prevImage() {
    setState(() {
      photoIndex =
          photoIndex > 0 ? photoIndex - 1 : widget.photoPaths.length - 1;
    });
  }

  void _nextImage() {
    setState(() {
      photoIndex =
          photoIndex < widget.photoPaths.length - 1 ? photoIndex + 1 : 0;
    });
  }

  Widget _buildBackground() {
    return CachedNetworkImage(
      imageUrl: widget.photoPaths[photoIndex],
      errorWidget: (context, url, dynamic error) => const Icon(Icons.error),
      fit: BoxFit.cover,
    );
  }

  Widget _buildIndicator() {
    return Positioned(
      top: 0.0,
      left: 0.0,
      right: 0.0,
      child: PhotoIndicator(
        photoIndex: photoIndex,
        photoCount: widget.photoPaths.length,
      ),
    );
  }

  Widget _buildControls() {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        GestureDetector(
          onTap: _prevImage,
          child: FractionallySizedBox(
            widthFactor: 0.5,
            heightFactor: 1.0,
            alignment: Alignment.topLeft,
            child: Container(
              color: Colors.transparent,
            ),
          ),
        ),
        GestureDetector(
          onTap: _nextImage,
          child: FractionallySizedBox(
            widthFactor: 0.5,
            heightFactor: 1.0,
            alignment: Alignment.topRight,
            child: Container(
              color: Colors.transparent,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    for (var photoPath in widget.photoPaths) {
      precacheImage(CachedNetworkImageProvider(photoPath), context);
    }
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        _buildBackground(),
        _buildIndicator(),
        _buildControls(),
      ],
    );
  }
}
