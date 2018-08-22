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

    // MARK: - Private

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
}

extension BrowseVC: BrowseVMDelegate {
	
}

extension BrowseVC: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AnnotatedPhotoCell", for: indexPath)
        if let annotateCell = cell as? AnnotatedPhotoCell {
            annotateCell.photo = photos[indexPath.item]
        }
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }

}

extension BrowseVC : PinterestLayoutDelegate {

    // 1. Returns the photo height
    func collectionView(_ collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath:IndexPath) -> CGFloat {
        return photos[indexPath.item].image.size.height
    }

}
