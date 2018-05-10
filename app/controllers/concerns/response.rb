module Response
  def json_response(object, inclusions, status = :ok)
    render json: object, include: inclusions, status: status
  end
end
