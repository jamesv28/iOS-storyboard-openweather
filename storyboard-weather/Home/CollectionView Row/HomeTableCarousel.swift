//
//  HomeTableCarousel.swift
//  storyboard-weather
//
//  Created by James Volmert on 3/17/26.
//

import UIKit

class HomeTableCarousel: UITableViewCell {

    static let id = "HomeTableCarousel"
    
    @IBOutlet private weak var tableView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCollectionView()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    private func setupCollectionView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func configure() {
        
    }
}

extension HomeTableCarousel: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = tableView.dequeueReusableCell(withReuseIdentifier: DailyCollectionCell.id, for: indexPath) as! DailyCollectionCell
        return cell
    }
    
    
}

extension HomeTableCarousel: UICollectionViewDelegate {
    
}

extension HomeTableCarousel: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // placeholder - will change
        return CGSize(width: 75, height: 140)
    }
}
