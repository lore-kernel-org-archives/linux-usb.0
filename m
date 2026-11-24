Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795488837;
	b=DKFVthYiIRicrOf0kQt3/TRxzqQohqb4KfIWIETasDy40NJPvjrMEQm9gZXXCNryffTL
	 80EsnHV46cU1hlltbzo2FXFj7uORf6HVgkK/2T0U9Bo/H8v1ZysWcvZoWormbSdP0wXxh
	 OwE0oPqsbnOYhYBAizmo3U6nskzDgc8zp91oLDdmZL7CaF/4hYlEI6VuCAVvQgMOvGvTn
	 FsoFhSlkGWkfPD1lKcmb3+0YtqHY+dKULZ8RROvplOgfFrkAnJBfxEtHmwDBFry3UcF7j
	 ysLE7kIj09LZkxlIMHHQkEVtYPS8ld0MhhB1BwfTFKPOGc6Xf/0ggFzFi2rEuKob8iA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795488837;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=R9x6gy9Zg+ecRiCUx9JurtPZo9C7kz+m26c9HYo6ShU=;
	b=oh8u0AfTg0Oax2j0/HJF+RAvfvz5f1GTb1MNdOgtPwIxtsKdzXGzcLfZnRo2vjURndug
	 atgB/Bak8tWEOmudGFXRycsayoaULYPaZ0KV8XRQ7JT63BlT5Nez/iHAYTga1HqNewNXl
	 cgh9p7p/IgFNVY8Cls9LNbmlK3WvSgtL7gndB7PhW69yIfvsbazQuMiH+a7wC+gHrNWeS
	 SlBXFTGnOxnhEZ/QFM6Z8sjafFRYjm0pgqRYiZOgh0rNpK0ozjcMwkEZZ/hLqLZ1ztbyo
	 5G5EeyPyM3u5janKyZJWSGJHtJi6RZ6/Y1tngLAPP981lurzIVwHuFheQuRZLDXAOUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PeJTLVh2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB6FE606A31E
	for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 02:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PeJTLVh2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 661871F000CA;
	Tue, 24 Nov 2026 02:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795488836;
	bh=R9x6gy9Zg+ecRiCUx9JurtPZo9C7kz+m26c9HYo6ShU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PeJTLVh2ZwFpm1KYCRwo3oMCTmTzgH7Z4v7cZHn5H01QC7g9NWdBW+DaPW/N/7n5Z
	 xgf5669EkuoihHnFS7RB2MxYEPqQhRumdC4eJkHT4CdcIFJO+/MciEk5XmQsotnZr0
	 37T+fKzDaFbEQNgmj5Do/UV8H4ta+WkkA3YXBx8boxghZTPNYPWyIDSAZwqw/jG0rG
	 cd9xHvsDLk2f2x54TqFE75FFUrgqFX/45AWf7idgoXdtBTOt07xCzYYE3XWiVyfNYK
	 31iya32MtwLT8GpQ8ShOdbz72NopI9vSDIF1zsVnaNHXEcr/LAho1i2+zIMnfHk/sO
	 OBKbfbRtacayQ==
Message-ID: <sashiko-outbox-230427@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] USB: dwc2: shut down the wakeup timer before removing
 the HCD
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yuming Hu" <huyuming@kylinos.cn>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261124024516.2621743-1-huyuming@kylinos.cn>
References: <20261124024516.2621743-1-huyuming@kylinos.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 02:53:55 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> The wakeup timer is armed from hardirq context (WKUPINT, 71 ms) and its
> callback dwc2_wakeup_detected() ends up calling
> usb_hcd_resume_root_hub(hsotg->priv) when the port is suspended.
>=20
> dwc2_hcd_remove() invokes usb_remove_hcd() and clears hsotg->priv before
> it reaches dwc2_hcd_release(), where fd772af9512c ("USB: dwc2: shut down
> wakeup timer before freeing HCD state") performs the
> timer_shutdown_sync().  If the timer expires inside that window, or its
> callback is in flight while hsotg->priv is being cleared,
> dwc2_hcd_rem_wakeup() passes the NULL hcd to
> usb_hcd_resume_root_hub(), which dereferences it without a NULL check
> and oopses in softirq context.
>=20
> Shut the timer down before usb_remove_hcd(), so that an in-flight
> callback always observes a valid hsotg->priv and any later rearm attempt
> is ignored by the timer core.  The timer_shutdown_sync() call in
> dwc2_hcd_release() is idempotent and keeps covering the probe error
> path.
>=20
> Fixes: 7359d482eb4d ("staging: HCD files for the DWC2 driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Yuming Hu <huyuming@kylinos.cn>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124024516.2621=
743-1-huyuming@kylinos.cn?part=3D1
