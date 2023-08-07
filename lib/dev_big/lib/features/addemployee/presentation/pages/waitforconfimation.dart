import 'package:depertment_of_labor_employers/features/addemployee/presentation/pages/addemployeedetail.dart';
import 'package:depertment_of_labor_employers/features/addemployee/presentation/pages/searchemployee.dart';
import 'package:depertment_of_labor_employers/features/addemployee/presentation/widgets/waitforconfirmationitem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WaitingForConfirmation extends StatelessWidget {
  WaitingForConfirmation({super.key});
  final List<Map<String, dynamic>> itemList = [
    {
      'image':
          'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
      'name': 'หม่อง ทาดี',
      'country': 'ลาว',
      'passport_id': 'D658965',
      'date': '8 กพ. 2565'
    },
    {
      'image':
          'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
      'name': 'จันทร์ดี มา',
      'country': 'ลาว',
      'passport_id': 'D258962',
      'date': '8 กพ. 2565'
    },
    // Add more items as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 2,
        itemBuilder: (context, index) {
          final item = itemList[index];

          return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AddEmployeeDetail(
                            page: 'confirm',
                          )),
                );
              },
              child: WaitForConfirmationItem(index: index, item: item));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const SeachEmployee()));
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        shape: const CircleBorder(),
        backgroundColor: const Color.fromRGBO(121, 30, 195, 1),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
