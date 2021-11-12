import 'package:hal/hal.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/foundation.dart';
import 'package:hal/src/rippers.dart';

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
  group('Rippers test', () {
    test('Parse links', () {
      final links = parseLinks(jsonExample);
      print(links);
      // expect(links is Map(String, dynamic), true);
      // expect(links., true);
    });
  });
}
