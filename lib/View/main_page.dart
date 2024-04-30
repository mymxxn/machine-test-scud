import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:machine_test_scrud_networks/Controller/news_controller.dart';
import 'package:machine_test_scrud_networks/View/components.dart';
import 'package:machine_test_scrud_networks/View/home_page.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});

  final NewsController newsController = Get.put(NewsController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 233, 243, 252),
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/newsNightLogo.png",
                height: size.height * 0.1,
                width: 100,
              ),
              Text("Top News")
            ],
          ),
        ),
        body: Obx(
          () => newsController.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 2,
                      ),
                  physics: const BouncingScrollPhysics(),
                  itemCount: newsController.newsArticles.length,
                  itemBuilder: (context, index) => InkWell(
                      onTap: () => Get.to(() => HomePage(
                            title:
                                newsController.newsArticles[index].title ?? '',
                            description: newsController
                                    .newsArticles[index].description ??
                                '',
                            imageUrl:
                                newsController.newsArticles[index].urlToImage ??
                                    "",
                            author:
                                newsController.newsArticles[index].author ?? "",
                            publishedAt: newsController
                                .newsArticles[index].publishedAt
                                .toString(),
                            content:
                                newsController.newsArticles[index].content ??
                                    '',
                          )),
                      child: NewsCard(
                        title: newsController.newsArticles[index].title ?? '',
                        description:
                            newsController.newsArticles[index].description ??
                                '',
                        imageUrl:
                            newsController.newsArticles[index].urlToImage ?? "",
                        author: newsController.newsArticles[index].author ?? "",
                        publishedAt: DateFormat('dd.MM.yyyy').format(
                            newsController.newsArticles[index].publishedAt ??
                                DateTime.now()),
                      ))),
        ));
  }
}
