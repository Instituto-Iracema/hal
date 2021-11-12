<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

<!-- TODO: Put a short description of the package here that helps potential users
know whether this package might be useful for them. -->
A Dart library to handle Hypertext Application Language (HAL) resources.


## Features

<!-- TODO: List what your package can do. Maybe include images, gifs, or videos. -->
- Easy handling of HAL Resources

## Getting started

<!-- TODO: List prerequisites and provide or point to information on how to
start using the package. -->

## Usage

<!-- TODO: Include short and useful examples for package users. Add longer examples
to `/example` folder.  -->

```dart

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

final resource =
          HypertextApplicationLanguageResource.fromMap(jsonExample);
          
```

## Additional information

<!-- TODO: Tell users more about the package: where to find more information, how to 
contribute to the package, how to file issues, what response they can expect 
from the package authors, and more. -->
Hypertext Application Language (HAL) specification is described in detail
at https://datatracker.ietf.org/doc/html/draft-kelly-json-hal