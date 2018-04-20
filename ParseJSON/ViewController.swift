//
//  ViewController.swift
//  ParseJSON
//
//  Created by Sai Pratap Koppolu on 19/04/18.
//  Copyright © 2018 Sai Pratap Koppolu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    struct Emp: Decodable {
        let id: Int?
        let name: String?
        let addr: addr?
    }
    
    struct addr: Decodable {
        let city: String?
    }
    
    @IBOutlet weak var tableView: UITableView!
    var employeeDetails: [Emp] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(DetailTableViewCell.registerNib(), forCellReuseIdentifier: DetailTableViewCell.reusableIdentifier())
        getJSONFromURL()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getJSONFromURL() {
        let url = NSURL(string: "https://springmvcjson.cfapps.io/listEmp")
        
        URLSession.shared.dataTask(with: url! as URL) { (data, response, error) in
            
            let employees = try? JSONDecoder().decode([Emp].self, from: data!)
            self.employeeDetails = employees!
            DispatchQueue.main.async {
                self.tableView.delegate = self
                self.tableView.dataSource = self
                self.tableView.reloadData()
            }
            
        }.resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employeeDetails.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DetailTableViewCell.reusableIdentifier(), for: indexPath) as! DetailTableViewCell
        cell.idNo.text = String(employeeDetails[indexPath.row].id!)
        cell.name.text = employeeDetails[indexPath.row].name!
        cell.address.text = employeeDetails[indexPath.row].addr?.city!
        return cell
    }


}

