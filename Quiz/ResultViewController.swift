//
//  ResultViewController.swift
//  Quiz
//
//  Created by 坂本 泉 on 2020/02/15.
//  Copyright © 2020 mycompany. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    var correctAnswer: Int = 0
    @IBOutlet var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        resultLabel.text = String(correctAnswer)
    }
    
    @IBAction func back(){
        self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
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
