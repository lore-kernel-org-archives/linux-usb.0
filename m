Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795125246;
	b=ecjATVV0eNtx0nUYaSqUST4v0tn0PtL4kLlyLI4PQRJN4awY3S3GL+pnBtsF/od/2wTr
	 GDRYriS7JaNXSBm4PSys0lXl0HlRNABkRrlDyhGJXlS7/YrcWIRlj1G2DZymXJuc6IG5T
	 kB6+0lD4G5l9NcBh9U4Kcjpg2Jupfer/b44yJP7SAsqZLTYvpOEskGuLJrwR4f8DQ1tfI
	 B2cvBJZ870//GMlAqhZMxTlSd5/PoG7csb/wMyxp9I5HxA8wcKrGtpNPJi6fqyeAnC0HX
	 CryobTI2CZ37Kg5x2QYxeMDNPggfK2HXhwCti4jnZnkF6iuHUHB12MW7LAj7pF22POw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795125246;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=cpGb2wEbtBz4xy0lAJdsS4py7t5tyhpga/TBB9v40Io=;
	b=FbX2140WvC5VFXRgg1Zx+8hK4U97idH2YqJbrNHryF+ghH7DopRV6BDZ2BT33PLvD4Mk
	 xPcm5vsodvW2C1SgoSilNHFZMlb5HwFcRK9iIEIfhZrRWhx5tNruBe3xLwuLkU/y2yxzC
	 ptjM1cyGPXUC5xZD+mPifFiEOM75gR5nbqUQZuDCdDZhRA9BS+JsF9kTYcFiX3kCIoHwK
	 wLrw01RzF3bquZ2TCcwUkwzX9FTTyH3Qv6hEpMZJhnBPxR4e9c4ePUzWyxfYNcQgRHXQ/
	 FxywihS773Ah8fMYY9CapFnawGirhZBpaflEceMOhHk5KvxiT+mCWlpNGKQGdI7GWGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lpZJB6PG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3243F606A325
	for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 21:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lpZJB6PG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A84B21F000C0;
	Thu, 19 Nov 2026 21:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795125245;
	bh=cpGb2wEbtBz4xy0lAJdsS4py7t5tyhpga/TBB9v40Io=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lpZJB6PGsd9NYBumVLbO0daWcIV+dQP1q/D7WBCq5no7/LYOGU0VEv4bihHK4zsHi
	 imPuoSwOqwAJP0TuR4l+AdjE8mUdject9f4gtUBNDVjXaAIqxgTEAbmRalRW7nJbzc
	 2LzJOFwJM7jEz/ULqgfCCBHFFl622/fLWxEWNzNx2yE5SUkUPb0gmHxgaXuPQVtK59
	 5UThSiJiycrqCrn116Z35rIxrWVDbqdgHlF+PFHTlJcNj83iUdKLbEVNxFWAfgRYeR
	 d2ITtOq66HkMuDfxFmovgqMhEA9Q8dADc2CRw8zmdPYN0moYa6yqilbK+pEfCzNFU3
	 inMdG+NSG8n6g==
Message-ID: <sashiko-outbox-224112@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [[RFT PATCH v2] 2/2] xhci: sideband: check virt device under
 xhci lock when stopping endpoints
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mathias Nyman" <mathias.nyman@linux.intel.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261119214841.1552318-3-mathias.nyman@linux.intel.com>
References: <20261119214841.1552318-1-mathias.nyman@linux.intel.com>
 <20261119214841.1552318-3-mathias.nyman@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 21:54:05 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Start work to protect sideband API functions against the xhci driver
> freeing or reallocating the virt device (vdev) in the middle of an API
> call.
>=20
> Make the following sideband API calls hold xhci->lock while validating
> the vdev and its endpoint, and while queueing the stop endpoint command:
>=20
> xhci_sideband_unregister()
> xhci_sideband_stop_endpoint()
> xhci_sideband_remove_endpoint()
>=20
> Locking changes are still needed in several xhci 'core' driver vdev free
> paths before the above calls are fully serialized against vdev free.
> Cases involve xHC reset in resume, enumeration retry, and reset-resume.
>=20
> Move the stop endpoint code from xhci_stop_endpoint_sync() in xhci.c to
> a new sideband_stop_endpoint_sync() helper in xhci-sideband.c.
>=20
> xhci_stop_endpoint_sync() has no other users, so remove it.
>=20
> Also take sb->mutex in xhci_sideband_stop_endpoint(), and keep holding
> it in xhci_sideband_unregister() until the sideband is detached from the
> vdev.
>=20
> Fixes: de66754e9f80 ("xhci: sideband: add initial api to register a secon=
dary interrupter entity")
> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119214841.1552=
318-1-mathias.nyman@linux.intel.com?part=3D2

