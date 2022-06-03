import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import '../../domain/usecase/content_detail_usecase.dart';

part 'content_detail_viewmodel.g.dart';

class ContentDetailViewModel = _ContentDetailViewModelBase with _$ContentDetailViewModel;
abstract class _ContentDetailViewModelBase with Store {
  final _usecase = Modular.get<ContentDetailUseCase>();

  Future<int> switchStatus(int status) async {
    
    int res = await _usecase.switchStatus(status);
    return res;
  }

  Future<int> deleteContent(int id) async {
    
    int res = await _usecase.deleteContent(id);
    return res;
  }
}