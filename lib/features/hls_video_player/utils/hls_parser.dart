import 'package:stage_hls_assignment/core/utils/enum/attribute_type.enum.dart';

class HlsParser {
  static const String regexpResolutions = 'RESOLUTION=(\\d+x\\d+)';
  static const String regexpBandwidth = '[^-]BANDWIDTH=(\\d+)\\b';

  static Map<AttributeType, List<String>> extractFromManifest(
      String manifest, Map<AttributeType, String> patterns) {
    Map<AttributeType, List<String>> extractedData = {};

    patterns.forEach((attribute, pattern) {
      final RegExp regExp = RegExp(pattern);

      // Find all matches of the pattern in the manifest
      Iterable<Match> matches = regExp.allMatches(manifest);

      // Initialize an empty list to store extracted values
      List<String> values = [];

      // Extract values from the matches
      for (Match match in matches) {
        // Extract the value from the matched substring
        String value = match.group(1)!; // Group 1 contains the value
        values.add(value);
      }

      // Add extracted values to the map
      extractedData[attribute] = values;
    });

    return extractedData;
  }

  static List<String> sortResolutions(List<String> resolutions) {
    resolutions.sort((a, b) {
      // Parse the resolutions into width and height integers
      List<int> resolutionA = a.split('x').map(int.parse).toList();
      List<int> resolutionB = b.split('x').map(int.parse).toList();

      // Compare the resolutions based on width and height
      if (resolutionA[0] != resolutionB[0]) {
        // If width is different, sort by width in descending order
        return resolutionB[0].compareTo(resolutionA[0]);
      } else {
        // If width is same, sort by height in descending order
        return resolutionB[1].compareTo(resolutionA[1]);
      }
    });

    return resolutions;
  }

  static String appendResolutionToUrl(String url, String resolution) {
    // Find the last occurrence of '.' in the URL
    int lastIndex = url.lastIndexOf('.');

    // Insert the resolution before the file extension
    String modifiedUrl =
        url.substring(0, lastIndex) + resolution + url.substring(lastIndex);

    return modifiedUrl;
  }
}
