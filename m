Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795171813;
	b=Y6iDkn81NcE4z2DFUcg2MZODonE+DEmKDkxR20yX7fNcBE5QE8Ng+4SXQ31bXVqx63WN
	 v7BAT2WRXcZZnCe7plZET4jw737w8o05cAu75rK7unRc58fOU9oa+VbQZp1MjLHdPsG4G
	 Wf57sg5CdCQLuYxVQdNcCToLJMVpQp94JTC34+Lm6ix3IdbooIxcRCe0vNUaiFHoSymT6
	 i2pvSGg5UnkknNTGZQ5q+9l6QwXJ6wuHeyVRXcsdTP1Idl2mM/JeqB8fS1FZO3MrefDrz
	 Lzwm4tlxKJER185NugDhi8BERc9srVpXyQfRm3MGJJYB1aH/OUME+fOldYrRt8I0sLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795171813;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=t32/Vj4E+pdMjLhw/nyfYrLcflIqAL805UQFbxCTQpo=;
	b=2zfsEgOpnYnmhQfRVZ9y5UI4Cw2bB6IZlATL9/U4WRFkn/ZnLPnOwHYmI0tTg/PjmM8y
	 7N73lvRdFIuefpsqt5p1oi9BoHJHtatP5TfFplCcdndI8f1W+5BdIy90scBS7ADC0ZSCE
	 XJp/CpepQxrop/8WXsK/1pFOWc9tEACB01IuHabQ8CRi+us2SkfFs3idPfrDkcQOvN1OY
	 F7ZQU2JJCWry4+nJ5Zf6mGwe/41gBPDULUZRTeIUoj5HknQC5w8CbdIGyLbmw32HY0e3k
	 Z/we58C4/ySBZTQrXABgDSyCyqqt1ViyPPP+7QOu/1UWgLVoWbEs7xMvC2PURqMBdcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b="t/tSR4o/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D602606A320;
	Fri, 20 Nov 2026 10:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=t/tSR4o/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BCDD1F000C6;
	Fri, 20 Nov 2026 10:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795171812;
	bh=t32/Vj4E+pdMjLhw/nyfYrLcflIqAL805UQFbxCTQpo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=t/tSR4o/9B71uFR0YCZHmfoIA/EiZ2XrYHhZflAyEahss/3hQj9MTHA0BwJiIgg8k
	 nxj084LQV+7zV1WPMUPnZcTdSMB5Nkr50kM8rX4mbunpJ586GrZwbAhWL689wWrepI
	 tbR4QkawHSDdTbirIcf809ucY7I3hrylLG8OE2lU=
Date: Fri, 20 Nov 2026 11:50:09 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: nicholasfvelten@gmail.com
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	syzbot+85ede281798faf736677@syzkaller.appspotmail.com
Subject: Re: [PATCH] usb: gadget: u_ether: refuse to re-register a failed
 net_device
Message-ID: <2026112050-revision-essence-daee@gregkh>
References: <20261014-fix-gadget-netdev-reregister-v1-1-0fb91999da06@gmail.com>
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
In-Reply-To: <20261014-fix-gadget-netdev-reregister-v1-1-0fb91999da06@gmail.com>

On Wed, Oct 14, 2026 at 08:06:38AM -0300, Nicholas Velten via B4 Relay wrote:
> From: Nicholas Velten <nicholasfvelten@gmail.com>
> 
> When register_netdevice() fails in or after netdev_register_kobject(),
> it returns an error but leaves the net_device in NETREG_UNREGISTERED.
> Such a device can never be registered again; the only valid thing to do
> with it is free_netdev().
> 
> The configfs Ethernet functions (ECM, EEM, NCM, RNDIS and subset)
> allocate their net_device once per function instance and register it
> from the bind callback, retrying on every bind for as long as the device
> is not registered (formerly tracked by a "bound" flag, now by
> device_is_registered()). After a failed registration the next bind
> therefore calls register_netdev() on an NETREG_UNREGISTERED device and
> hits the BUG_ON() at the top of register_netdevice():
> 
>   kernel BUG at net/core/dev.c:11440!
>   Oops: invalid opcode: 0000 [#1] SMP KASAN NOPTI
>   RIP: 0010:register_netdevice+0xc21/0x1d00
>   Call Trace:
>    register_netdev
>    gether_register_netdev
>    ncm_bind
>    usb_add_function
>    configfs_composite_bind
>    gadget_bind_driver
>    ...
>    gadget_dev_desc_UDC_store
> 
> syzbot hits this by binding a gadget from a memory cgroup with a tiny
> limit, which makes the memcg-accounted allocations in
> netdev_register_kobject() fail. That is why its bisection lands on
> commit 425b9c7f51c9 ("memcg: accounting for objects allocated for new
> netdevice"): that commit made the failure reachable that way, while the
> retry itself is much older.
> 
> Refuse to register a net_device that is not NETREG_UNINITIALIZED in
> gether_register_netdev(), which all of these functions use, so that the
> bind fails with -EINVAL instead of crashing. The function instance has
> to be recreated to get a usable net_device again.
> 
> Reproduced with fail-nth fault injection on the allocations of the
> write() to the gadget's UDC attribute, binding again without injection
> after each failed bind, using a fresh function instance per iteration:
> without this change NCM, ECM and RNDIS hit the BUG_ON() at the 16th
> injected allocation; with it, 400 iterations for NCM and 300 each for
> ECM, EEM, RNDIS and subset complete with no BUG or KASAN report.
> 
> Fixes: 40d133d7f542 ("usb: gadget: f_ncm: convert to new function interface with backward compatibility")
> Reported-by: syzbot+85ede281798faf736677@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=85ede281798faf736677
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Nicholas Velten <nicholasfvelten@gmail.com>
> ---
> The syzbot C reproducer did not reach the gadget bind in my virtme-ng
> guest (its sandbox setup appears to fail there), so I reproduced with a
> small fail-nth program instead. I can post it if useful.
> 
> Not tested: architectures other than x86_64, and the legacy (non-configfs)
> gadgets that also call gether_register_netdev() (g_ether, g_multi,
> g_ffs); they register once from their bind path and should be unaffected.
> 
> f_phonet has the same retry pattern but a different outcome:
> gphonet_register_netdev() calls free_netdev() on failure while
> phonet_opts->net still points at the device and phonet_opts->bound stays
> false, so the next bind uses a freed net_device. I left it out of this
> patch to keep it to one change and because f_phonet is being changed by
> "usb: gadget: f_phonet: fix use-after-free in pn_bind" (v3, not yet
> applied); I can send a separate fix on top of that if wanted.
> 
> Also touching gether_register_netdev(), without conflict:
> "usb: gadget: u_ether: Fix NULL pointer deref in debug logging".
> ---
>  drivers/usb/gadget/function/u_ether.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/usb/gadget/function/u_ether.c b/drivers/usb/gadget/function/u_ether.c
> index 59d85d6a8..1f4ac7078 100644
> --- a/drivers/usb/gadget/function/u_ether.c
> +++ b/drivers/usb/gadget/function/u_ether.c
> @@ -865,6 +865,17 @@ int gether_register_netdev(struct net_device *net)
>  
>  	if (!net->dev.parent)
>  		return -EINVAL;
> +
> +	/*
> +	 * A register_netdev() that failed after netdev_register_kobject()
> +	 * leaves the device NETREG_UNREGISTERED, and it can never be
> +	 * registered again. The function drivers retry on every bind while
> +	 * the device is not registered, so refuse instead of hitting the
> +	 * BUG_ON() in register_netdevice().
> +	 */

LLMs love to write huge comments.  Don't do that.
