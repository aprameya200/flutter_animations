class Topics {
  Topics(this.topicName, this.courses, this.imageName, this.topicDescription);

  final String topicName;
  final String topicDescription;
  final List<Course> courses;
  final String imageName;
}

class Course {
  Course(this.courseName, this.courceDescription);

  final String courseName;
  final String courceDescription;
}

class CourseTopics {
  static List<Course> courses = [];

  static List<Topics> allTopics = [
    Topics("Design", courses, "design.png",
        "Design is a broad term encompassing the intentional creation or configuration of something, often with a focus on aesthetics, functionality, and user experience. In various contexts, design can refer to visual elements, product architecture, user interfaces, or the overall structure and planning of a system, with the goal of achieving effective and meaningful solutions."),
    Topics("Coding", courses, "coding.png",
        "Coding refers to the process of writing instructions in a programming language to create software, applications, or websites. It involves translating human-readable logic into a format that computers can understand and execute. Coding is essential for building and developing various digital solutions, from simple scripts to complex software systems, and it plays a crucial role in virtually every aspect of modern technology."),
    Topics(
      "Data",
      courses,
      "data_science.png",
      "Data Science involves extracting insights and knowledge from structured and unstructured data through various techniques, including statistics, machine learning, and data analysis.",
    ),
    Topics(
      "Mobile",
      courses,
      "mobile_app_dev.png",
      "Mobile App Development focuses on creating applications for mobile devices, such as smartphones and tablets, often using frameworks like Flutter or React Native.",
    ),
    Topics(
      "Security",
      courses,
      "cybersecurity.png",
      "Cybersecurity involves protecting computer systems, networks, and data from unauthorized access, attacks, and damage to ensure confidentiality, integrity, and availability.",
    ),
    Topics(
      "Web",
      courses,
      "web_dev.png",
      "Web Development encompasses creating and maintaining websites and web applications. It involves front-end and back-end development, as well as various frameworks and technologies.",
    ),
  ];
}
