
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

  final TextEditingController _textEditingController = TextEditingController();
  final bookCtrl = Get.put(BookController());

  @override
  void initState() {
    bookCtrl.fetchBookData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BookController>(
      builder: (GetxController controller){
        return Scaffold(
          appBar: bookCtrl.showSearch.value
              ? AppBar(
            backgroundColor: Colors.deepPurple,
            title: 
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _textEditingController,
                          key: bookCtrl.searchTextFieldKey,
                          style: TextStyle(color: Colors.white, fontSize: 18),
                          showCursor: false,
                          decoration: InputDecoration(
                            hintStyle: TextStyle(color: Colors.white54),
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
                      IconButton(icon: Icon(Icons.search,color: Colors.white,), onPressed: bookCtrl.isSearch.value?() {

                        bookCtrl.searchBookData(_textEditingController.text);
                      }: null)
                    ],
                  ),
                ),
              
             )
              : AppBar(
            backgroundColor: Colors.deepPurple,
            title: Text("Book Library",style: TextStyle(color: Colors.white),),

            actions: [
              IconButton(
                  onPressed: () {
                    bookCtrl.showSearch.value= true;
                    setState(() {
                    });
                  },
                  icon: Icon(Icons.search,color: Colors.white,)),

            ],
          ),
          body: bookCtrl.isLoading.value?Center(child: CircularProgressIndicator(color: Colors.deepPurple,)):bookCtrl.isSearch.value?Column(
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
          bookCtrl.isLoading.value?Center(child: CircularProgressIndicator(color: Colors.deepPurple,)):Column(
            children: [
              Expanded(
                child: ListView.builder(

                  itemCount: bookCtrl.book.length,
                    itemBuilder: (BuildContext context, int index){
                    bool btnColor= bookCtrl.book[index].readStatus;
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
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(right: 5),
                                      child: ElevatedButton(onPressed: (){

                                        bookCtrl.updateReadStatus(bookCtrl.book[index].id!);
                                        bookCtrl.updateBool[index]= !bookCtrl.updateBool[index];
                                      },
                                        child: Text(bookCtrl.updateBool[index]?"Read":"Unread",style: TextStyle(color: Colors.white)),style:  ElevatedButton.styleFrom(
                                        primary: bookCtrl.updateBool[index]?Colors.green:Colors.transparent,

                                      ),),
                                    ),
                                  ],
                                )
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
