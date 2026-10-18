Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ECD737647B
	for <linux-usb@vger.kernel.org>; Sun, 18 Oct 2026 22:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792363222; cv=none; b=AKD5ZbuZv1nDFf3yRCLecpkA3rbWoT9X5gAQJg16yPhpJUaC5kYtbip4FjMO0zryf78hwtSEEDHla8vMIFY59OIJ0c0sEqeRncvD8HVHTsf8kq/0uBZJWBw33YP8rmfSIWHG2YGmgSND02UVuTvbxgRZUBWpQbHSKJU3dT51Yvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792363222; c=relaxed/simple;
	bh=nskayjZN5wS4En/+0kZTnH0kKQpiua2ftCRLPCjqg/w=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=Mt0U6h1e4e5YFyM8FjCoXnBr+8IzqndD5t7yRBYvSU/fu6wQuKuG9rgt4i0judyAykXyxtEdze4RCn5Y/YYbpHK7ccTxumQ6DbBcvvzT7fOEVKbJx3DdS24KP/QamtRu9wtMxfE6y6fwweMMlN3n0nGskAEDVJ32h/FhAP0XsMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YtYJRHhH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YtYJRHhH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0C7B1F000C4;
	Sun, 18 Oct 2026 22:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792363220;
	bh=nskayjZN5wS4En/+0kZTnH0kKQpiua2ftCRLPCjqg/w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YtYJRHhHGT93RQ9dnrPLnp/nlVZZfMxFlM5Iz01tyMqelC2Zo2y9uibFVIrjpPFk5
	 wLSYk/cp+zeS4dnq8HhWXm1wUqclf3BX4aU3OQmxctRIQf+46QWYDn4ScIUncwvvmc
	 txETYZWtagK9/Y2+xPR5m5aJ6kHU4AtZABIuXIVvuwnFhopgH2fu1BBcErdHHAZvSO
	 wZVcDHb8FWZdmnXCBKPDUv4Z0H6PYEbHXTcH5EY7xyb9l1A6zo2J8WMF3Zs7hXRmkf
	 LRmdE4IqXRGuTZb7jvakdf8fcOGaA3GOkQijp/7eZtLRzEvqMSo2ZrKX1xfyGEZOFK
	 DPa8/brb2YyaA==
Message-ID: <sashiko-outbox-176431@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] USB: serial: sierra: validate URB length in instat
 callback
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tristan Madani" <tristmd@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261018223352.2021650-1-tristmd@gmail.com>
References: <20261018223352.2021650-1-tristmd@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 18 Oct 2026 22:40:20 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> From: Tristan Madani <tristan@talencesecurity.com>
>=20
> sierra_instat_callback() reads one byte past the usb_ctrlrequest
> header at offset sizeof(struct usb_ctrlrequest) without first
> checking that urb->actual_length is large enough to contain it.
> A short USB interrupt transfer could cause an out-of-bounds read.
>=20
> Add a length check matching the pattern already present in the
> option driver (option_instat_callback), which validates the same
> field access.
>=20
> Fixes: 033a3fb980b041 ("USB: Sierra Wireless driver update")
> Cc: stable@vger.kernel.org
> Signed-off-by: Tristan Madani <tristan@talencesecurity.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261018223352.2021=
650-1-tristmd@gmail.com?part=3D1

