abstract class VideoRepository {
  Future<String?> getVideoManifestFromUrl(String url);
}