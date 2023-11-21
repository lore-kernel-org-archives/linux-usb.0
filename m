Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0B244A2E
	for <linux-usb@vger.kernel.org>; Tue, 21 Nov 2023 11:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="I9W1Cuuu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BB51C433C8;
	Tue, 21 Nov 2023 11:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1700565905;
	bh=TbPcnZPxnGe9plFdKanhkx7U7DgBVbiQezneWX/9tcU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I9W1Cuuu3o9xwgJoI7weqFwtc0MSIicVUSfWNo/cza9ZTBN09AZW+1eJ6zK+vqbeq
	 cQDBLLd7Vi+/IqRYLpSjMdXVoX+lRwT5OWaky6WBk0V83NGJx9Pryrbv0RA2tEPel0
	 h8UahsOh9T1Al0bXC9DQlH7y3WfnFCqkCem2GVBU=
Date: Tue, 21 Nov 2023 12:25:01 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Sprite <spriteovo@gmail.com>
Cc: johan@kernel.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, Yangyu Chen <cyy@cyyself.name>
Subject: Re: [PATCH] USB: serial: option: add Luat Air72*U series products
Message-ID: <2023112128-spinach-quit-0d8a@gregkh>
References: <20231121111626.64804-1-SpriteOvO@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231121111626.64804-1-SpriteOvO@gmail.com>

> Co-developed-by: Yangyu Chen <cyy@cyyself.name>
> Signed-off-by: Yangyu Chen <cyy@cyyself.name>
> Signed-off-by: Sprite <SpriteOvO@gmail.com>

"Sprite" is an odd name, is that how things are signed by you?

thanks,

greg k-h
