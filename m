Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795175543;
	b=liOknKXjkdv6ibTxeW20CWJs0h6B2U0yv/wpQxzsi9evhP80tBNtkFNwPeZaJIS3CGMg
	 mGJ3Fk6lTdFnYkPAmQiMLWAwppynpaqJOXpfBT5ONH0cAA2W3pD7Igy2dEwBGmsy4OK09
	 BKn50LN4BWkFwXr5iPqIx5ngWt7jxIo5dXl+0C/7RJrMjNQnz7PkyHcIu5gAS0R1TCsXu
	 xi1zoj3+1eVe0YkHC8bfzlTz9BPEpRBYfGlLAPQMDsPqv2d35T3wvt6ve8hKs5pKF+RKe
	 wNrNVXN1zXtym86xsNjHMr0EwCLUDsfRUL9t1lb/Ove0JvMz1Z7krfrHfUGPuMX7Ttw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795175543;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=qeDa6/dGBO7PkG4MthALQtdi8l3BzeWkfWxZJ7VMsS8=;
	b=ljz7Nid6fgF4Ov/+F4V+EPDAQCNJm1Optjzqkf2mK8d39aZtrmhgX0cRE6OxjVpTLpUW
	 tV2gZt8aAIXG4UlOcKIdJMO6Xru5ObvEZZ/hWAf2YUHW/GOrGXBzhJxuQfw5Lq28pZK6n
	 lNZEFTiuYUVpC9Hflfwfwm1EF0ZRmJc2aR62DIu5Dpqiu4YGjgSMPZtoyenRG+AuLW6iz
	 9kbQl3ArD73rfJMpeR1k1MfW7ImjA8snE24nEjexzPG2Hpzsit/ArGZepiTg5+elay1g2
	 +0OXUHWWfGbHEpvHJglSF2qESsGyT4HugwDkxHvHew/+VoKaWl7SwC1Nmp/Aq/zWiZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=mtioLA+f;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA6B3606A320;
	Fri, 20 Nov 2026 11:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=mtioLA+f
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DD9B1F000C6;
	Fri, 20 Nov 2026 11:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795175543;
	bh=qeDa6/dGBO7PkG4MthALQtdi8l3BzeWkfWxZJ7VMsS8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mtioLA+fPf8QEg8Z8KDN+5CO5YVh1+6umoWhv0U1e7XIP8zpRkhK6bSGX9Gw1nFDv
	 YMijEQMFw8ySLKjxwUtSeqP0EAofUR6HXq2theWz+G3NfrH++yNDtNxh6RENeuIQVl
	 9Bp0H04YV0h8DyEkubCnDuuD/HtfFy9tuvM1wpaQ=
Date: Fri, 20 Nov 2026 12:52:20 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Keisuke Tsukuda <catnyaaan@outlook.com>
Cc: Alan Stern <stern@rowland.harvard.edu>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"syzbot+a83a5a1ba9ff57935171@syzkaller.appspotmail.com" <syzbot+a83a5a1ba9ff57935171@syzkaller.appspotmail.com>,
	"syzbot+d31109047baed8f3b590@syzkaller.appspotmail.com" <syzbot+d31109047baed8f3b590@syzkaller.appspotmail.com>
Subject: Re: [PATCH v2 1/2] usb: gadget: composite: avoid warning on aborted
 delayed status
Message-ID: <2026112008-hungry-scorer-f2b0@gregkh>
References: <20260908203348.95825-1-tkdkei@outlook.jp>
 <20260908203348.95825-2-tkdkei@outlook.jp>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908203348.95825-2-tkdkei@outlook.jp>

On Tue, Sep 08, 2026 at 08:33:53PM +0000, Keisuke Tsukuda wrote:
> A SET_CONFIGURATION request that disables the current configuration, or a
> disconnect, can abort a control transfer whose status stage was delayed by
> a function driver. The asynchronous function work can nevertheless finish
> later and call usb_composite_setup_continue() after reset_config() has
> cleared delayed_status.
> 
> This is an expected consequence of aborting the old control transfer, and
> does not require a kernel warning. Keep the diagnostic available under
> dynamic debug and ignore the obsolete completion as before.
> 
> Fixes: 2bac51a1827a ("usb: gadget: composite: reset delayed_status on reset_config")
> Reported-by: syzbot+a83a5a1ba9ff57935171@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=a83a5a1ba9ff57935171
> Signed-off-by: Keisuke Tsukuda <tkdkei@outlook.jp>
> ---
>  drivers/usb/gadget/composite.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/gadget/composite.c b/drivers/usb/gadget/composite.c
> index df39e34..1b22381 100644
> --- a/drivers/usb/gadget/composite.c
> +++ b/drivers/usb/gadget/composite.c
> @@ -2740,7 +2740,7 @@ void usb_composite_setup_continue(struct usb_composite_dev *cdev)
>  	spin_lock_irqsave(&cdev->lock, flags);
>  
>  	if (cdev->delayed_status == 0) {
> -		WARN(cdev, "%s: Unexpected call\n", __func__);
> +		DBG(cdev, "%s: Ignoring obsolete call\n", __func__);
>  
>  	} else if (--cdev->delayed_status == 0) {
>  		DBG(cdev, "%s: Completing delayed status\n", __func__);
> -- 
> 2.50.1 (Apple Git-155)
> 

Please use Linux to send this, it's corrupted as-is for some reason.

greg k-h
