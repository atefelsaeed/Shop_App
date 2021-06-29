import 'package:bloc/bloc.dart';


class MyBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase base) {
    super.onCreate(base);
    print('onCreate -- ${base.runtimeType}');
  }

  @override
  void onChange(BlocBase base, Change change) {
    super.onChange(base, change);
    print('onChange -- ${base.runtimeType}, $change');
  }

  @override
  void onError(BlocBase base, Object error, StackTrace stackTrace) {
    print('onError -- ${base.runtimeType}, $error');
    super.onError(base, error, stackTrace);
  }

  @override
  void onClose(BlocBase base) {
    super.onClose(base);
    print('onClose -- ${base.runtimeType}');
  }
}