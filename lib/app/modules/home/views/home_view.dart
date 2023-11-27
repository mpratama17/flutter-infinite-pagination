import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController state = Get.put(HomeController());
    final ScrollController _scrollController = ScrollController();
    state.getUser();

    void onScroll() {
      double maxScroll = _scrollController.position.maxScrollExtent;
      double currentScroll = _scrollController.position.pixels;

      if (maxScroll == currentScroll && state.hasMore.value) {
        state.getUser();
      }
    }

    _scrollController.addListener(onScroll);

    return Scaffold(
        appBar: AppBar(
          title: Text('User'),
          // centerTitle: true,
        ),
        body: Obx(
          () => ListView.builder(
              controller: _scrollController,
              itemCount: state.hasMore.value
                  ? state.users.length + 1
                  : state.users.length,
              itemBuilder: (context, index) {
                if (index < state.users.length) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage:
                          NetworkImage(state.users[index].avatar ?? ''),
                    ),
                    title: Text(state.users[index].name.toString()),
                    subtitle: Text(state.users[index].email.toString()),
                  );
                } else {
                  // return circularProgressIndicator();
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
        ));
  }
}
