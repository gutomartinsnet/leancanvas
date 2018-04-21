module ApplicationHelper
  def default_meta_tags
    {
      site: 'リーンキャンバスメーカー',
      title: 'LeanCanvasMaker',
      reverse: true,
      charset: 'utf-8',
      description: 'Web上でLeanCanvasを描くことが出来る。Webで作成後、画像が生成され、画像の保存が可能',
      keywords: 'LeanCanvasMaker,LeanCanvas,リーンキャンバス ',
      canonical: request.original_url,
      separator: '|',
      icon: [
         { href: image_url('favicon.ico') },
      #   { href: image_url('icon.jpg'), rel: 'apple-touch-icon', sizes: '180x180', type: 'image/jpg' },
      ],
      og: {
        site_name: 'リーンキャンバスメーカー',
        title: 'LeanCanvasMaker',
        description: 'Web上でLeanCanvasを描くことが出来る。Webで作成後、画像が生成され、画像の保存が可能',
        type: 'website',
        url: request.original_url,
        image: image_url('leancanvas.png'),
        locale: 'ja_JP',
      },
      twitter: {
        card: 'summary',
        site: '@RestartFromCafe',
      }
    }
  end
end
