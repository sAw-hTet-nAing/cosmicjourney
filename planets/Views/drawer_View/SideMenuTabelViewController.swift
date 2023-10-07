//
//  SideMenuTabelViewController.swift
//  planets
//
//  Created by Saw Htet Naing on 07/10/2023.
//

import UIKit

class SideMenuTabelViewController: UITableViewController{
        
    let logoImageView: UIImageView = {
           let imageView = UIImageView()
           imageView.image = UIImage(named: "demo") // Replace with your app logo image name
           imageView.contentMode = .scaleAspectFit
           return imageView
       }()
       
       let titleLabel: UILabel = {
           let label = UILabel()
           label.text = "Your App Title"
           label.textColor = .white
           label.font = UIFont.boldSystemFont(ofSize: 18)
           return label
       }()
    
  
   
    
    public var delegate: SideMenuDelegate?
    private let menuItems: [SideMenuModel]
   
    var previouslySelectedIndex: IndexPath?
    
    init(with menuItems : [SideMenuModel]){
        self.menuItems = menuItems
    
        
        super.init(nibName: nil, bundle: nil)
    
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    override func viewDidLoad() {
    
       
   
        super.viewDidLoad()
        
        //select home at start
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        let indexPath = IndexPath(row: 0, section: 0)
               tableView.selectRow(at: indexPath, animated: false, scrollPosition: .none)
        tableView(self.tableView, didSelectRowAt: indexPath)
        
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 200))
           headerView.backgroundColor = .label
           
           // Add the logo image view to the header view
           let logoImageView = UIImageView(image: UIImage(named: "galaxy")) // Replace with your app logo image name
           logoImageView.contentMode = .scaleAspectFit
           logoImageView.translatesAutoresizingMaskIntoConstraints = false
           headerView.addSubview(logoImageView)
           
           // Add the title label to the header view
           let titleLabel = UILabel()
           titleLabel.text = "Cosmic Journey"
           titleLabel.textColor = .white
           titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
           titleLabel.translatesAutoresizingMaskIntoConstraints = false
           headerView.addSubview(titleLabel)
        
        
        
      
        // Set the header view as the table view's tableHeaderView
        tableView.tableHeaderView = headerView

        tableView.backgroundColor = .label
        view.backgroundColor = .label

        //Set Bottom App Version
        let appVersionLabel = UILabel()
        appVersionLabel.text = "Version " + (Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "")
        appVersionLabel.textColor = .white
        appVersionLabel.font = UIFont.systemFont(ofSize: 12)
        appVersionLabel.translatesAutoresizingMaskIntoConstraints = false

        // Add appVersionLabel to the parent view (the same view that contains the table view)
        view.addSubview(appVersionLabel)

        
        NSLayoutConstraint.activate([
            logoImageView.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            logoImageView.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 10),
            logoImageView.widthAnchor.constraint(equalToConstant: 100),
            logoImageView.heightAnchor.constraint(equalToConstant: 100),
            
            titleLabel.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 10),
            
            appVersionLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
               appVersionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
        ])
        


    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return menuItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: "cell",for: indexPath)
      
        cell.textLabel?.text = menuItems[indexPath.row].title
        
        cell.textLabel?.textColor = .gray
        cell.backgroundColor = .label
    
        cell.imageView?.image = menuItems[indexPath.row].icon
        cell.imageView?.tintColor = .gray
        cell.contentView.backgroundColor = .label
        cell.selectionStyle = .none
    
        return cell
    }


    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        if let previousIndex = previouslySelectedIndex {
               let previousCell = tableView.cellForRow(at: previousIndex)
               previousCell?.textLabel?.textColor = .gray
            previousCell?.imageView?.tintColor = .gray
          
           }
           
          
           let selectedCell = tableView.cellForRow(at: indexPath)
           selectedCell?.textLabel?.textColor = .white
        selectedCell?.imageView?.tintColor = .white
       
           previouslySelectedIndex = indexPath
           
           let selectedItem = menuItems[indexPath.row]
           delegate?.didSelectMenuItem(name: selectedItem.title, selectedIndex: indexPath.row)
        
    }
    
   
    
}
