class Creem::Jpi::V1::EmployerController < Creem::Jpi::V1::EntitiesController

  def update
    @entity = Employer.find(params[:id])
    @strong_params = employer_params
    super
  end

  private

  def employer_params
    params.require(:employer).permit(:metadata, :user_id, :first_name, :last_name, :profile_image, :profile_cover)
  end
end
