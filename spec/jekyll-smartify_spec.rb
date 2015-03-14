require 'spec_helper'

describe(Jekyll) do
  let(:overrides) do
    {
      "source"      => source_dir,
      "destination" => dest_dir,
      "url"         => "http://example.org",
    }
  end
  let(:config) do
    Jekyll.configuration(overrides)
  end
  let(:site)     { Jekyll::Site.new(config) }
  let(:contents) { File.read(dest_dir("index.html")) }
  before(:each) do
    site.process
  end

  it "converts quotes into curly quotes" do
    expect(contents).to match /It&rsquo;s working/
    expect(contents).to_not match /It's working/
  end

  it "converts dots into an ellipsis" do
    expect(contents).to match /Ellipsis&hellip;/
    expect(contents).to_not match /Ellipsis\.\.\./
  end

  it "does not convert to Markdown" do
    expect(contents).to match /#hashtag/
  end
 end
