//
//  ViewController.swift
//  FirstProjectSwift
//
//  Created by linoj ravindran on 28/10/2015.
//  Copyright © 2015 linoj ravindran. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var resultField: UILabel!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var multiplyButton: UIButton!
    @IBOutlet weak var devideButton: UIButton!
    @IBOutlet weak var powButton: UIButton!
    @IBOutlet weak var procentButton: UIButton!
    var method = 0
    var firstNumberInt = 0
    var lastNumberInt = 0
    var firstNumberDouble = 0.0
    var lastNumberDouble = 0.0
    var resultInt = 0
    var resultDouble = 0.0
    var aDouble = false
    var symbolActivated = false
    var firstUsed = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        resultField.text = String(0)
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left
        self.resultField.addGestureRecognizer(swipeLeft)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tal(_ thebutton: UIButton){
        if(resultField.text == "0") {
            resultField.text = thebutton.titleLabel!.text!
        }
        else{
            if(symbolActivated == true){
                resultField.text = ""
                resultField.text = thebutton.titleLabel!.text!
                symbolActivated = false
            }
            else{
                resultField.text = resultField.text! + thebutton.titleLabel!.text!
            }
        }
        
    }
    
    @IBAction func clear(_ thebutton: UIButton){
        
        resultField.text = "";
        resultField.text = String(0)
        symbolActivated = false
        firstUsed = ""
        plusButton.layer.borderWidth = 0
        minusButton.layer.borderWidth = 0
        multiplyButton.layer.borderWidth = 0
        devideButton.layer.borderWidth = 0
        powButton.layer.borderWidth = 0
        procentButton.layer.borderWidth = 0
    }

    @IBAction func slet(_ thebutton: UIButton){
        
        if(!(resultField.text?.isEmpty)!)
        {
            //resultField.text = resultField.text!.substring(to: resultField.text!.characters.index(before: resultField.text!.endIndex))
            resultField.text = String(resultField.text![..<resultField.text!.index(resultField.text!.endIndex, offsetBy: -1)])
            if(resultField.text?.isEmpty)!{
                resultField.text = String(0)
            }
            else{
                
            }
        }
        else
        {
            
        }
    }
    @IBAction func punktum(_ thebutton: UIButton){
        if !(resultField.text?.contains("."))! {
            resultField.text = resultField.text! + thebutton.titleLabel!.text!
        }
        else{
            
        }
    }
    
    @IBAction func Plus(_ thebutton: UIButton){
        nulStil(notThisButton: thebutton)
        if (!(resultField.text?.isEmpty)! && symbolActivated == false)   {
            symbolActivated = true
            if (CheckIfInteger(number: resultField.text!) == true) {
                firstNumberInt = Int(resultField.text!)!
                firstUsed = "Int"
            }
            else{
                firstNumberDouble = Double(resultField.text!)!
                firstUsed = "Double"
            }
        }
        else if(!(resultField.text?.isEmpty)! && symbolActivated == true){
            let midlertidigDouble = Double(resultField.text!)!
            if (CheckIfInteger(number: resultField.text!) == true) {
                let midlertidigInt = Int(resultField.text!)!
                if (firstUsed == "Int") {
                    let res = midlertidigInt + firstNumberInt
                    resultField.text = String(res)
                }
                else if(firstUsed == "Double"){
                    let res = midlertidigDouble + firstNumberDouble
                    resultField.text = String(res)
                    
                }
            }
            else{
                if (firstUsed == "Int") {
                    let res = midlertidigDouble + Double(firstNumberInt)
                    resultField.text = String(res)
                }
                else if(firstUsed == "Double"){
                    let res = midlertidigDouble + firstNumberDouble
                    resultField.text = String(res)
                }
            }
        }
        method = 1
    }
    
    @IBAction func Minus(_ thebutton: UIButton){
        nulStil(notThisButton: thebutton)
        if (!(resultField.text?.isEmpty)! && symbolActivated == false)   {
            symbolActivated = true
            if (CheckIfInteger(number: resultField.text!) == true) {
                firstNumberInt = Int(resultField.text!)!
                firstUsed = "Int"
            }
            else{
                firstNumberDouble = Double(resultField.text!)!
                firstUsed = "Double"
            }
        }
        else if(!(resultField.text?.isEmpty)! && symbolActivated == true){
            let midlertidigDouble = Double(resultField.text!)!
            if (CheckIfInteger(number: resultField.text!) == true) {
                let midlertidigInt = Int(resultField.text!)!
                if (firstUsed == "Int") {
                    let res = firstNumberInt - midlertidigInt
                    resultField.text = String(res)
                }
                else if(firstUsed == "Double"){
                    let res = firstNumberDouble - midlertidigDouble
                    resultField.text = String(res)
                    
                }
            }
            else{
                if (firstUsed == "Int") {
                    let res = Double(firstNumberInt) - midlertidigDouble
                    resultField.text = String(res)
                }
                else if(firstUsed == "Double"){
                    let res = firstNumberDouble - midlertidigDouble
                    resultField.text = String(res)
                }
            }
        }
        method = 2;
    }
    
    @IBAction func Gange(_ thebutton: UIButton){
        nulStil(notThisButton: thebutton)
        if (!(resultField.text?.isEmpty)! && symbolActivated == false)   {
            symbolActivated = true
            if (CheckIfInteger(number: resultField.text!) == true) {
                firstNumberInt = Int(resultField.text!)!
                firstUsed = "Int"
            }
            else{
                firstNumberDouble = Double(resultField.text!)!
                firstUsed = "Double"
            }
        }
        else if(!(resultField.text?.isEmpty)! && symbolActivated == true){
            let midlertidigDouble = Double(resultField.text!)!
            if (CheckIfInteger(number: resultField.text!) == true) {
                let midlertidigInt = Int(resultField.text!)!
                if (firstUsed == "Int") {
                    let res = midlertidigInt * firstNumberInt
                    resultField.text = String(res)
                }
                else if(firstUsed == "Double"){
                    let res = midlertidigDouble * firstNumberDouble
                    resultField.text = String(res)
                    
                }
            }
            else{
                if (firstUsed == "Int") {
                    let res = midlertidigDouble * Double(firstNumberInt)
                    resultField.text = String(res)
                }
                else if(firstUsed == "Double"){
                    let res = midlertidigDouble * firstNumberDouble
                    resultField.text = String(res)
                }
            }
        }
        method = 3;
    }
    
    @IBAction func Divider(_ thebutton: UIButton){
        nulStil(notThisButton: thebutton)
        if (!(resultField.text?.isEmpty)! && symbolActivated == false)   {
            symbolActivated = true
            if (CheckIfInteger(number: resultField.text!) == true) {
                firstNumberInt = Int(resultField.text!)!
                firstUsed = "Int"
            }
            else{
                firstNumberDouble = Double(resultField.text!)!
                firstUsed = "Double"
            }
        }
        else if(!(resultField.text?.isEmpty)! && symbolActivated == true){
            let midlertidigDouble = Double(resultField.text!)!
            if (CheckIfInteger(number: resultField.text!) == true) {
                let midlertidigInt = Int(resultField.text!)!
                if (firstUsed == "Int") {
                    let res = firstNumberInt / midlertidigInt
                    resultField.text = String(res)
                }
                else if(firstUsed == "Double"){
                    let res = firstNumberDouble / midlertidigDouble
                    resultField.text = String(res)
                    
                }
            }
            else{
                if (firstUsed == "Int") {
                    let res = Double(firstNumberInt) / midlertidigDouble
                    resultField.text = String(res)
                }
                else if(firstUsed == "Double"){
                    let res = firstNumberDouble / midlertidigDouble
                    resultField.text = String(res)
                }
            }
        }
        method = 4;
    }
    
    @IBAction func Ligmed(_ thebutton: UIButton){
        if(method == 0)
        {
            lastNumberInt = firstNumberInt
        }
        else if(!(resultField.text?.isEmpty)!)
        {
            switch(method)
            {
            case 1:
                // PLUS
                
                if(CheckIfInteger(number: resultField.text!) == true){
                    plusButton.layer.borderWidth = 0
                    lastNumberInt = Int(resultField.text!)!
                    if(firstUsed == "Double"){
                        resultDouble = firstNumberDouble + Double(lastNumberInt)
                        resultField.text = String(resultDouble)
                    }
                    else if(firstUsed == "Int"){
                        resultInt = firstNumberInt + lastNumberInt
                        resultField.text = String(resultInt)
                    }
                }
                else{
                    lastNumberDouble = Double(resultField.text!)!
                    if(firstUsed == "Double"){
                        resultDouble = firstNumberDouble + lastNumberDouble
                        resultField.text = String(resultDouble)
                    }
                    else if(firstUsed == "Int"){
                        resultDouble = Double(firstNumberInt) + lastNumberDouble
                        resultField.text = String(resultDouble)
                    }
                }
                break
            case 2:
                // MINUS
                
                if(CheckIfInteger(number: resultField.text!) == true){
                    minusButton.layer.borderWidth = 0
                    lastNumberInt = Int(resultField.text!)!
                    if(firstUsed == "Double"){
                        resultDouble = firstNumberDouble - Double(lastNumberInt)
                        resultField.text = String(resultDouble)
                    }
                    else if(firstUsed == "Int"){
                        resultInt = firstNumberInt - lastNumberInt
                        resultField.text = String(resultInt)
                    }
                }
                else{
                    lastNumberDouble = Double(resultField.text!)!
                    if(firstUsed == "Double"){
                        resultDouble = firstNumberDouble - lastNumberDouble
                        resultField.text = String(resultDouble)
                    }
                    else if(firstUsed == "Int"){
                        resultDouble = Double(firstNumberInt) - lastNumberDouble
                        resultField.text = String(resultDouble)
                    }
                }
                break
            case 3:
                // MULTIPLY
                
                if(CheckIfInteger(number: resultField.text!) == true){
                    multiplyButton.layer.borderWidth = 0
                    lastNumberInt = Int(resultField.text!)!
                    if(firstUsed == "Double"){
                        resultDouble = firstNumberDouble * Double(lastNumberInt)
                        resultField.text = String(resultDouble)
                    }
                    else if(firstUsed == "Int"){
                        resultInt = firstNumberInt * lastNumberInt
                        resultField.text = String(resultInt)
                    }
                }
                else{
                    lastNumberDouble = Double(resultField.text!)!
                    if(firstUsed == "Double"){
                        resultDouble = firstNumberDouble * lastNumberDouble
                        resultField.text = String(resultDouble)
                    }
                    else if(firstUsed == "Int"){
                        resultDouble = Double(firstNumberInt) * lastNumberDouble
                        resultField.text = String(resultDouble)
                    }
                }
                break
            case 4:
                // DEVIDE
                
                if(CheckIfInteger(number: resultField.text!) == true){
                    devideButton.layer.borderWidth = 0
                    lastNumberInt = Int(resultField.text!)!
                    if(firstUsed == "Double"){
                        resultDouble = firstNumberDouble / Double(lastNumberInt)
                        resultField.text = String(resultDouble)
                    }
                    else if(firstUsed == "Int"){
                        resultInt = firstNumberInt / lastNumberInt
                        resultField.text = String(resultInt)
                    }
                }
                else{
                    lastNumberDouble = Double(resultField.text!)!
                    if(firstUsed == "Double"){
                        resultDouble = firstNumberDouble / lastNumberDouble
                        resultField.text = String(resultDouble)
                    }
                    else if(firstUsed == "Int"){
                        resultDouble = Double(firstNumberInt) / lastNumberDouble
                        resultField.text = String(resultDouble)
                    }
                }
                break
            case 5:
                // POW - OPLØFT
                
                if(CheckIfInteger(number: resultField.text!) == true){
                    powButton.layer.borderWidth = 0
                    lastNumberInt = Int(resultField.text!)!
                    if(firstUsed == "Double"){
                        resultDouble = Double(pow(firstNumberDouble, Double(lastNumberInt)))
                        resultField.text = String(resultDouble)
                    }
                    else if(firstUsed == "Int"){
                        resultInt = Int(pow(Double(firstNumberInt), Double(lastNumberInt)))
                        resultField.text = String(resultInt)
                    }
                }
                else{
                    lastNumberDouble = Double(resultField.text!)!
                    if(firstUsed == "Double"){
                        resultDouble = Double(pow(firstNumberDouble, lastNumberDouble))
                        resultField.text = String(resultDouble)
                    }
                    else if(firstUsed == "Int"){
                        resultDouble = Double(pow(Double(firstNumberInt), lastNumberDouble))
                        resultField.text = String(resultDouble)
                    }
                }
                break
            case 6:
                // PROCENT
                
                if(CheckIfInteger(number: resultField.text!) == true){
                    procentButton.layer.borderWidth = 0
                    lastNumberInt = Int(resultField.text!)!
                    resultDouble = firstNumberDouble * Double(lastNumberInt)
                    if(testIfInt(n: resultDouble) == true){
                        resultInt = Int(resultDouble)
                        resultField.text = String(resultInt)
                    }
                    else{
                        resultField.text = String(resultDouble)
                    }
                }
                else{
                    lastNumberDouble = Double(resultField.text!)!
                    resultDouble = firstNumberDouble * lastNumberDouble
                    if(testIfInt(n: resultDouble) == true){
                        resultInt = Int(resultDouble)
                        resultField.text = String(resultInt)
                    }
                    else{
                        resultField.text = String(resultDouble)
                    }
                }
                break
                
            default:
                method = 0
            }
        }
        
    }
    
    @IBAction func Kvadratrod(_ thebutton: UIButton){
        if(!(resultField.text?.isEmpty)!)
        {
            firstNumberDouble = Double (resultField.text!)!
            firstNumberDouble = sqrt(firstNumberDouble)
            if(testIfInt(n: firstNumberDouble) == true){
                firstNumberInt = Int(firstNumberDouble)
                resultField.text = String(firstNumberInt)
                firstUsed = "Int"
            }
            else{
                resultField.text = String (firstNumberDouble)
                firstUsed = "Double"
            }
        }
    }
    
    @IBAction func PI(_ thebutton: UIButton){
        if((resultField.text?.isEmpty)! || resultField.text == "0"){
            resultField.text = "3.14159"
        }
        else{
            
        }
    }

    @IBAction func xianden(_ thebutton: UIButton){
        if(!(resultField.text?.isEmpty)!)
        {
            if(CheckIfInteger(number: resultField.text!) == true){
                firstNumberInt = Int(resultField.text!)!
                firstNumberInt = firstNumberInt * firstNumberInt
                resultField.text = String(firstNumberInt)
                firstUsed = "Int"
            }
            else{
                firstNumberDouble = Double(resultField.text!)!
                firstNumberDouble = firstNumberDouble * firstNumberDouble
                resultField.text = String(firstNumberDouble)
                firstUsed = "Double"
            }
        }
        else{
            
        }
    }
    
    @IBAction func plusMinus(_ thebutton: UIButton){
        if(!(resultField.text?.isEmpty)!)
        {
            if(CheckIfInteger(number: resultField.text!) == true){
                let minusPlus = Int (resultField.text!)
                let plusMinus = minusPlus! * (-1)
                resultField.text = String (plusMinus)
            }
            else{
            let minusPlus = Double (resultField.text!)
            let plusMinus = minusPlus! * (-1)
            resultField.text = String (plusMinus)
            }
        }
    }

    @IBAction func xin(_ thebutton: UIButton){
        nulStil(notThisButton: thebutton)
        symbolActivated = true
        if(!(resultField.text?.isEmpty)!) {
            if(CheckIfInteger(number: resultField.text!) == true){
                firstNumberInt = Int(resultField.text!)!
                firstUsed = "Int"
            }
            else{
                firstNumberDouble = Double(resultField.text!)!
                firstUsed = "Double"
            }
        }
        else{
            
        }
        method = 5
    }
    
    @IBAction func procent(_ thebutton: UIButton){
        nulStil(notThisButton: thebutton)
        symbolActivated = true
        if(!(resultField.text?.isEmpty)!)
        {
            firstNumberDouble = Double(resultField.text!)!
            firstNumberDouble = firstNumberDouble/100
        }
        method = 6
    }
    func CheckIfInteger(number: String) -> Bool {
        if number.contains(".") {
            return false
        }
        else{
            return true
        }
    }
    func nulStil(notThisButton: UIButton){
        plusButton.layer.borderWidth = 0
        minusButton.layer.borderWidth = 0
        multiplyButton.layer.borderWidth = 0
        devideButton.layer.borderWidth = 0
        notThisButton.layer.borderWidth = 3
    }
    func testIfInt(n: Double) -> Bool{
        if(n.truncatingRemainder(dividingBy: 1) == 0){
            return true
        }
        else{
            return false
        }
    }
    @objc func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.left:
                //resultField.text = resultField.text!.substring(to: resultField.text!.characters.index(before: resultField.text!.endIndex))
                if(!(resultField.text?.isEmpty)!){
                    resultField.text = String(resultField.text![..<resultField.text!.index(resultField.text!.endIndex, offsetBy: -1)])
                    if(resultField.text?.isEmpty)!{
                        resultField.text = String(0)
                    }
                    else{
                        
                    }
                }
                else{
                    
                }
                break
            default:
                break
            }
        }
    }
    
    


}

