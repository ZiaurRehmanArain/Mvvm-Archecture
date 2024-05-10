import 'package:mvvmarchecture/data/response/status.dart';

class ApiReponse<T> {
  Status? status;
  T? data;
  String? message;
  ApiReponse(this.status, this.data, this.message);
  ApiReponse.loading() : status = Status.LOADING;
  ApiReponse.completed() : status = Status.COMPLETED;
  ApiReponse.error() : status = Status.ERROR;

  @override
  String toString() {
    return 'Status :$status \n Message : $message \n data: $data';
  }
}
