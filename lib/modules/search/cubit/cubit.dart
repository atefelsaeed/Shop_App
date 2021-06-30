import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_abdalla/models/search_model.dart';
import 'package:shop_app_abdalla/modules/search/cubit/states.dart';
import 'package:shop_app_abdalla/shared/components/constants.dart';
import 'package:shop_app_abdalla/shared/network/endpoint.dart';
import 'package:shop_app_abdalla/shared/network/remote/dio_helper.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit() : super(SearchInitialState());

  static SearchCubit get(context) => BlocProvider.of(context);

  SearchModel model;

  void search(String text) {
    emit(SearchLoadingState());

    DioHelper.postData(
      url: SEARCH,
      token: token,
      data: {
        'text': text,
      },
    ).then((value) {
      model = SearchModel.fromJson(value.data);

      emit(SearchSuccessState());
    }).catchError((error) {
      print(error.toString());

      emit(SearchErrorState());
    });
  }
}
