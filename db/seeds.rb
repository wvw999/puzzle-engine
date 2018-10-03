class Seed
  Puzzle.destroy_all
  Play.destroy_all
  User.destroy_all


  def self.begin
    seed = Seed.new
    seed.generate_users
    seed.generate_puzzles
  end

  def generate_users
    20.times do |i|
      User.create!( name: Faker::Name.name, email: Faker::Internet.email, password: 'password', admin: false)
    end
  end

  def generate_puzzles
    # Puzzle.create!( board: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 'z', 'z', 'z', 'z', 'z', 'z', 'z', 'a', 1, 1, 'z', 'z', 'z', 'z', 'z', 'z', 'z', 'b', 1, 1, 'z', 'z', 'z', 'z', 'z', 'z', 'z', 'c', 1, 1, 'z', 'z', 'z', 'z', 'z', 'z', 'z', 'd', 1, 1, 'w', 'o', 'r', 'd', 'g', 'a', 'm', 'e', 1, 1, 'z', 'z', 'z', 'z', 'z', 'z', 'z', 'f', 1, 1, 'z', 'z', 'z', 'z', 'z', 'z', 'z', 'g', 1, 1, 'z', 'z', 'z', 'z', 'z', 'z', 'z', 'h', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], words: ['zzzzzzza', 'zzzzzzzb', 'zzzzzzzc', 'zzzzzzzd', 'zzzzzzzh', 'zzzzzzzf', 'zzzzzzzg', 'wordgame'] )
    Puzzle.create!( board: [0,0,0,0,0,0,0,0,0,0,1,"o","w","c","a","u","y","i","v",1,1,"n","a","r","r","e","n","j","n",1,1,"a","d","e","e","y","t","r","i",1,1,"r","s","t","l","s","r","u","p",1,1,"i","e","a","r","t","i","q","a",1,    1,"b","a","c","c","v","l","e","a",1,1,"a","m","r","t","a","l","a","n",1,    1,"i","n","c","e","l","o","a","m",1,0,0,0,0,0,0,0,0,0,0])
  end
end

Seed.begin
