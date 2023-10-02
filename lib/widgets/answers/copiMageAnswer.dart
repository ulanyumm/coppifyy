import 'package:flutter/material.dart';
import 'package:hypotenuse/viewmodel/copiMage_viewmodeli.dart';
import 'package:provider/provider.dart';

class ImageGridScreen extends StatelessWidget {
  const ImageGridScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<CopiMageViewModel>(context);

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // 2 kolon
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: viewModel.dataModel.data?.images?.length ?? 0,
      itemBuilder: (context, index) {
        final images = viewModel.dataModel.data?.images;

        if (images != null && index < images.length) {
          final imageUrl = images[index].url;

          return GestureDetector(
            onTap: () {
              if (imageUrl != null) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ImageViewerScreen(imageUrl),
                  ),
                );
              }
            },
            child: imageUrl != null
                ? Image.network(imageUrl, fit: BoxFit.cover)
                : Container(), // Null değer için boş bir Container döndürülebilir
          );
        }

        return Container(); // Index sınırları dışında ise boş bir Container döndür
      },
    );
  }
}

class ImageViewerScreen extends StatelessWidget {
  final String imageUrl;

  const ImageViewerScreen(this.imageUrl, {super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<CopiMageViewModel>(context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(children: [
              Container(child: Image.network(imageUrl)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.close,
                        color: Colors.white,
                      )),
                  IconButton(
                      onPressed: () {
                        viewModel.downloadImage(imageUrl);
                      },
                      icon: const Icon(
                        Icons.download,
                        color: Colors.white,
                      )),
                ],
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
