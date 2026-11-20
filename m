Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795171883;
	b=jpVJ3FJKIsXAl+eBL35QPlKqS8tBVts9oP/zqxyt22qqQFAvr+CLirSMStZ85j2mYtOd
	 8u056FJQ4uoEk8FlQfyxCwoXGzfySaKE12hkGsxPm4ElT24o0pvw4BrJbJnXA1I1KXnpx
	 MH3xrCUVpQwUh3t/4LKibTVloX34KNL1GsmkXXrhtUB2hIeL/PezvQY23J3vuitxGAKEf
	 4+6VWPPA5blgOPXJ3Go+lpEHzgdbrJHCbj+yatkZ9bMtBVI4f6L8365Zk0B6oVB6GF4hs
	 cT2E721+Hfzv3Y8bATPz5b1UJ1sLtPIaMXiOg7m83SQ3v0HqAlK3GPCL8f/HODSCkfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795171883;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=ZLa+aRA6A2wWEmJd3bWUKytPI54QN5Z7JZx26uLOZoY=;
	b=JuQcH83vFkaDVtFilhtsx/wMZ/Y0y91HXnboQzbTn2U2YYEd3bu2SGSWX4tGH1dXx0zE
	 z9fj0MKrITRghCWrXSX/1zzzBCT6zTnr+ICqGNLQet9lN7CG3KDBXZ4EtW+qpxhh+MgAk
	 XWGb7CVdcUbLblmY4X8Q2rFLi2qDfAl5d9C5DOwkdNQwzUwChJfhX6wTNDMpIxKQij8ru
	 SBA5QneEH4xLnTK6wN052n1q2tOG5A+/pRay6ilcZyWCyAYyIty3VWL4tnGAcdGWyEFDa
	 UULqK6A5H2aDAeQPOtrIqNMq25e2ccCXQMjlQJF6JIQ/7hPkyXhOtgMNaILo+Jveseg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=cAg2RYBA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B9E1606A336;
	Fri, 20 Nov 2026 10:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=cAg2RYBA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1693F1F000C0;
	Fri, 20 Nov 2026 10:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795171882;
	bh=ZLa+aRA6A2wWEmJd3bWUKytPI54QN5Z7JZx26uLOZoY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cAg2RYBAIgWHCi6NCaYYjti981XU82ZFkyIONKMdycKZfZ0ErvO4STisJrbXl6rs5
	 BPJuUJvdd+PHxuyoc8t9AoN8HU7roSGDPQ1dAOTLgKYR6kY8Hr5B7sdlI7Rw2eQCZ+
	 kS4IrQS0lgrTdKTe26vXWQC1TDAtAiUDK2gsQboc=
Date: Fri, 20 Nov 2026 11:51:20 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: nicholasfvelten@gmail.com
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	Nguyen Quang Le Kien <khiemtranzo532001@gmail.com>,
	syzbot+098999e05b6b877c01b3@syzkaller.appspotmail.com
Subject: Re: [PATCH] usb: gadget: f_phonet: don't free the net_device on
 failed registration
Message-ID: <2026112007-explicit-nanny-5e06@gregkh>
References: <20261014-fix-phonet-free-on-failure-v1-1-3c93c48e7527@gmail.com>
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
In-Reply-To: <20261014-fix-phonet-free-on-failure-v1-1-3c93c48e7527@gmail.com>

On Wed, Oct 14, 2026 at 09:03:57AM -0300, Nicholas Velten via B4 Relay wrote:
> From: Nicholas Velten <nicholasfvelten@gmail.com>
> 
> gphonet_register_netdev() frees the net_device when register_netdev()
> fails. That made sense when the device was registered once at module
> load, but since the conversion to the function interface the device is
> allocated in phonet_alloc_inst(), stored in phonet_opts->net and
> registered from pn_bind(), which only sets phonet_opts->bound on
> success. After a failed registration opts->net therefore points to
> freed memory, and the next bind writes to it in gphonet_set_gadget():
> 
>   BUG: KASAN: slab-use-after-free in pn_bind+0x49a/0x500
>   Write of size 8 at addr ffff888003e785d8 by task gadget_rereg/86
>   Call Trace:
>    pn_bind
>    usb_add_function
>    configfs_composite_bind
>    ...
>   Allocated by task 175:
>    alloc_netdev_mqs
>    phonet_alloc_inst
>    ...
>   Freed by task 86:
>    kfree
>    device_release
>    kobject_put
>    gphonet_register_netdev
>    pn_bind
>    ...
> 
> This is the "slab-use-after-free Write in pn_bind" that syzbot reports:
> its free stack also goes through gphonet_register_netdev() from
> pn_bind(), so the object is freed by the failed bind itself rather than
> by a racing phonet_free_inst().
> 
> Stop freeing the device there; it belongs to the function instance and
> phonet_free_inst() already frees it when it was never registered.
> Dropping the free alone would make the retry hit the BUG_ON() in
> register_netdevice(), because a registration that fails after
> netdev_register_kobject() leaves the device NETREG_UNREGISTERED and it
> cannot be registered again, so also refuse to register a device that is
> not NETREG_UNINITIALIZED, as gether_register_netdev() does for the
> Ethernet functions.
> 
> Reproduced with fail-nth fault injection on the allocations of the
> write() to the gadget's UDC attribute, binding again without injection
> after each failed bind, with a fresh phonet function instance per
> iteration: without this change KASAN reports the use-after-free above at
> the 15th injected allocation; with it, 300 iterations complete with no
> KASAN report, and removing the function instance afterwards frees the
> device without errors.
> 
> Fixes: fcbdf12ebef7 ("usb: gadget: f_phonet: convert to new function interface with backward compatibility")
> Reported-by: syzbot+098999e05b6b877c01b3@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=098999e05b6b877c01b3
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Nicholas Velten <nicholasfvelten@gmail.com>
> ---
> This is the f_phonet counterpart of my u_ether fix for the same retry
> pattern:
> https://lore.kernel.org/all/20261014-fix-gadget-netdev-reregister-v1-1-0fb91999da06@gmail.com/
> Both patches are independent and apply on their own.
> 
> Nguyen, Cc'ing you because your "usb: gadget: f_phonet: fix
> use-after-free in pn_bind" v3 targets the same syzbot report. The lock it
> adds covers a pn_bind() vs phonet_free_inst() race, but the free stack in
> the syzbot report (and in my reproduction) is in pn_bind() itself, via
> gphonet_register_netdev(), so I don't think it addresses this
> use-after-free. The two changes touch different functions and do not
> conflict.
> 
> The reproducer is a small fail-nth program; I can post it if useful.
> Not tested on architectures other than x86_64.
> ---
>  drivers/usb/gadget/function/f_phonet.c | 17 +++++++++++------
>  1 file changed, 11 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/usb/gadget/function/f_phonet.c b/drivers/usb/gadget/function/f_phonet.c
> index b1ee9a7c2..43b10ce36 100644
> --- a/drivers/usb/gadget/function/f_phonet.c
> +++ b/drivers/usb/gadget/function/f_phonet.c
> @@ -722,13 +722,18 @@ void gphonet_set_gadget(struct net_device *net, struct usb_gadget *g)
>  
>  int gphonet_register_netdev(struct net_device *net)
>  {
> -	int status;
> +	/*
> +	 * A register_netdev() that failed after netdev_register_kobject()
> +	 * leaves the device NETREG_UNREGISTERED, and it can never be
> +	 * registered again. pn_bind() retries on every bind until the
> +	 * device is registered, so refuse instead of hitting the BUG_ON()
> +	 * in register_netdevice(). The net_device is owned by the function
> +	 * instance and freed by phonet_free_inst().
> +	 */

Don't write huge comments when they are not needed.
