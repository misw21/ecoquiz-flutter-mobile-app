import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

Future<void> initServiceLocator() async {
  repositories(); // Register repositories first
  dataSources(); // Register data sources second
  useCase(); // Register use cases after repositories
  bloc(); // Register BLoCs last
}

void repositories() {
  // getIt.registerLazySingleton<SignUpRepo>(() => SignUpRepoImpl(getIt()));
}

void dataSources() {
  // getIt.registerLazySingleton<SignUpReomteDataSource>(() => SignUpReomteDataSourceImpl(getIt()));
}

void useCase() {
  // getIt.registerLazySingleton(() => SignUpBrokerUseCase(getIt()));
}

void bloc() {
  // getIt.registerLazySingleton(() => SignUpBloc(signUpInvestorUseCase: getIt(), signUpBrokerUseCase: getIt()));
}