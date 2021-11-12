import 'package:hal/hal.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/foundation.dart';

final Map<String, dynamic> jsonExample = {
  "_links": {
    "self": {"href": "/event/1", "title": "Evento"},
    "describedby": {"href": "/schemas/event"},
    "collection": {"href": "/event", "title": "Todos os Eventos"},
    "external": {
      "href":
          "https://delage.com.br/blog/calendario-eventos-de-logistica-2021/",
      "title": "Mais detalhes",
      "type": "text/html"
    },
    "plan": {"href": "/association/1/plan", "title": "Associe-se já!"}
  },
  "_embedded": {
    "plan": [
      {"title": "Premium", "id": 1, "preco": 37.50}
    ]
  },
  "id": 1,
  "title": "Masterclass Logística Internacional",
  "description": "Imperdível!",
  "url_for_details":
      "https://delage.com.br/blog/calendario-eventos-de-logistica-2021/"
};

void main() {
  group('Resource class tests', () {
    test('Getter linksKeys return a list of strings', () {
      final resource =
          HypertextApplicationLanguageResource.fromMap(jsonExample);
      final links = resource.linksKeys;
      expect(links is List<String>, true);
    });

    // test('Getter linksKeys return the expected list', () {
    //   final resource =
    //       HypertextApplicationLanguageResource.fromMap(jsonExample);
    //   final List<String> links = resource.linksKeys;
    //   final expectedList = [
    //     'self',
    //     'describedby',
    //     'collection',
    //     'external',
    //     'plan'
    //   ];
    //   expect(listEquals(links, expectedList), true);
    // });

    // test('Getter embeddedKeys struct', () {
    //   final resource =
    //       HypertextApplicationLanguageResource.fromMap(jsonExample);
    //   final List<String> embeddedKeys = resource.embeddedKeys;
    //   final expectedList = ['plan'];
    //   expect(listEquals(embeddedKeys, expectedList), true);
    // });
    test('Getter embeddedKeys works', () {
      final resource =
          HypertextApplicationLanguageResource.fromMap(jsonExample);
      final embedded = resource.embeddedKeys;
      expect(embedded is List<String>, true);
    });
    test('Getter embeddedKeys return the expected list', () {
      final resource =
          HypertextApplicationLanguageResource.fromMap(jsonExample);
      final List<String> eKeys = resource.embeddedKeys;
      final expectedList = [];
      expect(listEquals(eKeys, expectedList), true);
    });

    test('Getter propertyKeys works', () {
      final resource =
          HypertextApplicationLanguageResource.fromMap(jsonExample);
      final property = resource.propertyKeys;
      expect(property is List<String>, true);
    });

    // test('Getter propertyKeys return the expected list', () {
    //   final resource =
    //       HypertextApplicationLanguageResource.fromMap(jsonExample);
    //   final List<String> pKeys = resource.propertyKeys;
    //   final expectedList = [];
    //   expect(listEquals(pKeys, expectedList), true);
    // });

    // test('Getter propertyKeys return the expected list', () {
    //   final resource =
    //       HypertextApplicationLanguageResource.fromMap(jsonExample);
    //   final List<String> pKeys = resource.propertyKeys;
    //   final expectedList = [];
    //   expect(listEquals(pKeys, expectedList), true);
    // });

    test('Constructor works', () {
      final Map<String, dynamic> map = {
        "_links": {
          "self": {"href": "/event/1", "title": "Evento"},
          "describedby": {"href": "/schemas/event"},
          "collection": {"href": "/event", "title": "Todos os Eventos"},
          "external": {
            "href":
                "https://delage.com.br/blog/calendario-eventos-de-logistica-2021/",
            "title": "Mais detalhes",
            "type": "text/html"
          },
          "plan": {"href": "/association/1/plan", "title": "Associe-se já!"}
        },
        "id": 1,
        "title": "Masterclass Logística Internacional",
        "description": "Imperdível!",
        "url_for_details":
            "https://delage.com.br/blog/calendario-eventos-de-logistica-2021/"
      };

      final resource = HypertextApplicationLanguageResource.fromMap(map);

      expect(resource is HypertextApplicationLanguageResource, true);
    });

    test('Resource has expected keys', () {
      final Map<String, dynamic> map = {
        "_links": {
          "self": {"href": "/event/1", "title": "Evento"},
          "describedby": {"href": "/schemas/event"},
          "collection": {"href": "/event", "title": "Todos os Eventos"},
          "external": {
            "href":
                "https://delage.com.br/blog/calendario-eventos-de-logistica-2021/",
            "title": "Mais detalhes",
            "type": "text/html"
          },
          "plan": {"href": "/association/1/plan", "title": "Associe-se já!"}
        },
        "id": 1,
        "title": "Masterclass Logística Internacional",
        "description": "Imperdível!",
        "url_for_details":
            "https://delage.com.br/blog/calendario-eventos-de-logistica-2021/"
      };

      final resource = HypertextApplicationLanguageResource.fromMap(map);

      expect(resource.hasLink('self'), true);
      expect(resource.hasLink('describedby'), true);
      expect(resource.hasLink('collection'), true);
      expect(resource.hasLink('external'), true);
      expect(resource.hasLink('plan'), true);
    });
  });
}
