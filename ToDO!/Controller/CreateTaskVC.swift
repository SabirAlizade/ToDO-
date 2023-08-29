//
//  CreateTaskVC.swift
//  ToDO!
//
//  Created by Sabir Alizade on 29.05.2022.
//

import Foundation
import UIKit

protocol CreateTaskProtocol {
    func saveTask(name: String, time: String)
}

class CreateTaskVC: UIViewController {
    
    var delegate: CreateTaskProtocol?
    
    let taskNameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Task Name"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let taskTimeTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Time"
        textField.borderStyle = .roundedRect
        textField.keyboardType = .numbersAndPunctuation
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "New Task"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(didTapCreate))

        view.addSubview(taskNameTextField)
        view.addSubview(taskTimeTextField)
        
        NSLayoutConstraint.activate([
            taskNameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            taskNameTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 24),
            taskNameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:  -20),
            taskNameTextField.heightAnchor.constraint(equalToConstant: 40),
            
            taskTimeTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            taskTimeTextField.topAnchor.constraint(equalTo: taskNameTextField.bottomAnchor,constant: 10),
            taskTimeTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:  -20),
            taskTimeTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    @objc
    private func didTapCreate() {
        guard let name = taskNameTextField.text else {return}
        guard let time = taskTimeTextField.text else {return}
        delegate?.saveTask(name: name, time: time)
        navigationController?.popViewController(animated: true)
    }
}

