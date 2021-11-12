import '../hal.dart';

/// Rip the links from a provided map.
Map<String, dynamic> parseLinks(Map<String, dynamic> map) {
  if (map['_links'] != null) {
    try {
      final linksMap = Map<String, dynamic>.from(map['_links']);

      // for each key, parse the link
      var newLinksMap = Map<String, dynamic>.fromIterable(linksMap.keys,
          key: (key) => key,
          value: (key) {
            final value = linksMap[key];

            if (value is Map) {
              return HypertextApplicationLanguageLink.fromMap(
                  Map<String, dynamic>.from(value));
            }

            if (value is List) {
              return value
                  .map((item) => HypertextApplicationLanguageLink.fromMap(
                      Map<String, dynamic>.from(item)))
                  .toList();
            }
          });

      return newLinksMap;
    } catch (e) {
      return {};
    }
  }

  return {};
}

/// Rip the embedded resources from a provided map.
Map<String, dynamic> parseEmbedded(Map<String, dynamic> map) {
  if (map['_embedded'] != null) {
    try {
      final embeddedResourcesMap = Map<String, dynamic>.from(map['_embedded']);

      // for each key, parse the embedded resource
      var newEmbeddedResourcesMap = Map<String, dynamic>.fromIterable(
        embeddedResourcesMap.keys,
        key: (key) => key,
        value: (key) {
          final value = embeddedResourcesMap[key];

          if (value is List) {
            return value
                .map((resource) => HypertextApplicationLanguageResource.fromMap(
                    Map<String, dynamic>.from(resource)))
                .toList();
          }

          if (value is Map) {
            return HypertextApplicationLanguageResource.fromMap(
                Map<String, dynamic>.from(value));
          }
        },
      );

      return newEmbeddedResourcesMap;
    } catch (e) {
      return {};
    }
  }

  return {};
}

/// Rip the properties from a provided map.
Map<String, dynamic> parseProperties(Map<String, dynamic> map) {
  if (map['_links'] != null) {
    map.remove('_links');
  }
  if (map['_embedded'] != null) {
    map.remove('_embedded');
  }

  return map;
}
