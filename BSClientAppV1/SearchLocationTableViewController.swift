//
//  SearchLocationTableViewController.swift
//  BottleServiceApp
//
//  Created by David Olarte on 29/06/2018.
//  Copyright © 2018 Iselacher Digital Media Factory. All rights reserved.
//

import UIKit
import Firebase

class SearchLocationTableViewController: UITableViewController, UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filteredContent(searchText: self.searchController.searchBar.text!)
    }

    
    @IBOutlet var locationTVController: UITableView!
    
   
    
    func filteredContent(searchText:String) {
        self.filteredLoc = self.locArray.filter{ user in
            let username = user!["locationTitle"] as? String
            return(username?.lowercased().contains(searchText.lowercased()))!
        }
        tableView.reloadData()
    }
    
    let searchController = UISearchController(searchResultsController: nil)
    
    var locArray = [NSDictionary?]()
    var filteredLoc = [NSDictionary?]()
    

    
   var databaseRef = Database.database().reference()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.tableView.separatorStyle = .none
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: nil, action: nil)
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation  =  false
        definesPresentationContext = true
        tableView.tableHeaderView = searchController.searchBar
        
        
        databaseRef.child("OwnerToApp").child("Lounge").queryOrdered(byChild: "locationTitle").observe(.childAdded, with: { (snapshot) in
            self.locArray.append(snapshot.value as? NSDictionary)
            
            self.locationTVController.insertRows(at: [IndexPath(row: self.locArray.count-1, section: 0)], with: UITableViewRowAnimation.automatic)
            
        } ) { (error) in
            print(error.localizedDescription)
        }
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }



    override func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
if searchController.isActive && searchController.searchBar.text !=
        
    ""{
    return filteredLoc.count
    
        }
    return self.locArray.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        let user : NSDictionary?
        
        if searchController.isActive && searchController.searchBar.text != ""
        {
            user = filteredLoc[indexPath.row]
        } else{
            user = self.locArray[indexPath.row]
        }
        cell.textLabel?.text = user?["locationTitle"] as? String
        cell.detailTextLabel?.text = user?["locationTitle"] as? String
        
       
        
        return cell
    }
    @IBAction func btndismiss(_ sender: Any) {
             dismiss(animated: true, completion: nil)
    }
}
