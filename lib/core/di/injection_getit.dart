import 'package:abhedy_banking_project/features/data/repositories/customer_auth_status_repository_impl.dart';
import 'package:abhedy_banking_project/features/domain/repositories/customer_details_repository.dart';
import 'package:abhedy_banking_project/features/domain/usecases/customer_auth_status/customer_details_usecase.dart';
import 'package:abhedy_banking_project/features/domain/usecases/customer_auth_status/customer_loggedin_usecase.dart';
import 'package:abhedy_banking_project/features/domain/usecases/customer_auth_status/save_customer_details_usecase.dart';
import 'package:abhedy_banking_project/features/presentation/bloc/auth_status/auth_status_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);

  //bloc
  sl.registerFactory(
    () => AuthStatusBloc(
      isCustomerLoggedInUseCase: sl(), saveCustomerDetailsUseCase: sl(), customerDetailsUseCase: sl(),
    ),
  );

  //use cases
  sl.registerLazySingleton(() => IsCustomerLoggedInUseCase(sl()));
  sl.registerLazySingleton(() => SaveCustomerDetailsUseCase(sl()));
  sl.registerLazySingleton(() => CustomerDetailsUseCase(sl()));

  //repos
  sl.registerLazySingleton<CustomerDetailsRepository>(
    () => CustomerDetailsRepositoryImpl(sharedPreferences: sl()),
  );
}
