class GistData {
  String url;
  String forksUrl;
  String commitsUrl;
  String id;
  String nodeId;
  String gitPullUrl;
  String gitPushUrl;
  String htmlUrl;
  bool public;
  Files files;
  // Map<String, dynamic> files;
  DateTime createdAt;
  DateTime updatedAt;
  String description;
  int comments;
  dynamic user;
  String commentsUrl;
  Owner owner;
  bool truncated;

  GistData({
    this.url,
    this.forksUrl,
    this.commitsUrl,
    this.id,
    this.nodeId,
    this.gitPullUrl,
    this.gitPushUrl,
    this.htmlUrl,
    this.public,
    this.files,
    this.createdAt,
    this.updatedAt,
    this.description,
    this.comments,
    this.user,
    this.commentsUrl,
    this.owner,
    this.truncated,
  });

  factory GistData.fromJson(
          Map<String, dynamic> json) =>
      GistData(
        url: json["url"],
        forksUrl: json["forks_url"],
        commitsUrl: json["commits_url"],
        id: json["id"],
        nodeId: json["node_id"],
        gitPullUrl: json["git_pull_url"],
        gitPushUrl: json["git_push_url"],
        htmlUrl: json["html_url"],
        public: json["public"],
        files: Files.fromJson(json["files"]),
        // files: json["files"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        description: json["description"],
        comments: json["comments"],
        user: json["user"],
        commentsUrl: json["comments_url"],
        owner: Owner.fromJson(json["owner"]),
        truncated: json["truncated"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "forks_url": forksUrl,
        "commits_url": commitsUrl,
        "id": id,
        "node_id": nodeId,
        "git_pull_url": gitPullUrl,
        "git_push_url": gitPushUrl,
        "html_url": htmlUrl,
        "public": public,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "description": description,
        "comments": comments,
        "user": user,
        "comments_url": commentsUrl,
        "owner": owner.toJson(),
        "truncated": truncated,
      };
}

class Owner {
  String login;
  int id;
  String nodeId;
  String avatarUrl;
  String gravatarId;
  String url;
  String htmlUrl;
  String followersUrl;
  String followingUrl;
  String gistsUrl;
  String starredUrl;
  String subscriptionsUrl;
  String organizationsUrl;
  String reposUrl;
  String eventsUrl;
  String receivedEventsUrl;
  String type;
  bool siteAdmin;

  Owner({
    this.login,
    this.id,
    this.nodeId,
    this.avatarUrl,
    this.gravatarId,
    this.url,
    this.htmlUrl,
    this.followersUrl,
    this.followingUrl,
    this.gistsUrl,
    this.starredUrl,
    this.subscriptionsUrl,
    this.organizationsUrl,
    this.reposUrl,
    this.eventsUrl,
    this.receivedEventsUrl,
    this.type,
    this.siteAdmin,
  });

  factory Owner.fromJson(Map<String, dynamic> json) => Owner(
        login: json["login"],
        id: json["id"],
        nodeId: json["node_id"],
        avatarUrl: json["avatar_url"],
        gravatarId: json["gravatar_id"],
        url: json["url"],
        htmlUrl: json["html_url"],
        followersUrl: json["followers_url"],
        followingUrl: json["following_url"],
        gistsUrl: json["gists_url"],
        starredUrl: json["starred_url"],
        subscriptionsUrl: json["subscriptions_url"],
        organizationsUrl: json["organizations_url"],
        reposUrl: json["repos_url"],
        eventsUrl: json["events_url"],
        receivedEventsUrl: json["received_events_url"],
        type: json["type"],
        siteAdmin: json["site_admin"],
      );

  Map<String, dynamic> toJson() => {
        "login": login,
        "id": id,
        "node_id": nodeId,
        "avatar_url": avatarUrl,
        "gravatar_id": gravatarId,
        "url": url,
        "html_url": htmlUrl,
        "followers_url": followersUrl,
        "following_url": followingUrl,
        "gists_url": gistsUrl,
        "starred_url": starredUrl,
        "subscriptions_url": subscriptionsUrl,
        "organizations_url": organizationsUrl,
        "repos_url": reposUrl,
        "events_url": eventsUrl,
        "received_events_url": receivedEventsUrl,
        "type": type,
        "site_admin": siteAdmin,
      };
}

class Files {
  List<String> filesName;
  List<FilesData> filesData;
  Files({this.filesName, this.filesData});

  factory Files.fromJson(Map<String, dynamic> json) {
    List<String> filesName;
    List<FilesData> filesData = List();
    filesName = json.keys.map((e) => e).toList();
    filesData = json.values.map((e) => FilesData.fromJson(e)).toList();
    return Files(filesName: filesName, filesData: filesData);
  }
}

class FilesData {
  FilesData({
    this.filename,
    this.type,
    this.language,
    this.rawUrl,
    this.size,
  });

  String filename;
  String type;
  dynamic language;
  String rawUrl;
  int size;

  factory FilesData.fromJson(Map<String, dynamic> json) => FilesData(
        filename: json["filename"],
        type: json["type"],
        language: json["language"],
        rawUrl: json["raw_url"],
        size: json["size"],
      );

  Map<String, dynamic> toJson() => {
        "filename": filename,
        "type": type,
        "language": language,
        "raw_url": rawUrl,
        "size": size,
      };
}