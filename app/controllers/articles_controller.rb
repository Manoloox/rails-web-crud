class ArticlesController < ApplicationController
    def index
        @articles = Article.all
        respond_to do |format|
          format.html
          format.pdf do
            headers["Content-Disposition"] = "attachment; filename=\"reporte-#{Time.now.to_i}.pdf\""
          end
        end
    end
    def show
        @article = Article.find(params[:id])
    end
    # Método new
    def new 
        @article = Article.new
    end

    def edit
        @article = Article.find(params[:id])
    end      

    def create
        # @article = Article.new(params.require(:article).permit(:title, :text))
        @article = Article.new(article_params)

        if @article.save
            redirect_to @article
        else
            render 'new'
        end
    end

    def update
        @article = Article.find(params[:id])
      
        if @article.update(article_params)
          redirect_to @article
        else
          render 'edit'
        end
    end

    def destroy
        @article = Article.find(params[:id])
        @article.destroy
    
        redirect_to articles_path
    end

    private
    def article_params
        params.require(:article).permit(:title, :text)
    end
  
  
end
