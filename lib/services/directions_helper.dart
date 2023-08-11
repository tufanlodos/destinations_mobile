const originCoords = {"latitude": '41.0052041', "longitude": '28.8473737'};

const defaultParameters = [
  {"key": "travelmode", "value": "driving"}
];

class DirectionsHelper {
  static String getParams(List<Map<String, String>> params) {
    return params.map((param) => "${param['key']}=${param['value']}").join("&");
  }

  static String getSchemeAndURL(String latitude, String longitude,
      [origin = originCoords, params = defaultParameters]) {
    final List<Map<String, String>> paramsCopy = List.from(params);
    paramsCopy.add({
      "key": 'destination',
      "value": "$latitude,$longitude",
    });
    paramsCopy.add({
      "key": 'origin',
      "value": "${origin["latitude"]},${origin["longitude"]}",
    });
    return "https://www.google.com/maps/dir/?api=1&${getParams(paramsCopy)}";
  }
}
