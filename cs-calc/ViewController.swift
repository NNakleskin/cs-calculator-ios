//
//  ViewController.swift
//  cs-calc
//
//  Created by Никита Наклескин on 10.04.2022.
//


import UIKit

extension BinaryInteger {
    var binaryDescription: String {
        var binaryString = ""
        var internalNumber = self
        for _ in (1...self.bitWidth) {
            binaryString.insert(contentsOf: "\(internalNumber & 1)", at: binaryString.startIndex)
            internalNumber >>= 1
        }
        return "0b" + binaryString
    }
}

func fact(x:Int) -> Int
{
    if x == 1
    {
        return x;
    }
    return x * fact(x: x - 1);
}

class ViewController: UIViewController
{
    var UserNum1: Double = 0;
    var UserNum2: Double = 0;
    var actSign: Bool = false;
    
    @IBOutlet weak var result: UILabel!
    @IBOutlet weak var resultSmall: UILabel!
    
    @IBAction func digits(_ sender: UIButton)
    {
        if actSign == true
        {
            result.text = String(sender.tag)
            actSign = false
        }
        if sender.tag == 27
        {
            result.text = result.text! + "."
        }
        else
        {
            result.text = result.text! + String(sender.tag)
            UserNum1 = Double(result.text!)!
        }
    }
    
    @IBAction func ButtonActions(_ sender: UIButton)
    {
        if result.text != "" && sender.tag != 16 && sender.tag != 26
        {
            if sender.tag == 10 // bin
            {
                if UserNum1 < 256 && UserNum1 >= 0
                {
                    result.text = String(UInt8(Int(UserNum1)).binaryDescription  )
                }
                else
                {
                    result.text = "UInt8 overflow"
                
                }
                if UserNum1 < 4294967295 && UserNum1 >= 0
                {
                    resultSmall.text = String(UInt32(Int(UserNum1)).binaryDescription)
                }
                else
                {
                    resultSmall.text = "UInt32 overflow"
                }
                if UserNum1 < 0 // Add overflow errors
                {
                    result.text = String(Int(Int(UserNum1)).binaryDescription)
                    resultSmall.text = String(Int32(Int(UserNum1)).binaryDescription)
                }
            }
            else if sender.tag == 13 // HEX
            {
                resultSmall.text = ""
                result.text = "0x" + String(Int(UserNum1), radix: 16)
            }
            else if sender.tag == 28  //DEC
            {
                resultSmall.text = String(UserNum1)
                result.text = String(UserNum1)
            }
            else if sender.tag == 15 // not
            {
                result.text = " "
                result.text = String((~Int(UserNum1)));
            }
            else if sender.tag == 18 // sqrt
            {
                if UserNum1 < 0
                {
                    resultSmall.text = "Error: the root of a negative number"
                    result.text = "Error: the root of a negative number"
                }
                else
                {
                    resultSmall.text = String(sqrt(UserNum1))
                    result.text = String(sqrt(UserNum1))
                }
            }
            else if sender.tag == 20 // square
            {
                resultSmall.text = String(UserNum1 * UserNum1)
                result.text = String(UserNum1 * UserNum1)
            }
            else if sender.tag == 24 // fact
            {
                if Int(UserNum1) < 21
                {
                    result.text = " "
                    resultSmall.text = String((fact(x:Int(UserNum1))));
                    result.text = String((fact(x:Int(UserNum1))));
                }
                else
                {
                    result.text = "Integer owerflow"
                }
            }

        }
        else if sender.tag == 26 // PI number
        {
            result.text = String(Float.pi)
            resultSmall.text = String(Double.pi)
            UserNum1 = Double.pi
            
        }
        else if sender.tag == 16 // delete
        {
            UserNum1 = 0.0
            UserNum2 = 0.0
            result.text = "";
            resultSmall.text = "";
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

