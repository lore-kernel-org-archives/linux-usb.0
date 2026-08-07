Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D689A3DB629;
	Fri,  7 Aug 2026 10:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786097512; cv=none; b=RTi2j1gSXq605HQhCW5gALav42uohnNaUv4iZ5M0iVbFbYIOd3k363B/Mi8RtVO9BRr2PDrGEUHUL846JLHv99FwNybJ2j/tdfKNarqq8xfb6MiIdrev2zAhlRvANAm5d0F5JNLZ0LBhI4dj3LRy0qcyn9bIq+lfyUWOKxJ3PyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786097512; c=relaxed/simple;
	bh=Ebwf5LHputuTSxtGyqzf5bO13zEozfK3BHNLdSqgbu4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N6i5ra7SeepbzDP47LB3Z4Dn+ACT00KPyBiFy2XE8KZl+9DHFZI/a2Y1iWmoWIqTWtobyQrOwnlAuV96bPzSRCX5Aa4hT9mCXBjAtAcXeBlm/1f9HRAIzSG6MD15o0ZFYWOWJ1ObAWo5croft5dJ21tP5MRIw10sWYWv27INlRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cl1E0/XI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cl1E0/XI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 439501F000E9;
	Fri,  7 Aug 2026 10:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786097510;
	bh=chBOxfxrsy9R9xkuQ2YnIlcTAWgi3sVUnBACSCudAU4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cl1E0/XISB2autCymuTdKhT6FfkbgwqbB0zBBvWDMN+pu5fK7sgfdlxUiN43ePfaL
	 +mt8tzwk41imJTrzSa2DgbnfNNLJu5ALUqibt+t5sr5Oj5Fz0jTkIx2ffiKVXTyiqY
	 71Og3vJID8Eq6Q3+/iMeMQD8wdkpJa/Lw7nSekVSPfk4GhML7+y/ZvKNhZ5AE+1g/Q
	 xxePnSnM3JxZmz+r+RoMda5sxeUZ/m6MP7w5D6NqTlY6Ps3wAUmUwvfJHMoMHo/S5F
	 vXPhtoh1SQhvwJMS0vyL62j5YKfbWI+EtHXJpTMBi8MRBz9wFiH0xKEgUxwV6GtmWQ
	 YH1C5FikO38FQ==
Date: Fri, 7 Aug 2026 03:11:48 -0700
From: Peter Chen <peter.chen@kernel.org>
To: Jie Deng <dengjie03@kylinos.cn>
Cc: pawell@cadence.com, gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: cdns3: Fix NULL pointer dereference in
 cdns3_pci_probe
Message-ID: <anWvZMPQ5ARWMu3o@hu-petche-lv.qualcomm.com>
References: <20260806022258.3764848-1-dengjie03@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260806022258.3764848-1-dengjie03@kylinos.cn>

On 26-08-06 10:22:58, Jie Deng wrote:
> The Cadence USBSS controller is a two-function PCI device. The first
> probed function allocates the driver data and stores it with
> pci_set_drvdata(), while the second function reuses it via
> pci_get_drvdata() when pci_is_enabled() reports that the first
> function has already been probed.
> 
> When the second function is probed while the first one has been
> enabled but has not yet set its driver data, pci_get_drvdata()
> returns NULL, and the subsequent wrap->devfn assignment dereferences
> a NULL pointer and crashes the kernel.
> logs:
> Call trace:
>   cdns3_pci_probe+0xa4/0x300
>   local_pci_probe+0x44/0xa8
>   pci_call_probe+0x54/0x158
>   pci_device_probe+0x84/0x100
>   really_probe+0x184/0x3d0
>   __driver_probe_device+0x80/0x178
>   driver_probe_device+0x44/0xe8
>   __driver_attach+0xec/0x1f8
>   bus_for_each_dev+0x7c/0xe0
>   driver_attach+0x28/0x38
>   bus_add_driver+0x110/0x238
>   driver_register+0x64/0x128
>   __pci_register_driver+0x50/0x60
>   cdns3_pci_driver_init+0x28/0x38
>   do_one_initcall+0x5c/0x280
>   do_initcalls+0x104/0x1d8
>   kernel_init_freeable+0x140/0x218
>   kernel_init+0x28/0x1f8
>   ret_from_fork+0x10/0x20
> 
> Return -EPROBE_DEFER in this case so that probing is retried after
> the first function has completed its probe.
> 
> Fixes: 8bc1901ca7b0 ("usb:cdns3 Add Cadence USB3 DRD Driver")

The patch is okay, but the Fixes tag is wrong, 8bc1901ca7b0 was reverted,
you may use below tag:

Fixes: 7733f6c32e36 ("usb: cdns3: Add Cadence USB3 DRD Driver")

After above fix, feel free add:
Acked-by: Peter Chen <peter.chen@kernel.org>

Peter

> Signed-off-by: Jie Deng <dengjie03@kylinos.cn>
> ---
>  drivers/usb/cdns3/cdns3-pci-wrap.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/usb/cdns3/cdns3-pci-wrap.c b/drivers/usb/cdns3/cdns3-pci-wrap.c
> index eb5760f75b9d..fd06a3d8e638 100644
> --- a/drivers/usb/cdns3/cdns3-pci-wrap.c
> +++ b/drivers/usb/cdns3/cdns3-pci-wrap.c
> @@ -96,6 +96,11 @@ static int cdns3_pci_probe(struct pci_dev *pdev,
>  
>  	if (pci_is_enabled(func)) {
>  		wrap = pci_get_drvdata(func);
> +		if (!wrap) {
> +			dev_err(&pdev->dev,
> +				"second function not initialized, retrying\n");
> +			return -EPROBE_DEFER;
> +		}
>  	} else {
>  		wrap = kzalloc_obj(*wrap);
>  		if (!wrap)
> -- 
> 2.25.1
> 

-- 

Thanks,
Peter Chen
