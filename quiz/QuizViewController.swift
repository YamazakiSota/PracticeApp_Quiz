//
//  QuizViewController.swift
//  Quiz
//
//  Created by litech on 2015/02/10.
//  Copyright (c) 2015年 LifeisTech. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
    
    var number: Int = 0
    
    //クイズを格納する配列
    var quizArray = [[Any]]()
    
    //正解数
    var correctAnswer: Int = 0
    
    //クイズを表示するTextView
    @IBOutlet var quizTextView: UITextView!
    
    //選択肢のボタン
    @IBOutlet var choiceButtons1: UIButton!
    @IBOutlet var choiceButtons2: UIButton!
    @IBOutlet var choiceButtons3: UIButton!
    
    @IBOutlet weak var judgeImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //------------------------ここから下にクイズを書く------------------------//
        quizArray.append(["『古希』", "50", "60", "70", 3])
        quizArray.append(["『還暦』", "50", "60", "70", 2])
        quizArray.append(["『喜寿』", "55", "66", "77", 3])
        quizArray.append(["『傘寿』", "70", "80", "90", 1])
        quizArray.append(["『米寿』", "66", "77", "88", 3])
        quizArray.append(["『卒寿』", "70", "80", "90", 3])
        quizArray.append(["『白寿』", "88", "99", "111", 2])
        //------------------------ここから上にクイズを書く------------------------//
        
        //quizArrayの中身をシャッフルする
        quizArray.shuffle()

        choiceQuiz()
    }
    
    
    
    @IBAction func choiceAnswer(sender: UIButton) {
        if quizArray[0][4] as! Int == sender.tag {
            //正解数を増やす
            correctAnswer+=1
            
            judgeImageView.image = UIImage(named: "true")
        }else{
            judgeImageView.image = UIImage(named: "false")
        }
        
        judgeImageView.isHidden = false
        quizTextView.isHidden = true
        self.choiceButtons1.isHidden = true
        self.choiceButtons2.isHidden = true
        self.choiceButtons3.isHidden = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
            self.judgeImageView.isHidden = true
            self.quizTextView.isHidden = false
            self.choiceButtons1.isHidden = false
            self.choiceButtons2.isHidden = false
            self.choiceButtons3.isHidden = false
        }
        
        
        quizArray.remove(at: 0)
        
        //解いた問題数の合計が予め設定していた問題数に達したら結果画面へ
        if quizArray.count == 0 {
            performSegueToResult()
        } else {
            choiceQuiz()
        }
        
    }
    
    func choiceQuiz() {
        quizTextView.text = quizArray[0][0] as? String
        
        //選択肢のボタンにそれぞれ選択肢のテキストをセット
        choiceButtons1.setTitle(quizArray[0][1] as? String, for: .normal)
        choiceButtons2.setTitle(quizArray[0][2] as? String, for: .normal)
        choiceButtons3.setTitle(quizArray[0][3] as? String, for: .normal)
    }
    
    func performSegueToResult() {
        performSegue(withIdentifier: "toResultView", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "toResultView") {
            
            let resultView = segue.destination as! ResultViewController
            resultView.correctAnswer = self.correctAnswer
        }
    }
}


