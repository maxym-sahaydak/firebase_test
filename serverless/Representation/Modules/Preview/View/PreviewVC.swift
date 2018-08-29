//
//  PreviewPreviewVC.swift
//  serverless
//
//  Created by Maxym Sahaydak on 29/08/2018.
//  Copyright 2018 TechMagic. All rights reserved.
//

import UIKit
import Kingfisher

class PreviewVC : BaseVC {

	override func viewDidLoad() {
        super.viewDidLoad()
        
        router = PreviewRouter(withVC: self)
        setupTableView()
        viewModel?.viewDidLoad()
    }

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!

    //MARK: - Actions

    @IBAction func closeBtnPressed(_ sender: Any) {
        router?.close()
    }

    //MARK: - Public

    func setCMLImage(_ image: CMLImage) {
        viewModel = PreviewVM(withDelegate: self, cmlImage: image)
    }

    // MARK: - Private

    private func setupTableView() {
        tableView.registerNibs(["ColorTVCell"])
    }
    
    private var router: PreviewRouterProtocol?
    private var viewModel: PreviewVMProtocol?
}

extension PreviewVC: PreviewVMDelegate {

    func updateUI() {
        guard let urlStr = viewModel?.cmlImage.url, let url = URL(string: urlStr) else { return }
        imageView.kf.setImage(with: url)
        tableView.reloadData()
    }

}

//MARK: - UITableViewDelegate/UITableViewDataSource

extension PreviewVC: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.colors?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ColorTVCell") as? ColorTVCell, let color = viewModel?.colors?[indexPath.row] else { return UITableViewCell() }
        cell.updateWithRBGColors(color)
        return cell
    }


}
