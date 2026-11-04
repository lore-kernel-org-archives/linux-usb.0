Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793759306;
	b=vTQwW6v+lvg0eirVuR5t2yv+hJP8WDNYeIYOmo+f1TUx7+MIAiQIKjPDAviEj2uVjJLx
	 oiAURIWsEjpkeQYWlK+5Ppf+vapD7WbocdhhAeW4sUY57G1mOoXlh8C8dhv7K7c0ZKU+E
	 K3HxdmchiRVu+J4LDMZwOPZ6lTZiIyHpfdsMCRaa/RKlppxYpf5G3zCz3gHf+lYXOEtS4
	 M4Xdu9OdfsTRVzvm0vAWMLoS8fBHJXwsvC1+VOuDnJFvYDQ535+FaP9ZFon9yyfr1tMtT
	 j0IHwBKMxm5wLuq/03yGdi72d5gs0z5lZE6JLHWxZgNEqKrqNwhkWVae4RW2IfeARIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793759306;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=wnh1PtrCvi18tQ7ybx9OwvayEmLK5bM6Hxm4rUrPAtQ=;
	b=MmsRYFvgNR4lvHChzBArnbLQHYS/ow5jIpYiwhpnpN9Zh6hLEQ+44nn0darOJx89hTlG
	 8g3OhJPTaDp92r9c51mC9tYI3oJ7Z8qU++QqVHTmAKpI5hcyZ6bMQ6nBgJOntfKxbixIq
	 Utb2W+sncbimNIsFake2OzWWTkSTKNUQvIoSxYYb/TugDjYxblp/ZJGcNqFo13x+f6576
	 EB8uHiyrEBSoSsbbtwcbaue8fWTVsW9oeJAL6wqp2co/aRFcW0Jvp4D5FR29fp1bbGR2I
	 KBldx/u5xbwaicWNJaR745LaTBlwKM+DhSe3ie9CC74p6xb+U/Y7e/wbati8GxyoI9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BBZFkXl7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2374606A328
	for <linux-usb@vger.kernel.org>; Wed,  4 Nov 2026 02:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BBZFkXl7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 404B31F000C1;
	Wed,  4 Nov 2026 02:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793759305;
	bh=wnh1PtrCvi18tQ7ybx9OwvayEmLK5bM6Hxm4rUrPAtQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BBZFkXl7FTfi/I44Qy+zlZnIhDRmA1VVliN3sXmTB4OyevkA4Gt4R9BOc24F0gQiu
	 JBCtoTzdQNMJEL3gk8apMwMCi4HoRdzuyYlJHoaYh262x5drZLHIrtmWK76NFwCLGd
	 hI7VKFJsZSX8h4ADYydbyoqWBlSVZ9aewt/4/+8ICS74UZHNzJ2/2IrnihhU/8qvJY
	 YREvCozYx+wW65LmIe5fOu/xSw7btRmMXRwKT3PXqBS2zzLvUYCm6HTBTSJ5qY4jcP
	 FI/PES2orumi+K9SVBrNGQebjaDle2isvkbC8DIEkooPqLn8rdf8x37Eo/XkLba79p
	 YqqhMf4klTWFA==
Message-ID: <sashiko-outbox-196466@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: gadget: pxa27x_udc: let devres own the transceiver
 reference
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wentao Liang" <vulab@iscas.ac.cn>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261104021519.1468644-1-vulab@iscas.ac.cn>
References: <20261104021519.1468644-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 02:28:21 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> pxa_udc_probe() looks up the USB2 transceiver with usb_get_phy() on
> non-DT platforms.  That helper returns a reference which the caller has
> to drop, and the driver only drops it in pxa_udc_remove().  Every probe
> failure after the lookup (the clock lookup, clk_prepare() and all the
> err labels) returns without a usb_put_phy(), so a failed probe leaks the
> transceiver.
>=20
> The DT path already uses devm_usb_get_phy_by_phandle(), so there devres
> owns the reference.  pxa_udc_remove() nevertheless calls usb_put_phy()
> for it as well, dropping the managed reference a second time.
>=20
> Use devm_usb_get_phy() for the non-DT lookup, like the pxa25x UDC
> driver does, so that both paths are managed, and drop the hand written
> usb_put_phy() from pxa_udc_remove().
>=20
> Fixes: 0c0e287d454a ("usb: gadget: pxa27x: add phy notifier event handler=
")
> Cc: stable@vger.kernel.org
> Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104021519.1468=
644-1-vulab@iscas.ac.cn?part=3D1

