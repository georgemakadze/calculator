//
//  pinkTheme.swift
//  Calc
//
//  Created by iOSBFree on 24/01/2022.
//
//
//  iOSBFree Ltd                   β All rights reserved
//  Website                         β https://www.iosbfree.com
//
//  ππΏ Free Courses                 β https://www.udemy.com/user/iosbfree
//
//  YouTube                         β https://www.youtube.com/channel/UCWBUOVRbtKNml4jN_4bRkCQ
//  Linked In                       β http://www.linkedin.com/in/mattharding-iosbfree
//
//  Tell us what
//  you want to learn
//
//  π€ iOSBFree
//  community@iosbfree.com
//  π§π»π¨πΏβπΌπ©πΌβπΌπ©π»βπ»π¨πΌβπΌπ§π»ββοΈπ©πΌβπ»ππ½ββοΈπ΅π»ββοΈπ§πΌββοΈπ¦ΉπΌββπ§πΎπ§ββοΈ
// *******************************************************************************************
//
// β What's This File?
//   It's a color theme, used to display a different color theme.
//   Architectural Layer: Data Layer
//
//   π‘ Team Tip ππ» We can provide these files to a designer, if we wanted to.
// *******************************************************************************************

import Foundation


extension ThemeManager {
    
    var pinkTheme: CalculatorTheme {
        return CalculatorTheme(id:          "5",
            backgroundColor:                "#253C5B",
            displayColor:                   "#EBF0EF",
                               
            extraFunctionColor:             "#294666",
            extraFunctionTitleColor:        "#EBF0EF",
                               
            operationColor:                 "#FA569C",
            operationTitleColor:            "#EBF0EF",
            operationSelectedColor:         "#0265FF",
            operationTitleSelectedColor:    "#ffffff",
                               
            pinpadColor:                    "#16253A",
            pinpadTitleColor:               "#EBF0EF",
                               
            statusBarStyle:                 .light)
    }
}
