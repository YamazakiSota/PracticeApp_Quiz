//
//  ResultViewController.swift
//  Quiz
//
//  Created by litech on 2015/02/10.
//  Copyright (c) 2015年 LifeisTech. All rights reserved.
//

import UIKit



class ResultViewController: UIViewController {
    var correctAnswer:Int = 0
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var revel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        resultLabel.text = "7問中\(correctAnswer)問正解"
        
        if(correctAnswer == 7){
            revel.text = "神レベル"
        }else if(correctAnswer >= 4){
            revel.text = "普通レベル"
        }else{
            revel.text = "お子様レベル"
        }
        

    }
    
}
