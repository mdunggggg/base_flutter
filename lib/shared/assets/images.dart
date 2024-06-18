part of 'assets.dart';

class _ImageAsset {
  const _ImageAsset(this.path);

  final String path;
}

class _Images {
  const _Images();

  _ImageAsset get logo => const _ImageAsset('path_logo');
}