//
//  TeamService.swift
//  tvOS-Atividade
//
//  Created by Humberto  Julião on 03/05/16.
//  Copyright © 2016 Gabriel Alberto. All rights reserved.
//

import Foundation
import UIKit

// !! Testando, Não Chamar ainda !!

/*
 Classe - TeamService
 Objetivo - buscar dados na PList de campeonatos
 
 EX:
 
 
 let buscaService = TeamService.sharedInstance
 
 let resultadoBusca = buscaService.getInfosByChampionship("Frances")
 
 print("Inicio\n\n")
 print(resultadoBusca)
 print("\n\nFim")
 
 */

class TeamService{
    static let sharedInstance = TeamService()
    var myDict: NSDictionary?
    
    init() {}
    
    //  Função que retorna um Array com as informações sobre o campeonato passado como parametro.
    //  Retorno vazio em caso de não-existência
    func getInfosByChampionship(champ: String) -> NSArray {
        var resp : NSArray = []
        if let path = NSBundle.mainBundle().pathForResource("team", ofType: "plist") {
            myDict = NSDictionary(contentsOfFile: path)
        }
        if let dict = myDict {
            
            let championship = dict.allKeys as! [String]
            guard let indexChamp = championship.indexOf(champ) else{
                return []
            }
            resp = dict.valueForKey(championship[indexChamp]) as! NSArray
            return resp
            
        }
        return resp
    }
}