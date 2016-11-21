//
//  TableViewController.swift
//  SlapChat
//
//  Created by Ian Rahman on 7/16/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var store =  DataStore.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        store.fetchData()
        if store.messages.count == 0 { store.generateTestData() } else { return }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        store.fetchData()
        self.tableView.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return store.messages.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "messageCell")!
        
        cell.textLabel?.text = store.messages[indexPath.row].content
        return cell
        
    }
}


