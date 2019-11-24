//
//  ViewController.swift
//  Calculator
//
//  Created by Vaibhav Zodge on 24/11/19.
//  Copyright © 2019 Vaibhav Zodge. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var resultLable: UILabel!
    
    var numberOnScree:Double = 0;
    var previousNumber:Double = 0;
    var performingMath = false;
    var operation = 0;
    
    @IBAction func numbers(_ sender:UIButton)
    {
        if performingMath == true
        {
            resultLable.text = String(sender.tag-1);
            numberOnScree = Double(resultLable.text!)!;
            performingMath = false;
        }else{
        resultLable.text=resultLable.text! + String(sender.tag-1);
        numberOnScree = Double( resultLable.text!)!;
        }
    }

    @IBAction func buttons(_ sender: UIButton) {
        
        if resultLable.text != "" && sender.tag != 11 && sender.tag != 16
        {
            previousNumber = Double(resultLable.text!)!;
            if sender.tag == 12 //divide
            {
                resultLable.text = "/";

            } else if sender.tag == 13 //multiply
            {
                resultLable.text = "*";

            } else if sender.tag == 14 //substract
            {
                resultLable.text = "-";

            }else if sender.tag == 15 //add
            {
                resultLable.text = "+";
            }
            operation = sender.tag;
            performingMath = true;
        }else if sender.tag == 16
        {
        if operation == 12
        {
            resultLable.text = String(previousNumber / numberOnScree)

        }else if operation == 13
        {
            resultLable.text = String(previousNumber * numberOnScree)

        }else if operation == 14
        {
            resultLable.text = String(previousNumber - numberOnScree)

        }else if operation == 15
        {
            resultLable.text = String(previousNumber + numberOnScree)
        }
        }
        else if sender.tag == 11
        {
            resultLable.text = ""
            numberOnScree = 0
            previousNumber = 0
            operation = 0
            performingMath = false
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

