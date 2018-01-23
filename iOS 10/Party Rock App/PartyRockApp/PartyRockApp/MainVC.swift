//
//  ViewController.swift
//  PartyRockApp
//
//  Created by Emad on 8/21/17.
//  Copyright © 2017 askerlap. All rights reserved.
//

import UIKit

class MainVC: UIViewController ,UITableViewDelegate , UITableViewDataSource{
    
    @IBOutlet weak var tableView: UITableView!
    
    var partyRocks = [PartRock] ()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let p1 = PartRock.init(imageURL: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS5BImNN0tW_CYPXy7coQ0dmx1d4y4G4MTI1wAwg7OcshHZvpKZ-A", vidoURL: "<iframe width=\"375\" height=\"277\" src=\"https://www.youtube.com/embed/xGiBiHocSZM?ecver=1\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Hello world")
        let p2 = PartRock.init(imageURL: "http://static3.businessinsider.com/image/58dbde7c77bb7050008b4ae9-1190-625/nasas-1-billion-jupiter-probe-just-sent-back-breathtaking-new-images-of-the-gas-giant.jpg", vidoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/xGiBiHocSZM?ecver=1\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "hello Table View")
        
        tableView.delegate = self
        tableView.dataSource = self
        
        partyRocks.append(p1)
        partyRocks.append(p2)
       
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PartyCell", for: indexPath) as? PartyCell {
            
            let partyRock = partyRocks[indexPath.row]
            
            cell.updateUI(partyRock: partyRock)
            
            return cell
        } else {
            
            return UITableViewCell()
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return partyRocks.count
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let partyRock = partyRocks[indexPath.row]
        
        performSegue(withIdentifier: "VideoSegue", sender: partyRock)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destination = segue.destination as? VideoVC {
            
            if let party = sender as? PartRock {
                destination.partyRock = party
            }
        }
    }

}

