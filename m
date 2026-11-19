Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795093139;
	b=2MMgfW32hdKRZ3P5PI056IZuiDLD1aw0+S2LGYmgA84vgQTfXePKvSMuIQewu7Q/lXvx
	 FweEJbsnAMM57w7qloU+qIWZo2kXLF988EM6tYYyqZcnNENGaIeAN/fMPGfc2m0anGZrM
	 ujWD11SmQROIQUZ2DtMtZPrUQFDVFx772ZUZixRGF9OG2H4GQLp0fZjLsgK3UeMIk5kqz
	 cXwcgQDUaZOHO7AgjMKIm0UPgxhi23QHuPlItDOkSgLWwvWJyDSKjmAvzL51ic2E3ZuOP
	 stctwy+mJB/C6EcVeo3gPDHDY8frWtYLHRxNQg1+vfXMH9Q8CmR+QL3qc0LK/FRSz9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795093139;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=0GxcZReOlleAx+FUrAp3e05usLPxEjNSLY+BKwPzScE=;
	b=aJR7XhxpOEghprRO2WdIY5yYBjTjsRTv6f0LUF22swwBro9WKFKZ93Cm8vYgJiyA1jbR
	 wF4I75aCbuuq+YMk07q8Us19zGgLZkWzNeqwHYm+neSqfWmVG4XSpfF+EYu0RNghLdXEs
	 VnFJU/sFMvQOUEc/x/JAFsvwvOMuZKmY3vaKFG7tgO0qnj0gYLFbs5A4WswahSRsdcP/A
	 eEhCim4F1wW1VCDIyt1N/kJtsv1Syg9Gig6yV6jOTIvlUp77h2BNBKzQY9NNTc3Or716g
	 mdTjzp7M/RUtFCwbw+po2fBk+5zu8W6ZGcnDwQWHlXaaBM6j9iZ7qKpKCoMid0Zu5sg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ID0hLUnO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42714606A320
	for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 12:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ID0hLUnO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2EE41F000C4;
	Thu, 19 Nov 2026 12:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795093138;
	bh=0GxcZReOlleAx+FUrAp3e05usLPxEjNSLY+BKwPzScE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ID0hLUnOEsk/VuA/xfn5VCpmRU9w4wdyh9cqa1Yn3U/QPdpCQW9MxjZk1qVwPMAr+
	 JDdRfXFTpFVjwrZrPymIT9F0swM4fpqjCy8kvzXn/68nYgv0yySHXIPWHbrtXqhZxH
	 a7Q6JR6ZllcW26EbMSeBSzPZ3oon9U457XPLSZwkTcZZkNUhWZX2ISOc63mydEmH9Z
	 NBTP/BcJ8qd5tW6PnmzG07L1FuGgOVWBawMvTStPtbAp5vo59uCC9qz5G1hcseDqti
	 DpxKyozl6f1ekq9qsxJM0VJvcJXaMQqO99tX5YPku6LBC6XD7Vu8SJ8hSANhm+WAbr
	 O+3N/UpO6SaQQ==
Message-ID: <sashiko-outbox-223128@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/2] usb: dwc3: qcom: Use the UTMI clock as PIPE
 clock in DisplayPort-only modes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joonhoe Kim" <26rote@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261119124558.1548-3-26rote@gmail.com>
References: <20261119124558.1548-1-26rote@gmail.com>
 <20261119124558.1548-3-26rote@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 12:58:58 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> With DisplayPort pin assignment C or E the QMP USB3-DP combo PHY gives
> all four lanes to DisplayPort and powers its USB PCS down. The
> controller can still run USB 2.0, e.g. for the hub of a USB-C monitor.
> Keeping the pipe clock branch enabled, as commit f546912bcac6 ("phy:
> qcom: qmp-combo: Move pipe_clk on/off to common") does, is not enough on
> Kaanapali. The next xHCI reset in this mode times out ("Host halt
> failed, -110"), and USB stops working until the cable is replugged.
>=20
> Register the glue as a Type-C mode switch when the node has the
> "mode-switch" property. Select the UTMI clock as PIPE clock in DP-only
> modes, as "qcom,select-utmi-as-pipe-clk" does statically.
> typec_mux_set() calls the switches in the order of the connector's
> ports. Port 0 (HS, the controller) comes before port 1 (SS, the PHY).
> So the controller switches before the PHY powers its USB side down.
>=20
> [ ... ]
> PHY_QCOM_QMP_COMBO does, and do not register the mux without it. With
> the arm64 defconfig (TYPEC=3Dm) this builds the glue, including
> dwc3-qcom-legacy, as a module.
>=20
> Signed-off-by: Joonhoe Kim <26rote@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119124558.1548=
-1-26rote@gmail.com?part=3D2

