Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792802412;
	b=Kc+uQa18oe6514vlzs4DAHPnCx20Tky5ruMkgg4f4WF7+jM65ztvuMJ6R96jzEPub6cm
	 OdB0gZz2HtquXbDi1M8g57iHvqgx7/w2eK3qignRCnaLmlz8K3XPapWeyPxFmq/ntMyhh
	 j3Sz8vlkwdXn2XwYv6jbgyTOCvEfYCG4f9K0pMEf7qLtaGnuFAXtYEoDg8+KUXQAQNeWa
	 vCkh507jHV+SvYyKBA/CN0cKAlZEEjpaAr7077DI6AgPP+mUnyvcLJcwwEsNDkJqAM54l
	 v9kb0IlIgVpHLs/mftiB68NW/DfRUBk8u8wZeJ4ruqQ/TCQ05PykrPSQulzdu7fGS8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792802412;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=wTzGlyzxEAIiREi0p+/V5urlMhxupcUaYzAkC3HBu1g=;
	b=OFBclfRnXQRbxz0ep3xDZubYXkAZyJo3TNigcvVctpd4Kwc51E34lKHle3tl8z+DiR9q
	 1fWxdWj2t+pUDBLczpceacHe/AF1/4k7DEYKfmDrQaJZmtpmvUWLJh0EadvxmLscagU7+
	 lqybtg0CLqW8yPcu5RKm1QWvRq8L17KfdpCPMaMl9+bl/DxGOO268KtvL/jVGd1j42zdR
	 wbyYCSmFBcRA8sEmX96/owdTqLcF38SMZK+5h66o0bxyktKb4bJErXcLNPeUE4JkNiILs
	 zPc3Zy8MnOnD4Jozw8UBhvMpLBi9NbCWtHPgfNweCffFHEVN5JZ38y7bW2fdnbeYNUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="DU0/njIY";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 089D6606A31A
	for <linux-usb@vger.kernel.org>; Sat, 24 Oct 2026 00:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DU0/njIY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 756871F01825;
	Sat, 24 Oct 2026 00:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792802411;
	bh=wTzGlyzxEAIiREi0p+/V5urlMhxupcUaYzAkC3HBu1g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DU0/njIY8iY/yObiAu9J8zJJ43IsecgOwRN5UmQ6CcWcNmoCiyP4mEM1ESuAptV3Q
	 7eMn+HhMCMqM2LPik8mo5+GcTEY++dCB7iUBbq41hUZpSlHdT05R+Kk36ugAD/nZn1
	 M7kKZKxkl3G9Ksw6j8vLgfhiLg8hVwRTxFyCxXeXhKXBYTe0ADHgdkCvLx5GbrfIIU
	 cdQgYfzu/yy2+v9Hahr4OdUzmFQ5DRQJxTPvfxnPdp4TJ+ySx7yGxh/zU5khd6/glA
	 Lb5OuAHBK+W0ITFthGp/Y/slN29JEY2mfHrjxg13d3LgEIF+PVK/w9YROL+ZPMQn//
	 ICds+N4VXwQKA==
Message-ID: <sashiko-outbox-183462@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 5/9] drm/bridge: aux-hpd: let drivers pass IRQ_HPD
 events
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261024-hpd-irq-events-v8-5-6ee949e7a384@oss.qualcomm.com>
References: <20261024-hpd-irq-events-v8-0-6ee949e7a384@oss.qualcomm.com>
 <20261024-hpd-irq-events-v8-5-6ee949e7a384@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 24 Oct 2026 00:40:11 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> The DisplayPort standard defines a special kind of HPD events called
> IRQ_HPD. These events are used to notify DP Source about the events on
> the Sink side.
>=20
> Let users of aux-hpd, the UCSI and PMIC GLINK drivers pass the IRQ_HPD
> events to the DisplayPort drivers.
>=20
> The drm_aux_hpd_bridge_notify() is kept to ease merging of the series,
> preventing extra cross-tree merges. It will be removed once all
> drivers are converted. The drm_bridge_hpd_notify() function is kept for
> the drivers which only care about the connector status and will always
> pass DRM_CONNECTOR_NO_EXTRA_STATUS as the extra status.
>=20
> Reviewed-by: Pengyu Luo <mitltlatltl@gmail.com>
> Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261024-hpd-irq-ev=
ents-v8-0-6ee949e7a384@oss.qualcomm.com?part=3D5

