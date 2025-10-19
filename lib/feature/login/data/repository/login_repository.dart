
import '../data_source/login_remote_data_source.dart';

abstract class LoginRepository {}
 
class LoginRepositoryImp implements LoginRepository  {
  LoginRepositoryImp(this._remoteDataSource);
 
  final LoginRemoteDataSource _remoteDataSource;

}