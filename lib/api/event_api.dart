import 'package:noobz/api/api.dart';
import 'package:noobz/utils/string.dart';

class EventApi {
  storeEvent({
    event_name,
    event_type,
    payment_amount = null,
    payment_type = null,
    unit_name = null,
    unit_number = null,
    unit_type = null,
    schedule,
  }) async {
    var url = BASE_URL + 'register';
    var data;
    data = {
      'event_name': event_name,
      'event_type': event_type,
      'payment_amount': payment_amount,
      'payment_type': payment_type,
      'unit_name': unit_name,
      'unit_number': unit_number,
      'unit_type': unit_type,
      'schedule': schedule,
      'payment_status': 'pending',
      'api_token': '',
    };

    var response = await Api.execute(
      url: url,
      data: data,
    );
    print(response.toString());
    return response;
  }
}
