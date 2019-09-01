////
////  PeopleViewController.swift
////  WheelsUpiOSTest
////
////  Created by Gio Lomsa on 8/31/19.
////  Copyright © 2019 Giorgi Lomsadze. All rights reserved.
////
//
//import UIKit
//
//class PeopleViewController: UIViewController {
//
//    var selectedUrl: String?
//    var viewModel = DetailItemsViewModel()
//    
//    //MARK:- IBOutlets
//    @IBOutlet weak var initialsBackgroundView: UIView!
//    @IBOutlet weak var initialsLabel: UILabel!
//    @IBOutlet weak var bYearLabel: UILabel!
//    @IBOutlet weak var eyeColorLabel: UILabel!
//    @IBOutlet weak var filmsLabel: UILabel!
//    @IBOutlet weak var genderLabel: UILabel!
//    @IBOutlet weak var hairColorLabel: UILabel!
//    @IBOutlet weak var homeWorldLabel: UILabel!
//    @IBOutlet weak var massLabel: UILabel!
//    @IBOutlet weak var heightLabel: UILabel!
//    @IBOutlet weak var createdAtLabel: UILabel!
//    @IBOutlet weak var skinColorLabel: UILabel!
//    @IBOutlet weak var editedAtLabel: UILabel!
//    @IBOutlet weak var speciesLabel: UILabel!
//    @IBOutlet weak var starshipsLabel: UILabel!
//    @IBOutlet weak var vehiclesLabel: UILabel!
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        manageObservers()
//        customizeUI()
//        print(selectedUrl ?? "no url")
//        // Do any additional setup after loading the view.
//        if let url = selectedUrl{
//            DispatchQueue.global(qos: .background).async {
//                self.viewModel.loadCategoryItems(url: url, category: .people )
//            }
//        }
//    }
//    
//
//    private func manageObservers(){
//        NotificationCenter.default.addObserver(self, selector: #selector(updateUIFromViewModel), name: DetailItemsViewModel.itemWasSetNotification, object: nil)
//    }
//    
//    private func customizeUI(){
//        initialsBackgroundView.layer.cornerRadius = initialsBackgroundView.frame.width/2
//    }
//    
//    @objc private func updateUIFromViewModel(){
//        if let person = self.viewModel.item as? Person{
//            print(person.name)
//            
//            DispatchQueue.main.async {
//                self.initialsLabel.text = person.name.firstAndSecondWordFirstLetters
//                self.navigationItem.title = person.name.capitalized
//                self.bYearLabel.text = person.birth_year.capitalized
//                self.eyeColorLabel.text = person.eye_color.capitalized
//                self.filmsLabel.text = "person.films.count".capitalized
//                self.genderLabel.text = person.gender.capitalized
//                self.hairColorLabel.text = person.hair_color.capitalized
//                self.homeWorldLabel.text = person.homeworld.capitalized
//                self.massLabel.text = person.mass.capitalized
//                self.heightLabel.text = person.height.capitalized
//                self.createdAtLabel.text = person.created.capitalized
//                self.skinColorLabel.text = person.skin_color.capitalized
//                self.editedAtLabel.text = person.edited.capitalized
//                self.speciesLabel.text = "person.species".capitalized
//                self.starshipsLabel.text = "person.starships".capitalized
//                self.vehiclesLabel.text = "person.vehicles".capitalized
//            }
//        }
//    }
//}
