require "spec_helper"

RSpec.describe "data:migrate:remove_main_headings" do
  include_context "rake"

  it "migrates posts with main headings" do
    post = create :post, body: "# title"

    subject.invoke

    expect(post.reload.body).to eq "## title"
  end

  it "does not migrates posts without main headings" do
    post = create :post, body: "## title"

    subject.invoke

    expect(post.reload.body).to eq "## title"
  end
end
