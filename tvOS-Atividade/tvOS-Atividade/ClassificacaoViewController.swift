//
//  ClassificacaoViewController.swift
//  tvOS-Atividade
//
//  Created by Gabriel Alberto de Jesus Preto on 02/05/16.
//  Copyright © 2016 Gabriel Alberto. All rights reserved.
//

import UIKit

class ClassificacaoViewController: UIViewController {
    
    private let segueIdentifier = ""
    
    private var championships = []
    
    private let buscaService = TeamService.sharedInstance
    
    var team:Team!
    
    @IBOutlet weak var championshipDetail: UILabel!
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        championships = buscaService.getInfosByChampionship("Ingles")
        self.tableView.reloadData()
        

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func didUpdateFocusInContext(context: UIFocusUpdateContext, withAnimationCoordinator coordinator: UIFocusAnimationCoordinator) {
        if let cell = context.nextFocusedView as? TimeTableViewCell {
            cell.logo.adjustsImageWhenAncestorFocused = true
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ClassificacaoViewController: UITableViewDataSource {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return championships.count+1
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 66
        } else {
            return 130
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCellWithIdentifier("HeaderIndentifier", forIndexPath: indexPath) as! HeaderTableViewCell
            return cell
        }

        let cell = tableView.dequeueReusableCellWithIdentifier("TimeIdentifier", forIndexPath: indexPath) as! TimeTableViewCell
        cell.posicaoLabel.text = String(indexPath.row)
        guard let Item = championships.objectAtIndex(indexPath.row-1) as? NSDictionary else{
            return cell
        }
        
        cell.timeLabel.text = Item.objectForKey("name") as! NSString as String
        cell.jogosLabel.text = "\(Item.objectForKey("match") as! NSNumber)"
        cell.vitoriasLabel.text = "\(Item.objectForKey("winner") as! NSNumber)"
        cell.derrotasLabel.text = "\(Item.objectForKey("loser") as! NSNumber)"
        cell.empatesLabel.text = "\(Item.objectForKey("draw") as! NSNumber)"
        cell.pontosLabel.text = "\(Item.objectForKey("points") as! NSNumber)"
        cell.logo.image = UIImage(named: Item.objectForKey("imageName") as! NSString as String)
        
        return cell
    }
    
}

// MARK: - Table view delegate
extension ClassificacaoViewController: UITableViewDelegate {
    
    func tableView(tableView: UITableView, canFocusRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        
        if indexPath.row == 0 {
            return false
        }
        
        return true
        
    }
    
    
    
}


// MARK: - ALTERAR CAMPEONATO DELEGATE
extension ClassificacaoViewController: AlterarCampeonatoDelegate {
    func alterarCampeonato(description: Campeonatos) {
        if description.description == "Inglês" {
            championships = buscaService.getInfosByChampionship("Ingles")
            self.tableView.reloadData()
            print(description.description)
        }
        else if description.description == "Alemão" {
            championships = buscaService.getInfosByChampionship("Alemao")
            self.tableView.reloadData()
            print(description.description)
        }
        else if description.description == "Francês" {
            championships = buscaService.getInfosByChampionship("Frances")
            self.tableView.reloadData()
            print(description.description)
        }
        else if description.description == "Espanhol" {
            championships = buscaService.getInfosByChampionship("Espanhol")
            self.tableView.reloadData()
            print(description.description)
        }
        
        
        championshipDetail.text = "Campeonato \(description.description)"
    }
}
