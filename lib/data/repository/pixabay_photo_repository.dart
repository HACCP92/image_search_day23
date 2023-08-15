import 'package:image_search_day23/data/data_source/pixabay_api.dart';
import 'package:image_search_day23/data/mapper/photo_mapper.dart';
import 'package:image_search_day23/domain/model/photo.dart';
import 'package:image_search_day23/domain/repository/photo_reposiotry.dart';

class PixabayPhotoRepositoryImpl implements PhotoRepository {
  final _api = PixabayApi();

  @override
  Future<List<Photo>> getPhotos(String query) async {
    final resultDto = await _api.getImages(query);

    if (resultDto.hits == null) {
      return [];
    }
    return resultDto.hits!.map((e) => e.toPhoto()).toList();
  }
}
