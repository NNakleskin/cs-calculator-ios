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
        result.text = result.text! + String(sender.tag)
        UserNum1 = Double(result.text!)!
    }
    
    @IBAction func ButtonActions(_ sender: UIButton)
    {
        if result.text != ""
        {
            if sender.tag == 10 // bin
            {
                if UserNum1 < 256
                {
                    result.text = String(UInt8(Int(UserNum1)).binaryDescription  )
                }
                else
                {
                    result.text = "UInt8 overflow"
                
                }
                if UserNum1 < 4294967295
                {
                    resultSmall.text = String(UInt32(Int(UserNum1)).binaryDescription  )
                }
                else
                {
                    resultSmall.text = "UInt32 overflow"
                }
            }
            else if sender.tag == 13 // xor
            {
                resultSmall.text = ""
                result.text = "0x" + String(Int(UserNum1), radix: 16)
                
                
            }
            else if sender.tag == 15 // not
            {
                result.text = String((~Int(UserNum1)));
                
                
            }

        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

