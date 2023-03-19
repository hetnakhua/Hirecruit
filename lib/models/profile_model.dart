class ProfileModel {
  String name;
  String email;
  List<String> skills;
  List<Object> education;
  List<Object> projects;
  List<Object> experience;

  ProfileModel(this.name, this.email, this.skills, this.education,
      this.projects, this.experience);
}

class EducationModel {
  String uni;
  String duration;

  EducationModel({required this.uni, required this.duration});
}

class ProjectModel {
  String title;
  String desc;

  ProjectModel({required this.title, required this.desc});
}

class ExperienceModel {
  String title;
  String desc;

  ExperienceModel({required this.title, required this.desc});
}
