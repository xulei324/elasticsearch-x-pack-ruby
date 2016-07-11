require 'test_helper'

module Elasticsearch
  module Test
    class XPackWatcherStopTest < Minitest::Test

      context "XPack Watcher: Stop" do
        subject { FakeClient.new }

        should "perform correct request" do
          subject.expects(:perform_request).with do |method, url, params, body|
            assert_equal 'PUT', method
            assert_equal '_xpack/watcher/_stop', url
            assert_equal Hash.new, params
            assert_nil   body
            true
          end.returns(FakeResponse.new)

          subject.xpack.watcher.stop
        end

      end

    end
  end
end
