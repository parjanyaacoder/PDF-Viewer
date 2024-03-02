import 'package:flutter/material.dart';
import 'package:myapp/pdf_viewer_screen.dart';

class UrlPdfViewer extends StatefulWidget {
  const UrlPdfViewer({Key? key}) : super(key: key);

  @override
  State<UrlPdfViewer> createState() => _UrlPdfViewerState();
}

class _UrlPdfViewerState extends State<UrlPdfViewer> {

  bool _loading = false;
  void getPdf() { 
    if(_loading) return;
    setState(() {
      _loading = true;
    });
     Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const PdfViewerScreen(),
              settings: RouteSettings(name: 'PdfViewerScreen', arguments: { 'url': urlTextController.text },)
              ),
            ).then((value) => 
                  setState(() {
                  _loading = false;
      })
            );
  }

  TextEditingController urlTextController = TextEditingController.fromValue(const TextEditingValue());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Pdf Viewer'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(padding: const EdgeInsets.all(8), child: TextField(
              key: const Key('pdf_url'),
              cursorHeight: 18,
              controller: urlTextController,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                labelText: 'PDF URL',
                labelStyle: TextStyle(
                  color: Colors.deepOrange,
                  fontSize: 18,
                ),
              ),
            )
            ),
            ElevatedButton(
              onPressed: getPdf,
              child: _loading ? const Text('Loading...') : const Text('Load PDF'),
            ),
          ],
        ),
      ),// This trailing 
    );
  }
}