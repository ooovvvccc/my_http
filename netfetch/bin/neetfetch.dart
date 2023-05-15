
import 'package:http/http.dart' as http;
void main() async {
  final httpPackageUrl = Uri.https('dart.dev', '/f/packages/http.json');
  final httpPackageInfo = await http.read(httpPackageUrl);
  print(httpPackageInfo);
  final httpPackageUrl1= Uri.https('dart.dev', '/f/packages/http.json');
  final httpPackageResponse = await http.get(httpPackageUrl1);
  if (httpPackageResponse.statusCode != 200) {
    print('Failed to retrieve the http package!');
    return;
  }
  print(httpPackageResponse.body);
  await http.get(Uri.https('dart.dev', '/f/packages/http.json'),
    headers: {'User-Agent': '<product name>/<product-version>'});
 final httpPackageUrl2 = Uri.https('dart.dev', '/f/packages/http.json');
  final client = http.Client();
  try {
    final httpPackageInfo2 = await client.read(httpPackageUrl2);
    print(httpPackageInfo2);
  } finally {
    client.close();
  }
}