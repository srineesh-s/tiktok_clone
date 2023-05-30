import 'package:tiktok_clone/constants/api_constants.dart';
import 'package:tiktok_clone/constants/exceptions.dart';
import 'package:tiktok_clone/models/following_section_model.dart';
import 'package:tiktok_clone/models/for_you_section_model.dart';
import 'package:tiktok_clone/services/api_client.dart';

class TikTokSectionRepository {
  ApiClient _ApiClient;
  TikTokSectionRepository(this._ApiClient);
  Future<FollowingSectionModel> getFollowingSection() async {
    try {
      final response = await _ApiClient.getResponse(
          ApiConstants.baseUrl, ApiConstants.followingSectionRoute);
      return FollowingSectionModel.fromJson(response);
    } catch (e) {
      throw FollowingApiException();
    }
  }

  Future<ForYouSectionModel> forYouSeciton() async {
    try {
      final response = await _ApiClient.getResponse(
          ApiConstants.baseUrl, ApiConstants.forYouSectionRoute);
      return ForYouSectionModel.fromJson(response);
    } catch (e) {
      throw ForYouApiException();
    }
  }
}
