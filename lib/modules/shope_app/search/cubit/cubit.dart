import 'package:alhumiri_frist_project/Shared/componens/constants.dart';
import 'package:alhumiri_frist_project/Shared/network/endpoint.dart';
import 'package:alhumiri_frist_project/Shared/network/remote/dio_helper.dart';
import 'package:alhumiri_frist_project/model/shope_app/search_model.dart';
import 'package:alhumiri_frist_project/modules/shope_app/search/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class SearchCubit extends Cubit<SearchStates> {
  SearchCubit() : super(SearchInitialState());

  static SearchCubit get(context) => BlocProvider.of(context);

  SearchModel? model;

  void search(String text) {
    emit(SearchLoadingState());

    DioHelper.PostData(
      url: 'products/search',
      token: token!,
      data: {
        'text': text,
      },
    ).then((value)
    {
      model = SearchModel.fromJson(value.data);

      emit(SearchSuccessState());
    }).catchError((error)
    {
      print('=========================================================');
      print(error.toString());
      emit(SearchErrorState());
    });
  }
}
