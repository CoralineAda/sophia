require 'spec_helper'

RSpec.describe ServicesController, type: :controller do

  describe "GET #show" do

    let :service { Service.create(
        canonical_name: "testservice.1.0.0",
        name: "Test Service",
        version: "1.0.0",
        health_check_url: "/status"
      )
    }

    it "displays a service" do
      get 'show', id: service.id
      doc = Nokogiri::XML(response.body)
      expect(doc.at_css("h1")).to eq "Test Service 1.0.0 Details"
    end

  end
end
