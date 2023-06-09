import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RaiseComplaint extends StatelessWidget {
  RaiseComplaint({Key? key}) : super(key: key);

  FocusNode describeFocusnode = FocusNode();
  FocusNode bookingFocusnode = FocusNode();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500.h,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                    height: 7.h,
                    width: 50.w,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade400,
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                    )),
                SizedBox(
                  height: 15.h,
                ),
                Text("We are here to resolve your issues.",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500)),
                SizedBox(
                  height: 20.h,
                ),
                TextFormField(
                  focusNode: bookingFocusnode,
                  keyboardType: TextInputType.text,
                  //controller: nameController,
                  decoration: InputDecoration(
                      // filled: true,
                      // fillColor: Colors.black.withOpacity(0.6),
                      prefixIcon: const Icon(
                        Icons.book,
                        color: Colors.black,
                      ),
                      labelText: 'Enter Your Booking ID',
                      hintText: 'Enter Your Booking ID',
                      labelStyle:
                          TextStyle(color: Colors.black.withOpacity(0.6)),
                      hintStyle: TextStyle(
                        color: Colors.black.withOpacity(0.6),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.black.withOpacity(0.5), width: 1.w),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                  onFieldSubmitted: (value) {
                    FocusScope.of(context).requestFocus(describeFocusnode);
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please Enter Booking ID';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20.h,
                ),
                TextFormField(
                  focusNode: describeFocusnode,
                  keyboardType: TextInputType.text,
                  maxLength: 200,
                  minLines: 6,
                  maxLines: 200,
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    labelText: 'Describe Your Issues Here',
                    hintText: 'Describe Your Issues',
                    labelStyle: TextStyle(
                      color: Colors.black.withOpacity(0.6),
                    ),
                    hintStyle: TextStyle(
                      fontStyle: FontStyle.italic,
                      color: Colors.black.withOpacity(0.6),
                    ),
                    alignLabelWithHint:
                        true, // Aligns the hint text at line number 0
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black.withOpacity(0.5),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                // TextFormField(
                //   focusNode: describeFocusnode,
                //   keyboardType: TextInputType.text,
                //   maxLength: 200,
                //   minLines: 6,
                //   maxLines: 200,
                //   textAlign: TextAlign.start,
                //   decoration: InputDecoration(
                //       labelText: 'Describe Your Issues Here ',
                //       hintText: 'Describe Your Issues ',
                //       labelStyle: TextStyle(
                //           // fontStyle: FontStyle.italic,
                //           color: Colors.black.withOpacity(0.6)),
                //       hintStyle: TextStyle(
                //         fontStyle: FontStyle.italic,
                //         color: Colors.black.withOpacity(0.6),
                //       ),
                //       enabledBorder: OutlineInputBorder(
                //         borderSide: BorderSide(
                //             color: Colors.black.withOpacity(0.5), width: 1.w),
                //         borderRadius: BorderRadius.circular(10),
                //       ),
                //       border: OutlineInputBorder(
                //         borderRadius: BorderRadius.circular(10),
                //       )),
                // ),
                // SizedBox(
                //   height: .h,
                // ),
                SizedBox(
                  height: 40.h,
                  width: 140.w,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 1,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        backgroundColor: Colors.black),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Navigator.of(context).pushNamedAndRemoveUntil(
                        //     'home', (route) => false);
                      }
                    },
                    child: Text(
                      "Submit",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
