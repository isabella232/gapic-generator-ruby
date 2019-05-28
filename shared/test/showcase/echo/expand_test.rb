# frozen_string_literal: true

# Copyright 2019 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require "test_helper"
require "google/showcase/v1alpha3/echo"
require "grpc"

class ExpandTest < ShowcaseTest
  def test_expand
    client = Google::Showcase::V1alpha3::Echo::Client.new do |config|
      config.credentials = GRPC::Core::Channel.new("localhost:7469", nil, :this_channel_is_insecure)
    end

    request_content = "The quick brown fox jumps over the lazy dog"

    response_enum = client.expand content: request_content

    assert_equal request_content, response_enum.to_a.map(&:content).join(" ")
  end
end