Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795082963;
	b=NhQYvr1GsZmphEBhYM0uXaI9bq0EeSrt1f2r5oxnxt3I/vLqqpdwgRUe9XNMLn+hPW0f
	 3HdYSWBWdffE4W9KoAUeSZFnhj2z4jLg4fBEBafdiykpl9ecRgsVqBLaEWNzkP9Yn8NvX
	 cFV0pig7Rj8YcIb0kpPowiNEyZ0IqTANe7YcIFFR94KfT4VaZ9vHj8sCp+njDswKtF1LT
	 qV1tAsAOkr3E5VXivQRAqSWddi7H7/0SgdnvvZNxpQDarNdH3QbfYHjBaPMVu8hY6bPlN
	 SHL53qYsun/X3FTumDlCcW+aVatyw9w0bzAPa+4InwWDvyd9Bh8nc/7JXuEUeYlce0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795082963;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=fVaacCESo1IXWdG4Z+LD4jmUXTFbL5dor1opA5+bZfw=;
	b=kCaRYFZ8unul6TwXXt/jwUoDk8JZEokLMgGA/1gA4SFJn12ZbcJ31gZE7MO+P1frZpWm
	 GKA9OS0V1UYMJZtuaWwLRHQPUlkqq6f3v441bHhfwUC4p6JEoa8rhvNRzbdLtE49ZIgtH
	 SSmtAnI/jGJvThSlBixlBMCrvBawCwQI6xcYZkCObjVdvRzjzNE+89+E0YhaTxVu/q5xI
	 iv2o82YLaM2yMrpmtO560Pbm61BkPYJ7d/cmXEx8YN++tVCwX/CIPu5ha3fh2FQEGJ1YW
	 6QC9Gqr/Mi5u3VTePyMKyPO5zoUF9Y5euGV/mTD11tV1g3YRxoJqPqjJ15Th6EDtc0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TkotwNlH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA8A606A320
	for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 10:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TkotwNlH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C0201F000C4;
	Thu, 19 Nov 2026 10:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795082963;
	bh=fVaacCESo1IXWdG4Z+LD4jmUXTFbL5dor1opA5+bZfw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TkotwNlHwtjwFsUTtcuf6wPuWmJQvLeEA9zVNwUfRWTUygpqO1FgEZzKPEgxnZSya
	 Q7qrNMf2smbbbqSq8Gb27oX7QrDQjmCW4aIBVcfcYhtxMYwTCZOKAUDRkXKtZHpbGU
	 kjB7C30UgMFWB8F+VLvEnuLUJr2ghL7L4YBM1XKrIYd7+AQnTwTZKazSCuQ2z6DXul
	 sgj8ZHvnDwcUkkzsz7JThHzdZdqJTjmg8Ea+YRRpd6Wt9kHWHMfCOpn62ZRO98wYAl
	 D8hFF+qh+r9zfVTAajjzn9JmpNelXN1WHNw1qRHVYyRIi2p/KVuvt9ZVIIofjnMpN4
	 +/GVdLgPEO/XQ==
Message-ID: <sashiko-outbox-222917@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/3] usb: core: Prefer the graph for a dwc3
 SuperSpeed port's connect_type
Reply-To: sashiko-reviews@lists.linux.dev
To: "Arun Iyengar" <aiyengar1990@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261119-usb-port-pairing-v6-2-32bd7e36e426@gmail.com>
References: <20261119-usb-port-pairing-v6-0-32bd7e36e426@gmail.com>
 <20261119-usb-port-pairing-v6-2-32bd7e36e426@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 10:09:22 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> From: Arun Iyengar <aiyengar1990@gmail.com>
>=20
> A SuperSpeed root port not found by its controller port number gets the
> connect_type of its root hub port number, as before this series. On a
> dwc3 that is 1, and a child node with reg 1 is the USB 2.0 device there,
> so a SuperSpeed port with port@1 to a connector reads "hardwired", and
> its devices are "fixed" and authorized as internal.
>=20
> In that fallback, port@1 leading to an available node means "hotplug".
> This changes rk3576-lckfb-tspi-3m and sc7180-ecs-liva-qc710.
>=20
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119-usb-port-p=
airing-v6-0-32bd7e36e426@gmail.com?part=3D2

