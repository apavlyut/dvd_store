class AddMissingColumnstoMovie < ActiveRecord::Migration
  def self.up
    add_column :movies, :title_origin, :string # оригинальное название
    add_column :movies, :director_id, :integer  # режиссер
    add_column :movies, :producer_id, :integer  # продюсер
    add_column :movies, :film_studio, :string # киностудия
    add_column :movies, :distributor, :string # дистрибьютер
    add_column :movies, :regional_code, :integer # региональный код
    add_column :movies, :data_medium, :string # формат носителя - DVD, BLUE-RAY
    add_column :movies, :subtitle, :string # субтитры
    add_column :movies, :audio_track, :string # звуковые дорожки 
    add_column :movies, :split_screen_format, :string # формат изображения
    add_column :movies, :release_date, :date # дата релиза
    add_column :movies, :coutry, :string # страна производитель
    add_column :movies, :addons, :text # доплонительные материалы
    add_column :movies, :in_stock, :integer # количество в наличие
  end

  def self.down
    remove_column :movies, :title_origin
    remove_column :movies, :director_id
    remove_column :movies, :producer_id
    remove_column :movies, :film_studio
    remove_column :movies, :distributor
    remove_column :movies, :regional_code
    remove_column :movies, :data_medium
    remove_column :movies, :subtitle
    remove_column :movies, :audio_track
    remove_column :movies, :split_screen_format
    remove_column :movies, :release_date
    remove_column :movies, :coutry
    remove_column :movies, :addons
    remove_column :movies, :in_stock
  end
end
