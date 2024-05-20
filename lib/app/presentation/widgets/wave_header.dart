import 'package:artbuy/app/presentation/styles/colors.dart';
import 'package:flutter/material.dart';

class HeaderHaveWidget extends StatefulWidget {
  final double _height;
  final Widget _item;

  const HeaderHaveWidget(this._height, this._item, {super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HeaderHaveWidgetState createState() =>
      // ignore: no_logic_in_create_state
      _HeaderHaveWidgetState(_height, _item);
}

class _HeaderHaveWidgetState extends State<HeaderHaveWidget> {
  final double _height;
  final Widget _item;

  _HeaderHaveWidgetState(this._height, this._item);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        ClipPath(
          clipper: ShapeClipper([
            Offset(width / 5, _height),
            Offset(width / 10 * 5, _height - 60),
            Offset(width / 5 * 4, _height + 20),
            Offset(width, _height - 18)
          ]),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    AppColors.primary.withOpacity(0.4),
                    AppColors.primary.withOpacity(0.9),
                  ],
                  begin: const FractionalOffset(0.0, 0.0),
                  end: const FractionalOffset(1.0, 0.0),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp),
            ),
          ),
        ),
        ClipPath(
          clipper: ShapeClipper([
            Offset(width / 3, _height + 20),
            Offset(width / 10 * 8, _height - 60),
            Offset(width / 5 * 4, _height - 60),
            Offset(width, _height - 20)
          ]),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    AppColors.primary.withOpacity(0.4),
                    AppColors.primary.withOpacity(0.9),
                  ],
                  begin: const FractionalOffset(0.0, 0.0),
                  end: const FractionalOffset(1.0, 0.0),
                  stops: const [0.0, 1.0],
                  tileMode: TileMode.clamp),
            ),
          ),
        ),
        ClipPath(
          clipper: ShapeClipper([
            Offset(width / 5, _height),
            Offset(width / 2, _height - 40),
            Offset(width / 5 * 4, _height - 80),
            Offset(width, _height - 20)
          ]),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    AppColors.primary,
                    AppColors.primary.withOpacity(.8),
                  ],
                  begin: const FractionalOffset(0.0, 0.0),
                  end: const FractionalOffset(1.0, 0.0),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp),
            ),
          ),
        ),
        SizedBox(
          height: _height - 40,
          child: Center(child: _item),
        ),
      ],
    );
  }
}

class ShapeClipper extends CustomClipper<Path> {
  List<Offset> _offsets = [];
  ShapeClipper(this._offsets);
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0.0, size.height - 20);

    path.quadraticBezierTo(
        _offsets[0].dx, _offsets[0].dy, _offsets[1].dx, _offsets[1].dy);
    path.quadraticBezierTo(
        _offsets[2].dx, _offsets[2].dy, _offsets[3].dx, _offsets[3].dy);

    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
