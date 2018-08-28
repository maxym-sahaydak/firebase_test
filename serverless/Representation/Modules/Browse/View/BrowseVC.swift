//
//  BrowseBrowseVC.swift
//  serverless
//
//  Created by Maxym Sahaydak on 22/08/2018.
//  Copyright 2018 TechMagic. All rights reserved.
//

import UIKit

class BrowseVC : BaseVC {

    //MARK: - Outlet

    @IBOutlet weak var collectionView: UICollectionView!

    var photos = Photo.allPhotos()

	override func viewDidLoad() {
        super.viewDidLoad()

        setupCollectionView()

        router = BrowseRouter(withVC: self)
        viewModel = BrowseVM(withDelegate: self)
    }

    //MARK: - Actions

    @IBAction func addBtnPressed(_ sender: UIButton) {
        contentPicker.show(withOptions: [.camera(.photo), .library(.photo)], in: self, sourceView: sender) { [weak self] (content) in
            guard let `self` = self else { return }
            self.viewModel?.handleFileUpload(content: content)
        }
    }


    //MARK: - Private

    private func setupCollectionView() {
        collectionView?.backgroundColor = UIColor.clear
        collectionView?.contentInset = UIEdgeInsets(top: 23, left: 10, bottom: 10, right: 10)
        // Set the PinterestLayout delegate
        if let layout = collectionView?.collectionViewLayout as? PinterestLayout {
            layout.delegate = self
        }
    }
    
    private var router: BrowseRouterProtocol?
    private var viewModel: BrowseVMProtocol?

    private lazy var contentPicker: ContentPicker = {
        var contentPicker = ContentPicker()
        contentPicker.delegate = self
        return contentPicker
    }()
}

extension BrowseVC: BrowseVMDelegate {

    func itemsDidUpdate(items: [CMLImage]) {
        print(items)
        print("count of items \(items.count)")
        collectionView.collectionViewLayout.invalidateLayout()
        collectionView.reloadData()
    }

}

extension BrowseVC: ContentPickerDelegate {

    func noAccess() {

    }

}

extension BrowseVC: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AnnotatedPhotoCell", for: indexPath)
        if let annotateCell = cell as? AnnotatedPhotoCell {
            annotateCell.image = viewModel?.items?[indexPath.row]
        }
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.items?.count ?? 0
    }
}

extension BrowseVC : PinterestLayoutDelegate {

    // 1. Returns the photo height
    func collectionView(_ collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath:IndexPath) -> CGFloat {
        guard let cmlImage = viewModel?.items?[indexPath.row] else { return 0 }
        return  CGFloat(165/(cmlImage.width?.floatValue ?? 0.00001) * (cmlImage.height?.floatValue ?? 0.00001))
    }
}
