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
        
        // registrando la nueva celda
        tableView.register(UINib(nibName: "MyCustomTableViewCell", bundle: nil), forCellReuseIdentifier: "MyCustomCell")
    }


}



extension ViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // esta funcion maneja el numero de filas
        return myCountries.count
    }
    
    //maneja el numero de secciones en el tableview
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 50
        }
        
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            var cell = tableView.dequeueReusableCell(withIdentifier: "myCell")
            if cell == nil {
                cell = UITableViewCell(style: .default , reuseIdentifier: "myCell" )
                cell?.backgroundColor = .gray
                cell?.textLabel?.font = UIFont.systemFont(ofSize: 20)
                cell?.accessoryType = .disclosureIndicator
            }
            
            cell?.textLabel?.text = myCountries[indexPath.row]
            return cell!
        }else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MyCustomCell", for: indexPath) as? MyCustomTableViewCell
            
            cell?.myFirstLabel.text = String(indexPath.row + 1)
            cell!.mySecondLabel.text = myCountries[indexPath.row]
            if indexPath.row == 2 {
                cell?.mySecondLabel.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
            }
            return cell!
        }
        
        
    }
}

extension ViewController:UITableViewDelegate {
    // este evento se dispara al hacer click
    // onclick
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(myCountries[indexPath.row])
    }
}
