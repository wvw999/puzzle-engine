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
    Puzzle.create!( board: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 'z', 'z', 'z', 'z', 'z', 'z', 'z', 'a', 1, 1, 'z', 'z', 'z', 'z', 'z', 'z', 'z', 'b', 1, 1, 'z', 'z', 'z', 'z', 'z', 'z', 'z', 'c', 1, 1, 'z', 'z', 'z', 'z', 'z', 'z', 'z', 'd', 1, 1, 'w', 'o', 'r', 'd', 'g', 'a', 'm', 'e', 1, 1, 'z', 'z', 'z', 'z', 'z', 'z', 'z', 'f', 1, 1, 'z', 'z', 'z', 'z', 'z', 'z', 'z', 'g', 1, 1, 'z', 'z', 'z', 'z', 'z', 'z', 'z', 'h', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], words: ['zzzzzzza', 'zzzzzzzb', 'zzzzzzzc', 'zzzzzzzd', 'zzzzzzzh', 'zzzzzzzf', 'zzzzzzzg', 'wordgame'] )
  end
end

Seed.begin
