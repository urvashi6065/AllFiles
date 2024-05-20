class HitModel {
  final int id;
  final String pageURL;
  final String type;
  final String tags;
  final String previewURL;
  final int previewWidth;
  final int previewHeight;
  final String webformatURL;
  final int webformatWidth;
  final int webformatHeight;
  final String largeImageURL;
  final int imageWidth;
  final int imageHeight;
  final int imageSize;
  final int views;
  final int downloads;
  final int collections;
  final int likes;
  final int comments;
  final int user_id;
  final String user;
  final String userImageURL;

  HitModel(
      {required this.id, required this.pageURL, required this.type, required this.tags, required this.previewURL,
        required this.previewWidth, required this.previewHeight, required this.webformatURL,
        required this.webformatWidth, required this.webformatHeight, required this.largeImageURL,
        required this.imageWidth, required this.imageHeight, required this.imageSize, required this.views,
        required this.downloads, required this.collections, required this.likes, required this.comments, required this.user_id,
        required this.user, required this.userImageURL});

  factory HitModel.fromjson(Map map){
    return HitModel(id: map['id'],
        pageURL: map['pageURL'],
        type: map['type'],
        tags: map['tags'],
        previewURL: map['previewURL'],
        previewWidth: map['previewWidth'],
        previewHeight: map['previewHeight'],
        webformatURL: map['webformatURL'],
        webformatWidth: map['webformatWidth'],
        webformatHeight: map['webformatHeight'],
        largeImageURL: map['largeImageURL'],
        imageWidth: map['imageWidth'],
        imageHeight: map['imageHeight'],
        imageSize: map['imageSize'],
        views: map['views'],
        downloads: map['downloads'],
        collections: map['collections'],
        likes: map['likes'],
        comments: map['comments'],
        user_id: map['user_id'],
        user: map['user'],
        userImageURL: map['userImageURL']);
  }
}