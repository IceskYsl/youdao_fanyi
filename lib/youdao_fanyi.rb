#API key：1274584216
#keyfrom：ice-blog-home
#http://fanyi.youdao.com/openapi.do?keyfrom=ice-blog-home&key=1274584216&type=data&doctype=<doctype>&version=1.1&q=要翻译的文本
#http://fanyi.youdao.com/openapi.do?keyfrom=ice-blog-home&key=1274584216&type=data&doctype=json&version=1.1&q=要翻译的文本
require 'open-uri'
require 'net/http'
require 'rexml/document'
require 'uri'
class YouDaoFanyi
  BASE_URL = "http://fanyi.youdao.com/openapi.do?type=data&doctype=xml&version=1.1"
  API_keyfrom = "ice-blog-home"
  API_key = "1274584216"
  TRANSLATE_URL = BASE_URL+"&keyfrom=#{API_keyfrom}&key=#{API_key}"
  
  def self.translate(q)
    q.gsub!(/[&]/, ' '
    url = TRANSLATE_URL + "&q=#{URI.escape(q) }"
    xml_data = Net::HTTP.get_response(URI.parse(url)).body
    doc = REXML::Document.new(xml_data)
    REXML::XPath.first(doc, '//paragraph').text
  end
end



=begin
<youdao-fanyi>
  <errorCode>0</errorCode>
  <query>
    <![CDATA[ 我真的爱你 ]]>
  </query>
  <!-- 有道翻译 -->
    <translation>
      <paragraph>
        <![CDATA[ I really love you ]]>
      </paragraph>
    </translation>
<!-- 有道词典-网络释义 -->
=end


