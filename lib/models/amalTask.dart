class Task {
  String id;
  String title;
  String description;
  int rewardCoins;
  bool isCompleted;

  Task({
    required this.id,
    required this.title,
    required this.description,
    required this.rewardCoins,
    this.isCompleted = false,
  });
}