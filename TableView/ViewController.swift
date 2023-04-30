//
//  ViewController.swift
//  TableView
//
//  Created by Edgar Gamarra on 28/04/23.
//

import UIKit

class ViewController: UIViewController {

    private let myCountries = ["España", "Peru", "Mexico", "Colombia", "Argentina","EEUU", "Francia","Italia"]
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
    }


}



extension ViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // esta funcion maneja el numero de filas
        return myCountries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "myCell")
        if cell == nil {
            cell = UITableViewCell(style: .default , reuseIdentifier: "myCell" )
            cell?.backgroundColor = .gray
            cell?.textLabel?.font = UIFont.systemFont(ofSize: 20)
            cell?.accessoryType = .disclosureIndicator
        }
        
        cell?.textLabel?.text = myCountries[indexPath.row]
        return cell!
    }
}

extension ViewController:UITableViewDelegate {
    // este evento se dispara al hacer click
    // onclick
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(myCountries[indexPath.row])
    }
}
