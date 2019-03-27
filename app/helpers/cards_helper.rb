module CardsHelper
  def selected_card_image(brand)
    case brand
      when "Visa"
        image_tag('//www-mercari-jp.akamaized.net/assets/img/card/visa.svg')
      when "MasterCard"
        image_tag('//www-mercari-jp.akamaized.net/assets/img/card/master-card.svg')
      when "JCB"
        image_tag('//www-mercari-jp.akamaized.net/assets/img/card/jcb.svg?3435714107')
      when "American Express"
        image_tag('//www-mercari-jp.akamaized.net/assets/img/card/american_express.svg')
      when "Diners Club"
        image_tag('//www-mercari-jp.akamaized.net/assets/img/card/dinersclub.svg')
      when "Discover"
        image_tag('//www-mercari-jp.akamaized.net/assets/img/card/discover.svg')
    end
  end
end
