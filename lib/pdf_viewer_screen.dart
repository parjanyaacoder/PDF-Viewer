import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

class PdfViewerScreen extends StatelessWidget {
  const PdfViewerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

  final routeParams = ModalRoute.of(context)!.settings.arguments as Map;
    final url = routeParams['url'];
    
    return Scaffold(
        appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inverseSurface,
        title: const Text('Pdf Viewer'),
      ),
      body: const PDF(swipeHorizontal: false, fitEachPage: true,
      fitPolicy: FitPolicy.BOTH,enableSwipe: true, nightMode: true, autoSpacing: true
      ).cachedFromUrl(url,
      errorWidget: (error) => const Center(
        child:  Text('Unable to load pdf. Sorry for the inconvenience caused. Please do check the url once and retry.'),
      ))
        );
  }
}
