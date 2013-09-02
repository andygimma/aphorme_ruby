#
# Developer : Andy Gimma (andy.n.gimma@gmail.com)
# Date : 08/14/13
# All code (c)2013 Andy Gimma all rights reserved
#

require 'digest/sha1'

class TermsController < ApplicationController
  def new
  end

  def create
    # check if this term already exists
    if session[:user_id]
      term = params[:term].downcase
      origin = params[:origin]
      related_terms = params[:related_terms]
      
      
      #####
      # Not saving related_terms for now. Will save them to a has_many relationship
      #####
      bit = params[:bit]
      byte = params[:byte]
      batch = params[:batch]
      version_number = Digest::SHA1.hexdigest Time.new.to_s
      @user = User.find(session[:user_id])
      @term = @user.terms.build(name: term, term: term, origin: origin, bit: bit, byte: byte, batch: batch, previous_version_number: nil, version_number: version_number)
      @term.save
      
      ip_address = request.remote_ip
      @term_info = @term.term_infos.build(ip_address: ip_address, user_id: session[:user_id], name: @term.name)
      @term_info.save
      terms_array = related_terms.split ","
      terms_array.each do |term|
	@related_term = Term.find(term)
	@new_related_term = @term.related_terms.build(related_term_id: term.to_i, name: @related_term.name)
	@new_related_term.save
      end
      redirect_to '/terms/index'
    else
      redirect_to '/signin'
    end
  end

  def read
    term_id = params[:term_id]
    @term = Term.find(term_id)
  end

  def new_version
    ### AUTH
    if session[:user_id]
      term_id = params[:term_id]
      origin = params[:origin]
      related_terms = params[:related_terms]
      #####
      # Not saving related_terms for now. Will save them to a has_many relationship
      #####
      bit = params[:bit]
      byte = params[:byte]
      batch = params[:batch]
      
      user_id = session[:user_id]
      
      submission_hash = {"origin" => origin,
			"bit" => bit,
			"byte" => byte,
			"batch" => batch,
			"user_id" => user_id,
			  }
      @term = Term.find(term_id)
      @term.update_attributes(submission_hash)
      @term.save
      
      ip_address = request.remote_ip
      @term_info = @term.term_infos.build(ip_address: ip_address, user_id: session[:user_id], name: @term.name)
      @term_info.save
      
      terms_array = related_terms.split ","
      terms_array.each do |term|
	@related_term = Term.find(term)
	@new_related_term = @term.related_terms.build(related_term_id: term.to_i, name: @related_term.name)
	@new_related_term.save
      end
      redirect_to '/terms/index'
    else
      redirect_to '/signin'
    end
  end

  def new_version_form
    if session[:user_id]
      term_id = params[:term_id]
      @term = Term.find(term_id)
    else
      redirect_to '/signin'
    end
    
  end

  def index
    @terms = Term.order("name")
  end

  def search
    search_term = params[:search_term]
    search_string = "%#{search_term}%"
    @terms = Term.where("name like ?", search_string)

  end
  
  def search_term
    search_term = params[:search_term]
    search_term.sub!(' ', '%20')
    
    redirect_to '/search_terms/' + search_term
  end
  def versions
    term_id = params[:term_id]
    @term = Term.find(term_id)
    @versions = @term.versions
  end
  
  def search_ui
  end
  
  def save_search_info
    term_id = params[:term_id]
    @term = Term.find(term_id)
    ip_address = request.remote_ip
    @search_info = @term.search_infos.build(ip_address: ip_address, user_id: session[:user_id], name: @term.name)
    @search_info.save
    redirect_to '/terms/' + term_id.to_s
  end
  
  def term_map
  end
  
  def term_map_api
    @term_infos = TermInfo.all()
    render json: @term_infos
  end
  
  def search_map
  end
  
  def search_map_api
    @search_infos = SearchInfo.all()
    render json: @search_infos
  end
  
  def term_autocomplete_api
    @terms = Term.select("name, id")
    render json: @terms
  end
end
