import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:technovation2020/src/bloc/fancy_line_bloc.dart';
import 'package:technovation2020/src/model/event_model.dart';

class Slideshow extends StatefulWidget {
  final Function(EventModel) onImageClick;

  Slideshow({
    @required this.onImageClick,
  });

  @override
  _SlideshowState createState() => _SlideshowState();
}

class _SlideshowState extends State<Slideshow> {
  List<Widget> images;
  List<EventModel> specialEvents = [
    EventModel.fromJson({
      "id": 300,
      "image": "000.jpg",
      "name": "Internet Mystery",
      "description":
          "This is going to be the description of the event. It will be filled up later for you to know what this event is about.",
      "rules": ["How to play rule 1", "How to play rule 2"],
      "coordinators": ["Md.Azharuddin", "Sonali Mishra"],
      "coordinatorsNumber": ["9078600498", "9439141156"],
      "judgement": [],
    }),
    EventModel.fromJson({
        "id": 0,
        "image": "000.jpg",
        "name": "Internet Mystery",
        "description":
            "This is an event to test the deciphering abilities of participants. Participants will need to solve some mind-boggling puzzles to get to the treasure. This event will be conducted in two phases.\n\nPhase1: It will be a pre-event. Participants will need to solve all the puzzles to know when and where phase 2 will be conducted.\n\nPhase 2: The final puzzle, which will be provided on the spot."
            "\n\nIMPORTANT: App provided with puzzle is only required in phase 2 and its entry code will be provided on the spot.",
        "rules": [
        "It is an individual challenge",
        "Full use of internet is allowed"
        ],
        "coordinators": ["Md.Azharuddin", "Sonali Mishra"],
        "coordinatorsNumber": ["9078600498", "9439141156"],
        "judgement": [
        "The very first person to solve the final puzzle will win the prize."
        ],
    }),
    EventModel.fromJson({
        "id": 100,
        "image": "100.jpg",
        "name": "Encantador",
        "description":
            "Being well dressed hasn’t much to do with having good clothes. It’s a question of good balance and good common sense. So in order to be irreplaceable one must always be different.\n\nSo wake up beauties and hunks, its time to beast, for we are back with the 4th edition of Encantador, the fashion show.\n\nBe the designer of your own and let the fire inside you burn brighter than the fire around you.\n\nThemes:\n\nBollywood\nWizardry\nColors of the sea\nAnimals in cage\nShades of karma \"Zodiac\"\nPalace of illusions\nGarbage bag gala\nDiversity of India\nCandy Land\nK-Pop\n",
        "rules": [
        "Each team will consist of 6-9 members",
        "Every team will have to base their performance on a specific theme",
        "Every team will be given a time limit of maximum 3 minutes.",
        "Every team will have to bring its own music track for the walk.",
        "Each theme can be taken up by a maximum of 2 teams on a first come first serve basis."
        ],
        "coordinators": ["Azazul Haque", "Monalisha sahoo", "Satya Prakash Rout", "Pujarani Rout"],
        "coordinatorsNumber": ["8457867856", "9348328210", "9040583814", "6370873252"],
        "judgement": [
        "On the basis of Creativity",
        "On the basis of Confidense",
        "On the basis of Costume design",
        "On the basis of Relevance to the theme",
        "On the basis of Originality of concept",
        "On the basis of Interaction with the audience"
        ]
    }),
    EventModel.fromJson({
      "id": 103,
      "image": "103.jpg",
      "name": "Mr. & Mrs. Technovation",
      "description":
      "“Success is a series of small wins”.\n\nThe most awaited, charismatic, Mr. and Mrs. Technovation is back with a bang. An online event where you will be asked to send a picture of yours And the participant with the highest number of likes will qualify to the next round followed by some other interesting rounds.\n\nThe difference between ordinary and extraordinary is that little “extra”. Go that extra mile, Make it happen . Cause no one is you and that is your superpower."
          "\n\nProcedure:\n\nThe contestants will send their photo on the email ID mrandmisstechnovation2020@gmail.com on or before 10TH MARCH.\n\nThe pics sent by the contestants will be posted in Mr and Miss Technovation page.\n\nThe jury shall consider the likes of those persons who like the pic as well as the Mr  & Miss Technovation page.\n\nTop 16 participants (8 boys and 8 girls inclusively) getting the maximum likes for their pic on the page will be selected for the 2nd round to be conducted at IGIT, Sarang during Technovation 2020."
          "\n\nMr & Miss Fame (the boy and the girl who will be the Highest like holder) will get some bonus point in this competition.\n\nIn the 2nd round the participants will face the quiz test and self performance (Dancing , singing or Solo Act) and PI.\n\nAmong all the 16 participants, 10 (5 boys and 5 girls) will be selected for the final round.\n\nWinner of Mr. Technovation and Miss Technovation will be decided based on the participants' performance in the Final round (Ramp Walk)."
          "\n\nDo check the page regularly to stay updated with the event and related posts.",
      "rules": [
        "The contestants need to send their photos along with their full name & college name to mrandmisstechnovation2020@gmail.com",
        "Photo size should be less than 10 MB and it must not have any filter effects or edits.",
        "Selfies are not allowed in the competition.",
        "Use of auto liker and auto commenter is  not allowed. Participants using such means will be disqualified.",
        "Photo should be decent where the participant should be properly dressed.",
        "Only a single picture without any collage shall be taken into consideration.",
        "If any of the above rules is not followed by any of the contestants they will be disqualified.",
      ],
      "coordinators": ["Abhijit Panda", "Moumita Panda"],
      "coordinatorsNumber": ["8114957735", "8917242677"],
      "judgement": []
    }),
    EventModel.fromJson({
        "id": 207,
        "image": "207.jpg",
        "name": "Stunt Show",
        "description":
            "Stay off the tracks! Team RTZ is all set to awe you in disbelief with the roar and thunder of their bikes.\n\nGet Ready to experience an enthralling evening very soon!",
        "rules": [],
        "coordinators": ["Mahesh", "Nrusinghnath"],
        "coordinatorsNumber": ["8249752218", "7327057891"],
        "judgement": []
    }),
  ];

  FancyLineBloc _fancyLineBloc;

  Widget getImage(String asset, int serial) {
    return Container(
      width: 300,
      padding: EdgeInsets.all(10),
      child: CustomPaint(
        painter: _BorderPainter(
          border: Colors.white,
        ),
        child: GestureDetector(
          onTap: () => widget.onImageClick(specialEvents[serial]),
          child: Container(
            padding: EdgeInsets.zero,
            child: ClipPath(
              clipper: _BorderClipper(),
              child: Image.asset(
                'images/events/$asset',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    images = [
      getImage('event1.jpg', 0),
      getImage('000.jpg', 1),
      getImage('100.jpg', 2),
      getImage('103.jpg', 3),
      getImage('207.jpg', 4),
    ];
    _fancyLineBloc = FancyLineBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: 6.2,
      child: Transform.scale(
        scale: 1,
        child: CarouselSlider(
          items: images,
          height: 200,
          viewportFraction: 0.8,
          initialPage: 0,
          enableInfiniteScroll: true,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 3),
          pauseAutoPlayOnTouch: Duration(seconds: 2),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          scrollDirection: Axis.horizontal,
          onPageChanged: (int i) {
            _fancyLineBloc.change(i);
          },
        ),
      ),
    );
  }
}

class _BorderPainter extends CustomPainter {
  Color border;

  _BorderPainter({
    @required this.border,
  });

  @override
  void paint(Canvas canvas, Size size) {
    double diff = 10;

    var paint = Paint();
    paint.color = border;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 2;

    var path = Path();
    path.moveTo(diff, 0);
    path.lineTo(0, diff);

    path.moveTo(2 * diff, 0);
    path.lineTo(0, 2 * diff);

    path.moveTo(3 * diff, 0);
    path.lineTo(0, 3 * diff);

    path.moveTo(4 * diff, 0);
    path.lineTo(0, 4 * diff);
    path.lineTo(0, size.height);
    path.lineTo(size.width - 4 * diff, size.height);
    path.lineTo(size.width, size.height - 4 * diff);
    path.lineTo(size.width, 0);
    path.lineTo(4 * diff, 0);

    path.moveTo(size.width, size.height - 3 * diff);
    path.lineTo(size.width - 3 * diff, size.height);

    path.moveTo(size.width, size.height - 2 * diff);
    path.lineTo(size.width - 2 * diff, size.height);

    path.moveTo(size.width, size.height - diff);
    path.lineTo(size.width - diff, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class _BorderClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var path = Path();
    double diff = 10;
    path.moveTo(4 * diff, 0);
    path.lineTo(0, 4 * diff);
    path.lineTo(0, size.height);
    path.lineTo(size.width - 4 * diff, size.height);
    path.lineTo(size.width, size.height - 4 * diff);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
}
