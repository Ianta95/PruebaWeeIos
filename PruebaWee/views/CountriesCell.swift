//
//  CountriesCell.swift
//  PruebaWee
//
//  Created by Ian De Jesus on 15/02/21.
//

import UIKit

class CountriesCell: UITableViewCell {
    
    // MARK: Componentes
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    
    public var active = false
    
    // MARK: Propiedades
    public var viewModel: PaisesViewModel? {
        didSet {
            configure()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    // MARK: Helper Functions
    private func configure(){
        label.text = viewModel!.pais
    }
    
}
