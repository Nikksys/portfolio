class Contact < MailForm::Base
  attribute :name,      :validate => true
  attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :mobile,    :validate => false
  attribute :message,   :validate => true
  attribute :nickname,  :captcha  => true

  def headers
    {
      :subject => "#{name} Vient de t'écrire depuis Portfolio",
      :to => "azerty-nikko@hotmail.fr",
      :from => %("#{name}" <#{email}>)
    }
  end
  
end