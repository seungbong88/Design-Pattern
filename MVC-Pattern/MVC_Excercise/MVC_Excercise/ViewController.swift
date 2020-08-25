//
//  ViewController.swift
//  MVC_Excercise
//
//  Created by seungbong on 2020/08/25.
//  Copyright © 2020 한승희. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var bottomView: UIView!
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userAgeLabel: UILabel!
    
    var person: Person = Person()
    
    let randomName: [String] = ["김나이키", "박아디다스", "정이케아"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    

    @IBAction func clickedInputButton(_ sender: UIButton) {
        // Model의 정보 변경
        person.name = nameTextField.text ?? ""
        person.age = Int(ageTextField.text ?? "") ?? 0
        userNameLabel.text = person.name
        userAgeLabel.text = "\(person.age)"
        
        topView.isHidden = true
        bottomView.isHidden = false
    }
    
    @IBAction func clickedChangeNameButton(_ sender: Any) {
        let randNum = Int.random(in: 0..<randomName.count)
        person.name = randomName[randNum]
        
        userNameLabel.text = person.name
        userAgeLabel.text = "\(person.age)"
    }
    @IBAction func clickedChangeAgeButton(_ sender: Any) {
        person.age += 1
        userAgeLabel.text = "\(person.age)"
    }

}
