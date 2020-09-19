//
//  AddTodo.swift
//  TodoList
//
//  Created by Mac on 05/09/2020.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit

class AddTodo: UIViewController {
    
    @IBOutlet weak var todoName : UITextField!
    @IBOutlet weak var todoDescription : UITextField!
    
    var didAddTodo: ((Todo) -> Void)?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Add Todo"
    }
    
    
    @IBAction func onAddTodo ( sender : UIButton){
        print(todoName.text ?? "" , todoDescription.text ?? "")
        didAddTodo?(Todo(name: todoName.text ?? "", description: todoDescription.text ?? ""))
        navigationController?.popViewController(animated: true)
    }
}
