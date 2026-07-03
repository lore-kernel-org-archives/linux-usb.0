Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6674639183B;
	Fri,  3 Jul 2026 09:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783071692; cv=none; b=CdTuy4RnkJwNE+c78Ug64i9Q74ibYVwD1ZXXrJoB0BljqCAhaCKTa5siMpExXogZjYZRtg7PVlVWzMVhh9S23AkH8XBXQttqx6n22HRPRhKMnSd4l+zK5A3fsH+GKYKsX2+7Z+JMaSLr8PqF6gP0fJl3v4ovmGtRB1Urbuf8ORw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783071692; c=relaxed/simple;
	bh=Nje89JJB9LKW2BNpvuLOzvhXXBGBNjguqSd8VegCC30=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AeyUFYWKbPY5at8pnTuzgjPcJ7pPpJl/YyAoKxQFs4GRth1Kdu4/v6B5y+aYsJ9rk9SiI58xbCvl3nlJZXJT/mie1KbfHkxm5d1B12w0itU5NTfTVmuXo/+iOQnbyXDvBkjkf/Q3wb5lZE9IgjltMBSKrFEOjRIk1Hb9wQHI8WY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=cXR3pyob; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="cXR3pyob"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 744211F00A3A;
	Fri,  3 Jul 2026 09:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783071691;
	bh=X784Ptt1FjoW0rEoRguXaoBFm/BLnHHUxQuoZ6SDSnc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cXR3pyobyMK2wgUIzSq9gwWu153yF8BSDJ1zdJB0HkaV3gn2008n+FJJqfC8jLZbG
	 DmSiHzBuFNeXgGBIwwpFvzJeMN+tS8akNUIMAUSv9Vpqob1vpIqdL+9xiNQiJh1B9b
	 nw8Lo6+sbGqAxPiewvjLLhnodWfNaTzgRVBT5O8o=
Date: Fri, 3 Jul 2026 11:41:33 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Johan Hovold <johan@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] USB serial fixes for 7.2-rc2
Message-ID: <2026070321-chewy-absolute-fe9a@gregkh>
References: <akd4FQzHuMKG7qQ1@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <akd4FQzHuMKG7qQ1@hovoldconsulting.com>

On Fri, Jul 03, 2026 at 10:51:33AM +0200, Johan Hovold wrote:
> The following changes since commit ab9de95c9cf952332ab79453b4b5d1bfca8e514f:
> 
>   Merge tag 'rust-7.2-2' of git://git.kernel.org/pub/scm/linux/kernel/git/ojeda/linux (2026-06-24 15:11:08 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git tags/usb-serial-7.2-rc2

Pulled and pushed out, thanks.

greg k-h
