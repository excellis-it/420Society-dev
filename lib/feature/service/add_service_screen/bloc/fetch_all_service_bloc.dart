
import 'package:bloc/bloc.dart';
import 'package:groumally/core/api/api_string.dart';
import 'package:groumally/feature/service/add_service_screen/model/all_service_model.dart';
import 'package:groumally/feature/service/add_service_screen/model/details_service_model.dart';
import 'package:groumally/utils/APi/api_provider.dart';
part 'fetch_all_service_event.dart';
part 'fetch_all_service_state.dart';

class FetchAllServiceBloc
    extends Bloc<FetchAllServiceEvent, FetchAllServiceState> {
  FetchAllServiceBloc() : super(FetchAllServiceInitial()) {
    final apiProvider = ApiProvider();
    AllServiceModel allServiceModel = AllServiceModel();
    on<FetchAllServiceEvents>((event, emit) async {
      try {
        emit(FetchAllServiceLoadingState());
        final myData = await apiProvider
            .dataProcessor({}, allServiceModel, Apis.getAllService);
        print("my data--> $myData");
        if (myData != null && myData.status == true) {
          print("loaded--> ${myData.toJson()}");
          emit(FetchAllServiceLoadedState(allServiceModel: myData));
        } else {
          emit(FetchAllServiceErrorState(message: myData.toString()));
        }
      } catch (e) {
        emit(FetchAllServiceErrorState(message: e.toString()));
      }
    });
  }
}


class FetchAllFieldBloc
    extends Bloc<FetchAllFieldEvent, FetchAllFieldState> {
  FetchAllFieldBloc() : super(FetchAllFieldInitial()) {
    final apiProvider = ApiProvider();
    ServiceFieldModel serviceFieldModel = ServiceFieldModel();
    on<ServiceDetailsFieldEvent>((event, emit) async {
      try {
        emit(FetchAllServiceFieldLoading());
        final myData = await apiProvider.dataProcessor(
            {"service_id": event.serviceID},
            serviceFieldModel,
            Apis.serviceDetailById);
        print("mydata--> ${myData.status}");
        if (myData != null && myData.status == true) {
          print("field loaded--> ${myData.toJson()}");
          emit(FetchAllServiceDetailsFieldSetDoneState(
              detailServiceModel: myData));
        } else {
          print("errorState-->");
          emit(FetchAllServiceDetailsFieldSetfaildState());
        }
      } catch (e) {
        print("cache->$e");
        emit(FetchAllServiceDetailsFieldSetfaildState());
      }
    });

  }}
