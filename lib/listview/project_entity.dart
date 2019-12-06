class ProjectEntityDataContent {
  int ggsiteCount;
  double projectLowerPrice;
  dynamic attachmentId;
  String projectName;
  String projectId;
  double projectHighestPrice;
  int distanceFromDowntown;
  dynamic url;
  int scene;

  ProjectEntityDataContent(
      {this.ggsiteCount,
      this.projectLowerPrice,
      this.attachmentId,
      this.projectName,
      this.projectId,
      this.projectHighestPrice,
      this.distanceFromDowntown,
      this.url,
      this.scene});

  ProjectEntityDataContent.fromJson(Map<String, dynamic> json) {
    ggsiteCount = json['ggsiteCount'];
    projectLowerPrice = json['projectLowerPrice'];
    attachmentId = json['attachmentId'];
    projectName = json['projectName'];
    projectId = json['projectId'];
    projectHighestPrice = json['projectHighestPrice'];
    distanceFromDowntown = json['distanceFromDowntown'];
    url = json['url'];
    scene = json['scene'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ggsiteCount'] = this.ggsiteCount;
    data['projectLowerPrice'] = this.projectLowerPrice;
    data['attachmentId'] = this.attachmentId;
    data['projectName'] = this.projectName;
    data['projectId'] = this.projectId;
    data['projectHighestPrice'] = this.projectHighestPrice;
    data['distanceFromDowntown'] = this.distanceFromDowntown;
    data['url'] = this.url;
    data['scene'] = this.scene;
    return data;
  }
}
