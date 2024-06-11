class QuizQuestions {
  final String text;
  final List<String> answers;
 const QuizQuestions(this.text,this.answers);
  List<String> getShuffledAnswers() {
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }

}