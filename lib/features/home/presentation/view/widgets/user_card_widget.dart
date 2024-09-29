import 'package:flutter/material.dart';
import 'package:linkyou_task/features/home/data/user_model.dart';

class UserCardWidget extends StatelessWidget {
  final UserModel data;
  final int index;
  const UserCardWidget(this.data, this.index);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(70),
                  child: Image.network(
                    data.userData![index].imageLink,
                    fit: BoxFit.cover,
                    width: 70,
                  )),
              SizedBox(width: 20),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.userData![index].firstName!+data.userData![index].lastName!,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    data.userData![index].email!,
                    style: TextStyle(color: Colors.black54),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
