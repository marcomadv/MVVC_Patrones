//
//  SplashViewController.swift
//  MVVMPatrones
//
//  Created by Marco Muñoz on 4/10/23.
//

import UIKit



//MARK: - PROTOCOLS
protocol SplashViewProtocol: AnyObject {
    func showLoading(_ show: Bool)
    func navigateToHome()
}


//MARK: - CLASS
class SplashViewController: UIViewController {
    
    @IBOutlet weak var activitiIndicator: UIActivityIndicatorView!
    
    var viewModel: SplashViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.onViewsLoaded()
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        activitiIndicator.stopAnimating()
    }
}


//MARK: - EXTENSIONS

extension SplashViewController: SplashViewProtocol {
    
    //Método cargar activity indicator
    func showLoading(_ show: Bool) {
        switch show {
        case true where !activitiIndicator.isAnimating:
            activitiIndicator.startAnimating()
        case false where activitiIndicator.isAnimating:
            activitiIndicator.stopAnimating()
        default: break
        }
    }
    
    //Metodo para navegar a la home
    func navigateToHome() {
        let nextVC = HomeTableViewController()
        nextVC.viewModel = homeViewModel(viewDelegate: nextVC)
        
        navigationController?.setViewControllers([nextVC], animated: true)
    }
}
