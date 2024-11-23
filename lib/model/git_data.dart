class GitData {
  PersonalData personalData;
  List<ProjectData> projectData;
  List<Experience> experience;
  SiteData siteData;
  GitData({
    required this.personalData,
    required this.projectData,
    required this.experience,
    required this.siteData,
  });

  factory GitData.fromMap(Map<String, dynamic> data) {
    return GitData(
        personalData: PersonalData.fromMap(data["personal_data"]),
        experience: List<Experience>.from(
            data["experience"].map((e) => Experience.fromMap(e))),
        projectData: List<ProjectData>.from(
            data["project_data"].map((e) => ProjectData.fromMap(e))),
        siteData: SiteData.fromMap(data["site_data"]));
  }
}

class SocialLinks {
  final String linkedin;
  final String github;
  final String instagram;
  final String resume;
  SocialLinks({
    required this.linkedin,
    required this.github,
    required this.resume,
    required this.instagram,
  });
  factory SocialLinks.fromMap(Map<String, dynamic> map) => SocialLinks(
      linkedin: map["linkedin"],
      github: map["github"],
      instagram: map["instagram"],
      resume: map["resume"]);
}

class PersonalData {
  String name;
  List<String> desc;
  SocialLinks socialLinks;

  PersonalData({
    required this.name,
    required this.desc,
    required this.socialLinks,
  });

  factory PersonalData.fromMap(Map<String, dynamic> data) => PersonalData(
      socialLinks: SocialLinks.fromMap(data["social-links"]),
      name: data["name"],
      desc: List<String>.from(data["desc"].map((e) => e)));
}

class Experience {
  String name;
  String from;
  String to;
  List<String> desc;
  Experience({
    required this.name,
    required this.from,
    required this.to,
    required this.desc,
  });

  factory Experience.fromMap(Map<String, dynamic> data) => Experience(
      name: data["name"],
      from: data["from"],
      to: data["to"],
      desc: List<String>.from(data["desc"]));
}

class ProjectData {
  String name;
  String desc;
  List<String> images;
  String? webLink;
  String? gitLink;
  ProjectData({
    required this.name,
    required this.desc,
    required this.images,
    required this.webLink,
    required this.gitLink,
  });

  factory ProjectData.fromMap(Map<String, dynamic> data) => ProjectData(
      name: data["name"],
      desc: data["desc"],
      images: List<String>.from(data["images"]),
      webLink: data["web_link"] ?? "",
      gitLink: data["git_link"] ?? "");
}

class SiteData {
  String copyright;
  SiteData({required this.copyright});
  factory SiteData.fromMap(Map<String, dynamic> data) =>
      SiteData(copyright: data["copyright"]);
}
