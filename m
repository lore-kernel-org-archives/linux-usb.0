Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795421111;
	b=kk7V4bNauTX+zsv2lqG1/twLYchNpsQ4sIKakpwYH1QOj4FoZo04pLAKPd4RhKvLF+oV
	 K/SMThTqsDTERGTQlSRN/8ZUvtnnCRJM9cC/gGwL7QTJomr0xr4eaGlz6neuYu+g2VlrB
	 rlgJ5DfCPM+F5C8GJImxaCZvfebAbZT0ikkGVNfqZ+Nrj8bG0rcKMTchtXj4c1tFvhf16
	 AtFmp75aYhHHtzKMRLhaBUn9WPJBDYFncE/CXAxgIS5pm8Z/FVIYLsVyq5A2XXiFY/Uik
	 WQdjFvbaZ4nvbtc0vgwYUsRuxp1s9Hzsy9hKAMjBblVpAtWBuXLaljzAmknbyJVnk3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795421111;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=YQsCRbhd0uGNg9CRWeZrXOxXdCYhv5DX9bfisUsb6KE=;
	b=BJTvZ1wCoENXdQMMVJc1/VJ3dWjpp5MrL9SRGZcicmyioCWtFNYqzbGqWl+MVr/QHHRo
	 PXxOChUgsy0TjaS8N0zVf0seMMqU2cKIG5SEJJZAvNx4+v8C8QSzo5MJJxLLpMuGDMa1X
	 CfWnw6+gNNyISkUkXw5qcNdeetUf0ck5XQQ5TQoJiJF+qF8Jm75DmClYDsyvsvCxn3UNR
	 LXPtcrlU0U4ep7e1+0GEBgA//31e80TJIruHvTDQ2hLDPQvScNxpKiB+gnoJjLH2wWfyN
	 jAdBfbxfu/fZtYnM+/9taGF3PhlcKEpD0weNWy/Z5V2QI1PdVyjJl5h1uVvnOMcPgWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mk9dNXnF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9371B606F607
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 08:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mk9dNXnF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B89901F000CA;
	Mon, 23 Nov 2026 08:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795421110;
	bh=YQsCRbhd0uGNg9CRWeZrXOxXdCYhv5DX9bfisUsb6KE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mk9dNXnFSGuD7ylI6buH3niLI1G5wdfCR7rALgHmlfvXZaDOb4zBH8q3PY6+kw+dw
	 jNqEyQIsS3+GpSnKMzFrsXV0SBqTxvfmaX0Rje2GlXMhW4t41YzjCc7AQvnmGdGSTH
	 wA3RHRm991780bRXH5i3JUJzVEmIx9BbohL+J94ybjsbhc0RQhAuRXggtBkAMbnxlT
	 IVyw1jWlaHh2OzAnqdNOE08+N/YN444LPYubSGM+uOnLjKOmihOYRYJnC6leB188nr
	 IwdwO4SHw66naC0mzFuT+dBGpgNqfGRiske+TzCNA3f1HoWIVgQ/pdymvD1aHzibTs
	 WciEm9ZL4hKVA==
Message-ID: <sashiko-outbox-228874@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4] usb: cdns3: fix NULL dereference in
 cdns_host_resume()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guomin chen" <chenguoming88s@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261123075116.3868-1-chenguoming88s@gmail.com>
References: <20261123044347.3273-1-chenguoming88s@gmail.com>
 <20261123075116.3868-1-chenguoming88s@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 08:05:10 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> From: Guoming Chen <chenguoming88s@gmail.com>
>=20
> cdns_host_resume() assumes that the xhci-hcd child is bound and passes
> platform_get_drvdata() to hcd_to_xhci_priv() unchecked.  The child is
> created by __cdns_host_init(), but xhci-plat probes it only when it
> registers; cdns3/ precedes host/ in drivers/usb/Makefile, so with both
> built in the child is registered before xhci-plat's initcall runs, and
> with xhci-plat as a module it stays unbound until the module loads.
> Platforms that allow runtime PM (cdns3-imx is the only in-tree user)
> autosuspend the controller after 20 ms, so the parent may already be
> suspended when the child is probed.
>=20
> Resuming the parent, either for the child's probe
> (__driver_probe_device() calls pm_runtime_get_sync(dev->parent)) or on
> a system-wide resume, runs cdns_host_resume() while the drvdata is
> [ ... ]
> resume would dereference freed memory instead of bailing out.
>=20
> Fixes: 3a85c1011540 ("usb: host: cdns3: forward lost power information to=
 xhci")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guoming Chen <chenguoming88s@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123075116.3868=
-1-chenguoming88s@gmail.com?part=3D1
