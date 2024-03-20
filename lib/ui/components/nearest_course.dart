import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:klassrum_web/ui/screens/call_room.dart';

class NearestCourse extends StatelessWidget {
  const NearestCourse({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      width: 350,
      decoration: ShapeDecoration(
        image: const DecorationImage(
          image: AssetImage("assets/img/course_banner.jpg"),
          fit: BoxFit.fill,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Column(
        children: [
          Expanded(
              child: Center(
            child: Container(
                width: 58,
                height: 58,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: ShapeDecoration(
                  color: const Color(0xCC29272E),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                child: InkWell(
                  onTap: () => Navigator.of(context).pushNamed("/call-room",
                      arguments: CallArguments(
                          'hoet01', 'M. Daniel ANAKPA', 'call01')),
                  child: const Icon(
                    Icons.play_arrow,
                    color: Colors.white,
                    size: 32,
                  ),
                )),
          )),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(color: Color(0xCC29272E)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Programmation distribuée',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.5),
                    fontSize: 14,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    height: 0,
                    letterSpacing: -0.56,
                  ),
                ),
                const Gap(8),
                const Text(
                  'les services REST',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    height: 0,
                    letterSpacing: -0.64,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
