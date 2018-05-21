//
//  DetailViewController.swift
//  Lenring
//
//  Created by Huy on 5/10/18.
//  Copyright © 2018 Huy. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController , UIImagePickerControllerDelegate ,UINavigationControllerDelegate {
    
    @IBOutlet weak var txtTu: UITextField!
    @IBOutlet weak var txtPhienAm: UITextField!
    @IBOutlet weak var txtNghia: UITextField!
    @IBOutlet weak var txtVidu: UITextField!
    @IBOutlet weak var txtNghiaVidu: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var button: UIButton!
    var arrDetail: [Entity] = []
    var index: IndexPath?
    var kt: Bool?
    override func viewDidLoad() {
        super.viewDidLoad()
        if (Dataservice.shared.isAvtive == true){
            setData()
            button.setTitle("Edit", for: .normal)
            title = "Edit Data"
        }
        else{
            button.setTitle("Save", for: .normal)
            title = "Add Data"
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        imageView.image = selectedImage
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func tapImage(_ sender: UITapGestureRecognizer) {
        
        // UIImagePickerController is a view controller that lets a user pick media from their photo library.
        let imagePickerController = UIImagePickerController()
        
        // Only allow photos to be picked, not taken.
        imagePickerController.sourceType = .photoLibrary
        
        // Make sure ViewController is notified when the user picks an image.
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
    @IBAction func btnSave(_ sender: UIButton) {
        kiemTra()
        if(Dataservice.shared.isAvtive == true){
            let data = Dataservice.shared.fetchedResultsController.object(at: index!)
            if (kt! == true){
                if let tu = txtTu.text ,
                    let phienam = txtPhienAm.text ,
                    let nghia = txtNghia.text ,
                    let vidu = txtVidu.text,
                    let nghiavidu = txtNghiaVidu.text,
                    let image = imageView.image{
                    
                    data.tu = tu
                    data.phienAm = phienam
                    data.nghia = nghia
                    data.vidu = vidu
                    data.nghiaViDu = nghiavidu
                    data.image = image
                    
                    
                    let alert = UIAlertController(title: "Thong Bao", message: "Edit Done", preferredStyle: UIAlertControllerStyle.alert)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
                
            }
                else {
                    let alert = UIAlertController(title: "Thong Bao", message: "Nhap du du lieu", preferredStyle: UIAlertControllerStyle.alert)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                
            }
            AppDelegate.saveContext()
            
        }
        else {
            if (kt! == true) {
                if let tu = txtTu.text ,
                    let phienam = txtPhienAm.text ,
                    let nghia = txtNghia.text ,
                    let vidu = txtVidu.text,
                    let nghiavidu = txtNghiaVidu.text,
                    let image = imageView.image{
                    
                    let enTiTy = Entity(context: AppDelegate.context())
                    enTiTy.tu = tu
                    enTiTy.phienAm = phienam
                    enTiTy.nghia = nghia
                    enTiTy.vidu = vidu
                    enTiTy.nghiaViDu = nghiavidu
                    enTiTy.image = image
                   
                    let alert = UIAlertController(title: "Thong Bao", message: "Da Luu", preferredStyle: UIAlertControllerStyle.alert)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                    
                }
               
            }
            else {
                let alert = UIAlertController(title: "Thong Bao", message: "Nhap du du lieu", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
              AppDelegate.saveContext()
        }
        
    }
    
    func setData(){
        if let tu = arrDetail.first?.tu ,
            let phienam = arrDetail.first?.phienAm ,
            let nghia = arrDetail.first?.nghia ,
            let vidu = arrDetail.first?.vidu,
            let nghiavidu = arrDetail.first?.nghiaViDu,
            let image = arrDetail.first?.image{
            
            txtTu.text = tu
            txtPhienAm.text = phienam
            txtNghia.text = nghia
            txtVidu.text = vidu
            txtNghiaVidu.text = nghiavidu
            imageView.image  = image as? UIImage
            
        }
        
    }
    
    func kiemTra(){
        if txtTu.text == "" || txtPhienAm.text == "" || txtNghia.text == "" || txtVidu.text == "" || txtNghiaVidu.text == "" || imageView.image == #imageLiteral(resourceName: "icon-plus"){
            kt = false
        }
        else {
            kt = true
        }
    }
    
}

