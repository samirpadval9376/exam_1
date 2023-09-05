import 'package:exam_1/controllers/quotes_controller.dart';
import 'package:exam_1/utils/my_page_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  QuotesController quotesController = Get.put(QuotesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Quotes",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: "Search",
                  hintStyle: TextStyle(
                    color: Colors.grey.shade400,
                  ),
                  suffixIcon: Icon(
                    Icons.search,
                    color: Colors.grey.shade400,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                onSubmitted: (val) {
                  quotesController.search(val: val);
                },
              ),
              Expanded(
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: quotesController.category.length,
                    itemBuilder: (context, index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () async {
                              quotesController.category =
                                  await quotesController.search(
                                      val: quotesController.category[index]);
                            },
                            child: Text(quotesController.category[index]),
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                        ],
                      );
                    }),
              ),
              Expanded(
                flex: 7,
                child: ListView.builder(
                    itemCount: quotesController.data.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed(
                            MyPageRoute.detailPage,
                            arguments: index,
                          );
                        },
                        child: Card(
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${quotesController.data[index]['quote']}",
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      "- ${quotesController.data[index]['author']}",
                                      style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
