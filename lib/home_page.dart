import 'package:flutter/material.dart';
import 'package:one_request_test/api_request/api_request.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

ApiRequest apiRequest = ApiRequest();

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text('One Request Test'),
      ),
      // body: Center(
      //   child: ListView.builder(
      //     itemCount: ApiRequest.posts.length,
      //     itemBuilder: (context, index) {
      //       return Column(
      //         children: [
      //           Center(
      //             child: Text('${index + 1}'),
      //           ),
      //           ListTile(
      //             title: Text(ApiRequest.posts[index].title!),
      //             subtitle: Text(ApiRequest.posts[index].body!),
      //           ),
      //         ],
      //       );
      //     },
      //   ),
      // ),

      body: Column(
        children: [
          ElevatedButton(
            onPressed: () async {
              await ApiRequest.getMap();
              setState(() {});
            },
            child: const Text('Get Map'),
          ),
          if (ApiRequest.mapModel.data != null)
            Expanded(
              child: Center(
                child: ListView.builder(
                  itemCount: ApiRequest.mapModel.data!.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Center(
                          child: Text('${index + 1}'),
                        ),
                        ListTile(
                          title: Text(
                              ApiRequest.mapModel.data?[index].firstName! ??
                                  ''),
                          subtitle: Text(
                              ApiRequest.mapModel.data?[index].email! ?? ''),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
        ],
      ),
    );
  }
}
