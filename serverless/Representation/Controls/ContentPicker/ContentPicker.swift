//
//  ContentPicker.swift
//  SocioLocal
//
//  Created by Alex Kunitsa on 11/17/17.
//  Copyright © 2017 TechMagic. All rights reserved.
//

import UIKit
import Photos
import AVFoundation
import MobileCoreServices

typealias ContentPickerCompletion = ((ContentPickerData) -> ())

enum VideoOrientation: String {

    case portrait = "portrait"
    case landscape = "landscape"
}

protocol ContentPickerDelegate: class {
    
    func noAccess()
}

class ContentPicker: NSObject {

    var completion: ContentPickerCompletion?
    var controller: UIViewController?
    let picker = UIImagePickerController()
    var alert: UIAlertController?
    
    weak var delegate: ContentPickerDelegate?

    func show(withOptions options: [ContentPickerSource], in controller: UIViewController, sourceView: UIView, completion: @escaping ContentPickerCompletion) {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        self.alert = alert
        
        self.completion = completion
        self.controller = controller

        options.forEach { (option) in
            alert.addAction(pickerAction(option: option))
        }
        
        alert.addAction(cancelAction())
//        alert.view.tintColor = Constants.Color.orange
//        alert.configForPopoverWithSourceView(sourceView)

        DispatchQueue.main.async {
            controller.present(alert, animated: true, completion: nil)
        }
    }
    
    // MARK - Private
    
    private func checkCameraPersmisions(_ completion: @escaping (Bool) -> ()) {
        let cameraMediaType = AVMediaType.video
        let cameraAuthorizationStatus = AVCaptureDevice.authorizationStatus(for: cameraMediaType)
        
        switch cameraAuthorizationStatus {
        case .denied, .restricted:
            completion(false)
        case .authorized:
            checkMicPermission(completion: { (success) in
                completion(success)
            })

        case .notDetermined:
            AVCaptureDevice.requestAccess(for: cameraMediaType) { granted in
                if granted {
                    self.checkMicPermission(completion: { (success) in
                        completion(success)
                    })
                } else {
                    completion(false)
                }
            }
        }
    }

    private func checkMicPermission(completion: @escaping ((_ success: Bool) -> Void)) {
        switch AVAudioSession.sharedInstance().recordPermission {
        case AVAudioSession.RecordPermission.granted:
            completion(true)
        case AVAudioSession.RecordPermission.denied:
            completion(false)
        case AVAudioSession.RecordPermission.undetermined:
            AVAudioSession.sharedInstance().requestRecordPermission({ (success) in
                completion(success)
            })
        }
    }

    private func checkLibraryPersmisions(_ completion: @escaping (Bool) -> ()) {
        let status = PHPhotoLibrary.authorizationStatus()
        switch status {
        case .authorized:
            completion(true)
        case .denied:
            completion(false)
        case .notDetermined:
            PHPhotoLibrary.requestAuthorization({ (newStatus) in
                completion(newStatus == .authorized)
            })
        case .restricted:
            completion(false)
        }
    }
    
    private func pickerAction(option: ContentPickerSource) -> UIAlertAction {
        return UIAlertAction(title: option.title(), style: .default, handler: { [weak self] action in
            guard let strongSelf = self else { return }
            
            switch option {
            case .camera:
                strongSelf.checkCameraPersmisions({ success in
                    strongSelf.handlePermissionsReceived(success, option: option)
                })
            case .library:
                strongSelf.checkLibraryPersmisions({ success in
                    strongSelf.handlePermissionsReceived(success, option: option)
                })
            }
        })
    }
    
    private func handlePermissionsReceived(_ success: Bool, option: ContentPickerSource) {
        if !success {
            delegate?.noAccess()
            return
        }
        
        if !UIImagePickerController.isSourceTypeAvailable(option.sourceType()) {
            return
        }
        
        let picker = UIImagePickerController()
        picker.sourceType = option.sourceType()
        picker.delegate = self
        picker.mediaTypes = option.mediaTypes()
        
        DispatchQueue.main.async {
            self.controller?.present(picker, animated: true, completion: nil)
        }
    }
    
    private func cancelAction() -> UIAlertAction {
        return UIAlertAction(title: "Canceled", style: .cancel, handler: { action in })
    }
}

// MARK: - UIImagePickerControllerDelegate, UINavigationControllerDelegate

extension ContentPicker: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let mediaType = info[UIImagePickerController.InfoKey.mediaType] as? String {
            if mediaType == (kUTTypeImage as String) {
                handleImageReceived(info)
            }
            else if mediaType == (kUTTypeMovie as String) {
                handleVideoReceived(info)
            }
        }

        picker.dismiss(animated: true) { }
    }

//    private func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
//
//    }

    private func handleImageReceived(_ info: [UIImagePickerController.InfoKey : Any]) {
        if let imageURL = info[UIImagePickerController.InfoKey.mediaURL] as? URL {
            let result = PHAsset.fetchAssets(withALAssetURLs: [imageURL], options: nil)
            guard let asset = result.firstObject else { return }
            
            let options = PHImageRequestOptions()
            options.isSynchronous = true
            
            PHCachingImageManager().requestImage(for: asset,targetSize: UIScreen.main.bounds.size, contentMode: .aspectFit, options: options, resultHandler: { [weak self] (image, info) in
                self?.handleImage(image)
            })
            
        } else if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            handleImage(image)
        }
    }
    
    private func handleVideoReceived(_ info: [UIImagePickerController.InfoKey : Any]) {
        guard let url = info[UIImagePickerController.InfoKey.mediaURL] as? URL  else { return }
        
        let asset = AVAsset(url: url)
//        let assetURL = AVURLAsset(url: url)

        let generator = AVAssetImageGenerator(asset: asset)
        generator.appliesPreferredTrackTransform = true

        let time = CMTime.init(seconds: 1.0, preferredTimescale: 1)
        var actualTime = CMTimeMake(value: 0, timescale: 0)

        var thumbnail: UIImage?
        if let img = try? generator.copyCGImage(at: time, actualTime: &actualTime) {
            thumbnail = UIImage(cgImage: img)
            
           
        }

        if picker.sourceType == .camera {
            if UIVideoAtPathIsCompatibleWithSavedPhotosAlbum(url.path) {
                UISaveVideoAtPathToSavedPhotosAlbum(url.path, nil, nil, nil)
            }
        }
        
        let width: CGFloat = thumbnail?.size.width ?? 0
        let height: CGFloat = thumbnail?.size.height ?? 0
        
        let content = ContentPickerVideo()
        content.videoUrl = url
        content.duration = CMTimeGetSeconds(asset.duration)
        content.thumbnail = thumbnail
        content.orientation = width.isLess(than: height) ? VideoOrientation.portrait : VideoOrientation.landscape
        
        completion?(content)
    }
    
    private func handleImage(_ image: UIImage?) {
        guard let image = image else { return }
        
//        if !image.isSizeReadyForUpload() {
//            if let resizedImage = image.resizedImage() {
//                completion?(ContentPickerImage(image: resizedImage))
//                return
//            }
//        }

        completion?(ContentPickerImage(image: image))
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true) { }
    }
}
