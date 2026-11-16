Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794834394;
	b=0Xb9pK/gy8Wr/UytVc+JBU0JwxJG8t9pffqWzDsqU210VO6WVQm+sOfZW70Lvt9ydU55
	 RIEzvMumdVihQQ396DgKznEcyIXzSqnCSJDrEfTxQhBxU8ZCOLxP0oVsLHPIQzhLIh4zH
	 vhfhY8iq2U9sfpsS+JtElK6JXwzFrkk+ieWczsQpEU07gGoor0EABH0YWlCxBEknNvysy
	 tTflETtgXWT6+IpfUVyzG31ycslUOr5X6dmMUfDJVUqsxolz7xWubyvDw9oa875+NPK3e
	 EPCA5qhsh6BTfZS0h9RUlfRo/p0lAxY2BUaLzgoFN8nIgGWcTFrM0nDbZyI7g08uhgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794834394;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=8Zc1XVkCmZVO0DaXJn4b93AZEyBbFIkw4spqIpFVzw0=;
	b=1J8hSI0ONNFakZGBNhDuMECbU8BRKlh2+Yikev+waLHbNn1f+in587Jqo8AT5gyQrBpX
	 qxDwF89qTvYa74kx1ZmgQL/0z7ADumOIBVuvMFiyhOLyegP4JllRIWaSIr3uB5mWHpETO
	 7YoEoS2f1gGPEixm0mN0Kd1a/BlgYZjiViXqxP+/CvVjnHbWLTkMgod06OS+CDvPsqGr+
	 QH0swhkAftvUeQywc3d5LOrFwYteml9DiK/sWPHIlmItTdj6mh9I6mL5tfyJ+ahM9+TYO
	 2y0B3ANBeeeuXS/DrQkxZaDxle7iC1FS8ftsXFZF/WR7Y1M9ZDdT4OMKyL+azHz5xEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bwVKv8rP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69499606A329
	for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 13:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bwVKv8rP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D50EC1F000C4;
	Mon, 16 Nov 2026 13:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794834394;
	bh=8Zc1XVkCmZVO0DaXJn4b93AZEyBbFIkw4spqIpFVzw0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bwVKv8rPekH+gnj+OTRMAxd5JDjf85o0ZQdf6wtG9dKVDPh0wFf67/u9Mcatgjc64
	 3dhQumgkjSQGNdNF3TGV5C4FaBW8vnYdiNir6MzXsmmPrGEgOUy2pWmV+uTWNODeY7
	 lq3p//+5Sx290tjcOgNwYWK6zujQKz12O1R/LyNkmS7jbwoo3CCMkbJyAbJkkB0zJA
	 Dvn96uUGE/X3VBzopfJYLZyVcDf1xtPm/kBZF0n+pWn/4i/SIaCjuSLU/3GcXBDTwo
	 ITuPDQkX4icpgFBYmO/8x1j1iC5qJucdrjeHJE5j+dGCddN023BSYkbxFwxGRLlZap
	 GM4RJ3qdC/u7g==
Message-ID: <sashiko-outbox-217038@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: dwc3: skip extcon lookup for fixed-role mode
Reply-To: sashiko-reviews@lists.linux.dev
To: "Radhey Shyam Pandey" <radhey.shyam.pandey@amd.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261116125705.323670-1-radhey.shyam.pandey@amd.com>
References: <20261116125705.323670-1-radhey.shyam.pandey@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 13:06:33 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> As a last resort dwc3_get_extcon() walks the OF graph from the "phys"
> phandle and asks extcon for a device bound to the remote node.  A PHY
> "port" node no longer implies an extcon provider though: it may link
> to a Type-C controller for orientation switching.  There
> extcon_find_edev_by_node() returns -EPROBE_DEFER, the same value it
> uses for "not registered yet", so the probe defers forever.
>=20
> An extcon is only consulted for role switching in OTG mode, so skip
> the graph walk for a fixed role.  dwc->dr_mode is still the raw device
> tree value here, as dwc3_get_dr_mode() runs after the lookup, so also
> derive the fixed cases it would force from GHWPARAMS0 and from the
> Kconfig role selection.  Its remaining OTG to peripheral downgrade
> cannot be covered because it consumes dwc->edev, but it is only
> reached once the lookup has already returned NULL.
>=20
> The check stays below the explicit "extcon" and "linux,extcon-name"
> lookups so those keep working for a fixed role.
>=20
> Fixes: d182c2e1bc92 ("usb: dwc3: Don't switch OTG -> peripheral if extcon=
 is present")
> Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116125705.3236=
70-1-radhey.shyam.pandey@amd.com?part=3D1

