import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tiktok_clone/models/following_section_model.dart';
import 'package:tiktok_clone/models/for_you_section_model.dart';
import 'package:tiktok_clone/screens/tiktok_screen/repository/tiktok_repository.dart';
import 'package:tiktok_clone/services/api_client.dart';

import 'tiktok_repository_test.mocks.dart';

@GenerateMocks([ApiClient])
void main() {
  late MockApiClient mockApiClient;
  late TikTokSectionRepository tikTokSectionRepository;
  setUp(() {
    mockApiClient = MockApiClient();
    tikTokSectionRepository = TikTokSectionRepository(mockApiClient);
  });

  Map<String, dynamic> followingSuccessResponse = {
    "type": "flashcard",
    "id": 9949,
    "playlist": "Period 5: 1844-1883",
    "flashcard_front":
        "How did the election of 1844 contribute to the Mexican-American War?",
    "flashcard_back":
        "Election of 1844:\n- Democrats: Led by James Polk, in favor of annexing Texas to the US, \"Texas or Disunion\"\n- Southern Democrats threatened to disassociate themselves if there is no annexation\n- Whigs: Led by Henry Clay, favored annexing Texas but doing it later \n- Polk saw his victory as a mandate in favor of annexation",
    "description": "Topic 5.3: The Mexicanâ€“American War #apush",
    "user": {
      "name": "AP US History",
      "avatar":
          "http://cross-platform-rwa.s3-website-us-east-1.amazonaws.com/avatars/apush.png"
    }
  };

  Map<String, dynamic> forYouSectionResponse = {
    "type": "mcq",
    "id": 6194,
    "playlist": "Period 6: 1865-1898",
    "description": "5.5 Sectional Conflict:  Regional Differences #apush",
    "question":
        "What did it mean when defenders of slavery called it a \"positive social good\"?",
    "options": [
      {
        "id": "A",
        "answer":
            "Slavery gave black people a better life than if they lived in a free society"
      },
      {
        "id": "B",
        "answer":
            "Slavery created a power structure that defined morality for everyone"
      },
      {"id": "C", "answer": "Slavery was essential for the economy to prosper"}
    ],
    "user": {
      "name": "AP US History",
      "avatar":
          "http://cross-platform-rwa.s3-website-us-east-1.amazonaws.com/avatars/apush.png"
    }
  };

  test("checking the success following section", () async {
    when(mockApiClient.getResponse(
            "https://cross-platform.rp.devfactory.com/", "following"))
        .thenAnswer((realInvocation) async => followingSuccessResponse);
    final response = await tikTokSectionRepository.getFollowingSection();
    expect(response, isA<FollowingSectionModel>());
  });

  test("checking the success for you  section", () async {
    when(mockApiClient.getResponse(
            "https://cross-platform.rp.devfactory.com/", "for_you"))
        .thenAnswer((realInvocation) async => forYouSectionResponse);
    final response = await tikTokSectionRepository.forYouSeciton();
    expect(response, isA<ForYouSectionModel>());
  });
}
