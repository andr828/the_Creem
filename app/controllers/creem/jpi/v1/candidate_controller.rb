class Creem::Jpi::V1::CandidateController < Creem::Jpi::V1::EntitiesController


  respond_to :json
  def index

  	@candidate = Entity.where(:type => 'Candidate')
    render json: @candidate
  end

  def get_candidate
    
  end


  def update
    @entity = Candidate.find(params[:id])
    @strong_params = candidate_params
    super
  end

  private

  def candidate_params
    params.require(:candidate).permit(:metadata, :user_id, :first_name, :last_name, :profile_image)
  end
end
