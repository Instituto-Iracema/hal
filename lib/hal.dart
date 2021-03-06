/// A Dart library to handle Hypertext Application Language (HAL) resources.
/// Hypertext Application Language (HAL) specification is described in detail
/// at https://datatracker.ietf.org/doc/html/draft-kelly-json-hal
library hal;

import 'package:hal/src/rippers.dart';

/// A representation of a JSON HAL resource, according to the specification available at https://datatracker.ietf.org/doc/html/draft-kelly-json-hal
/// Resources are described in detail in
///
/// https://datatracker.ietf.org/doc/html/draft-kelly-json-hal#page-4
///
/// Bellow is an excerpt from the specification:
///
/// ## 4. Resource Objects

/// A Resource Object represents a resource.

/// It has two reserved properties:

/// 1.  "_links": contains links to other resources.

/// 2.  "_embedded": contains embedded resources.

/// All other properties MUST be valid JSON, and represent the current
/// state of the resource.

class HypertextApplicationLanguageResource {
  /// Provides a HAL Resource from a JSON-like map.
  HypertextApplicationLanguageResource.fromMap(Map<String, dynamic> map)
      : links = parseLinks(map),
        embedded = parseEmbedded(map),
        properties = parseProperties(map),
        _source = map;

  /// Available link objects and lists of link objects.
  /// Link Objects are described in detail in
  /// https://datatracker.ietf.org/doc/html/draft-kelly-json-hal#section-5

  /// #### 4.1.1.  _links

  ///  The reserved "_links" property is OPTIONAL.

  /// It is an object whose property names are link relation types (as
  /// defined by [RFC5988]) and values are either a Link Object or an array
  /// of Link Objects.  The subject resource of these links is the Resource
  ///  Object of which the containing "_links" object is a property.
  final Map<String, dynamic> links;

  /// ####  4.1.2.  _embedded

  /// The reserved "_embedded" property is OPTIONAL

  /// It is an object whose property names are link relation types (as
  /// defined by [RFC5988]) and values are either a Resource Object or an
  /// array of Resource Objects.

  ///  Embedded Resources MAY be a full, partial, or inconsistent version of
  ///  the representation served from the target URI.
  final Map<String, dynamic> embedded;

  ///

  /// The unreserved properties of the resource.
  final Map<String, dynamic> properties;

  /// The source map of the resource.
  final Map<String, dynamic> _source;

  /// List of keys for each link relation type.
  List<String> get linksKeys => links.keys.toList();

  /// List of keys for each embedded resource or list of embedded resources.
  List<String> get embeddedKeys => embedded.keys.toList();

  /// List of keys for each property.
  List<String> get propertyKeys => properties.keys.toList();

  /// Given a link relation type returns true if the resource has a link for such relation type, false otherwise.
  bool hasLink(String key) => links.containsKey(key);

  /// Given a link relation type returns true if the resource has an embedded resource for such relation type, false otherwise.
  bool hasEmbedded(String key) => embedded.containsKey(key);

  /// Given a key for a property returns true if the resource has a property for such key, false otherwise.
  bool hasProperty(String key) => properties.containsKey(key);

  /// Given a link relation type returns the link object or list of link objects for such relation type, null otherwise.
  dynamic getLink(String key) => links[key];

  /// Given a link relation type returns the embedded resource or list of embedded resources for such relation type, null otherwise.
  dynamic getEmbedded(String key) => embedded[key];

  /// Given a key for a property returns the property value for such key, null otherwise.
  dynamic getProperty(String key) => properties[key];

  Map<String, dynamic> getSource() => _source;

  @override
  String toString() {
    return 'HypertextApplicationLanguageResource{links: $linksKeys, embeds: $embeddedKeys}';
  }
}

/// ### 5.  Link Objects

/// A Link Object represents a hyperlink from the containing resource to
/// a URI.  It has the following properties:
class HypertextApplicationLanguageLink {
  const HypertextApplicationLanguageLink({
    required this.href,
    this.type,
    this.deprecation,
    this.name,
    this.profile,
    this.title,
    this.hreflang,
    this.templated = true,
  });

  /// ### 5.1.  href

  /// The "href" property is REQUIRED.

  /// Its value is either a URI [RFC3986] or a URI Template [RFC6570].

  /// If the value is a URI Template then the Link Object SHOULD have a
  /// "templated" attribute whose value is true.
  final String href;

  /// #### 5.2.  templated

  /// The "templated" property is OPTIONAL.

  ///    Its value is boolean and SHOULD be true when the Link Object's "href"
  ///    property is a URI Template.

  ///    Its value SHOULD be considered false if it is undefined or any other
  ///    value than true.
  final bool templated;

  /// #### 5.3.  type

  ///    The "type" property is OPTIONAL.

  ///    Its value is a string used as a hint to indicate the media type
  ///    expected when dereferencing the target resource.
  final String? type;

  /// #### 5.4.  deprecation

  ///    The "deprecation" property is OPTIONAL.

  ///    Its presence indicates that the link is to be deprecated (i.e.
  ///    removed) at a future date.  Its value is a URL that SHOULD provide
  ///    further information about the deprecation.

  ///    A client SHOULD provide some notification (for example, by logging a
  ///    warning message) whenever it traverses over a link that has this
  ///    property.  The notification SHOULD include the deprecation property's
  ///    value so that a client manitainer can easily find information about
  ///    the deprecation.
  final String? deprecation;

  /// #### 5.5.  name

  ///    The "name" property is OPTIONAL.

  ///    Its value MAY be used as a secondary key for selecting Link Objects
  ///    which share the same relation type.
  final String? name;

  /// #### 5.6.  profile

  ///    The "profile" property is OPTIONAL.

  ///    Its value is a string which is a URI that hints about the profile (as
  ///    defined by [I-D.wilde-profile-link]) of the target resource.
  ///
  final String? profile;

  /// #### 5.7.  title

  ///    The "title" property is OPTIONAL.

  ///    Its value is a string and is intended for labelling the link with a
  ///    human-readable identifier (as defined by [RFC5988]).
  final String? title;

  /// #### 5.8.  hreflang

  ///    The "hreflang" property is OPTIONAL.

  ///    Its value is a string and is intended for indicating the language of
  ///    the target resource (as defined by [RFC5988]).
  final String? hreflang;

  /// Provides a Link object from a JSON-like map.
  HypertextApplicationLanguageLink.fromMap(Map<String, dynamic> map)
      : type = map['type'] ?? null,
        href = map['href'],
        templated = map['templated'] ?? false,
        title = map['title'] ?? 'Sem t??tulo',
        deprecation = map['deprecation'] ?? null,
        name = map['name'] ?? null,
        profile = map['profile'] ?? null,
        hreflang = map['hreflang'] ?? null {
    if (href == null) {
      throw Exception('Link n??o possui href');
    }
  }
}
