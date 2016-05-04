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
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCellWithIdentifier("HeaderIndentifier", forIndexPath: indexPath) as! HeaderTableViewCell
            return cell
        }
        
        let cell = tableView.dequeueReusableCellWithIdentifier("TimeIdentifier", forIndexPath: indexPath) as! TimeTableViewCell
        
        
        cell.posicaoLabel.text = "\(String(indexPath.row))º"
        cell.timeLabel.text = "Corinthians"
        cell.jogosLabel.text = "1"
        cell.vitoriasLabel.text = "1"
        cell.derrotasLabel.text = "0"
        cell.empatesLabel.text = "0"
        cell.pontosLabel.text = "3"
        
        return cell
    }
    
    
    
}

// MARK: - Table view delegate
extension ClassificacaoViewController: UITableViewDelegate {
//    func tableView(tableView: UITableView, didUpdateFocusInContext context: UITableViewFocusUpdateContext, withAnimationCoordinator coordinator: UIFocusAnimationCoordinator) {
//        guard let indexPath = context.nextFocusedIndexPath else { return }
//    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let detail = self.storyboard!.instantiateViewControllerWithIdentifier("detailView") as! DetailViewController
        
        
        guard let Item = championships.objectAtIndex(indexPath.row-1) as? NSDictionary else{
            return
        }
        
        
        let team = Team()
        
        team.name = Item.objectForKey("name") as! NSString as String
        team.imageName = Item.objectForKey("imageName") as! NSString as String
        team.match = Item.objectForKey("match") as? Int
        team.winner = Item.objectForKey("winner") as? Int
        team.loser = Item.objectForKey("loser") as? Int
        team.draw = Item.objectForKey("draw") as? Int
        team.position = indexPath.row
        team.points = Item.objectForKey("points") as? Int

        
        detail.team = team
        
        
        self.navigationController?.pushViewController(detail, animated: false)
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    
    
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
        else if description.description == "Francês" {
            championships = buscaService.getInfosByChampionship("Frances")
            self.tableView.reloadData()
            print(description.description)
        }
        else if description.description == "Espanhol" {
            print(description.description)
        }
        
        
        championshipDetail.text = "Campeonato \(description.description)"
    }
}
