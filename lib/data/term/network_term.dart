class ApiConstants {
  //authetication
  static const loginUrl = '/login';
  static const validateOtpUrl = '/validate-otp';
  static const generateOtpUrl = '/generate-otp';
  //user-controller
  static const updateUserInforUrl = '/user';
  static const upLoadAvatarUrl = '/uploadAvatar';
  static const changePasswordUrl = '/changePassword';
  static const searchUrl = '/search';
  static const userUrl = '/users/me/v2';
  static const allUserUrl = '/me';
  //friend-ship
  //study
  //vocabulary
  static const vocabFromTopic = '/vocabulary/';
  static const searchTopic = '/vocabularies/search';
  // static const
  // static const
  // static const
  static const deleteVocab = '/vocabularies/';
  //static const
  //topic
  static const allTopicUrl = '/topics/all';
  static const searchTopicUrl = '/topics/search';
  static const deleteTopicUrl = '/topics/';
  //question
  static const getQuestionUrl = '/questions/';
  //friend
  static const addFriendUrl = '/friend-ship/add-friend/';
  static const acceptFriendUrl = '/friend-ship/accept-friend/';
  static const getSendingListFriendUrl = '/friend-ship/sending-list';
  static const getRequestListFriendUrl = '/friend-ship/request-list';
  static const getlistFriendUrl = '/friend-ship/friend-list';
  static const canelFriendUrl = '/friend-ship/cancel-friend/';
  //chat
  static const getListConversationUrl = '/conversations/all-me';
  static const createConversationUrl = '/conversations';
  static const sendMessageUrl = '/messages';
}
