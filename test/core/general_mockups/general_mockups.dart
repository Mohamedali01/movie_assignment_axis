import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([Dio,HiveInterface])
Future<void> main() async{
  void globalSetup() {
 }
}