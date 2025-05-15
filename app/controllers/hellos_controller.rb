class HellosController < ApplicationController
    def new
        @hello = Hello.new
    end

    def keisan
        kekka == kazu + suuzi
    end
end