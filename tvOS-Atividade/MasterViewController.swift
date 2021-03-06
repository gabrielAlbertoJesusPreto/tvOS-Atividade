//
//  MasterViewController.swift
//  tvOS-Atividade
//
//  Created by Humberto  Julião on 02/05/16.
//  Copyright © 2016 Gabriel Alberto. All rights reserved.
//

import UIKit

enum Campeonatos: Int, CustomStringConvertible {
    case ingles
    case espanhol
    case frances
    
    var description: String {
        switch self {
        case .ingles: return "Inglês"
        case .espanhol: return "Espanhol"
        case .frances: return "Francês"
        }
    }
}

protocol AlterarCampeonatoDelegate: class {
    func alterarCampeonato(description: Campeonatos)
}

    
    class MasterTableViewController: UITableViewController {
        
        weak var delegate: AlterarCampeonatoDelegate?
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            tableView.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: 200))
            
            if let detailNav = splitViewController?.viewControllers.last as? UINavigationController, alterarDelegate = detailNav.topViewController as? AlterarCampeonatoDelegate {
                delegate = alterarDelegate
            }
            
        }
    }

    // MARK: - Table view data source
    extension MasterTableViewController {
        override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
            return 1
        }
        
        override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 3
        }
        
        override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCellWithIdentifier("campeonatosIdentifier", forIndexPath: indexPath) as! MasterTableViewCell
            
            let campeonatos = Campeonatos(rawValue: indexPath.row)!
            cell.Campeonatos.text = campeonatos.description
            
            return cell
        }
        
        override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 100))
            label.font = UIFont.systemFontOfSize(35, weight: UIFontWeightMedium)
            label.textColor = UIColor.whiteColor()
            label.text = "Campeonatos Internacionais"
            
            return label
            
        }
    }
    
    // MARK: - Table view delegate
    extension MasterTableViewController {
        override func tableView(tableView: UITableView, didUpdateFocusInContext context: UITableViewFocusUpdateContext, withAnimationCoordinator coordinator: UIFocusAnimationCoordinator) {
            guard let indexPath = context.nextFocusedIndexPath else { return }
            delegate?.alterarCampeonato(Campeonatos(rawValue: indexPath.row)!)
        }
        
        override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
            if let detailNav = splitViewController?.viewControllers.last as? UINavigationController {
                detailNav.popToRootViewControllerAnimated(true)
            }
            tableView.deselectRowAtIndexPath(indexPath, animated: true)
        }
    }

