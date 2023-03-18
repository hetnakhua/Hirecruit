class JobDetails {
  final String company;
  final String title;
  final String imageUrl;
  final String jobDescription;
  final List skills;
  final double salary;
  final double rating;
  JobDetails(
      {required this.company,
      required this.title,
      required this.imageUrl,
      required this.jobDescription,
      required this.skills,
      required this.salary,
      required this.rating});
}
