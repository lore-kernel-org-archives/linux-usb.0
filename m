Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99B002772A
	for <linux-usb@vger.kernel.org>; Tue, 21 Nov 2023 14:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="1aCGz0Sd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46AB4C433C8;
	Tue, 21 Nov 2023 14:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1700578173;
	bh=bldujqKviIOIMvPwKfmv7CG4Fmr04NgywnMf5OyqOH4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=1aCGz0SdDYpI6LnmjRqauIIpentHGRTjLdTX+IxHOFAQ4Wk/QEjdYD6oQErpg49ub
	 jeMKtjOfp1MxqxVFF9ZZMb/+una9F2CRloOlueRuttfm22hcR77VM6VUcyIeSuHuJr
	 MrsU2pITtqsxLGUqu3OYPLs0C0ejgoHTaKLE9Vfk=
Date: Tue, 21 Nov 2023 14:52:24 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: SpriteOvO <spriteovo@gmail.com>
Cc: johan@kernel.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, Yangyu Chen <cyy@cyyself.name>
Subject: Re: [PATCH] USB: serial: option: add Luat Air72*U series products
Message-ID: <2023112147-pegboard-discourse-9a31@gregkh>
References: <20231121111626.64804-1-SpriteOvO@gmail.com>
 <2023112128-spinach-quit-0d8a@gregkh>
 <7bdf5f7a-cdcd-46cc-88df-8bc0706ec9e9@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7bdf5f7a-cdcd-46cc-88df-8bc0706ec9e9@gmail.com>

On Tue, Nov 21, 2023 at 08:02:17PM +0800, SpriteOvO wrote:
> I've been using that name for a long time in open source communities, here's
> my GitHub profile:
> 
> https://github.com/SpriteOvO
> 
> Linux has allowed pseudonymous contributions since earlier this year, does
> this apply to me? If you are concerned that "Sprite" will cause confusion, I
> can use "Asuna", which is the name I used on IM chats and social media
> platforms.

A "unique" identifier that you use to identify yourself is fine,
"Sprite" is not really unique :)

thanks,

greg k-h
