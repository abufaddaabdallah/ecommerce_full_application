// import 'dart:async';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../controllers/category_controller.dart';
// import '../../model/category.dart';
// import 'categories_events.dart';
// import 'categories_states.dart';
//
// class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesStates> {
//   List<Category>? categories;
//
//   CategoriesBloc() : super(InitialState()) {
//     on<CategoriesEvent>(_getCategories);
//   }
//
//   FutureOr<void> _getCategories(
//       CategoriesEvent event, Emitter<CategoriesStates> emit) async {
//     try {
//       emit(LoadingState());
//       categories = await CategoryController().getAll();
//       print("Categories Fetched");
//       emit(SuccessState(categories: categories!));
//     } catch (ex) {
//       print(ex);
//       emit(FailureState());
//     }
//   }
// }
