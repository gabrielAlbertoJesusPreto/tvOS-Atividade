//
//  DetailViewController.swift
//  tvOS-Atividade
//
//  Created by Liliane Bezerra Lima on 04/05/16.
//  Copyright © 2016 Gabriel Alberto. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    var team:Team!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self

        imageView.image = UIImage(named: team.imageName!)
        //imageView.canBecomeFocused()
        
        // Do any additional setup after loading the view.
    }
    
    override var preferredFocusedView: UIView? {
        return imageView
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

extension DetailViewController: UITableViewDataSource {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCellWithIdentifier("HeaderIndentifier", forIndexPath: indexPath) as! HeaderTableViewCell
            return cell
        }
        
        let cell = tableView.dequeueReusableCellWithIdentifier("TimeIdentifier", forIndexPath: indexPath) as! TimeTableViewCell
        
        
        cell.posicaoLabel!.text = String(team!.position!)
        cell.timeLabel.text = team!.name!
        cell.jogosLabel.text = String(team!.match!)
        cell.vitoriasLabel.text = String(team!.winner!)
        cell.derrotasLabel.text = String(team!.loser!)
        cell.empatesLabel.text = String(team!.draw!)
        cell.pontosLabel.text = String(team!.points!)
        
        return cell
    }
    
}

// MARK: - Table view delegate
extension DetailViewController: UITableViewDelegate {
    //    func tableView(tableView: UITableView, didUpdateFocusInContext context: UITableViewFocusUpdateContext, withAnimationCoordinator coordinator: UIFocusAnimationCoordinator) {
    //        guard let indexPath = context.nextFocusedIndexPath else { return }
    //    }
    
    //    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    //        if let detailNav = splitViewController?.viewControllers.last as? UINavigationController {
    //            detailNav.popToRootViewControllerAnimated(true)
    //        }
    //        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    //    }
    
    func tableView(tableView: UITableView, canFocusRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        
        if indexPath.row == 0 {
            return false
        }
        
        return true
        
    }
    
    
    
}
