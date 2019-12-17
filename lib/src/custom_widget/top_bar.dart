import 'package:flutter/material.dart';
import 'package:technovation2020/src/bloc/notification_bloc.dart';

class TopBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;

  @override
  final Size preferredSize;

  TopBar({@required this.title}) : preferredSize = Size.fromHeight(60.0);

  @override
  _TopBarState createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 50,
        margin: EdgeInsets.all(8),
        child: CustomPaint(
          painter: _BeveledPainter(
            background: Theme.of(context).cardColor,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  widget.title,
                  style: Theme.of(context).textTheme.title,
                ),
                Stack(
                  children: <Widget>[
                    Icon(Icons.notifications_none),
                    Positioned(
                      right: 0,
                      child: StreamBuilder(
                        stream: notificationBloc.notificationStream,
                        builder: (context, AsyncSnapshot<bool> snapshot){
                          if(snapshot.data == null) return Container();
                          if(snapshot.data){
                            return Container(
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(color: Colors.white),
                              ),
                              constraints: BoxConstraints(
                                minHeight: 12,
                                minWidth: 12,
                              ),
                            );
                          }
                          else return Container();
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _BeveledPainter extends CustomPainter {
  Color background;

  _BeveledPainter({
    @required this.background,
  });

  @override
  void paint(Canvas canvas, Size size) {
    double mid = size.height / 5;
    double upper = size.height / 5;
    double lower = size.height / 2.5;
    var paint = Paint();
    paint.color = background;
    paint.style = PaintingStyle.fill;

    var path = Path();
    path.moveTo(0, mid);
    path.lineTo(upper, 0);
    path.lineTo(size.width - lower, 0);
    path.lineTo(size.width, size.height - mid);
    path.lineTo(size.width - upper, size.height);
    path.lineTo(lower, size.height);
    path.lineTo(0, mid);

    canvas.drawPath(path, paint);

    paint = Paint();
    paint.color = Colors.white;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 1;

    path = Path();
    path.moveTo(0, mid);
    path.lineTo(upper, 0);
    path.lineTo(size.width - lower, 0);
    path.lineTo(size.width, size.height - mid);
    path.lineTo(size.width - upper, size.height);
    path.lineTo(lower, size.height);
    path.lineTo(0, mid);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}