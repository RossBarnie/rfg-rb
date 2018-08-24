RSpec.describe Rfg::Client do
  describe "#generate_favicon" do
    context "with the default endpoint" do
      let(:config) { {} }
      subject { Rfg::Client.new.generate_favicon(config: config) }
      it "sends a post request to the default endpoint" do
        VCR.use_cassette("client_default") do
          is_expected.to have_requested(:post, "#{Rfg::Client::DEFAULT_HOST}/#{Rfg::Client::DEFAULT_GENERATE_PATH}")
        end
      end
    end

    context "with a specified endpoint" do
      let(:config) { {} }
      subject { Rfg::Client.new(host: "http://www.google.com").generate_favicon(config: config, path: '') }
      it "sends a post request to the default endpoint" do
        VCR.use_cassette("client_custom_endpoint") do
          is_expected.to have_requested(:post, "http://www.google.com/")
        end
      end

      it "returns self" do
        VCR.use_cassette("client_custom_endpoint") do
          is_expected.to be_a Rfg::Client
        end
      end
    end
  end
end
