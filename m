Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795109521;
	b=1psDDFftX2fcgln6XnBwCS4apHzBUrpS+8pmeKV6OiGaJKL5ZyUSsXPoINp9iGKXI0Kh
	 7x310obDQpy8hkypES8P/bgDfHHW/FcPGkJjPvDOV1CgjEj/5OG3QDWCY0CF8re4npGfr
	 ffccDMA4SYo+X8go3vatd+rDsy2emQLQNvZGR2DWpWuhri08NE3DhT2qiMlGO6ZDNz3qa
	 vmNYG2C+L9QO7TYgfQYOH63cOCIHhdkb3ar5HS3rnx/SH1kMj2zG7EY2gWvJB5mQN0/JT
	 qcueKDhikubo7D84ynbhqBp3/0O/HfGsMPSGGDZkn2Bq5V9oHM8eO6SEtpEFU5J+61g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795109521;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=jVi3UhbZbIRmNHykTC02JuXpXx1D12/Y28qWibE0xa4=;
	b=NvdOYQej/tR74zuldqMzOrIZKNTImxqjizG63nv60N7Cxx4sT/gVaZ847ARLQW2NR4HW
	 EDeDeWLOi+6CSXGI8oTY8RY6l3Q2TcGsAXAfuHjewzcEjXC7iaJX1QAy0t1/n63rEm7/e
	 cPZFAsNXRTgbzEjgHWeeIpeQniTFYy0zxdzhc0kPrh0tJEr6+JSwi6cuEkJuqeQsXA48e
	 w69GCxMh8Y3qArUb1MHpPsfJq9pa1tuDWuQm4M12ZX86KM0M7CLhwGIkw/Stc9B2BaUc4
	 cR4QwHTOeTfrHFimPUFabBga06+E5uRndDNutrMWTI9LQVgrZ8w9593V418D2wta6Ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PeUvGez+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B911A606A324
	for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 17:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PeUvGez+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2442D1F000C6;
	Thu, 19 Nov 2026 17:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795109521;
	bh=jVi3UhbZbIRmNHykTC02JuXpXx1D12/Y28qWibE0xa4=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=PeUvGez+OFC9z6Ak+G6j2bZ/vZw0D9sAATEqLmRCbHINcDWWa/8tBix40+xeZYapE
	 AzBuWpCaga0CtKQh/2jIbkfrBIn+2eNJkQMVd9HYnCqCmYLrusewoKpF4PFBCptzY1
	 BCBX6LffHIEbtbuR044mRthhL6ybcDhMaLS7CDbFifRfmWu3Mg1DQCve/kiJ0X+n5J
	 RNqRoRM/p1tYvAE/mB7bBy8ZAnrq7UZxwRvDyBc6XCfNRNfcEPujW0HdXOvMFzRykE
	 zKBt12FVy23k4L0uPI2JdU07sGWd6ltjp7Ig1942IlRyTbxchK5RrVQIu8w24jnBrZ
	 MbTFxbiLuNN2g==
Message-ID: <sashiko-outbox-223699@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 01/18] thunderbolt: Avoid leaking of DMA tunnel after
 XDomain removal
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mika Westerberg" <mika.westerberg@linux.intel.com>, linux-usb@vger.kernel.org
In-Reply-To: <20261119171232.1616316-2-mika.westerberg@linux.intel.com>
References: <20261119171232.1616316-1-mika.westerberg@linux.intel.com>
 <20261119171232.1616316-2-mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 17:32:00 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found no new issues
in this patch, but noticed 1 related pre-existing issue it does not
introduce:
- [High] thunderbolt: use-after-free of unplugged xdomain via
  tb_xdomain_resume() [1]
--

commit 2656e124696e0ac2d72fefe13421cb4187bc49b6
Author: Mika Westerberg (Intel) <westeri@kernel.org>

thunderbolt: Avoid leaking of DMA tunnel after XDomain removal

This commit moves the xd->is_unplugged checks and adapter lookups under
tb->lock in tb_approve_xdomain_paths() and tb_disconnect_xdomain_paths()
to prevent creating or leaking DMA tunnels while an XDomain is being
unregistered.

> diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
> index 418ad0a61a5de..655bcc699410e 100644
> --- a/drivers/thunderbolt/tb.c
> +++ b/drivers/thunderbolt/tb.c
> @@ -2336,12 +2336,18 @@ static int tb_approve_xdomain_paths(struct tb *tb=
, struct tb_xdomain *xd,
>  	struct tb_switch *sw;
>  	int ret;
> =20
> +	mutex_lock(&tb->lock);
> +
> +	/* The XDomain is going away so no new tunnels allowed */
> +	if (xd->is_unplugged) {
> +		ret =3D -ENODEV;
> +		goto err_unlock;
> +	}

[Severity: High]
This problem wasn't introduced by this patch, but can tb_xdomain_resume()
trigger a use-after-free on an unplugged XDomain [1]?

Commit a8937f35cf39 ("thunderbolt: Remove XDomain from the bus without
holding tb->lock") deferred unregistering unplugged XDomains from
tb_resume_noirq() to tb_complete().  Because xd->dev remains registered
during the intervening dpm_resume phase, tb_xdomain_resume() runs without
checking xd->removing or xd->is_unplugged and restarts xd->state_work
after tb_xdomain_remove() has already stopped it:

CPU0                                    kworker
tb_resume_noirq()
  ...
  tb_xdomain_remove(xd)
    xd->removing =3D true
    stop_handshake(xd)

tb_xdomain_resume(&xd->dev)
  start_handshake(xd)
    queue_delayed_work(..., &xd->state_work, ...)

tb_complete()
  ...
  tb_xdomain_unregister(xd)
    device_unregister(&xd->dev)
      tb_xdomain_release(&xd->dev)
        kfree(xd)
                                        tb_xdomain_state_work()
                                          xd->...  <-- use-after-free

[1] https://sashiko.dev/#/bug/linux-e4eef44b-8ad5-49c0-ac52-81edebd4fd36

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119171232.1616=
316-1-mika.westerberg@linux.intel.com?part=3D1
