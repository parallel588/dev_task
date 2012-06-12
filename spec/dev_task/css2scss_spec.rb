require 'spec_helper'


describe DevTask::Css2scss, 'Css to scss' do
  let(:css){
     ".header h1 a{
        display: block;
        float: left;
        height: 31px;
        margin-right:20px;
        overflow: hidden;
        width: 178px;
      }"
   }
  let(:scss){
    ".header h1 a {
  display: block;
  float: left;
  height: 31px;
  margin-right: 20px;
  overflow: hidden;
  width: 178px; }
"
  }
  describe ".convert" do
    it "should valid convert" do
      DevTask::Css2scss.convert(css).should eq(scss)
    end
  end
end
