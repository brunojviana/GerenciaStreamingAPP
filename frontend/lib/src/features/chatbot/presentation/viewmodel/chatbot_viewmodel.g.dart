// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chatbot_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ChatBotViewModel on _ChatBotViewModelBase, Store {
  final _$textAtom = Atom(name: '_ChatBotViewModelBase.text');

  @override
  String get text {
    _$textAtom.reportRead();
    return super.text;
  }

  @override
  set text(String value) {
    _$textAtom.reportWrite(value, super.text, () {
      super.text = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_ChatBotViewModelBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$messageListAtom = Atom(name: '_ChatBotViewModelBase.messageList');

  @override
  ObservableList<ChatMessage> get messageList {
    _$messageListAtom.reportRead();
    return super.messageList;
  }

  @override
  set messageList(ObservableList<ChatMessage> value) {
    _$messageListAtom.reportWrite(value, super.messageList, () {
      super.messageList = value;
    });
  }

  final _$_ChatBotViewModelBaseActionController =
      ActionController(name: '_ChatBotViewModelBase');

  @override
  void validateText() {
    final _$actionInfo = _$_ChatBotViewModelBaseActionController.startAction(
        name: '_ChatBotViewModelBase.validateText');
    try {
      return super.validateText();
    } finally {
      _$_ChatBotViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addMessage(ChatMessage messageChat) {
    final _$actionInfo = _$_ChatBotViewModelBaseActionController.startAction(
        name: '_ChatBotViewModelBase.addMessage');
    try {
      return super.addMessage(messageChat);
    } finally {
      _$_ChatBotViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
text: ${text},
isLoading: ${isLoading},
messageList: ${messageList}
    ''';
  }
}

mixin _$ChatBotError on _ChatBotErrorBase, Store {
  Computed<bool>? _$hasErrorsComputed;

  @override
  bool get hasErrors =>
      (_$hasErrorsComputed ??= Computed<bool>(() => super.hasErrors,
              name: '_ChatBotErrorBase.hasErrors'))
          .value;

  final _$textAtom = Atom(name: '_ChatBotErrorBase.text');

  @override
  String? get text {
    _$textAtom.reportRead();
    return super.text;
  }

  @override
  set text(String? value) {
    _$textAtom.reportWrite(value, super.text, () {
      super.text = value;
    });
  }

  final _$messageAtom = Atom(name: '_ChatBotErrorBase.message');

  @override
  String? get message {
    _$messageAtom.reportRead();
    return super.message;
  }

  @override
  set message(String? value) {
    _$messageAtom.reportWrite(value, super.message, () {
      super.message = value;
    });
  }

  @override
  String toString() {
    return '''
text: ${text},
message: ${message},
hasErrors: ${hasErrors}
    ''';
  }
}
