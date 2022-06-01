import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import '../../../auth/data/dto/user_dto.dart';
import '../../domain/model/content.dart';
import '../../domain/usecase/list_contents_usecase.dart';

part 'list_contents_viewmodel.g.dart';

class ListContentsViewModel = _ListContentsViewModelBase with _$ListContentsViewModel;
abstract class _ListContentsViewModelBase with Store {
  final _usecase = Modular.get<ListContentsUseCase>();

    Future<List<Content>> loadContents(UserDto user) async {
    
    List<Content> res = await _usecase.loadContents(user);
    return res;
    }
}