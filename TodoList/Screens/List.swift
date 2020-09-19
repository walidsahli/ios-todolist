//
//  List.swift
//  TodoList
//
//  Created by Mac on 05/09/2020.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit

class List: UIViewController {
    
    var todos = [Todo(name : "Data" , description: "desc")]
    
    @IBOutlet weak var tableView : UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        navigationItem.title = "List Todos"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(goToAddTodo))
        tableView.delegate = self
        tableView.dataSource = self
    };
    
    @objc func goToAddTodo () {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let exo = storyboard.instantiateViewController(withIdentifier: "addTodo") as! AddTodo;
            exo.didAddTodo = { todo in
                self.todos.append(todo)
                self.tableView.reloadData()
                print(todo.name! , "TAG" , self.todos.count)

            }
            navigationController?.show(exo, sender: self)
    }
}

extension List : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        print("touched a row number " , indexPath)
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alert = UIAlertController(title: "Description of \(todos[indexPath.row].name ?? "")", message: todos[indexPath.row].description, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
            NSLog("The \"OK\" alert occured.")
        }))
        self.present(alert, animated: true, completion: nil)
    }
}

extension List: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ListCell
        cell.label.text = todos[indexPath.row].name
        return cell
    }
    
    
}
