
season1 = Season.where(name: 'Season 1').first
winner1 = Queen.where(name: 'Bebe Zahara Benet').first
season1.update(winner_id: winner1.id)

season2 = Season.where(name: 'Season 2').first
winner2 = Queen.where(name: 'Tyra Sanchez').first
season2.update(winner_id: winner2.id)

season3 = Season.where(name: 'Season 3').first
winner3 = Queen.where(name: 'Raja').first
season3.update(winner_id: winner3.id)

season4 = Season.where(name: 'Season 4').first
winner4 = Queen.where(name: 'Sharon Needles').first
season4.update(winner_id: winner4.id)

season5 = Season.where(name: 'Season 5').first
winner5 = Queen.where(name: 'Jinkx Monsoon').first
season5.update(winner_id: winner5.id)

season6 = Season.where(name: 'Season 6').first
winner6 = Queen.where(name: 'Bianca Del Rio').first
season6.update(winner_id: winner6.id)

season7 = Season.where(name: 'Season 7').first
winner7 = Queen.where(name: 'Violet Chachki').first
season7.update(winner_id: winner7.id)

season8 = Season.where(name: 'Season 8').first
winner8 = Queen.where(name: 'Bob The Drag Queen').first
season8.update(winner_id: winner8.id)

season9 = Season.where(name: 'Season 9').first
winner9 = Queen.where(name: 'Sasha Velour').first 
season9.update(winner_id: winner9.id)
