import 'package:exam_1/controllers/quotes_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    int index = ModalRoute.of(context)!.settings.arguments as int;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Quote Detail",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Consumer<QuotesController>(builder: (context, provider, child) {
          provider.ind = index;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: s.height * 0.4,
                width: s.width,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                    image: NetworkImage(
                      provider.background[provider.bdImage],
                    ),
                    fit: BoxFit.fill,
                  ),
                  boxShadow: const [
                    BoxShadow(
                      offset: Offset(3, 3),
                      color: Colors.black,
                      blurRadius: 6,
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  child: Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () {
                                provider.back(index: index);
                              },
                              icon: Icon(
                                Icons.arrow_back_ios,
                                color: provider.textColor,
                              ),
                            ),
                            Text(
                              "Quote",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w500,
                                color: provider.textColor,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                provider.forward(index: index);
                              },
                              icon: Icon(
                                Icons.arrow_forward_ios,
                                color: provider.textColor,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "${provider.data[provider.ind]['quote']}",
                          style: TextStyle(
                            color: provider.textColor,
                            fontWeight: FontWeight.values[provider.fontWeight],
                            fontSize: 22,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "- ${provider.data[index]['author']}",
                              style: TextStyle(
                                color: provider.textColor,
                                fontWeight:
                                    FontWeight.values[provider.fontWeight],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Change Text Colour :- ",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    provider.colors.length,
                    (index) => GestureDetector(
                      onTap: () {
                        provider.changeColor(index: index);
                      },
                      child: Container(
                        height: 40,
                        width: 100,
                        margin: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: provider.colors[index],
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Change Text Weight :- ",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Slider(
                  min: 0,
                  max: 8,
                  divisions: 9,
                  value: provider.fontWeight.toDouble(),
                  onChanged: (val) {
                    provider.font(
                      val: val.toInt(),
                    );
                  }),
            ],
          );
        }),
      ),
    );
  }
}
