
import 'package:flutter/material.dart';
import 'package:mobpdp/model/Post.dart';
import 'package:mobpdp/screens/edit_post_screen.dart';
import 'package:mobpdp/service/ApiService.dart';
import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store {

  @observable List<Post> posts = [];

  Future apiGetUsers() {
    var s = ApiService.GET(ApiService.GET_API, ApiService.paramsEmpty())
        .then((value) => {
        posts = value!,
    });
    return s;
  }

  Future apiDeleteUsers(String api) {
    var s = ApiService.DELETE(api, ApiService.paramsEmpty())
        .then((value) => {
    });
    return s;
  }


  Future nextPage(BuildContext context,Post post,int index) async{

    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PostUpdateScreen(post: post, index: index)),
    );

      posts[index] = result;
      return result;
  }


}