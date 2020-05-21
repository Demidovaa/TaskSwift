//
//  BaseViewController.swift
//  FaceID
//
//  Created by Анастасия Демидова on 22.05.2020.
//  Copyright © 2020 Waqood. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
    }

    @IBAction func backAction(_ sender: Any) {
        _ = navigationController?.popViewController(animated: true)
    }
}
