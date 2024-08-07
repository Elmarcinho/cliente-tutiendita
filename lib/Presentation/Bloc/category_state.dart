part of 'category_bloc.dart';


class CategoryState extends Equatable {


  final List<CategoryModel> listCategory;


  const CategoryState({
    this.listCategory = const [],
  });


  CategoryState copyWith({
    List<CategoryModel>? listCategory,
  })=> CategoryState(
    listCategory: listCategory ?? this.listCategory
  );
  
  
  @override
  List<Object> get props => [];
}

