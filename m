Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74A09361640;
	Sat, 22 Aug 2026 09:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787390847; cv=none; b=c23kcrGYaci+qR4Xo08XgJjCObEn3kYnVwGxvRQF5/FRbm4wOiPlv3kOGxugB3P2v5LzGdlSQkPo+EojJ1gGtYjbkLDjgK6WMJ33q6YlYcFb+/czGM49iIXEnP0KxPcvt9qs8dQLMZZCi8R5okSX3gdvUzAy1quC5ksc+tM1WLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787390847; c=relaxed/simple;
	bh=B8IJocKx+kmTTzBu3BdDtDIcLEbSWRE4V2ECI46rw3Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ttr7kr8gQS7Hsfq0oab1fjNack826SkGUR6prO4VYzOCfrKpxpWHcR2Ksdr181ecLXogm4vc0Uf7z9rnG/0wCUrDgprwVfEN+Yn6bMVXTsd4YWAlHpnbUP2cBcivWACiz0rAQy7xpC6Bj6TrBG9CFpDHfuU+7nAaI7VoAuSnKBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=jThCMWMm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="jThCMWMm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A3CD1F000E9;
	Sat, 22 Aug 2026 09:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1787390846;
	bh=SlxEW4ZEPJHz16tOwLaU/Lzua1z6Mo+0EP3uLL2aTXw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jThCMWMmJYIGa4i3fXGhp4/+nfewVOv+0bc0j2vpfbGgrSDuV9lAaXIz8WKiFesBT
	 MQYYT43NSmjSHyE/yvVQ/l0n6MPUGQ/q76lIKYgV+UFny9EzcHeiyD5JBehEsIHI5x
	 7XV5IWF9Zv+UJRfWr/txzfKEVP/1elLRi30vCyls=
Date: Sat, 22 Aug 2026 11:25:46 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Alexander Bendezu <alexanderbendezu10@gmail.com>
Cc: Andrzej Pietrasiewicz <andrzej.p@samsung.com>,
	Felipe Balbi <balbi@ti.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com,
	syzbot+3a0d6aa450317f25e501@syzkaller.appspotmail.com
Subject: Re: [PATCH] usb: gadget: f_phonet: fix out-of-bounds read in
 ifname_show
Message-ID: <2026082242-celery-circle-dee9@gregkh>
References: <20260822075230.70609-1-alexanderbendezu10@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260822075230.70609-1-alexanderbendezu10@gmail.com>

On Sat, Aug 22, 2026 at 07:52:30AM +0000, Alexander Bendezu wrote:
> The f_phonet_ifname_show() function incorrectly used gether_get_ifname(),
> which casts the net_device private data to 'struct eth_dev'. Since the
> Phonet gadget only allocates a small 'struct phonet_port' for its private
> data, this resulted in a KASAN slab-out-of-bounds read when accessing
> dev->ifname_set.
> 
> Fix this by safely reading the network device name directly using
> netdev_name() and dropping the u_ether.h include, completely avoiding
> the invalid struct cast.
> 
> Fixes: 0736390bea65 ("usb-gadget/f_phonet: use per-attribute show and store methods")
> Reported-by: syzbot+3a0d6aa450317f25e501@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3a0d6aa450317f25e501
> Signed-off-by: Alexander Bendezu <alexanderbendezu10@gmail.com>
> ---
>  drivers/usb/gadget/function/f_phonet.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/gadget/function/f_phonet.c b/drivers/usb/gadget/function/f_phonet.c
> index b1ee9a7c2e94..a17e74bcc07c 100644
> --- a/drivers/usb/gadget/function/f_phonet.c
> +++ b/drivers/usb/gadget/function/f_phonet.c
> @@ -13,6 +13,7 @@
>  #include <linux/module.h>
>  #include <linux/device.h>
>  
> +#include <linux/rtnetlink.h>
>  #include <linux/netdevice.h>
>  #include <linux/if_ether.h>
>  #include <linux/if_phonet.h>
> @@ -600,7 +601,13 @@ static const struct configfs_item_operations phonet_item_ops = {
>  
>  static ssize_t f_phonet_ifname_show(struct config_item *item, char *page)
>  {
> -	return gether_get_ifname(to_f_phonet_opts(item)->net, page, PAGE_SIZE);

So this has never worked at all?  How has no one noticed this in the
past decade?

> +	struct net_device *net = to_f_phonet_opts(item)->net;
> +	int ret;
> +
> +	rtnl_lock();
> +	ret = scnprintf(page, PAGE_SIZE, "%s\n", netdev_name(net));

sysfs_emit() please.

And what is the lock really doing here?  Why would this configfs file be
here if there was not a netdev present?

thanks,

greg k-h
