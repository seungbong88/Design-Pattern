//
//  ViewController.swift
//  MVC_Excercise
//
//  Created by seungbong on 2020/08/25.
//  Copyright © 2020 한승희. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    let changeNameNotification = "ChangeNameNotification"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var person = Person(name: "김나이키", age: 38)
        
        person.observe(\.name) { (object, change) in
          print("SomeClass object value changed to \(person.name)")
        }
    }
    
    @IBAction func clickedButton(_ sender: Any) {
    }
    
    @objc func changeName() {
        
    }
}
