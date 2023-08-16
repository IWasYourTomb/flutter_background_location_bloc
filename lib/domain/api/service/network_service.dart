import 'package:dio/dio.dart';
import 'package:geotest/domain/api/repository/i_network_repository.dart';
import 'package:geotest/internal/di/inject.dart';
import 'package:geotest/untils/api/api_constants.dart';
import 'package:geotest/untils/dev.dart';
import 'package:geotest/untils/dio/dio_client.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: INetworkRepository)
class NetworkService implements INetworkRepository {
  final _dioClient = getIt.get<DioClient>();

  @override
  Future<void> sendLocation(double latitude, double longitude) async {
    var locationObject = {'lat': latitude, 'lon': longitude};

    Dev.log('$locationObject', name: 'Object');

    _dioClient.dio.options.headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json'
    };

    try {
      Response response = await _dioClient.dio.post(ApiConstants.location, data: locationObject);

      Dev.log('${response.statusCode}', name: 'SEND LOCATION RESPONSE CODE');

      if (response.statusCode == 201 || response.statusCode == 200) {
        Dev.log('${response.data}', name: 'SEND LOCATION RESPONSE');
        return response.data;
      } else {
        throw Exception('${response.data}');
      }
    }on DioError catch (dioError) {
      Dev.log("DioError catch: ${dioError.message}", name: 'SEND LOCATION ERROR');
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> getLogs() async {
    try {
      Response response = await _dioClient.dio.get(ApiConstants.logs);

      Dev.log('${response.statusCode}', name: ' GET LOGS RESPONSE CODE');

      if (response.statusCode == 201 || response.statusCode == 200) {
        // Dev.log('${response.data}', name: 'GET LOGS RESPONSE');
        return response.data;
      } else {
        throw Exception('${response.data}');
      }
    }on DioError catch (dioError) {
      Dev.log("DioError catch: ${dioError.message}", name: 'GET LOGS ERROR');
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
