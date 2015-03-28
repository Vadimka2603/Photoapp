module UsersHelper

  # Добавим Фредди вместо аватарки
  def gravatar_for(user)
    
    gravatar_url = "http://troll-face.ru/static/images/freddie-mercury-pic.jpg"
    image_tag(gravatar_url, title: "Конечно тут должна быть аватарка, но автор пока приделал вам Фредди", class: "gravatar")
  end
end