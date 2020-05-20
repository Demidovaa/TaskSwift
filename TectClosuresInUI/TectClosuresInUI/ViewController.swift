//
//  ViewController.swift
//  TectClosuresInUI
//
//  Created by Анастасия Демидова on 16.05.2020.
//  Copyright © 2020 AnastasiaDemidova. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerTableViewCell()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func registerTableViewCell() {
        let customCell = UINib(nibName: "CustomTableViewCell", bundle: nil)
        tableView.register(customCell, forCellReuseIdentifier: "CustomTableViewCell")
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: "CustomTableViewCell", for: indexPath)
            as? CustomTableViewCell else { return UITableViewCell() }
        
        if indexPath.row == 0 {
            cell.testButton.removeFromSuperview()
            cell.animate { (state) in
                switch state {
                case .began:
                    print("start animation")
                case .finished:
                    print("stop animation")
                }
            }
        }
        
        if indexPath.row == 1 {
            cell.buttonTapHandler = { (cell) in
                cell.textLabel?.text = "Click" }
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
