import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import '../../domain/model/content.dart';
import '../../domain/usecase/list_contents_usecase.dart';

part 'list_contents_viewmodel.g.dart';

class ListContentsViewModel = _ListContentsViewModelBase with _$ListContentsViewModel;
abstract class _ListContentsViewModelBase with Store {
  final _usecase = Modular.get<ListContentsUseCase>();

    Future<List<Content>> loadContents(int userId, int category) async {
      
      List<Content> res = await _usecase.loadContents(userId);
      List<Content> moviesAndSeries = [];
      List<Content> other = [];

      for (var i=0; i<res.length; i++)
      {
        if (res[i].category == 'cat_movies' || res[i].category == 'cat_series')
        {
          moviesAndSeries.add(res[i]);
        }
        else
        {
          other.add(res[i]);
        }  
      }

      if (category == 1)
      {
        return moviesAndSeries;
      }
      else
      {
        return other;
      }
    }
}