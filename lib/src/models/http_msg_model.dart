import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:equatable/equatable.dart';

@jsonSerializable
class HttpMsg extends Equatable{
  String msg;
  int code;

  HttpMsg({this.msg, this.code});

  @override
  List<Object> get props => [msg,code];
}
