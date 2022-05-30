import 'package:dio/dio.dart';
import './dio.dart';

final Dio dio = Http.getInstance().dio;

Future<Response> getEthContract(String addr) {
  return dio.get('https://api.etherscan.io/api', queryParameters: {
    'module': 'contract',
    'action': 'getsourcecode',
    'address': addr,
    'apikey': 'K1XNFGYK65R9JDQZ89E9NDMVVNEQ6IHKZ1',
  });
}
