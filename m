Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9E29351C10
	for <linux-usb@vger.kernel.org>; Wed,  7 Oct 2026 03:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791342342; cv=none; b=E9LunqMcVyJV8DJDU76lTXfnpjsGHsvRrBclkPBcda6TUS5zZrYaMnOwnu6xZLzHdc1v5udEthxhvUY4r6ncQOwSupKyDIGRx6pKFq7262cwENZGmm/10JenxVRakFCjCurIn+To4UmRnzhR7gKa9XpyyAipM9mHytCND+tbS6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791342342; c=relaxed/simple;
	bh=Ol4FBbf3oy8JGhQfBAaOsl4XgbiDvmXdYYUdkCPVwcQ=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=HF+yE6SaX2MIdZ5QyYBB+5dErxsDUX2JzUz53BFaxTmgflVKyOq2dUu+3xY479t6agTHsFpC4W5fFgvNal2ZhQ7hi9XfQDz3qbt/gCUr0wc5kHcgSBq7YwGsnWAOCmiRrmHaelKm3644EcnZVjIWELIGX4q66rYfnsXYDSOF/Xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fmAsZiiY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fmAsZiiY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CFC11F0089D;
	Wed,  7 Oct 2026 03:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791342341;
	bh=cf5Dyfz3nfTI/ddbw6xGRyKf+yIJstgMAt3r+QVZObE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fmAsZiiY20GGouDcfJufcmZwRQuqBrzpGzqhQ0e5YYj87B8CNbQrOtABdJ8lS3Wap
	 B8boaNHsNvefbDCzQETWmLn1EnvIa8JhOlJnp727N8A8jRPQsYab+6LhF0qjp49aOc
	 /pyt1TshvoJwkhzyUf6D7NjBYeTfewrugOO97fjqFcs8UEucYAvM8uG0tNnS+9pGvJ
	 xsVrUfA6Hw7W4VWmgA9Gqr9grTPEqzsqMNYrNg9MGYY3f/uZ/LZ6aMKuR+qOa1n8Gz
	 UMTcIhEO3Vn/EpRtnTujN7m85kWjVuy38U9OvK/YiyTzWhAK2m0D3eihYxyFnKmr/x
	 v5JURooUPjXpQ==
Message-ID: <sashiko-outbox-162603@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v17 03/13] ax88179_178a: Split driver into
 library and device specific code
Reply-To: sashiko-reviews@lists.linux.dev
To: "Birger Koblitz" <mail@birger-koblitz.de>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261006-ax88179a-v17-3-252814fe35ea@birger-koblitz.de>
References: <20261006-ax88179a-v17-0-252814fe35ea@birger-koblitz.de>
 <20261006-ax88179a-v17-3-252814fe35ea@birger-koblitz.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 07 Oct 2026 03:05:40 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] net: deadlock in ax88179_change_mtu() due to recursive rtnl_lock()
--

commit bbebfb7ee3c4e848c7cc7bf989fd290de2e0c6f1
Author: Birger Koblitz <mail@birger-koblitz.de>
Subject: ax88179_178a: Split driver into library and device specific code

This commit splits the ax88179_178a module code into a common library and
device-specific code. It also renames the module to ax88179 and adds an
alias to the old name.

> diff --git a/drivers/net/usb/ax88179_lib.c b/drivers/net/usb/ax88179_lib.c
> new file mode 100644
> index 0000000000000..522ea2447a111
> --- /dev/null
> +++ b/drivers/net/usb/ax88179_lib.c
[ ... ]
> +int ax88179_change_mtu(struct net_device *net, int new_mtu)
> +{
> +	struct usbnet *dev =3D netdev_priv(net);
> +	u16 tmp16;
> +
> +	WRITE_ONCE(net->mtu, new_mtu);
> +	dev->hard_mtu =3D net->mtu + net->hard_header_len;
> +
> +	rtnl_lock();
> +	if (net->mtu > 1500) {

[Severity: High]
Does acquiring the RTNL lock here lead to a deadlock?

The core network stack already holds the RTNL mutex when it invokes the
.ndo_change_mtu callback (which is registered as ax88179_change_mtu in
ax88179_netdev_ops).

Since the RTNL mutex is non-recursive, attempting to acquire it again from
the same thread here in ax88179_change_mtu() will cause an immediate hang
whenever an MTU change is attempted on the network device.

> +		ax88179_read_cmd(dev, AX_ACCESS_MAC, AX_MEDIUM_STATUS_MODE,
> +				 2, 2, &tmp16);
> +		tmp16 |=3D AX_MEDIUM_JUMBO_EN;
> +		ax88179_write_cmd(dev, AX_ACCESS_MAC, AX_MEDIUM_STATUS_MODE,
> +				  2, 2, &tmp16);
> +	} else {
> +		ax88179_read_cmd(dev, AX_ACCESS_MAC, AX_MEDIUM_STATUS_MODE,
> +				 2, 2, &tmp16);
> +		tmp16 &=3D ~AX_MEDIUM_JUMBO_EN;
> +		ax88179_write_cmd(dev, AX_ACCESS_MAC, AX_MEDIUM_STATUS_MODE,
> +				  2, 2, &tmp16);
> +	}
> +	rtnl_unlock();
> +
> +	/* max qlen depend on hard_mtu and rx_urb_size */
> +	usbnet_update_max_qlen(dev);
> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261006-ax88179a-v=
17-0-252814fe35ea@birger-koblitz.de?part=3D3
