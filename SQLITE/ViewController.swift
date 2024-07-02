//
//  ViewController.swift
//  SQLITE
//
//  Created by Arshad Shaik on 11/12/23.
//

import UIKit

class ViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }
  
  // MARK: - Actions -
  @IBAction func addTapped(_ sender: UIButton) {
    SqliteDatabase.shared.createTable()
  }
  
  @IBAction func fetchTapped(_ sender: UIButton) {
    print("get rows: ",SqliteDatabase.shared.getRows())
  }
  
  @IBAction func updateTapped(_ sender: UIButton) {
    SqliteDatabase.shared.insertRow()
  }
  
  @IBAction func deleteTapped(_ sender: UIButton) {
    
  }
  
}

