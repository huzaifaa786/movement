import 'package:academy_app/models/all_category.dart';
import 'package:academy_app/models/common_functions.dart';
import 'package:academy_app/models/course.dart';
import 'package:academy_app/models/instructor.dart';
import 'package:academy_app/models/message.dart';
import 'package:academy_app/models/message_user.dart';
import 'package:academy_app/models/sub_category.dart';
import 'package:academy_app/providers/shared_pref_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/category.dart';
import '../constants.dart';

class Messages with ChangeNotifier {
  List<Course> _items = [];

  List<Course> get items {
    return [..._items];
  }

  Future<void> fetchCoursesByCategory(int categoryId) async {
    var url = '$BASE_URL/api/category_wise_course?category_id=$categoryId';
    try {
      final response = await http.get(Uri.parse(url));
      final extractedData = json.decode(response.body) as List;
      // ignore: unnecessary_null_comparison
      if (extractedData == null) {
        return;
      }
      // print(extractedData);

      _items = buildCourseList(extractedData);
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }

  List<Course> buildCourseList(List extractedData) {
    final List<Course> loadedCourses = [];
    for (var courseData in extractedData) {
      loadedCourses.add(Course(
        id: int.parse(courseData['id']),
        title: courseData['title'],
        thumbnail: courseData['thumbnail'],
        price: courseData['price'],
        isFreeCourse: courseData['is_free_course'],
        instructor: courseData['instructor_name'],
        instructorImage: courseData['instructor_image'],
        rating: courseData['rating'],
        totalNumberRating: courseData['number_of_ratings'],
        numberOfEnrollment: courseData['total_enrollment'],
        shareableLink: courseData['shareable_link'],
        courseOverviewProvider: courseData['course_overview_provider'],
        courseOverviewUrl: courseData['video_url'],
        vimeoVideoId: courseData['vimeo_video_id'],
        productId: courseData['product_id'],
      ));
      // print(catData['name']);
    }
    return loadedCourses;
  }

  Future<void> sendNewMessage(String message, Instructor instructor) async {
    try {
      final authToken = await SharedPreferenceHelper().getAuthToken();
      final instructorId = instructor.id;

      if (authToken == null) {
        return;
      }
      try {
        final url = Uri.parse(
            '$BASE_URL/api/send_new_message/$authToken/$message/$instructorId/academybycreativeitem');
        final response = await http.post(url, body: {
          'message': message,
        });
        final responseData = json.decode(response.body);

        if (responseData['message'] != 'success') {
          return;
        } else {
          CommonFunctions.showSuccessToast('Message Sent Successfully');
        }
      } catch (e) {
        // Handle any exceptions that occur during the HTTP request or JSON decoding
        print('Error: $e');
      }

      notifyListeners();
    } catch (error) {
      print('An error occurred while  the : $error'); // Consider using a logger
    }
  }

  Future<List<MessageUser>?> getMessageUsers() async {
    List<MessageUser> messages = [];
    try {
      final authToken = await SharedPreferenceHelper().getAuthToken();

      if (authToken == null) {
        return messages;
      }

      try {
        final url = Uri.parse(
            '$BASE_URL/api/get_message_users/$authToken/academybycreativeitem');
        final response = await http.get(url);
        final responseData = json.decode(response.body);

        if (response.statusCode != 200) {
          return messages;
        } else {
          for (var messageUser in responseData) {
            print(messageUser);
            messages.add(MessageUser(
                threadCode: messageUser['message_thread_code'].toString(),
                instructorId:
                    int.parse(messageUser['user_to_show_id'].toString()),
                firstName: messageUser['user_to_show_first_name'].toString(),
                lastName: messageUser['user_to_show_last_name'].toString(),
                email: messageUser['user_to_show_email'].toString(),
                imageUrl: messageUser['user_to_show_image'].toString(),
                countUnread: int.parse(
                    messageUser['number_of_unreaded_message'].toString()),
                lastMessage: messageUser['last_message'].toString(),
                lastMessageTimestamp: int.parse(
                    messageUser['last_message_timestamp'].toString())));
          }
          print(messages);
          return messages;
        }
      } catch (e) {
        // Handle any exceptions that occur during the HTTP request or JSON decoding
        print('Error: $e');
      }

      notifyListeners();
    } catch (error) {
      print('An error occurred while  the : $error'); // Consider using a logger
    }
  }

  Future<List<Message>?> getMessages(String threadCode) async {
    List<Message> messages = [];
    try {
      final authToken = await SharedPreferenceHelper().getAuthToken();

      if (authToken == null) {
        return messages;
      }

      try {
        final url = Uri.parse(
            '$BASE_URL/api/messages/$threadCode/$authToken/academybycreativeitem');
        final response = await http.get(url);
        final responseData = json.decode(response.body);
        print(responseData);

        if (response.statusCode != 200) {
          return messages;
        } else {
          for (var messageUser in responseData) {
            messages.add(Message(
                messageThreadCode:
                    messageUser['message_thread_code'].toString(),
                message: messageUser['message'].toString(),
                firstName: messageUser['first_name'].toString(),
                lastName: messageUser['last_name'].toString(),
                messageId: int.parse(messageUser['message_id'].toString()),
                senderId: int.parse(messageUser['sender'].toString()),
                timestamp: int.parse(messageUser['timestamp'].toString())));
          }
          print(messages);
          return messages;
        }
      } catch (e) {
        // Handle any exceptions that occur during the HTTP request or JSON decoding
        print('Error: $e');
      }

      notifyListeners();
    } catch (error) {
      print('An error occurred while  the : $error'); // Consider using a logger
    }
  }

  Future<void> sendMessage(String threadCode, String message) async {
    try {
      final authToken = await SharedPreferenceHelper().getAuthToken();

      if (authToken == null) {
        return;
      }

      try {
        final url = Uri.parse(
            '$BASE_URL/api/send_message/$threadCode/$authToken/academybycreativeitem');
        final response = await http.post(url, body: {
          'message': message,
        });
        final responseData = json.decode(response.body);
        print(responseData);

        if (response.statusCode != 200) {
          return;
        } else {
      
          return;
        }
      } catch (e) {
        // Handle any exceptions that occur during the HTTP request or JSON decoding
        print('Error: $e');
      }

      notifyListeners();
    } catch (error) {
      print('An error occurred while  the : $error'); // Consider using a logger
    }
  }
}
