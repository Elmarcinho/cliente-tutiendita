import 'package:url_launcher/url_launcher_string.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';



class WhatsAppService {

  static launchWhatsAppString(String mensaje) async {
    final link = WhatsAppUnilink(
      phoneNumber: '+59133217668',
      text: mensaje,
    );
    await launchUrlString('$link'); 
  } 
}