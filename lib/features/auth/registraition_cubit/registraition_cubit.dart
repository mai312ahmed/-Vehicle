import 'package:bloc/bloc.dart';

import '../../../cubits/registraition_cubit/registraition_cubit.dart';

class RegistraitionCubit extends Cubit<RegistraitionState> {
  RegistraitionCubit() : super(RegistraitionInitial());
}
