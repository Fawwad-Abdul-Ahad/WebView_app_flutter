import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:webview/controllers/webview_controller.dart';
import 'package:webview/screens/webview.dart';

class Homescreen extends StatelessWidget {
  Homescreen({super.key});
  
  final TextEditingController searchController = TextEditingController();
   
  void searchtoNavigate() {
    String link = searchController.text.trim();
    bool isURL = Uri.tryParse(link)?.isAbsolute ?? false;

    if (isURL) {
      Get.to(Webview(url: link));
    } else {
      // If it's not a URL, treat it as a Google search term
      String searchURL = 'https://www.google.com/search?q=${Uri.encodeComponent(link)}';
      Get.to(Webview(url: searchURL));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 72, 52),
        title: const Text(
          "WebView App",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          height: Get.height * 0.3,
          width: Get.width * 1,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top:18.0),
                child: Text("Welcome to my WebView App",style: TextStyle(fontSize: 22,color: Color.fromARGB(255, 255, 57, 57),fontWeight: FontWeight.bold),),
              ),
               Padding(
                padding: const EdgeInsets.only(top:8.0),
                child: Text("Search directly and view on Google",style: TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.w600),),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: TextFormField(
                  controller: searchController,  // Correct controller reference
                  style: const TextStyle(
                    fontSize: 18, 
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                  decoration: InputDecoration(
                    suffixIcon: const Icon(
                      Icons.search,
                      size: 28,
                    ),
                    hintText: "Enter URL or Search here",
                    hintStyle: const TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 18,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Container(
                width: Get.width * 0.6,
                height: Get.height * 0.06,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(254, 211, 208, 1),
                  ),
                  onPressed: () {
                    searchtoNavigate();  // Correctly trigger the search action
                  },
                  child: const Text(
                    "Search",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
