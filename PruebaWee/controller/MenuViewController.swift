//
//  MenuViewController.swift
//  PruebaWee
//
//  Created by Ian De Jesus on 15/02/21.
//

import UIKit

private let reusideIdentifier = "cellCountry"

class MenuViewController: UIViewController {
    // MARK: Properties
    private var viewModels = [PaisesViewModel]() {
        didSet {
            configureTableView()
        }
    }
    // MARK: Components
    @IBOutlet weak var countryTableView: UITableView!
    
    
    // MARK: App Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        
    }
    // MARK: Prepare App
    func fetchData(){
        Service.fetchFromAPI { lista in
            var viewModels = [PaisesViewModel]()
            for item in lista {
                let viewModel = PaisesViewModel(dict: item)
                viewModels.append(viewModel)
            }
            self.viewModels = viewModels
        }
    }
    func configureUI(){
        view.backgroundColor = .white
        countryTableView.delegate = self
        countryTableView.dataSource = self
        countryTableView.fillSuperview()
    }

    // MARK: Help Functions
    private func configureTableView(){
        configureUI()
    }

}

extension MenuViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reusideIdentifier, for: indexPath) as! CountriesCell
        cell.contentView.isUserInteractionEnabled = false
        print("row es \(indexPath.row), item es \(indexPath.item) y section es \(indexPath.item)")
        let info = self.viewModels[indexPath.row]
        print("viewModel es \(info.pais)")
        cell.viewModel = info
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alert = UIAlertController(title: "Alert", message: "Message", preferredStyle: .alert)
        let image = #imageLiteral(resourceName: "octocat").withRenderingMode(.alwaysOriginal)
        let action = UIAlertAction(title: "OK", style: .default, handler: { action in
                                    switch action.style{
                                    case .default:
                                          print("default")

                                    case .cancel:
                                          print("cancel")

                                    case .destructive:
                                          print("destructive")


                                    }})
        action.setValue(image, forKeyPath: "image")
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    
}
