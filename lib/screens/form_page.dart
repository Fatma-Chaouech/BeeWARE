
import 'package:bee/screens/dashbord_page.dart';
import 'package:flutter/material.dart';
import 'package:bee/constants/colors.dart';
import '../constants/colors.dart';
import '../handlers/registration_backend.dart';
import '../modals/registration.dart';


class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);
  @override
  State<AddPage> createState() => _MyAddPage();
}

//te5edh objet profile mel base
class _MyAddPage extends State<AddPage> {
  late Registration registration ;
  TextEditingController emailController = TextEditingController();
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool isApiCallProcess = false;

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // if(token.isNotEmpty) {
    //   Navigator.pushReplacement(
    //     context,
    //     MaterialPageRoute(builder: (context) => const SearchPage()),
    //   );
    // }
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Scaffold(
            key: scaffoldKey,
            backgroundColor: coldBackground,
            body: Stack(
              children: [
                Container(
                  width: 400,
                  child: Image.asset(
                    "assets/beeware.png",
                    width: size.height * 0.18,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                    margin: EdgeInsets.fromLTRB(size.width * 0.07, 0, size.width * 0.07, 0),
                    child: Form(
                      key: globalFormKey,
                      child: ListView(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(height: size.height * 0.4),
                              TextFormField(
                                onSaved: (input) => registration.weight = input!,
                                controller: emailController,
                                style: const TextStyle(
                                  color: writingBlue,
                                ),
                                decoration: InputDecoration(
                                  labelText: "Enter the initial weight",
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(width: 0, color: Colors.white),
                                    borderRadius: BorderRadius.circular(11),
                                  ),
                                  fillColor: Colors.white,
                                  filled: true,
                                ),
                              ),
                              SizedBox(height: size.height * 0.03),
                              ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<Color>(beeBrown),
                                ),
                                onPressed: (){
                                  Registration registration = Registration(
                                    weight: emailController.text,
                                  );
                                  setState(Null Function() param0){
                                    return emailController.text="";
                                  };
                                  addRegistration(registration);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => Dashboard()),
                                  );
                                },
                                child: Text("Confirm"),
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                ),
              ],
            )
        ),
      ),
    );
  }

}
