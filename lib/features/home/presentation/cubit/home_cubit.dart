import 'dart:io';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:movie_assignment_axis/core/database/populars_database.dart';
import 'package:movie_assignment_axis/core/exceptions/failure.dart';
import 'package:movie_assignment_axis/features/home/domain/entities/popular.dart';
import 'package:movie_assignment_axis/features/home/domain/usecase/get_populars_use_case.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:http/http.dart' as http;

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._getPopularsUseCase) : super(HomeInitial());

  final GetPopularsUseCase _getPopularsUseCase;
  List<Popular> populars = [];

  Future<List<Popular>> getPopulars({int page = 1}) async {
    emit(GetPopularsLoading());
    final result = await _getPopularsUseCase.call(page: page);
    return await result.fold(
      (failure) async {
        emit(GetPopularsFailure(failure));
        return [];
      },
      (returnedPopulars) async {
        populars.addAll(returnedPopulars);
        emit(GetPopularsLoaded());
        return returnedPopulars;
      },
    );
  }


   bool downloading = false;
  Future<void> saveImage(String imageUrl) async {
    downloading = true;
    emit(ChangeDownloadingState(true));
    // setState(() => _downloading = true);

    try {
      final status = await Permission.storage.request();
      if (!status.isGranted) {
        emit(PermissionDenied());
        return;
      }
      final response = await http.get(Uri.parse(imageUrl));
      final Uint8List bytes = response.bodyBytes;

      final directory = await getExternalStorageDirectory();
      final String path =
          '${directory!.path}/${DateTime.now().millisecondsSinceEpoch}.jpg';
      final File file = File(path);

      await file.writeAsBytes(bytes);

      emit(ImageSavedState(path));
    } catch (e) {
      emit(ErrorSavingFile(e));
    } finally {
      downloading = false;
      emit(ChangeDownloadingState(false));
      // setState(() => _downloading = false);
    }
  }
}
