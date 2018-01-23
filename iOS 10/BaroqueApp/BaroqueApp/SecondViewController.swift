//
//  SecondViewController.swift
//  BaroqueApp
//
//  Created by Emad on 6/20/17.
//  Copyright © 2017 askerlapAskerlap. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    var data: String = ""
    
    @IBOutlet weak var musicanName: UILabel!
    @IBOutlet weak var musicanCantry: UILabel!
    @IBOutlet weak var musicanYear: UILabel!
    @IBOutlet weak var musicanPic: UIImageView!
    @IBOutlet weak var bioTextView: UITextView!
    
    
    let musicianArray = ["Bach was born in Eisenach, in the duchy of Saxe-Eisenach, into a great musical family. His father Johann Ambrosius Bach was the director of the town musicians, and all of his uncles were professional musicians. His father probably taught him to play the violin and harpsichord, and his brother Johann Christoph Bach taught him the clavichord and exposed him to much contemporary music.Apparently at his own initiative, Bach attended St. Michael's School in Lüneburg for two years. After graduating he held several musical posts across Germany: he served as Kapellmeister (director of music) to Leopold, Prince of Anhalt-Köthen, and as Thomaskantor in Leipzig, a position of music director at the main Lutheran churches and educator at the Thomasschule. He received the title of Royal Court Composer from Augustus III in 1736.Bach's health and vision declined in 1749, and he died on 28 July 1750." ,
                         "Born the same year as Johann Sebastian Bach and Domenico Scarlatti, Handel is regarded as one of the greatest composers of the Baroque era, with works such as Water Music, Music for the Royal Fireworks and Messiah remaining steadfastly popular. One of his four Coronation Anthems, Zadok the Priest (1727), composed for the coronation of George II, has been performed at every subsequent British coronation, traditionally during the sovereign's anointing. Handel composed more than forty operas in over thirty years, and since the late 1960s, with the revival of baroque music and historically informed musical performance, interest in Handel's operas has grown." ,
                         "Antonio Lucio Vivaldi was born on 4 March 1678 in Venice,then the capital of the Republic of Venice. He was baptized immediately after his birth at his home by the midwife, which led to a belief that his life was somehow in danger. Though not known for certain, the child's immediate baptism was most likely due either to his poor health or to an earthquake that shook the city that day. In the trauma of the earthquake, Vivaldi's mother may have dedicated him to the priesthood.Vivaldi's official church baptism took place two months later."]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpBio()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func setUpBio() {
        
        if data == "Bach" {
            musicanPic.image = UIImage(named : "bach")
            let mMusician = Musician(name: "Bach", bio: musicianArray[0], country: "Germany", year: "1685-1750")
            musicanName.text = mMusician.getName()
            bioTextView.text = mMusician.getBio()
            musicanCantry.text = mMusician.getCountry()
            musicanYear.text = mMusician.getYear()
            
        } else if data == "Handel" {
            musicanPic.image = UIImage(named: "handel")
            let mMusician = Musician(name: "Handel", bio: musicianArray[1], country: "Germany", year: "1726-1728")
            musicanName.text = mMusician.getName()
            bioTextView.text = mMusician.getBio()
            musicanCantry.text = mMusician.getCountry()
            musicanYear.text = mMusician.getYear()
        } else {
            musicanPic.image = UIImage(named: "vivaldi")
            let mMusician = Musician(name: "Vivaldi", bio: musicianArray[2], country: "Italy", year: "1678-1741")
            musicanName.text = mMusician.getName()
            bioTextView.text = mMusician.getBio()
            musicanCantry.text = mMusician.getCountry()
            musicanYear.text = mMusician.getYear()
            
        }
    }
    
}
