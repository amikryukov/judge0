class LanguagesController < ApplicationController
  def index
    puts "log on languages index call"
    render json: Language.all, each_serializer: LanguageSerializer, fields: [:id, :name]
  end

  def all
    puts "log on languages all call"
    render json: Language.unscoped.order(name: :asc), each_serializer: LanguageSerializer, fields: [:id, :name, :is_archived]
  end

  def show
    render json: Language.unscoped.find(params[:id])
  end
end
