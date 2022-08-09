import 'package:newarchitecture/models/currency_model.dart';

class HomeState {
  HomeState();
}

class HomeInitialState extends HomeState {
  HomeInitialState();
}

class HomeLoadingState extends HomeState {
  HomeLoadingState();
}

class HomeCompleteState extends HomeState {
  List<CurrencyModel> data;
  HomeCompleteState(this.data);
}

class HomeErrorState extends HomeState {
  String error;
  HomeErrorState(this.error);
}
