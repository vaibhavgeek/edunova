module ApplicationHelper
  AWS_CONFIG = {
    'access_key_id' => 'AKIAJQCJY4CA5VUEGMDA',
    'secret_access_key' => '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',
    'bucket' => 'vaibhavgeek',
    'acl' => 'public-read',
    'key_start' => 'store/'
  }
def markdown(text)
  markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML , autolink: true , filter_html: true , tables: true  )
  return markdown.render(text).html_safe
end

  def signature
    Base64.encode64(
        OpenSSL::HMAC.digest(
          OpenSSL::Digest.new('sha1'),
          AWS_CONFIG['secret_access_key'], policy
        )
      ).gsub("\n", "")
  end

  def policy
    Base64.encode64(self.policy_data.to_json).gsub("\n", "")
  end

  def policy_data
    {
      expiration: 10.hours.from_now.utc.iso8601,
      conditions: [
        ["starts-with", "$key", AWS_CONFIG['key_start']],
        ["starts-with", "$x-requested-with", "xhr"],
        ["content-length-range", 0, 20.megabytes],
        ["starts-with", "$content-type", ""],
        {bucket: AWS_CONFIG['bucket']},
        {acl: AWS_CONFIG['acl']},
        {success_action_status: "201"}
      ]
    }
  end

  def data_hash
    {:signature => self.signature, :policy => self.policy, :bucket => AWS_CONFIG['bucket'], :acl => AWS_CONFIG['acl'], :key_start => AWS_CONFIG['key_start'], :access_key => AWS_CONFIG['access_key_id']}
  end
end
