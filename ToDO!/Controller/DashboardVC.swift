//
//  DashboardVC.swift
//  ToDO!
//
//  Created by Sabir Alizade on 29.05.2022.
//

import Foundation
import UIKit

class DashboardVC:  UIViewController {
    
    var viewModel: DashboardViewModel = {
        let model = DashboardViewModel()
        return model
    }()
    
    lazy var tableView: UITableView = {
        let view = UITableView()
        view.delegate = self
        view.dataSource = self
        view.register(DashBoardCell.self, forCellReuseIdentifier: DashBoardCell.description())
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Dashboard"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTapCreate))
        
        viewModel.data = viewModel.readData()
        
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -44),
            tableView.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    @objc
    private func didTapCreate() {
        let vc = CreateTaskVC()
        vc.delegate = self
        show(vc, sender: self)
    }
}

extension DashboardVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: DashBoardCell.description(), for: indexPath) as? DashBoardCell {
            cell.item = viewModel.data[indexPath.row]
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath ) {
        if editingStyle == .delete {
            viewModel.data.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            viewModel.saveData()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        showUpdate(index: indexPath.row)
    }
    
    private func showUpdate(index: Int) {
        let vc = TaskNoteVC()
        vc.viewModel.selectedIndex = index
        vc.viewModel.delegate = self
        vc.modalPresentationStyle = .fullScreen
        show(vc, sender: self)
    }
}

extension DashboardVC: CreateTaskProtocol {
    func saveTask(name: String, time: String) {
        viewModel.data.append(TaskModel(name: name, createdAt: time))
        tableView.reloadData()
        viewModel.saveData()
    }
}

extension DashboardVC: UpdateProtocol {
    func update(note: String, index: Int) {
        viewModel.data[index].note = note
        tableView.reloadData()
        viewModel.saveData()
    }
}
