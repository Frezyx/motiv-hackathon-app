import 'package:flutter/material.dart';

import '../../theme/design/design_theme.dart';
import '../../theme/design/design_theme.dart';

class FiltersScreen extends StatelessWidget {
  const FiltersScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body:
      Container(

        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children:[
              _buildAppBar(context),
              SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Город", style: TextStyle().copyWith(color: DesignTheme.mainColor,),),
            TextFormField(
                decoration: InputDecoration(
                  hintText: "Введите город поиска..."
                ),
            ),

              SizedBox(height: 20),
            Text("Опыт работы", style: TextStyle().copyWith(color: DesignTheme.mainColor,),),
             Container(
              height: 1,
              color: DesignTheme.grey,
              ),
            Container(

          padding: EdgeInsets.all(2.0),
          child: DropdownButton(
              value: 1,
              items: [
                DropdownMenuItem(
                  child: Text("Нет опыта"),
                  value: 1,
                ),
                DropdownMenuItem(
                  child: Text("1-3 года"),
                  value: 2,
                ),
                DropdownMenuItem(
                  child: Text("3 года и более"),
                  value: 3
                ),], onChanged: (int value) {  },),),
   SizedBox(height: 20),
            Text("Возраст",style: TextStyle().copyWith(color: DesignTheme.mainColor,),),
             Container(
              height: 1,
              color: DesignTheme.grey,
              ),
            Container(
          padding: EdgeInsets.all(2.0),
          child: DropdownButton(
              value: 1,
              items: [
                DropdownMenuItem(
                  child: Text("До 18 лет"),
                  value: 1,
                ),
                DropdownMenuItem(
                  child: Text("18-25 лет"),
                  value: 2,
                ),
                DropdownMenuItem(
                  child: Text("25 и более"),
                  value: 3
                ),], onChanged: (int value) {  },),
            ),
                            SizedBox(height: 20),
            Text("Высшее образование",style: TextStyle().copyWith(color: DesignTheme.mainColor,),),
             Container(
              height: 1,
              color: DesignTheme.grey,
              ),
            Container(

          padding: EdgeInsets.all(2.0),
          child: DropdownButton(
              value: 1,
              items: [
                DropdownMenuItem(
                  child: Text("Есть"),
                  value: 1,
                ),
                DropdownMenuItem(
                  child: Text("Нет"),
                  value: 2,
                           ),
                          ], onChanged: (int value) {  },),
            ),
            SizedBox(height: 20),
            Text("Тип занятости", style: TextStyle().copyWith(color: DesignTheme.mainColor,),),
             Container(
              height: 1,
              color: DesignTheme.grey,
              ),
            Container(

          padding: EdgeInsets.all(2.0),
          child: DropdownButton(
              value: 1,
              items: [
                DropdownMenuItem(
                  child: Text("Полная"),
                  value: 1,
                ),
                DropdownMenuItem(
                  child: Text("Частичная"),
                  value: 2,
                ),
                DropdownMenuItem(
                  child: Text("Проектная работа"),
                  value: 3
                ),
                DropdownMenuItem(
                  child: Text("Стажировка"),
                  value: 4,
                ),
              ], onChanged: (int value) {  },
          ),),

          SizedBox(height: 20),
          
                      Text("График работы", style: TextStyle().copyWith(color: DesignTheme.mainColor,),),
             Container(
              height: 1,
              color: DesignTheme.grey,
              ),
            Container(
          padding: EdgeInsets.all(2.0),
          child: DropdownButton(
              value: 1,
              items: [
                DropdownMenuItem(
                  child: Text("Полный день"),
                  value: 1,
                ),
                DropdownMenuItem(
                  child: Text("Смешанный график"),
                  value: 2,
                ),
                DropdownMenuItem(
                  child: Text("Гибкий график"),
                  value: 3
                ),
                DropdownMenuItem(
                  child: Text("Удаленная работа"),
                  value: 4
                ),
              ], onChanged: (int value) {  },),),

            // Container(
            //   height: 1,
            //   color: DesignTheme.grey,
            //   ),
            // SizedBox(height: 25),
            // Text("Возраст"),
            //  Container(
            //   height: 1,
            //   color: DesignTheme.grey,
            //   ),
            // SizedBox(height: 25),
            // Text("Тип занятости"),
            //  Container(
            //   height: 1,
            //   color: DesignTheme.grey,
            //   ),
            // SizedBox(height: 25),
            // Text("График работы"),
            //  Container(
            //   height: 1,
            //   color: DesignTheme.grey,
            //   ),
                              ],
                            ),
              ),
          ],
        ),
      ),
    );
  }
  

  Container _buildAppBar(BuildContext context) {
    return Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Color(0xFF6805F5),
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30),)
              ),
              child: Padding(
                padding: EdgeInsets.all(8.0).copyWith(top: 30),
                child: Text("Уточнить", textAlign: TextAlign.center, style: TextStyle().copyWith(color: Colors.white,),
              ),));
  }
}

// DesignTheme.mainColor