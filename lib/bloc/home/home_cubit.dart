import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newarchitecture/bloc/home/home_state.dart';
import 'package:newarchitecture/models/currency_model.dart';
import 'package:newarchitecture/services/get_currency_service.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitialState());

  // Write a home logic here

  Future<void> getCurrency() async {
    // Emit to initial State
    emit(HomeInitialState());

    // Emit to Loading State
    emit(HomeLoadingState());
    await GetCurrencyService.getData().then((value) {
      // Then Emit to Complete State
      if (value.runtimeType == String) {
        // IF Response is error, emit to error state with together erorr type
        emit(HomeErrorState(value));
        return false;
      } else {
        // If Response is successfully, emit to complete state with together data type
        List<CurrencyModel> data =
            (value as List).map((e) => CurrencyModel.fromJson(e)).toList();
        emit(HomeCompleteState(data));
        return true;
      }
    });
  }
}
