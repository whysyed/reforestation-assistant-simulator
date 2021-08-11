import 'package:ras/models/kml/Placemark.dart';
import 'package:ras/models/kml/Polygon.dart';

class KML {
  String name;
  String content;
  String style; //TO DO: Implement different styles for markers

  KML(this.name, this.content,{this.style = ''});

  static buildKMLContent(List<Placemark> placemarks, Polygon polygon) {
    String kmlContent = '';
    if(polygon.coord.length > 0) kmlContent += '\n ${polygon.generateTag()}';
    placemarks.forEach((element) {
      kmlContent += '\n ${element.generateTag()}';
    });

    return kmlContent;
  }

  mount() {
    return '''
<?xml version="1.0" encoding="UTF-8"?>
  <kml xmlns="http://www.opengis.net/kml/2.2" xmlns:gx="http://www.google.com/kml/ext/2.2" xmlns:kml="http://www.opengis.net/kml/2.2" xmlns:atom="http://www.w3.org/2005/Atom">
    <Document>
      <name>$name</name>
        <Folder>
        $content
        </Folder>
    </Document>
  </kml>
''';
  }
}
