//
//  ViewController.swift
//  UrunBilgileriCreate
//
//  Created by Dilara Elçioğlu on 29.12.2022.
//

import UIKit
import SnapKit

class ProductionVC: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
   
    


    lazy var scrollView = UIScrollView()
    lazy var arrayText1 = ["Kategori","Marka","Renk","Kargo Boyu"]
    lazy var arrayText2 = ["Ürünü kaça aldın","Ne kadara satıyorsun","Kazancın"]
    var photoImage = UIImageView()
    var dataArray: [UIImage] = [UIImage(named: "tap")!]
    var imagePick = UIImage()
    lazy var collectionView = UICollectionView()
    var selectRow = 0


    
    lazy var tableView1 = UITableView()
    lazy var tableView2 = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        view.backgroundColor = .white
    }
    
    func setupUI(){

        lazy var accountHeader = UILabel()
        accountHeader.font = UIFont.systemFont(ofSize: 24)
        accountHeader.text = "Ürün Bilgileri"
        accountHeader.textColor = .black
        view.addSubview(accountHeader)
        accountHeader.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(80)
            make.centerX.equalToSuperview()
        }
        
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(accountHeader.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(view.snp.bottom).offset(-100)
        }
        scrollView.contentSize = CGSize(width: view.frame.size.width, height: view.frame.size.height*1.4)
        scrollView.backgroundColor = .white
        
        
        lazy var fotograflarLabel = UILabel()
        fotograflarLabel.font = UIFont.systemFont(ofSize: 20)
        fotograflarLabel.text = "Fotoğraflar"
        fotograflarLabel.textColor = .black
        scrollView.addSubview(fotograflarLabel)
        fotograflarLabel.snp.makeConstraints { make in
            make.top.equalTo(scrollView.snp.top).offset(12)
            make.leading.equalToSuperview().offset(16)
            make.height.equalTo(30)
        }
        
        
        lazy var fotoAdetLabel = UILabel()
        fotoAdetLabel.font = UIFont.systemFont(ofSize: 20)
        fotoAdetLabel.text = "0/8"
        fotoAdetLabel.textColor = .gray
        scrollView.addSubview(fotoAdetLabel)
        fotoAdetLabel.snp.makeConstraints { make in
            make.leading.equalTo(fotograflarLabel.snp.trailing).offset(8)
            make.centerY.equalTo(fotograflarLabel)
            make.height.equalTo(fotograflarLabel)
        }
        
        
        lazy var duzenleButton = UIButton()
        duzenleButton.setTitle("Düzenle", for: .normal)
        duzenleButton.titleLabel?.font = .systemFont(ofSize: 20)
        duzenleButton.setTitleColor(.systemMint, for: .normal)
        scrollView.addSubview(duzenleButton)
        duzenleButton.snp.makeConstraints { make in
            make.centerY.equalTo(fotograflarLabel)
            make.trailing.equalTo(view.snp.trailing).offset(-16)
            make.width.equalTo(100)
            make.height.equalTo(30)
        }
        
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        layout.itemSize = CGSize(width: (view.frame.size.width/4), height: (view.frame.size.width/4))
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        scrollView.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.identifier)
        collectionView.snp.makeConstraints { make in
            make.width.equalTo(view).offset(-32)
            make.centerX.equalToSuperview()
            make.top.equalTo(fotograflarLabel.snp.bottom).offset(12)
            make.height.equalTo(120)
        }
        
        
        lazy var pleaseLabel = UILabel()
        pleaseLabel.backgroundColor = .white
        pleaseLabel.text = "Lütfen en az bir fotoğraf ekleyin"
        pleaseLabel.font = UIFont.systemFont(ofSize: 14)
        pleaseLabel.textColor = .gray
        scrollView.addSubview(pleaseLabel)
        pleaseLabel.snp.makeConstraints { make in
            make.top.equalTo(collectionView.snp.bottom).offset(12)
            make.leading.equalTo(fotograflarLabel)
            make.width.equalTo(scrollView)
            make.height.equalTo(20)
        }
      
        lazy var productHeaderLabel = UILabel()
        productHeaderLabel.font = UIFont.systemFont(ofSize: 20)
        productHeaderLabel.text = "Ürün Başlığı"
        productHeaderLabel.textColor = .black
        scrollView.addSubview(productHeaderLabel)
        productHeaderLabel.snp.makeConstraints { make in
            make.top.equalTo(pleaseLabel.snp.bottom).offset(20)
            make.leading.equalTo(fotograflarLabel)
            make.height.equalTo(30)
        }
        
        
        lazy var productCharacterLabel = UILabel()
        productCharacterLabel.font = UIFont.systemFont(ofSize: 20)
        productCharacterLabel.text = "(5+ karakter)"
        productCharacterLabel.textColor = .gray
        scrollView.addSubview(productCharacterLabel)
        productCharacterLabel.snp.makeConstraints { make in
            make.leading.equalTo(productHeaderLabel.snp.trailing).offset(8)
            make.centerY.equalTo(productHeaderLabel)
            make.height.equalTo(productHeaderLabel)
        }
        
        lazy var productInfoLabel = UILabel()
        productInfoLabel.backgroundColor = .white
        productInfoLabel.text = "Ürünü başlığını ayrıntılı gir.Örn:Zara Mom Jean Pantolon "
        productInfoLabel.font = UIFont.systemFont(ofSize: 14)
        productInfoLabel.textColor = .gray
        scrollView.addSubview(productInfoLabel)
        productInfoLabel.snp.makeConstraints { make in
            make.top.equalTo(productHeaderLabel.snp.bottom).offset(12)
            make.leading.equalTo(fotograflarLabel)
            make.width.equalTo(scrollView)
            make.height.equalTo(20)
        }
      
        
        lazy var explanationLabel = UILabel()
        explanationLabel.font = UIFont.systemFont(ofSize: 20)
        explanationLabel.text = "Açıklama"
        explanationLabel.textColor = .black
        scrollView.addSubview(explanationLabel)
        explanationLabel.snp.makeConstraints { make in
            make.top.equalTo(productInfoLabel.snp.bottom).offset(20)
            make.leading.equalTo(fotograflarLabel)
            make.height.equalTo(30)
        }
        
        lazy var explainInfoLabel = UILabel()
        explainInfoLabel.backgroundColor = .white
        explainInfoLabel.text = "Ürünü birkaç cümle ile anlat"
        explainInfoLabel.font = UIFont.systemFont(ofSize: 14)
        explainInfoLabel.textColor = .gray
        scrollView.addSubview(explainInfoLabel)
        explainInfoLabel.snp.makeConstraints { make in
            make.top.equalTo(explanationLabel.snp.bottom).offset(12)
            make.leading.equalTo(fotograflarLabel)
            make.width.equalTo(scrollView)
            make.height.equalTo(20)
        }
        
        lazy var explanationLabel2 = UILabel()
        explanationLabel2.backgroundColor = .white
        explanationLabel2.text = "örn: Sadece iki defa kullandım.Bedeni S-M uyumludur."
        explanationLabel2.font = UIFont.systemFont(ofSize: 14)
        explanationLabel2.textColor = .gray
        scrollView.addSubview(explanationLabel2)
        explanationLabel2.snp.makeConstraints { make in
            make.top.equalTo(explainInfoLabel.snp.bottom)
            make.leading.equalTo(fotograflarLabel)
            make.width.equalTo(scrollView)
            make.height.equalTo(20)
        }
        
        lazy var detailsLabel = UILabel()
        detailsLabel.font = UIFont.systemFont(ofSize: 20)
        detailsLabel.text = "Detaylar"
        detailsLabel.textColor = .black
        scrollView.addSubview(detailsLabel)
        detailsLabel.snp.makeConstraints { make in
            make.top.equalTo(explanationLabel2.snp.bottom).offset(20)
            make.leading.equalTo(fotograflarLabel)
            make.height.equalTo(30)
        }
        
        scrollView.addSubview(tableView1)
        tableView1.snp.makeConstraints { make in
            make.top.equalTo(detailsLabel.snp.bottom).offset(12)
            make.leading.trailing.equalTo(view)
            make.height.equalTo(180)
        }
        tableView1.dataSource = self
        tableView1.delegate = self
        tableView1.register(UITableViewCell.self, forCellReuseIdentifier: "cell1")
        
        lazy var usageLabel = UILabel()
        usageLabel.font = UIFont.systemFont(ofSize: 20)
        usageLabel.text = "Kullanım Durumu"
        usageLabel.textColor = .black
        scrollView.addSubview(usageLabel)
        usageLabel.snp.makeConstraints { make in
            make.top.equalTo(tableView1.snp.bottom).offset(20)
            make.leading.equalTo(fotograflarLabel)
            make.height.equalTo(30)
        }
        
        lazy var infoButton = UIButton()
        infoButton.setImage(UIImage(named: "info"), for: .normal)
        infoButton.titleLabel?.font = .systemFont(ofSize: 20)
        infoButton.tintColor = .systemMint
        scrollView.addSubview(infoButton)
        infoButton.snp.makeConstraints { make in
            make.top.equalTo(usageLabel)
            make.leading.equalTo(usageLabel.snp.trailing).offset(8)
            make.width.equalTo(30)
            make.height.equalTo(30)
        }
        
        lazy var clickButton = UIButton()
        clickButton.setTitleColor(.gray, for: .normal)
        clickButton.layer.cornerRadius = 12
        //clickButton.layer.borderColor = UIColor.neutralLight2.cgColor
        clickButton.backgroundColor = .white
        clickButton.layer.cornerRadius = 10
        clickButton.tintColor = .white
        clickButton.layer.borderWidth = 3
        scrollView.addSubview(clickButton)
        clickButton.snp.makeConstraints { make in
            make.top.equalTo(usageLabel.snp.bottom).offset(20)
            make.leading.equalTo(usageLabel.snp.leading)
            make.width.equalTo(20)
            make.height.equalTo(20)
        }
        clickButton.addTarget(self, action: #selector(clickButtonDidSelected), for: .touchUpInside)
        
        lazy var usageInfoLabel = UILabel()
        usageInfoLabel.backgroundColor = .white
        usageInfoLabel.text = "Az Kullanılmış"
        usageInfoLabel.font = UIFont.systemFont(ofSize: 14)
        usageInfoLabel.textColor = .gray
        scrollView.addSubview(usageInfoLabel)
        usageInfoLabel.snp.makeConstraints { make in
            make.centerY.equalTo(clickButton)
            make.leading.equalTo(clickButton.snp.trailing).offset(8)
            make.height.equalTo(20)
            make.width.equalTo(90)
        }

        lazy var clickButton2 = UIButton()
        clickButton2.setTitleColor(.gray, for: .normal)
        clickButton2.layer.cornerRadius = 12
        //clickButton.layer.borderColor = UIColor.neutralLight2.cgColor
        clickButton2.backgroundColor = .white
        clickButton2.layer.cornerRadius = 10
        clickButton2.tintColor = .white
        clickButton2.layer.borderWidth = 3
        scrollView.addSubview(clickButton2)
        clickButton2.snp.makeConstraints { make in
            make.centerY.equalTo(usageInfoLabel)
            make.leading.equalTo(usageInfoLabel.snp.trailing).offset(20)
            make.width.equalTo(20)
            make.height.equalTo(20)
        }
        clickButton2.addTarget(self, action: #selector(clickButtonDidSelected), for: .touchUpInside)
        
        lazy var usageInfoLabel2 = UILabel()
        usageInfoLabel2.backgroundColor = .white
        usageInfoLabel2.text = "Yeni"
        usageInfoLabel2.font = UIFont.systemFont(ofSize: 14)
        usageInfoLabel2.textColor = .gray
        scrollView.addSubview(usageInfoLabel2)
        usageInfoLabel2.snp.makeConstraints { make in
            make.centerY.equalTo(clickButton2)
            make.leading.equalTo(clickButton2.snp.trailing).offset(8)
            make.height.equalTo(20)
            make.width.equalTo(90)
        }
        
        lazy var clickButton3 = UIButton()
        clickButton3.setTitleColor(.gray, for: .normal)
        clickButton3.layer.cornerRadius = 12
        //clickButton.layer.borderColor = UIColor.neutralLight2.cgColor
        clickButton3.backgroundColor = .white
        clickButton3.layer.cornerRadius = 10
        clickButton3.tintColor = .white
        clickButton3.layer.borderWidth = 3
        scrollView.addSubview(clickButton3)
        clickButton3.snp.makeConstraints { make in
            make.centerY.equalTo(usageInfoLabel2)
            make.leading.equalTo(usageInfoLabel2.snp.trailing).offset(20)
            make.width.equalTo(20)
            make.height.equalTo(20)
        }
        clickButton3.addTarget(self, action: #selector(clickButtonDidSelected), for: .touchUpInside)
        
        lazy var usageInfoLabel3 = UILabel()
        usageInfoLabel3.backgroundColor = .white
        usageInfoLabel3.text = "Yeni & Etiketli"
        usageInfoLabel3.font = UIFont.systemFont(ofSize: 14)
        usageInfoLabel3.textColor = .gray
        scrollView.addSubview(usageInfoLabel3)
        usageInfoLabel3.snp.makeConstraints { make in
            make.centerY.equalTo(clickButton3)
            make.leading.equalTo(clickButton3.snp.trailing).offset(8)
            make.height.equalTo(20)
            make.width.equalTo(90)
        }
        
        lazy var cargoLabel = UILabel()
        cargoLabel.font = UIFont.systemFont(ofSize: 20)
        cargoLabel.text = "Kargo"
        cargoLabel.textColor = .black
        scrollView.addSubview(cargoLabel)
        cargoLabel.snp.makeConstraints { make in
            make.top.equalTo(clickButton3.snp.bottom).offset(20)
            make.leading.equalTo(fotograflarLabel)
            make.height.equalTo(30)
        }
        
        lazy var infoButton2 = UIButton()
        infoButton2.setImage(UIImage(named: "info2"), for: .normal)
        infoButton2.titleLabel?.font = .systemFont(ofSize: 20)
        infoButton2.tintColor = .systemMint
        scrollView.addSubview(infoButton2)
        infoButton2.snp.makeConstraints { make in
            make.top.equalTo(cargoLabel.snp.bottom).offset(20)
            make.leading.equalTo(cargoLabel)
            make.width.equalTo(30)
            make.height.equalTo(30)
        }
        
        lazy var infoLabel = UILabel()
        infoLabel.font = UIFont.systemFont(ofSize: 12)
        infoLabel.text = "Satıcı Öder seçimi ile gerçekleşen tüm satışlardan 50 Dolap Puan kazanabilirsin." //Text revize edielecek
        infoLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        infoLabel.numberOfLines = 2
        infoLabel.textColor = .gray
        scrollView.addSubview(infoLabel)
        infoLabel.snp.makeConstraints { make in
            make.top.equalTo(infoButton2)
            make.leading.equalTo(infoButton2.snp.trailing).offset(8)
            make.width.equalTo(300)
            make.height.equalTo(30)
        }
        
        lazy var cargoWhoLabel = UILabel()
        cargoWhoLabel.font = UIFont.systemFont(ofSize: 20)
        cargoWhoLabel.text = "Kargoyu Kim Öder?"
        cargoWhoLabel.textColor = .black
        scrollView.addSubview(cargoWhoLabel)
        cargoWhoLabel.snp.makeConstraints { make in
            make.top.equalTo(infoLabel.snp.bottom).offset(20)
            make.leading.equalTo(fotograflarLabel)
            make.height.equalTo(30)
        }
        
        lazy var cargoClickButton = UIButton()
        cargoClickButton.setTitleColor(.gray, for: .normal)
        cargoClickButton.layer.cornerRadius = 12
        //clickButton.layer.borderColor = UIColor.neutralLight2.cgColor
        cargoClickButton.backgroundColor = .white
        cargoClickButton.layer.cornerRadius = 10
        cargoClickButton.tintColor = .white
        cargoClickButton.layer.borderWidth = 3
        scrollView.addSubview(cargoClickButton)
        cargoClickButton.snp.makeConstraints { make in
            make.top.equalTo(cargoWhoLabel.snp.bottom).offset(20)
            make.leading.equalTo(cargoWhoLabel)
            make.width.equalTo(20)
            make.height.equalTo(20)
        }
        cargoClickButton.addTarget(self, action: #selector(clickButtonDidSelected), for: .touchUpInside)
        
        lazy var cargoInfoLabel = UILabel()
        cargoInfoLabel.backgroundColor = .white
        cargoInfoLabel.text = "Alıcı"
        cargoInfoLabel.font = UIFont.systemFont(ofSize: 14)
        cargoInfoLabel.textColor = .gray
        scrollView.addSubview(cargoInfoLabel)
        cargoInfoLabel.snp.makeConstraints { make in
            make.centerY.equalTo(cargoClickButton)
            make.leading.equalTo(cargoClickButton.snp.trailing).offset(8)
            make.height.equalTo(20)
            make.width.equalTo(90)
        }
        

        lazy var cargoClickButton2 = UIButton()
        cargoClickButton2.setTitleColor(.gray, for: .normal)
        cargoClickButton2.layer.cornerRadius = 12
        clickButton.layer.borderColor = UIColor.black.cgColor
        cargoClickButton2.backgroundColor = .white
        cargoClickButton2.layer.cornerRadius = 10
        cargoClickButton2.tintColor = .white
        cargoClickButton2.layer.borderWidth = 3
        
        scrollView.addSubview(cargoClickButton2)
        cargoClickButton2.snp.makeConstraints { make in
            make.centerY.equalTo(cargoInfoLabel)
            make.leading.equalTo(cargoInfoLabel.snp.trailing).offset(20)
            make.width.equalTo(20)
            make.height.equalTo(20)
        }
        cargoClickButton2.addTarget(self, action: #selector(clickButtonDidSelected), for: .touchUpInside)
        
        lazy var cargoInfoLabel2 = UILabel()
        cargoInfoLabel2.backgroundColor = .white
        cargoInfoLabel2.text = "Satıcı"
        cargoInfoLabel2.font = UIFont.systemFont(ofSize: 14)
        cargoInfoLabel2.textColor = .gray
        scrollView.addSubview(cargoInfoLabel2)
        cargoInfoLabel2.snp.makeConstraints { make in
            make.centerY.equalTo(cargoClickButton2)
            make.leading.equalTo(cargoClickButton2.snp.trailing).offset(8)
            make.height.equalTo(20)
            make.width.equalTo(90)
        }
        
        lazy var priceLabel = UILabel()
        priceLabel.font = UIFont.systemFont(ofSize: 20)
        priceLabel.text = "Fiyat"
        priceLabel.textColor = .black
        scrollView.addSubview(priceLabel)
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(cargoClickButton.snp.bottom).offset(20)
            make.leading.equalTo(fotograflarLabel)
            make.height.equalTo(30)
        }
        
        scrollView.addSubview(tableView2)
        tableView2.snp.makeConstraints { make in
            make.top.equalTo(priceLabel.snp.bottom).offset(12)
            make.leading.trailing.equalTo(view)
            //make.width.equalTo(scrollView)
            make.height.equalTo(180)
        }
        tableView2.delegate = self
        tableView2.dataSource = self
        tableView2.register(UITableViewCell.self, forCellReuseIdentifier: "cell2")
        
        lazy var offerLabel = UILabel()
        offerLabel.font = UIFont.systemFont(ofSize: 20)
        offerLabel.text = "Teklifli Satış"
        offerLabel.textColor = .black
        scrollView.addSubview(offerLabel)
        offerLabel.snp.makeConstraints { make in
            make.top.equalTo(tableView2.snp.bottom).offset(8)
            make.leading.equalTo(fotograflarLabel)
            make.height.equalTo(30)
        }
        
        lazy var offerButton = UIButton()
        offerButton.setImage(UIImage(named: "info"), for: .normal)
        offerButton.titleLabel?.font = .systemFont(ofSize: 20)
        offerButton.tintColor = .systemMint
        scrollView.addSubview(offerButton)
        offerButton.snp.makeConstraints { make in
            make.top.equalTo(offerLabel)
            make.leading.equalTo(offerLabel.snp.trailing).offset(8)
            make.width.equalTo(30)
            make.height.equalTo(30)
        }
        
        lazy var offerLabel2 = UILabel()
        offerLabel2.font = UIFont.systemFont(ofSize: 20)
        offerLabel2.text = "Ürüne teklif verilmesini ister misin?"
        offerLabel2.textColor = .black
        scrollView.addSubview(offerLabel2)
        offerLabel2.snp.makeConstraints { make in
            make.top.equalTo(offerLabel.snp.bottom).offset(12)
            make.leading.equalToSuperview().offset(20)
            make.height.equalTo(30)
        }
        
        lazy var switch1 = UISwitch()
        switch1.setOn(true, animated: false)
        switch1.onTintColor = .systemMint
        scrollView.addSubview(switch1)
        switch1.snp.makeConstraints { make in
            make.centerY.equalTo(offerLabel2)
            make.leading.equalTo(offerLabel2.snp.trailing).offset(30)
            make.width.equalTo(100)
            make.height.equalTo(30)
        }
        
        lazy var confirmButton = UIButton()
        confirmButton.setTitle("Onaya Gönder", for: .normal)
        confirmButton.titleLabel?.font = .systemFont(ofSize: 20)
        confirmButton.backgroundColor = .systemMint
        confirmButton.layer.cornerRadius = 30
        view.addSubview(confirmButton)
        confirmButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.snp.bottom).offset(-30)
            make.centerX.equalTo(view)
            make.width.equalTo(view).offset(-40)
            make.height.equalTo(60)
        }
        
    
        
    }
    
    @objc func clickButtonDidSelected(_ sender: UIButton){
            sender.backgroundColor = sender.backgroundColor == UIColor.white ? UIColor.systemMint: UIColor.white
        
        }
}

extension ProductionVC: UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as! CollectionViewCell
        let gesture = UITapGestureRecognizer(target: self, action: #selector(selectPhoto))
        cell.isUserInteractionEnabled = true
        collectionView.addGestureRecognizer(gesture)
        
        for _ in 0...4{
            if selectRow == 0{
                cell.imageView1.image = dataArray[0]
            }else if selectRow == 1{
                cell.imageView2.image = dataArray[0]
                cell.imageView1.image = dataArray[selectRow]
            }else if selectRow == 2{
                cell.imageView3.image = dataArray[0]
                cell.imageView2.image = dataArray[1]
                cell.imageView1.image = dataArray[selectRow]
            }else if selectRow == 3{
                cell.imageView4.image = dataArray[0]
                cell.imageView3.image = dataArray[1]
                cell.imageView2.image = dataArray[2]
                cell.imageView1.image = dataArray[selectRow]
            }else if selectRow == 4{
                cell.imageView4.image = dataArray[1]
                cell.imageView3.image = dataArray[2]
                cell.imageView2.image = dataArray[3]
                cell.imageView1.image = dataArray[selectRow]
            }else{
               print("end")
            }
        }
       
       
       
        

        return cell
    }
    
  
    @objc func selectPhoto(){
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        present(picker, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        selectRow = selectRow + 1
        imagePick = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        dataArray.append(imagePick)
        self.collectionView.reloadData()
        if selectRow == 5{
            selectRow = 0
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       var numberOfRow = 1
        switch tableView{
        case tableView1:
            numberOfRow = arrayText1.count
        case tableView2:
            numberOfRow = arrayText2.count
        default:
            print("row error")
        }
        return numberOfRow
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        switch tableView{
        case tableView1:
            cell = tableView.dequeueReusableCell(withIdentifier: "cell1" , for: indexPath)
            cell.textLabel?.text = arrayText1[indexPath.row]
        case tableView2:
            cell = tableView.dequeueReusableCell(withIdentifier: "cell2" , for: indexPath)
            cell.textLabel?.text = arrayText2[indexPath.row]
        default:
            print("cell error")
        }
        
        return cell
        
    }
    
    
}

class CollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CustomCell"
    var imageView1 = UIImageView()
    var imageView2 = UIImageView()
    var imageView3 = UIImageView()
    var imageView4 = UIImageView()

    

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .white
        contentView.addSubview(imageView1)
        contentView.addSubview(imageView2)
        contentView.addSubview(imageView3)
        contentView.addSubview(imageView4)

        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
       
        imageView1.frame = CGRect(x: 0, y: 0, width: contentView.frame.size.width, height: contentView.frame.size.height)
        imageView1.layer.borderWidth = 1
        imageView1.layer.borderColor = UIColor.lightGray.cgColor
       // imageView1.image = UIImage(named: "pic2")
        imageView1.clipsToBounds = true
        imageView1.layer.borderWidth = 1
        imageView1.layer.borderColor = UIColor.lightGray.cgColor
        
        imageView2.frame = CGRect(x: contentView.frame.size.width+10, y: 0, width: contentView.frame.size.width, height: contentView.frame.size.height)
        imageView2.layer.borderWidth = 1
        imageView2.layer.borderColor = UIColor.lightGray.cgColor
        imageView2.clipsToBounds = true
        imageView2.layer.borderWidth = 1
        imageView2.layer.borderColor = UIColor.lightGray.cgColor
        
        imageView3.frame = CGRect(x: 2*(contentView.frame.size.width+10), y: 0, width: contentView.frame.size.width, height: contentView.frame.size.height)
        imageView3.layer.borderWidth = 1
        imageView3.layer.borderColor = UIColor.lightGray.cgColor
        imageView3.clipsToBounds = true
        imageView3.layer.borderWidth = 1
        imageView3.layer.borderColor = UIColor.lightGray.cgColor
        
        imageView4.frame = CGRect(x: 3*(contentView.frame.size.width+10), y: 0, width: contentView.frame.size.width, height: contentView.frame.size.height)
        imageView4.layer.borderWidth = 1
        imageView4.layer.borderColor = UIColor.lightGray.cgColor
       // imageView1.image = UIImage(named: "pic2")
        imageView4.clipsToBounds = true
        imageView4.layer.borderWidth = 1
        imageView4.layer.borderColor = UIColor.lightGray.cgColor
    }
    
}





