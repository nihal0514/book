
import 'package:book/controllers/BookController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final bookCtrl = Get.put(BookController());

  @override
  void initState() {
  //  bookCtrl.orderLoadData();

    bookCtrl.fetchBookData().then((value) =>
    {
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BookController>(
      builder: (GetxController controller){
        return Scaffold(
          appBar: bookCtrl.showSearch.value
              ? AppBar(
            title: 
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          key: bookCtrl.searchTextFieldKey,
                          focusNode: bookCtrl.searchTextFieldFocusNode,
                          style: TextStyle(color: Colors.black, fontSize: 18),
                          cursorColor: Colors.white,
                          decoration: InputDecoration(
                            hintText: "Search Book",
                            border: InputBorder.none,
                          ),
                          onTap: () {
                            if (bookCtrl.showKeyboard.value) {
                              bookCtrl.showKeyboard.value = false;
                            }
                          },
                          onChanged: (value) {
                            if(value==""){
                              bookCtrl.isSearch.value= false;
                              setState(() {

                              });
                            }else{
                              bookCtrl.isSearch.value= true;
                             setState(() {

                             });
                            }

                          },
                        ),
                      ),
                      IconButton(icon: Icon(Icons.search), onPressed: () {
                        bookCtrl.searchBookData("the subtle art");
                      },)
                    ],
                  ),
                ),
              
             )
              : AppBar(
            title: Text("Order"),

            actions: [
              IconButton(
                  onPressed: () {
                    bookCtrl.showSearch.value= true;
                    setState(() {

                    });
                  },
                  icon: Icon(Icons.search)),

            ],
          ),
          body: bookCtrl.isSearch.value?  Column(
            children: [
              Expanded(
                child: ListView.builder(
                    itemCount: bookCtrl.searchBook.length,
                    itemBuilder: (BuildContext context, int index){
                      return Card(
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          child: Row(
                            children: [
                              Image.network(
                                  width: 100,height: 100,
                                  bookCtrl.searchBook[index].cover),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(bookCtrl.searchBook[index].title,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,overflow: TextOverflow.ellipsis),),
                                    Text(bookCtrl.searchBook[index].author.replaceAll("[", "").replaceAll("]", "").replaceAll(";", ", ")),
                                    Text(bookCtrl.searchBook[index].publishedYear),
                                    ElevatedButton(onPressed: (){}, child: Text("Unread",style: TextStyle(color: Colors.white)),style:  ElevatedButton.styleFrom(
                                      primary: Colors.grey,

                                    ),)
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              )
            ],
          ):
          Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: bookCtrl.book.length,
                    itemBuilder: (BuildContext context, int index){
                  return Card(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: Row(
                        children: [
                          Image.network(
                            width: 100,height: 100,
                              bookCtrl.book[index].cover),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(bookCtrl.book[index].title,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,overflow: TextOverflow.ellipsis),),
                                Text(bookCtrl.book[index].author.replaceAll("[", "").replaceAll("]", "").replaceAll(";", ", ")),
                                Text(bookCtrl.book[index].publishedYear),
                                ElevatedButton(onPressed: (){}, child: Text("Unread",style: TextStyle(color: Colors.white)),style:  ElevatedButton.styleFrom(
                                  primary: Colors.grey,

                                ),)
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }),
              )
            ],
          ),
        );
      },
    );
  }

}
