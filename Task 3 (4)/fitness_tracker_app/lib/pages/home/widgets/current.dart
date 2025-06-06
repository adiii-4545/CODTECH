import 'package:fitness_tracker_app/models/fitness_program.dart';
import 'package:flutter/material.dart';

class Current extends StatefulWidget {
  const Current({Key? key}) : super(key: key);

  @override
  State<Current> createState() => _CurrentState();
}

class _CurrentState extends State<Current> {
  ProgramType active = fitnessProgram[0].type;

  void _changeProgram(ProgramType newType) {
    setState(() {
      active = newType;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Current Progress',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Icon(Icons.arrow_forward_ios, size: 15),
            ],
          ),
        ),
        SizedBox(
          width: double.infinity,
          height: 100,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            scrollDirection: Axis.horizontal,
            itemCount: fitnessProgram.length,
            itemBuilder: (context, index) {
              return Program(
                program: fitnessProgram[index],
                active: fitnessProgram[index].type == active,
                onTap: _changeProgram,
              );
            },
            separatorBuilder: (context, index) => SizedBox(width: 20),
          ),
        ),
      ],
    );
  }
}

class Program extends StatelessWidget {
  final FitnessProgram program;
  final bool active;
  final Function(ProgramType) onTap;

  const Program({
    Key? key,
    required this.program,
    this.active = false,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap(program.type);
      },
      child: Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            colorFilter: ColorFilter.mode(
              active
                  ? Color(0xff1ebdf8).withOpacity(.8)
                  : Colors.white.withOpacity(.8),
              BlendMode.lighten,
            ),
            image: program.image,
            fit: BoxFit.cover,
          ),
        ),
        alignment: Alignment.bottomLeft,
        padding: const EdgeInsets.all(15),
        child: DefaultTextStyle.merge(
          style: TextStyle(
            color: active ? Colors.white : Colors.black,
            fontSize: 10,
            fontWeight: FontWeight.w500,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(program.name),
              Row(
                children: [
                  Text(program.cals),
                  SizedBox(width: 15),
                  Icon(
                    Icons.timer,
                    size: 10,
                    color: active ? Colors.white : Colors.black,
                  ),
                  SizedBox(width: 5),
                  Text(program.time),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
