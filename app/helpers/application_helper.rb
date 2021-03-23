module ApplicationHelper
  def default_meta_tags
    {
      site: 'M I N S U K E',
      title: '助っ人を探しているそんなあなたに',
      reverse: true,
      separator: '|',
      description: 'MINSUKEは人手不足などで困った際に役立つアプリです。全国の助っ人たちがあなたのもとに駆けつけてくれるでしょう。',
      keywords: '助っ人',
      canonical: request.original_url,
      noindex: ! Rails.env.production?,
      icon: [
        { href: image_url('4365516_m.jpg') },
        { href: image_url('4365516_m.jpg'), rel: 'apple-touch-icon', sizes: '180x180', type: 'image/jpg' },
      ],
      og: {
        site_name: 'M I N S U K E',
        title: '助っ人を探しているそんなあなたに',
        description: 'MINSUKEは人手不足などで困った際に役立つアプリです。全国の助っ人たちがあなたのもとに駆けつけてくれるでしょう。',
        type: 'website',
        url: request.original_url,
        image: image_url('4365516_m.jpg'),
        locale: 'ja_JP',
      }
    }
  end
end
