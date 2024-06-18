part of 'assets.dart';

class _IconAsset {
  const _IconAsset(this.path);
  final String path;
}

class _Icons {
  const _Icons();

  _IconAsset get icon => const _IconAsset('icon_path');

}