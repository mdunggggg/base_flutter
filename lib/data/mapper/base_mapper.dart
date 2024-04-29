abstract class BaseDataMapper<R, E> {
  const BaseDataMapper();

  E mapToEntity(R? data);

  List<E> mapToListEntity(List<R>? listData) {
    return listData?.map(mapToEntity).toList() ?? List.empty();
  }
}