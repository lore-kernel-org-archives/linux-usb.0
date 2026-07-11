Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 180D94086A;
	Sat, 11 Jul 2026 05:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783746597; cv=none; b=L8redXUuzs9ByLKDbBvVzGbxPpzpwazkXLD3C30kxXE5mTtQ/P+ceEmB73OymU0UeybVgbwNrCaerAFl8RMB1GHxh6Ysf0bA4iLE6XGohh7mAeppcA+PqhIMFV3FMTucVbGZ7tZc6dQ0rz+4EOWQFkg7Oko37EkLXYxrIglCa0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783746597; c=relaxed/simple;
	bh=lAy/RgsT2wpbAhWa7S/WExOAY+ZCkHb5WXS9qkPOykQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NDqEbEjVUwxPf756RftWDTcrd1tFjYaGarHcQAJ4bI2cO4uRNiUQhZeCmeBcaArHjENZEneXfj4PIFq+RSzJfqn63MfbCx6E7ms8Ue1bXk+pjw+Z1RNbhOkzGgJVqimpQLpQfmxLmt+kJ19uKwx5JIzruWFuNqd3C9+Du4L7zac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=cZIQH1JU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="cZIQH1JU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32A511F000E9;
	Sat, 11 Jul 2026 05:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783746595;
	bh=Sku0Sz1UTXEHS0+/XZx6RluxHvP3qLN3CzEs/l10WHg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cZIQH1JUEUqfmlQf9/qdJIrne/BYZA59/ySB7SkWL0gzlQJSN8QAciTPemIUzQiYq
	 O2BomI3h4PLfNW5IZ4wWiKvomFYusMZH0kH+FDO2D3CNK8dygAd4VQ+aZlYFU2kcKg
	 9CfVJ/OUYJrxnQnJyL3yt2UPxZgM+L4GjbjdzM/U=
Date: Sat, 11 Jul 2026 07:09:51 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: Al Viro <viro@zeniv.linux.org.uk>,
	Michael Bommarito <michael.bommarito@gmail.com>,
	Sam Day <me@samcday.com>, Kees Cook <kees@kernel.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usb: gadget: f_fs: fix __le16 of wMaxPacketSize
Message-ID: <2026071124-gracious-spry-9b7b@gregkh>
References: <20260710145430.501893-1-ben.dooks@codethink.co.uk>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260710145430.501893-1-ben.dooks@codethink.co.uk>

On Fri, Jul 10, 2026 at 03:54:30PM +0100, Ben Dooks wrote:
> The wMaxPacketSize is __le16 type, fix the sparse warnings by changing
> the type.
> 
> Fixes the following sparse warnings:
> drivers/usb/gadget/function/f_fs.c:3346:32: warning: incorrect type in assignment (different base types)
> drivers/usb/gadget/function/f_fs.c:3346:32:    expected unsigned short [usertype] wMaxPacketSize
> drivers/usb/gadget/function/f_fs.c:3346:32:    got restricted __le16 [usertype] wMaxPacketSize
> drivers/usb/gadget/function/f_fs.c:3371:36: warning: incorrect type in assignment (different base types)
> drivers/usb/gadget/function/f_fs.c:3371:36:    expected restricted __le16 [usertype] wMaxPacketSize
> drivers/usb/gadget/function/f_fs.c:3371:36:    got unsigned short [usertype] wMaxPacketSize
> 
> Fixes: dcc03cef0fd8 ("usb: gadget: f_fs: preserve wMaxPacketSize across  usb_ep_autoconfig() call")

This isn't a valid git id :(

