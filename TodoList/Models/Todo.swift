//
//  Todo.swift
//  TodoList
//
//  Created by Mac on 05/09/2020.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit

class Todo {
    
    var name : String!
    var description : String!
    init(name : String , description : String) {
        self.name = name
        self.description = description
    }
    
    func printTodo() -> Void {
        print(self.name + " -> " .self.description )
    }
}
