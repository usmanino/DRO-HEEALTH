import 'package:bloc/bloc.dart';
import 'package:dro/model/categories_model.dart';
import 'package:meta/meta.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit() : super(CategoriesInitial());

  Future<void> getCategories() async {
    try {
      await Future.delayed(const Duration(microseconds: 500), () {});
      emit(
        CategoriesSuccess(
          categoriseList: [
            CategoriesModel(
              name: "Headache",
              image: "assets/images/headache.png",
            ),
            CategoriesModel(
              name: "Supplements",
              image: "assets/images/supplements.png",
            ),
            CategoriesModel(
              name: "Infants",
              image: "assets/images/cough.png",
            ),
            CategoriesModel(
              name: "Cough",
              image: "assets/images/infants.png",
            )
          ],
        ),
      );
    } catch (e) {
      emit(
        CategoriesError("Error: $e"),
      );
    }
  }
}
