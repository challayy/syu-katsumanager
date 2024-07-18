class HelloController < ApplicationController
    def index
        @companies = Company.all
    end
    def link
    end
end
