import 'package:bloc/bloc.dart';
import 'package:dro/model/supplements_model.dart';
import 'package:meta/meta.dart';

part 'suplement_state.dart';

class SuplementCubit extends Cubit<SuplementState> {
  SuplementCubit() : super(SuplementInitial());

  Future<void> getSuplements() async {
    try {
      await Future.delayed(const Duration(microseconds: 500), () {});
      emit(
        SuplementSuccess(
          suplementList: [
            SupplementModle(
              imageName: "drg1",
              isPrescription: false,
              name: "Paracetamol",
              tablet: "500mg",
              amount: "350",
              categories: ["Headache", "Supplements", "Infants", "Cough"],
            ),
            SupplementModle(
              imageName: "drg2",
              isPrescription: true,
              name: "Doliprane",
              tablet: "1000mg",
              amount: "350",
              categories: ["Headache", "Supplements"],
            ),
            SupplementModle(
              imageName: "drg3",
              isPrescription: true,
              name: "Paracetamol",
              tablet: "500mg",
              amount: "350",
              categories: ["Headache"],
            ),
            SupplementModle(
              imageName: "drg4",
              isPrescription: false,
              name: "Ibuprofen",
              tablet: "500mg",
              amount: "350",
              categories: ["Supplements", "Infants", "Cough"],
            ),
            SupplementModle(
              imageName: "drg5",
              isPrescription: false,
              name: "Panadol",
              tablet: "500mg",
              amount: "350",
              categories: ["Supplements"],
            ),
            SupplementModle(
              imageName: "drg6",
              isPrescription: false,
              name: "Ibuprofen",
              tablet: "400mg",
              amount: "350",
              categories: ["Headache"],
            ),
          ],
        ),
      );
    } catch (e) {
      emit(SuplementError('Error $e'));
    }
  }
}

// class SuplementCubit extends Cubit<List<SupplementModle>> {
//   SuplementCubit() : super([]);
//   final List<SupplementModle> _suplementList = [
//     SupplementModle(
//       imageName: "drg1",
//       name: "Paracetamol",
//       tablet: "500mg",
//       amount: "350",
//     ),
//     SupplementModle(
//       imageName: "drg2",
//       isPrescription: true,
//       name: "Doliprane",
//       tablet: "1000mg",
//       amount: "350",
//     ),
//     SupplementModle(
//       imageName: "drg3",
//       isPrescription: true,
//       name: "Paracetamol",
//       tablet: "500mg",
//       amount: "350",
//     ),
//     SupplementModle(
//       imageName: "drg4",
//       name: "Ibuprofen",
//       tablet: "500mg",
//       amount: "350",
//     ),
//     SupplementModle(
//       imageName: "drg5",
//       name: "Panadol",
//       tablet: "500mg",
//       amount: "350",
//     ),
//     SupplementModle(
//       imageName: "drg6",
//       name: "Ibuprofen",
//       tablet: "400mg",
//       amount: "350",
//     ),
//   ];

//   void get getSuplement async => emit(_suplementList);
// }
