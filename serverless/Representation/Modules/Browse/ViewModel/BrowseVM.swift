//
//  BrowseBrowseVM.swift
//  serverless
//
//  Created by Maxym Sahaydak on 22/08/2018.
//  Copyright © 2018 TechMagic. All rights reserved.
//

import FirebaseStorage
import FirebaseDatabase

protocol BrowseVMProtocol {
    func handleFileUpload(content: ContentPickerData?)
    var items: [CMLImage]? { get }
}

protocol BrowseVMDelegate: class, BaseVCSpinnerProtocol, BaseVCMessagesProtocol {
    func itemsDidUpdate(items: [CMLImage])
}

class BrowseVM: BrowseVMProtocol {

	weak var delegate: BrowseVMDelegate?

	init(withDelegate delegate: BrowseVMDelegate) {
        self.delegate = delegate
        subscribeToItemsUpdate()
    }

    //MARK: - BrowseVMProtocol

    func handleFileUpload(content: ContentPickerData?) {

        guard let contentPickerImage = content as? ContentPickerImage, let image = contentPickerImage.image/*, let jpegRepresentation = fullSizeImage.image?.pngData()*/ else { return }
        uploadImage(image: image) { [weak self] (imageUrl, thumbUrl) in
            self?.createItem(with: imageUrl, thumbUrl: thumbUrl, imageSize: image.size)
        }

//        let fileName = UUID().uuidString
//        let storageRef = Storage.storage().reference().child("storage/\(fileName)/\(fileName).png")
//        let metadata = StorageMetadata()
//        metadata.contentType = "image/jpeg";
//
//        storageRef.putData(jpegRepresentation, metadata: metadata) { [weak self] (metadata, error) in
//            self?.delegate?.spinnerControl?.hide()
//            if error == nil {
//                self?.delegate?.infoMessage("Info", message: "Uploaded successfully")
//                storageRef.downloadURL(completion: { [weak self] (url, error) in
////                    self?.createItem(with: url?.absoluteString, image: fullSizeImage.image)
//                })
//            } else {
//                self?.delegate?.errorMessage(error?.localizedDescription)
//            }
//        }
    }


    func uploadImage(image: UIImage, completion: @escaping (String?, String?) -> Void) {
        guard let fullSizeImageData = image.jpegData(compressionQuality: 0.7),
            let thumImageData = image.resize(scale: 0.2)?.jpegData(compressionQuality: 1) else { return }
        let fileName = UUID().uuidString
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpeg";
        let storageRef = Storage.storage().reference().child("storage")

        let imageStorageRef = storageRef.child("\(fileName)/\(fileName).jpg")
        let thumbStorageRef = storageRef.child("\(fileName)/thumb_\(fileName).jpg")

        var imageUrl: String?
        var thumbUrl: String?

        let group = DispatchGroup()

        group.enter()
        imageStorageRef.putData(fullSizeImageData, metadata: metadata) { (metadata, error) in
            imageStorageRef.downloadURL(completion: { (url, error) in
                imageUrl = url?.absoluteString
                group.leave()
            })
        }

        group.enter()
        thumbStorageRef.putData(thumImageData, metadata: metadata) { (metadata, error) in
            thumbStorageRef.downloadURL(completion: { (url, error) in
                thumbUrl = url?.absoluteString
                group.leave()
            })
        }

        group.notify(queue: .main) {
            completion(imageUrl, thumbUrl)
        }

    }


    //MARK: - Private

    private func subscribeToItemsUpdate() {
        Database.database().reference().child("items")
        .observe(.value) { (snapshot) in
            print("childrenCount: \(snapshot.childrenCount)")

            guard let items = snapshot.value as? NSDictionary else { return }

            let cmlImages = items.allValues.compactMap({ (dictionary) -> CMLImage? in
                guard let dictionary = dictionary as? Dictionary<String, Any> else { return nil }
                let item = CMLImage(with: dictionary)
                return item
            })
                .sorted(by: {$0.timestamp?.floatValue ?? 0 < $1.timestamp?.floatValue ?? 0})

            print("images count: \(cmlImages.count)")

            DispatchQueue.main.async {
                self.items = cmlImages
                self.delegate?.itemsDidUpdate(items: cmlImages)
            }
            print(cmlImages)
        }
    }

    private func createItem(with imageUrl: String?, thumbUrl: String?, imageSize: CGSize) {
        delegate?.spinnerControl?.show()

        let itemRefId = UUID().uuidString
        let databaseRef = Database.database().reference().child("items/\(itemRefId)")
        let clImage = CMLImageForm()
        clImage.timestamp = NSNumber(value: Int(Date().timeIntervalSince1970 * 1000) )
        clImage.url = imageUrl
        clImage.thumbUrl = thumbUrl
        clImage.height = NSNumber(value: Float(imageSize.height))
        clImage.width = NSNumber(value: Float(imageSize.width))

//        databaseRef.updateChildValues(clImage.params()) { [weak self] (error, databaseRef) in
//            self?.delegate?.spinnerControl?.hide()
//        }
        databaseRef.setValue(clImage.params()) { [weak self] (error, reference) in
            self?.delegate?.spinnerControl?.hide()
        }
    }

    private(set) var items: [CMLImage]?
}
