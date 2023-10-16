import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:appifysocial/utils/utils.dart';

class Scene extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 1500;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      width: double.infinity,
      child: Container(
        // coverpageqFN (9:2)
        padding: EdgeInsets.fromLTRB(0*fem, 0*fem, 92*fem, 0*fem),
        width: double.infinity,
        decoration: BoxDecoration (
          color: Color(0xffffffff),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // signinpagex2U (9:7)
              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 80*fem, 4*fem),
              width: 375*fem,
              height: 812*fem,
              decoration: BoxDecoration (
                color: Color(0xffd7e5ff),
                borderRadius: BorderRadius.circular(40*fem),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x26000000),
                    offset: Offset(0*fem, 0*fem),
                    blurRadius: 37.5*fem,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // autogroupcr8smVi (FCxmvXP5QswGDLZjG5cR8s)
                    width: double.infinity,
                    height: 794*fem,
                    child: Stack(
                      children: [
                        Positioned(
                          // circle3sidebottem5mJ (9:8)
                          left: 419*fem,
                          top: 76*fem,
                          child: Align(
                            child: SizedBox(
                              width: 398*fem,
                              height: 398*fem,
                              child: Container(
                                decoration: BoxDecoration (
                                  borderRadius: BorderRadius.circular(199*fem),
                                  color: Color(0xffb0cbff),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // circle2mid1YU (9:9)
                          left: 0*fem,
                          top: 0*fem,
                          child: Align(
                            child: SizedBox(
                              width: 700*fem,
                              height: 700*fem,
                              child: Container(
                                decoration: BoxDecoration (
                                  borderRadius: BorderRadius.circular(350*fem),
                                  color: Color(0xd8367cfe),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // circle1topUS4 (9:10)
                          left: 21*fem,
                          top: 0*fem,
                          child: Align(
                            child: SizedBox(
                              width: 398*fem,
                              height: 398*fem,
                              child: Container(
                                decoration: BoxDecoration (
                                  borderRadius: BorderRadius.circular(199*fem),
                                  color: Color(0xff9bbefd),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // welcomebackKha (9:11)
                          left: 220*fem,
                          top: 217*fem,
                          child: Align(
                            child: SizedBox(
                              width: 177*fem,
                              height: 116*fem,
                              child: Text(
                                'Welcome\nBack',
                                style: SafeGoogleFont (
                                  'Futura Hv BT',
                                  fontSize: 46*ffem,
                                  fontWeight: FontWeight.w400,
                                  height: 1.2575*ffem/fem,
                                  color: Color(0xffffffff),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // vectortopLcg (9:28)
                          left: 220*fem,
                          top: 132*fem,
                          child: Align(
                            child: SizedBox(
                              width: 10*fem,
                              height: 20.01*fem,
                              child: Image.asset(
                                'assets/cover-page/images/vector-top.png',
                                width: 10*fem,
                                height: 20.01*fem,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // autogroup13xsCPz (FCxnqfXCTeSnkjetFE13xs)
                    padding: EdgeInsets.fromLTRB(36*fem, 14*fem, 36*fem, 49*fem),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // youremailGue (9:17)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 20*fem),
                          padding: EdgeInsets.fromLTRB(30*fem, 19*fem, 30*fem, 18*fem),
                          width: double.infinity,
                          decoration: BoxDecoration (
                            color: Color(0xffffffff),
                            borderRadius: BorderRadius.circular(20*fem),
                          ),
                          child: Text(
                            'Your Email',
                            style: SafeGoogleFont (
                              'Futura Md BT',
                              fontSize: 18*ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.2575*ffem/fem,
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                        Container(
                          // password3Z2 (9:20)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 30*fem),
                          padding: EdgeInsets.fromLTRB(30*fem, 19*fem, 30*fem, 18*fem),
                          width: double.infinity,
                          decoration: BoxDecoration (
                            color: Color(0xffffffff),
                            borderRadius: BorderRadius.circular(20*fem),
                          ),
                          child: Text(
                            'Password',
                            style: SafeGoogleFont (
                              'Futura Md BT',
                              fontSize: 18*ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.2575*ffem/fem,
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                        Container(
                          // autogroup4kv9pTJ (FCxn5gnUdMcMUkYcow4KV9)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 110*fem),
                          width: double.infinity,
                          height: 64*fem,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // signinWqv (9:12)
                                margin: EdgeInsets.fromLTRB(0*fem, 3*fem, 141*fem, 0*fem),
                                child: Text(
                                  'Sign in',
                                  style: SafeGoogleFont (
                                    'Futura Hv BT',
                                    fontSize: 32*ffem,
                                    fontWeight: FontWeight.w900,
                                    height: 1.2575*ffem/fem,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ),
                              Container(
                                // arrowPep (9:29)
                                padding: EdgeInsets.fromLTRB(21*fem, 24*fem, 19*fem, 24*fem),
                                height: double.infinity,
                                decoration: BoxDecoration (
                                  color: Color(0xff367cfe),
                                  borderRadius: BorderRadius.circular(32*fem),
                                ),
                                child: Center(
                                  // arrowvector7Kv (9:26)
                                  child: SizedBox(
                                    width: 24*fem,
                                    height: 16*fem,
                                    child: Image.asset(
                                      'assets/cover-page/images/arrow-vector.png',
                                      width: 24*fem,
                                      height: 16*fem,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          // autogroupf2ummvG (FCxnDmPM9sHa2oEmMiF2uM)
                          width: double.infinity,
                          height: 23*fem,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // autogroupnaabUZn (FCxnKWimjXjfyHTn4FnaAB)
                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 66*fem, 0*fem),
                                width: 78*fem,
                                height: double.infinity,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      // signupbottemPgk (9:13)
                                      left: 0*fem,
                                      top: 14*fem,
                                      child: Align(
                                        child: SizedBox(
                                          width: 78*fem,
                                          height: 9*fem,
                                          child: Container(
                                            decoration: BoxDecoration (
                                              color: Color(0x840a7de7),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      // signup65N (9:15)
                                      left: 5*fem,
                                      top: 0*fem,
                                      child: Align(
                                        child: SizedBox(
                                          width: 62*fem,
                                          height: 23*fem,
                                          child: Text(
                                            'Sign Up',
                                            style: SafeGoogleFont (
                                              'Futura Hv BT',
                                              fontSize: 18*ffem,
                                              fontWeight: FontWeight.w900,
                                              height: 1.2575*ffem/fem,
                                              color: Color(0xff000000),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                // autogroup6wpxYxx (FCxnQvjRBMj3Y7uV4d6WpX)
                                width: 159*fem,
                                height: double.infinity,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      // forgotbottemhax (9:14)
                                      left: 0*fem,
                                      top: 14*fem,
                                      child: Align(
                                        child: SizedBox(
                                          width: 159*fem,
                                          height: 9*fem,
                                          child: Container(
                                            decoration: BoxDecoration (
                                              color: Color(0x84ff0000),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      // forgotpasswordsQVN (9:16)
                                      left: 4*fem,
                                      top: 0*fem,
                                      child: Align(
                                        child: SizedBox(
                                          width: 144*fem,
                                          height: 23*fem,
                                          child: Text(
                                            'Forgot Passwords',
                                            style: SafeGoogleFont (
                                              'Futura Hv BT',
                                              fontSize: 18*ffem,
                                              fontWeight: FontWeight.w900,
                                              height: 1.2575*ffem/fem,
                                              color: Color(0xff000000),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              // signuppageeuW (9:30)
              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 4*fem),
              width: 375*fem,
              height: 812*fem,
              decoration: BoxDecoration (
                color: Color(0xffd7e5ff),
                borderRadius: BorderRadius.circular(40*fem),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x26000000),
                    offset: Offset(0*fem, 0*fem),
                    blurRadius: 37.5*fem,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    // autogroupuma78Jt (FCxodj2nPQfHs3Pom7umA7)
                    padding: EdgeInsets.fromLTRB(320*fem, 454*fem, 214*fem, 38*fem),
                    width: 700*fem,
                    height: 700*fem,
                    decoration: BoxDecoration (
                      color: Color(0xd8367cfe),
                      borderRadius: BorderRadius.circular(350*fem),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // vectortopcUx (9:51)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 156*fem, 71.99*fem),
                          width: 10*fem,
                          height: 20.01*fem,
                          child: Image.asset(
                            'assets/cover-page/images/vector-top-udi.png',
                            width: 10*fem,
                            height: 20.01*fem,
                          ),
                        ),
                        Container(
                          // createaccountWqE (9:33)
                          constraints: BoxConstraints (
                            maxWidth: 166*fem,
                          ),
                          child: Text(
                            'Create\nAccount',
                            style: SafeGoogleFont (
                              'Futura Hv BT',
                              fontSize: 46*ffem,
                              fontWeight: FontWeight.w900,
                              height: 1.2575*ffem/fem,
                              color: Color(0xffffffff),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // autogroupgdbd2Hn (FCxpAnyMEa8vB2z175Gdbd)
                    padding: EdgeInsets.fromLTRB(36*fem, 30*fem, 0*fem, 0*fem),
                    width: double.infinity,
                    height: 526*fem,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // namevtx (9:40)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 36*fem, 20*fem),
                          padding: EdgeInsets.fromLTRB(30*fem, 19*fem, 30*fem, 18*fem),
                          width: 303*fem,
                          decoration: BoxDecoration (
                            color: Color(0xffffffff),
                            borderRadius: BorderRadius.circular(20*fem),
                          ),
                          child: Text(
                            'Name',
                            style: SafeGoogleFont (
                              'Futura Md BT',
                              fontSize: 18*ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.2575*ffem/fem,
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                        Container(
                          // youremailayW (9:37)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 36*fem, 20*fem),
                          padding: EdgeInsets.fromLTRB(30*fem, 19*fem, 30*fem, 18*fem),
                          width: 303*fem,
                          decoration: BoxDecoration (
                            color: Color(0xffffffff),
                            borderRadius: BorderRadius.circular(20*fem),
                          ),
                          child: Text(
                            'Your Email',
                            style: SafeGoogleFont (
                              'Futura Md BT',
                              fontSize: 18*ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.2575*ffem/fem,
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                        Container(
                          // password2ac (9:43)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 36*fem, 30*fem),
                          padding: EdgeInsets.fromLTRB(30*fem, 19*fem, 30*fem, 18*fem),
                          width: 303*fem,
                          decoration: BoxDecoration (
                            color: Color(0xffffffff),
                            borderRadius: BorderRadius.circular(20*fem),
                          ),
                          child: Text(
                            'Password',
                            style: SafeGoogleFont (
                              'Futura Md BT',
                              fontSize: 18*ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.2575*ffem/fem,
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                        Container(
                          // autogroupgtvdS8Y (FCxokdzvwVix7JrPPHGtVd)
                          width: double.infinity,
                          height: 411*fem,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                // signupYhN (9:34)
                                margin: EdgeInsets.fromLTRB(0*fem, 13*fem, 8*fem, 0*fem),
                                child: Text(
                                  'Sign Up',
                                  style: SafeGoogleFont (
                                    'Futura Hv BT',
                                    fontSize: 32*ffem,
                                    fontWeight: FontWeight.w900,
                                    height: 1.2575*ffem/fem,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ),
                              Container(
                                // autogroupfbdqz3a (FCxow8hShKExsKxVhqfBDq)
                                width: 459*fem,
                                height: double.infinity,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      // circlebottemKLk (9:31)
                                      left: 0*fem,
                                      top: 13*fem,
                                      child: Align(
                                        child: SizedBox(
                                          width: 459*fem,
                                          height: 398*fem,
                                          child: Image.asset(
                                            'assets/cover-page/images/circle-bottem.png',
                                            width: 459*fem,
                                            height: 398*fem,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      // signinbottemzhn (9:35)
                                      left: 107*fem,
                                      top: 188*fem,
                                      child: Align(
                                        child: SizedBox(
                                          width: 78*fem,
                                          height: 9*fem,
                                          child: Container(
                                            decoration: BoxDecoration (
                                              color: Color(0x840a7de7),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      // signinh6Q (9:36)
                                      left: 116*fem,
                                      top: 174*fem,
                                      child: Align(
                                        child: SizedBox(
                                          width: 56*fem,
                                          height: 23*fem,
                                          child: Text(
                                            'Sign In',
                                            style: SafeGoogleFont (
                                              'Futura Hv BT',
                                              fontSize: 18*ffem,
                                              fontWeight: FontWeight.w900,
                                              height: 1.2575*ffem/fem,
                                              color: Color(0xff000000),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      // arrow9DJ (9:52)
                                      left: 121*fem,
                                      top: 0*fem,
                                      child: Container(
                                        padding: EdgeInsets.fromLTRB(21*fem, 24*fem, 19*fem, 24*fem),
                                        width: 64*fem,
                                        height: 64*fem,
                                        decoration: BoxDecoration (
                                          color: Color(0xff367cfe),
                                          borderRadius: BorderRadius.circular(32*fem),
                                        ),
                                        child: Center(
                                          // arrowvector1FW (9:49)
                                          child: SizedBox(
                                            width: 24*fem,
                                            height: 16*fem,
                                            child: Image.asset(
                                              'assets/cover-page/images/arrow-vector-dX6.png',
                                              width: 24*fem,
                                              height: 16*fem,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}