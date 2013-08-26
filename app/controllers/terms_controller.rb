require 'digest/sha1'

class TermsController < ApplicationController
  def new
  end

  def create
    # check if this term already exists
    term = params[:term]
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
    @term = @user.terms.build(term: term, origin: origin, bit: bit, byte: byte, batch: batch, previous_version_number: nil, version_number: version_number)
    @term.save
    
    ip_address = request.remote_ip
    @term_info = @term.term_infos.build(ip_address: ip_address, user_id: session[:user_id])
    @term_info.save
    
    redirect_to '/terms/index'
  end

  def read
    term_id = params[:term_id]
    @term = Term.find(term_id)
  end

  def new_version
    term = params[:term]
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
    
    submission_hash = {"term" => term,
                       "origin" => origin,
                       "bit" => bit,
                       "byte" => byte,
                       "batch" => batch,
                       "user_id" => user_id,
                        }
    @term = Term.find(term_id)
    @term.update_attributes(submission_hash)
    @term.save
    
    ip_address = request.remote_ip
    @term_info = @term.term_infos.build(ip_address: ip_address, user_id: session[:user_id])
    @term_info.save
    redirect_to '/terms/index'
  end

  def new_version_form
    term_id = params[:term_id]
    @term = Term.find(term_id)
  end

  def index
    @terms = Term.all()
  end

  def search
    search_term = params[:search_term]
    @terms = Term.where(term: search_term)
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
end
