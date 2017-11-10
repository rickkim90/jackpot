class LottoController < ApplicationController
  def index
    
  end

  def show
    @lotto = [*1..45].sample(6) 
  end
  
  def api
    require 'json'
    uri = "http://www.nlotto.co.kr/common.do?method=getLottoNumber&drwNo="
    response = HTTParty.get(uri)
    result = JSON.parse(response.body)
    
    bonus = result["bnusNo"]
    
    @arr = Array.new()
    #arr = [] #api로 가져온 이번주 당첨코드
    result.each do |key,value|
      @arr << value if key.include? "drwtNo"
    end

    @lotto = [*1..45].sample(6) 
    
    #lotto 담긴 숫자와 arr안에 담긴 숫자를 비교
    @matching = @arr & @lotto
    
    if @matching.count == 6
      @result = "1등"
    elsif @matching.count == 5 && @lotto.include?(bonus)  #우리 추천 번호에 bonus가 있니?
      @result = "2등"
    elsif @matching.count == 5
      @result = "3등"
    elsif @matching.count == 4
      @result = "4등(5만원)"
    elsif @matching.count == 3
      @result = "5등(5천원)"
    elsif @matching.count == 2
      @result = "6등"
    else
      @result = "꽝"
    end
   
    # 6개 맞으면 1등
    # 5개 맞으면 2등
    # 4개 맞으면 3등
    # 3개 맞으면 4등
    # 2개 맞으면 5등
    # 1개 맞으면 6등
    # 0개 맞으면 꼴등
    
  end
end