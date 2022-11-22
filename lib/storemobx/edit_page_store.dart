import 'package:flutter/cupertino.dart';
import 'package:mobpdp/service/ApiService.dart';
import 'package:mobx/mobx.dart';

import '../model/Post.dart';

part 'edit_page_store.g.dart';

class UpdatePostPage = _UpdatePostStore with _$UpdatePostStore;

abstract class _UpdatePostStore with Store{

  @observable TextEditingController title = TextEditingController();
  @observable TextEditingController body = TextEditingController();

  void apiUpdateUsers(String api,Post post,BuildContext context,widget) {
    ApiService.UPDATE(api, ApiService.paramsPost(post))
        .then((value) => {
      Navigator.pop(context,widget.post)
    });
  }


  void start(widget){
    title.text = widget.post.title;
    body.text = widget.post.body;
  }

}