class AddDefaultPhoto < ActiveRecord::Migration[7.0]
  def change
    change_column_default :users, :photo, "https://img.freepik.com/free-vector/mysterious-mafia-man-smoking-cigarette_52683-34828.jpg?w=1480&t=st=1674661161~exp=1674661761~hmac=e529680000ea966150e5ea3b38241a0d8c9582faf23dac8af61ce1785cf27838"
  end
end
