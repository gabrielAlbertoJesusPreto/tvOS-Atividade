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
    case alemao
    case espanhol
    case frances
    
    var description: String {
        switch self {
        case .ingles: return "Inglês"
        case .alemao: return "Alemão"
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
            return 4
        }
        
        override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCellWithIdentifier("campeonatosIdentifier", forIndexPath: indexPath) as! MasterTableViewCell
            
            let campeonatos = Campeonatos(rawValue: indexPath.row)!
            cell.Campeonatos.text = campeonatos.description
            
            return cell
        }
        
        override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            return "Campeonatos"
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

