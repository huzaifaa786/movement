import 'package:get_storage/get_storage.dart';
import 'package:translator/translator.dart';

Future<String> translateText(String text) async {
  GetStorage box = GetStorage();
  GoogleTranslator translator = GoogleTranslator();
  Translation translation =
      await translator.translate(text, to: box.read('Locale'));
  return translation.text;
}
