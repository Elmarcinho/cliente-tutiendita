import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Model/category_model.dart';
import '../../Provider/category_provider.dart';

part 'category_event.dart';
part 'category_state.dart';


class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {

  final CategoryProvider categoryProvider;

  CategoryBloc(this.categoryProvider) : super(const CategoryState()) {

    on<GetCategorysEvent>( _onGetCategorys );
  }

  void _onGetCategorys( GetCategorysEvent event, Emitter emit) async{
    
    final categorys= await categoryProvider.getCategorias();

    emit( 
      state.copyWith(
        listCategory: categorys
      )
    );

  }
}
