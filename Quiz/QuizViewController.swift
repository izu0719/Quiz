//
//  QuizViewController.swift
//  Quiz
//
//  Created by 坂本 泉 on 2020/02/15.
//  Copyright © 2020 mycompany. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {

    var quizArray = [Any]()
    var correctAnswer: Int = 0
    
    @IBOutlet var quizTextView: UITextView!
    
    @IBOutlet var choiceButton1: UIButton!
     @IBOutlet var choiceButton2: UIButton!
     @IBOutlet var choiceButton3: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var tmpArray = [Any]()
        
        tmpArray.append(["広島にある有名な神社は？","厳島神社","八坂神社","出雲大社",1])
        tmpArray.append(["広島で有名な食べ物といえば？","お好み焼き","たこ焼き","もんじゃ",1])
        tmpArray.append(["広島の方言「たう」の意味は？","使う","届く","買う",2])
        tmpArray.append(["広島で二番目に大きい都市は？","尾道市","福山市","広島市",2])
        tmpArray.append(["宮島は何市にある？","広島市","呉市","廿日市市",3])
        tmpArray.append(["広島の方言「みやすい」の意味は？","見えやすい","美しい","易しい",3])
        
        while (tmpArray.count > 0) {
            let index = Int(arc4random()) % tmpArray.count
            quizArray.append(tmpArray[index])
            tmpArray.remove(at: index)
        }
        
        choiceQuiz()
        // Do any additional setup after loading the view.
    }
    
    func choiceQuiz(){
        let tmpArray = quizArray[0] as! [Any]
        
        quizTextView.text = tmpArray[0] as! String
        
        choiceButton1.setTitle(tmpArray[1] as? String, for: .normal)
        choiceButton2.setTitle(tmpArray[2] as? String, for: .normal)
        choiceButton3.setTitle(tmpArray[3] as? String, for: .normal)
    }
    
    @IBAction func choiceAnswer(sender: UIButton){
        
        let tmpArray = quizArray[0] as! [Any]
        
        if tmpArray[4] as! Int == sender.tag{
            correctAnswer = correctAnswer + 1
        }
        
        quizArray.remove(at: 0)
        
        if quizArray.count == 0{
            performSegueToResult()
        }else{
            choiceQuiz()
        }
    }
    
    func performSegueToResult(){
        performSegue(withIdentifier: "toResultView", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toResultView"{
            let resultViewController = segue.destination as! ResultViewController
            resultViewController.correctAnswer = self.correctAnswer
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
