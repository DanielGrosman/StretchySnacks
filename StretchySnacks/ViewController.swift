//
//  ViewController.swift
//  StretchySnacks
//
//  Created by Daniel Grosman on 2017-12-07.
//  Copyright © 2017 Daniel Grosman. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var navHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var navView: UIView!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    var stackView = UIStackView ()
    var snacksArray = [String] ()
    var snacksLabel : UILabel = UILabel()
    var labelYConstraint : NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLabel()
        setupStackView()
        stackView.isHidden = true;
    }
    
    func setupLabel () {
        snacksLabel.text = "SNACKS"
        snacksLabel.textAlignment = .center
        snacksLabel.translatesAutoresizingMaskIntoConstraints = false;
        navView.addSubview(snacksLabel)
        snacksLabel.centerXAnchor.constraint(equalTo: navView.centerXAnchor).isActive = true
        labelYConstraint = snacksLabel.centerYAnchor.constraint(equalTo: navView.centerYAnchor)
        labelYConstraint.isActive = true
    }
    
    func setupStackView () {
        let oreosImage  = UIImageView ()
        oreosImage.heightAnchor.constraint(equalToConstant: 100).isActive = true
        oreosImage.widthAnchor.constraint(equalToConstant: 50).isActive = true
        oreosImage.image = UIImage.init(named:"oreos")
        oreosImage.isUserInteractionEnabled = true
        let oreoGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(snackTapped))
        oreoGestureRecognizer.name = "oreo"
        oreosImage.addGestureRecognizer(oreoGestureRecognizer)
        
        let pizzaPocketImage  = UIImageView ()
        pizzaPocketImage.heightAnchor.constraint(equalToConstant: 100).isActive = true
        pizzaPocketImage.widthAnchor.constraint(equalToConstant: 50).isActive = true
        pizzaPocketImage.image = UIImage.init(named:"pizza_pockets")
        pizzaPocketImage.isUserInteractionEnabled = true
        let pizzaPocketGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(snackTapped))
        pizzaPocketGestureRecognizer.name = "pizza"
        pizzaPocketImage.addGestureRecognizer(pizzaPocketGestureRecognizer)
        
        let popTartsImage = UIImageView ()
        popTartsImage.heightAnchor.constraint(equalToConstant: 100).isActive = true
        popTartsImage.widthAnchor.constraint(equalToConstant: 50).isActive = true
        popTartsImage.image = UIImage.init(named:"pop_tarts")
        popTartsImage.isUserInteractionEnabled = true
        let popTGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(snackTapped))
        popTGestureRecognizer.name = "popT"
        popTartsImage.addGestureRecognizer(popTGestureRecognizer)
        
        let popsicleImage = UIImageView ()
        popsicleImage.heightAnchor.constraint(equalToConstant: 100).isActive = true
        popsicleImage.widthAnchor.constraint(equalToConstant: 50).isActive = true
        popsicleImage.image = UIImage.init(named:"popsicle")
        popsicleImage.isUserInteractionEnabled = true
        let popsicleGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(snackTapped))
        popsicleGestureRecognizer.name = "popsicle"
        popsicleImage.addGestureRecognizer(popsicleGestureRecognizer)
        
        let ramenImage = UIImageView ()
        ramenImage.heightAnchor.constraint(equalToConstant: 100).isActive = true
        ramenImage.widthAnchor.constraint(equalToConstant: 50).isActive = true
        ramenImage.image = UIImage.init(named:"ramen")
        ramenImage.isUserInteractionEnabled = true
        let ramenGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(snackTapped))
        ramenGestureRecognizer.name = "ramen"
        ramenImage.addGestureRecognizer(ramenGestureRecognizer)
        
        stackView.axis = .horizontal
        stackView.distribution = UIStackViewDistribution.equalSpacing
        stackView.alignment = UIStackViewAlignment.center
        stackView.translatesAutoresizingMaskIntoConstraints = false;
        stackView.spacing = 10
        
        stackView.addArrangedSubview(oreosImage)
        stackView.addArrangedSubview(pizzaPocketImage)
        stackView.addArrangedSubview(popTartsImage)
        stackView.addArrangedSubview(popsicleImage)
        stackView.addArrangedSubview(ramenImage)
        navView.addSubview(stackView)
        
        stackView.trailingAnchor.constraint(equalTo: navView.trailingAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: navView.leadingAnchor).isActive = true
        stackView.centerXAnchor.constraint(equalTo: navView.centerXAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo:navView.bottomAnchor).isActive = true
    }
    
    
    @objc func snackTapped (sender: UITapGestureRecognizer) {
        switch (sender.name) {
        case "oreo"?:
            snacksArray.insert("Oreo", at: 0)
        case "pizza"?:
            snacksArray.insert("Pizza Pocket", at: 0)
        case "popT"?:
            snacksArray.insert("Pop Tart", at: 0)
        case "popsicle"?:
            snacksArray.insert("Popsicle", at: 0)
        case "ramen"?:
            snacksArray.insert("Ramen", at: 0)
        default:
            print ("error")
        }
        tableView.reloadData()
    }
    
    
    func addSignAnimation () {
        if self.navHeightConstraint.constant == 66 {
            UIView.animate(withDuration:0.5,
                           delay: 0.0,
                           usingSpringWithDamping: 0.3,
                           initialSpringVelocity: 0.5,
                           animations: {
                            let angle =  CGFloat(Double.pi/4)
                            let tr = CGAffineTransform.identity.rotated(by: angle)
                            self.addButton.transform = tr})
        } else if self.navHeightConstraint.constant == 200 {
            UIView.animate(withDuration:0.5,
                           delay: 0.0,
                           usingSpringWithDamping: 0.3,
                           initialSpringVelocity: 0.5,
                           animations: {
                            let angle =  -CGFloat(Double.pi*2)
                            let tr = CGAffineTransform.identity.rotated(by: angle)
                            self.addButton.transform = tr})
        }
    }
    
    func navViewAnimation () {
        if self.navHeightConstraint.constant == 66 {
            self.navHeightConstraint.constant = 200
            UIView.animate(withDuration: 1.0,
                           delay: 0.0,
                           usingSpringWithDamping: 0.3,
                           initialSpringVelocity: 0.5,
                           options: .curveEaseIn,
                           animations: {
                            self.view.layoutIfNeeded()
            }, completion: {
                (value: Bool) in
            })
        }
        else {
            self.navHeightConstraint.constant = 66
            UIView.animate(withDuration: 1.0,
                           delay: 0.0,
                           usingSpringWithDamping: 0.3,
                           initialSpringVelocity: 0.5,
                           options: .curveEaseIn,
                           animations: {
                            self.view.layoutIfNeeded()
            }, completion: {
                (value: Bool) in
            })
        }
    }
    
    @IBAction func addButtonPressed(_ sender: UIButton) {
        addSignAnimation()
        navViewAnimation()
        if self.navHeightConstraint.constant == 200 {
            stackView.isHidden = false
            labelYConstraint.constant = -50.0
        } else if self.navHeightConstraint.constant == 66 {
            stackView.isHidden = true
            labelYConstraint.constant = 0
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return snacksArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let snack  = snacksArray[indexPath.row]
        cell.textLabel?.text = snack
        return cell
    }
    
}
