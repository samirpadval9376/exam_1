import 'package:exam_1/controllers/quotes_controller.dart';
import 'package:exam_1/utils/my_page_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
          child:
              Consumer<QuotesController>(builder: (context, provider, child) {
            return Column(
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
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onSubmitted: (val) {
                    provider.search(val: val);
                  },
                ),
                Expanded(
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: provider.category.length,
                      itemBuilder: (context, index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () async {
                                provider.category = await provider.search(
                                    val: provider.category[index]);
                              },
                              child: Text(provider.category[index]),
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
                      itemCount: provider.data.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed(
                              MyPageRoute.detailPage,
                              arguments: index,
                            );
                          },
                          child: Card(
                            color: Colors.primaries[index % 18].shade400,
                            // child: ListTile(
                            //   // leading: Text("${provider.data[index]['category']}"),
                            //   title: Text("${provider.data[index]['quote']}"),
                            //   trailing:
                            //       Text("- ${provider.data[index]['author']}"),
                            // ),
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${provider.data[index]['quote']}",
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
                                        "- ${provider.data[index]['author']}",
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
            );
          }),
        ),
      ),
    );
  }
}
