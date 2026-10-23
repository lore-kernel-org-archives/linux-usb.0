Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792763594;
	b=ZHwwFe806C71LFtKHDJpW0uGRkCIQNFfsRU/l8fM250nfPsHTZonHOb6Q+kByRR5YQ4P
	 KnVFrdECDPjVn8aYv3+mK2602WnwR2lt3I/JXblU2PiPz9prvMJHIwSDkU7Bmo89oD/eq
	 fAoaiT40fRiYZAxqdPMX9Ba/m7cfBJ6rQWAhJoZBU8L9a9F1VDu2mcQ8UfRg+2aeVf56N
	 viipk/fr+cS9YbZGXEkr5/h/a6ltGbH4UsmPxFL2khiHcU/3fI175bOQ7Fj8ltKNUAZFv
	 yXzyc6Sbx4dabgT3VojqB3fbMNgcMdoCOiJKVORobTYnWPx587d4ie3RxPOjLqH5dZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792763594;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=HS8012XXNCEFqzqJGLl022/By9mRYP/VpcRCVmcTDj8=;
	b=Thzpo1/ElXPZwozUwl5womFoBTiskiIsuXfyXWTU62vl08YFRtaJQom2F1XcVSQqFzxw
	 o8w5YzRodXmx2H38mR4sFzC2IHPOTgqCqmX1RgsLSBB9EiJ0lYIWqQdPSDaSX+RdYmuiC
	 r7bVkWyPRGUt48uYT9VJJzQWi0eXRoROdnN1bDyChMPht6YQ/Ykah43WuxwqtRVxhbEDL
	 B3IIb+TbD+3/b50+hGWpYKJlAhN9ySvk0RLRW82P/LZTFuoTx7KHgHoC6HROfgGTRZJhT
	 v4hb6vFLeeiJx6+1PtQ1LbzS1yqCsfUyyAApNM1aREX5HRxkhoRkDCY82MOzcUuW/BA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VdUjf+id;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63807606A31B
	for <linux-usb@vger.kernel.org>; Fri, 23 Oct 2026 13:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VdUjf+id
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED5121F01828;
	Fri, 23 Oct 2026 13:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792763594;
	bh=HS8012XXNCEFqzqJGLl022/By9mRYP/VpcRCVmcTDj8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VdUjf+idOZwK6a9390VpWS3gnytPP+v0Kt81r9UBx5XtWVuWz5ikbxtQsW/lIocPC
	 NypSAlRi9qwf4SHzb0DIF4esLroRK0V+yczPs++iBOaF2Lvxaz6zBXTPrBRGv+djlx
	 v5rUa6OSqwdbH6QZyuKmd9iPr+9Q413zdAzPb+cQp2H7/uqQMgwxFJG4qpfrFE8gPR
	 QwfWtRwzY854D255CAJTIS+irCjh/6Xz5q+HMziYhevwkPZRnvI7cSrca7taQkVdin
	 f/svZUm9q8OgE2JWBO4s2N8517YRfIWtd9mQzpQQ1/uUiTKUeDmLFU09mY7fc/KWrR
	 HsqQqnOJtnnFg==
Message-ID: <sashiko-outbox-182856@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 1/9] drm/connector: report out-of-band IRQ_HPD events
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261023-hpd-irq-events-v7-1-57a3aea3f09e@oss.qualcomm.com>
References: <20261023-hpd-irq-events-v7-0-57a3aea3f09e@oss.qualcomm.com>
 <20261023-hpd-irq-events-v7-1-57a3aea3f09e@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 23 Oct 2026 13:53:13 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> The DisplayPort standard defines a special kind of events called IRQ.
> These events are used to notify DP Source about the events on the Sink
> side. It is extremely important for DP MST handling, where the MST
> events are reported through this IRQ.
>=20
> In case of the USB-C DP AltMode there is no actual HPD pulse, but the
> events are reported through the bits in the AltMode VDOs.
>=20
> Rename drm_connector_oob_hotplug_event() to drm_connector_dp_oob_status()
> and extend its interface to report IRQ events to the DisplayPort Sink
> drivers.
>=20
> Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261023-hpd-irq-ev=
ents-v7-0-57a3aea3f09e@oss.qualcomm.com?part=3D1

