import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfViewer extends StatefulWidget {
  final String webPdf;

  const PdfViewer({Key? key, required this.webPdf}) : super(key: key);

  @override
  _PdfViewerState createState() => _PdfViewerState();
}

class _PdfViewerState extends State<PdfViewer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PDF'),
      ),
      body: Column(
        children: [
          Expanded(
            child: widget.webPdf.isEmpty
                ? const Center(
              child: Text('Pdf Not Found'),
            )
                : SfPdfViewer.network('https://apis.bhavishashah.com/${widget.webPdf}'),
          ),
        ],
      ),
    );
  }
}