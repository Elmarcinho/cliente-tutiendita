import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cliente_tutiendita/Presentation/Bloc/category_bloc.dart';
import 'package:cliente_tutiendita/Model/category_model.dart';


class CategoryHorizontalListview extends StatelessWidget {
  //final List<CategoryModel> category; //*Cambiar por categoria
  final String? title;
  final TextStyle? titleStyle;

  const CategoryHorizontalListview({Key? key, this.title, this.titleStyle}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<CategoryBloc, CategoryState>(
      builder: (context, state) {
        return SizedBox(
          height: 190,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(title!, style: titleStyle,)),
              const SizedBox(height: 15),
              Expanded(
                child: ListView.builder(
                    itemCount: state.listCategory.length,
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return _Slide(category: state.listCategory[index]);
                    }),
              )
            ],
          ),
        );
      },
    );
  }
}

class _Slide extends StatelessWidget {
  final CategoryModel category;

  const _Slide({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 80,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.network(
                  category.image,
                  fit: BoxFit.cover,
                  width: 80,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress != null) {
                      return const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Center(
                            child: CircularProgressIndicator(strokeWidth: 2)),
                      );
                    }
                    return FadeIn(child: child);
                  },
                )),
          ),
          const SizedBox(height: 5),
          Text(category.title)
        ],
      ),
    );
  }
}
