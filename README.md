#4차산업혁명 선도인재 양성 프로젝트 과정
---
## 1. Week 1 Day 5:  Lotto generate

***

1. controller : lotto
2. lotto#index : '/' 페이지
3. lotto#index : 버튼(로또번호추천)
4. lotto#show : 로또번호추천
5. lotto#api : 로또번호를 가져와서, array에 넣는다



**lotto api link : http://www.nlotto.co.kr/common.do?method=getLottoNumber&drwNo= **

```ruby
def api
  HTTParty.get()
  JSON.parse()
  # 배열에 넣어준다
end
```



+ rails g controller lotto index show

1. index.erb : 
2. lotto_controller.rb : 로또 번호 추천 로직 넣기
3. show.erb : 로또 번호 추천 결과 보여주기



+ scraping

gemfile에 gem 'httparty', gem 'nokogiri' 추가

gemfile 수정 후 bundle install

```ruby
arr1 = [1,2,3,4]
arr2 = [3,4,5,6]
arr1 & arr2
> [3,4]
```

