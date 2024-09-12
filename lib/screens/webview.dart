import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview/controllers/webview_controller.dart'; // Assuming this is your controller

class Webview extends StatefulWidget {
  final String url;
  const Webview({super.key, required this.url});

  @override
  State<Webview> createState() => _WebviewState();
}

class _WebviewState extends State<Webview> {
  final WebViewControllerX controllerWebView = Get.put(WebViewControllerX());

  @override
  void initState() {
    super.initState();
    controllerWebView.WebViewFunc(widget.url); // Initialize with URL
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Webview"),
        backgroundColor: const Color.fromARGB(255, 255, 72, 52),
        actions: [
          IconButton(
            onPressed: () async {
              if (await controllerWebView.controller.canGoBack()) {
                await controllerWebView.controller.goBack();
              } else {
                Get.snackbar("Message", "You can't go back from this stage");
              }
            },
            icon: const Icon(Icons.arrow_back_outlined),
          ),
          IconButton(
            onPressed: () async {
              if (await controllerWebView.controller.canGoForward()) {
                await controllerWebView.controller.goForward();
              } else {
                Get.snackbar("Message", "You can't go forward at this stage");
              }
            },
            icon: const Icon(Icons.arrow_forward_outlined),
          ),
          IconButton(
            onPressed: () async {
              controllerWebView.controller.reload();
            },
            icon: const Icon(Icons.refresh_outlined),
          ),
        ],
      ),
      body: Stack(
        children: [
          WebViewWidget(controller: controllerWebView.controller),
          Obx(() {
            return controllerWebView.loadingpercentage.value < 100
                ? const Center(child: CircularProgressIndicator())
                : const SizedBox.shrink();
          }),
        ],
      ),
    );
  }
}
