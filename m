Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794834821;
	b=xrWvylBgyxhpeDUiTF57vf/TSudqgwI4i0VG80zkqMjdS9K9gDe01VBy3rftnK1FgYOo
	 na1EsyqRa318DShTnHZ01gnAZOsD2rLfB8RECWj+XONFlHDF81ic9Fcf++ztRPbNfA7uT
	 VygxClhHCOfutvSptCRfREs10ndNguxawWihhPkUF3kiyQ0hSOYTl2Rc0SAHhv0R7PSSg
	 VRXKFbZLkYLU99WQmy1arYi1RB71sKM0EAUGWhbfn8TUPO2T2M5eMrdStbVLGkd1olfoD
	 yqiFN2qmd61ZqkC3ascWcrP1a3F+dTPbA4d7IZu28JPfXEdsrFJQ4T4axg6oetzVBnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794834821;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=WBQNcBdEXC4Z4onSPFoLW4yKdzFQ6woP4BkVoa91cjc=;
	b=PNVcdymjy+cjti80+2nzhDJHr2BG/Gg8CZUMLcYEC0BUty/B+n/Aup6zvpwA3sscHsh3
	 RSap8c8awSnUhdFdWDdAq7rgbAzcCtpHRzfeoTS+LeyQFvOBJdafhpAWPT7FXaU/JKf6r
	 e5Zw+ICwCvH97zPUvZLJUHyopet8NxV9zrY9TFBdXOTb17pSISUFQ8/pJlW9VBy/AcyjD
	 jDLnG59fLJ+R2xD+RcKfO0EX/kAC3yEnR4w/vY2wgVfBLcJwr2I/uH1BqlVN/ybJVWT+v
	 XvY/FWnTsZrisFuyV/GvN714k/JQ0oGnH5xCBZdsVf3tenYeIe/hGSw3GiaZfgd9nYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Vlz+QlBN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58AA8606A885
	for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 13:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Vlz+QlBN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 035EF1F000C4;
	Mon, 16 Nov 2026 13:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794834821;
	bh=WBQNcBdEXC4Z4onSPFoLW4yKdzFQ6woP4BkVoa91cjc=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=Vlz+QlBNGNZDZOT7WeekL9rwTdrXjz9IeQ0xv8zgynYK+rvZBrbegYaKRQUJFuKAD
	 zWqcwEfi16MreY5+Fw76ePD6tQXFm3n/PN7TKsqlU0HqmBM+GxeO1w7+5K6uYzLSn1
	 xk0mWEc3UdIocBkSXxahAAVAXDfIKABeG84cnTqSivCTbU//4DvwMpNHjLqJYCAxbe
	 jpwGXp9/eM0kn/wLDIFoDHVr/bo/yDhkRz1tv2+OpIgnYCJ6csw1uC391bNlA8wn6/
	 fFskp2unJ2UYzia+mMM8+4Hs7SWPQ3rqmxS9Ot/l3K3oQ9ZMP5C6xzuN2Eh094Haah
	 iI/WFywGpeKbA==
Message-ID: <sashiko-outbox-217053@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: core: don't skip system resume for an already
 suspended device
Reply-To: sashiko-reviews@lists.linux.dev
To: "Selvarasu Ganesan" <selvarasu.g@samsung.com>, linux-usb@vger.kernel.org
In-Reply-To: <973576304.21794834003625.JavaMail.epsvc@epcpadp1new>
References: <CGME20261116125643epcas5p17e73b0fa50f1cb7609b1d90d62c5e3f6@epcas5p1.samsung.com>
 <973576304.21794834003625.JavaMail.epsvc@epcpadp1new>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 13:13:40 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> When offload is active on a USB device, usb_suspend_both() skips
> suspending it during system suspend so that the port is not pushed
> into its deep low power state.
>=20
> The commit bd3d245b0fef ("usb: core: use dedicated spinlock for offload
> state") made the resume path skip resuming the device whenever offload
> is active at resume time, instead of only when the corresponding suspend
> was skipped. That is wrong when the device was already suspended:
>=20
>   1. Streaming is running with offload active and the AP side stops
>      using the device, the user pauses streaming, or the USB interface
>      simply becomes idle.
>   2. The device auto-suspends.  The auto-suspend path
>      (PMSG_AUTO_SUSPEND) does not carry the PM_EVENT_SUSPEND event, so
>      the offload state is not consulted.  The port goes into its deep
> [ ... ]
> normal resume, as before bd3d245b0fef.
>=20
> Fixes: bd3d245b0fef ("usb: core: use dedicated spinlock for offload state=
")
> Cc: stable@vger.kernel.org
> Signed-off-by: Selvarasu Ganesan <selvarasu.g@samsung.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/973576304.217948340=
03625.JavaMail.epsvc@epcpadp1new?part=3D1

