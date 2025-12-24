import 'package:ard_light/features/auth/presentation/widget/question_item.dart';
import 'package:flutter/material.dart';

class QuestionTab extends StatefulWidget {
  QuestionTab({Key? key}) : super(key: key);

  @override
  _QuestionTabState createState() => _QuestionTabState();
}

class _QuestionTabState extends State<QuestionTab> {
  List<dynamic> questions = [
    {
      "title": "Хэрхэн бүртгүүлэх вэ?",
      "description":
          "Lorem ipsum dolor sit amet consectetur. Ut at nulla sit augue arcu nam scelerisque viverra. Interdum magna dolor tristique amet.",
    },
    {
      "title": "Хэрхэн баталгаажуулалт хийх вэ?",
      "description":
          "Lorem ipsum dolor sit amet consectetur. Ut at nulla sit augue arcu nam scelerisque viverra. Interdum magna dolor tristique amet.",
    },
    {
      "title": "Хэрхэн пин код сэргээх болон солих вэ?",
      "description":
          "Lorem ipsum dolor sit amet consectetur. Ut at nulla sit augue arcu nam scelerisque viverra. Interdum magna dolor tristique amet.",
    },
    {
      "title": "Хэрхэн бүртгүүлэх вэ?",
      "description":
          "Lorem ipsum dolor sit amet consectetur. Ut at nulla sit augue arcu nam scelerisque viverra. Interdum magna dolor tristique amet.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),

      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).colorScheme.onSurface),
          borderRadius: BorderRadius.circular(16),
        ),
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return QuestionItem(data: questions[index]);
          },
          itemCount: questions.length,
        ),
      ),
    );
  }
}
