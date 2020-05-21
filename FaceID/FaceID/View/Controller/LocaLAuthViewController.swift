//
//  LocaLAuthViewController.swift
//  FaceID
//
//  Created by Анастасия Демидова on 21.05.2020.
//  Copyright © 2020 AnastasiaDemidova. All rights reserved.
//

import UIKit

class LocaLAuthViewController: BaseViewController {

    let localAuth = LocalAuth()
    override func viewDidLoad() {
        super.viewDidLoad()
        localAuth.delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        localAuth.checkAuthentication()
    }
}

extension LocaLAuthViewController: LocalAuthDelegate {
    func pass() {
        performSegue(withIdentifier: AppConstant.Segue.Valid, sender: self)
    }
    
    func fail() {
        performSegue(withIdentifier: AppConstant.Segue.Invalid, sender: self)
    }
}
