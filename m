Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792543483;
	b=rRKpTFZpEVgVuhGG6kIIGD71EPXs92qEtvmfP/pto4T05hkxsUkw8wvAL1/yhKk1VCDj
	 TbkBwHWfSe1GUF0ZXXJwN9FJoLDxp6Ypd+nSNO3kC9M5V3V4E+4JuLyDtxbdn6os2Of6Z
	 cfH2jjIY3r5Rh/vcx2d1Jdm+UPls3vQBouBt75bhobtiZS/acvPmNKnC7OsDOnPag0Ucd
	 bIRsU3ryOJIKpCooHmCB7a8c8vXy6kgtz61mixufSNTSQdlHG1NsO9rSHuJoXd5rOvsl2
	 9neZAuxm33XI3AvfAY5mpoRKSlN9IIYFKRuZw8ndRZa3BSobNdiI3pwPv/DjLzUAv6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792543483;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=gad02bNQ2Ftsf9QIkstXUbohNA4LJvcWN9Y4HNC79E0=;
	b=L5lytwri0Mc3zQd8gZw9uuPOyH0R8UZdkc/YcteZDSDrqjjPhMk918zbK64ywuud183t
	 WA6hSRTUnA7d3cBmVBLqcr7jCINnBXwFTxpHe9vmKllUpXLnvVieQfM9SL/hDav7wx/R9
	 0ypt/fgCfq0bTn3a9Uo/OI9lnh0iKB6fNOvXMP9jdjddmRf0QE8Ucv7hVIspu6hvlKktQ
	 uAchw1HajtKWkNxddXbVtY50vvr7SRSwZLlSr/An+WZ65kw7xA/BFoNk1jPfDquXB+O7p
	 hsMM7zicwL/bhbsLm+3pEdqmJOcd9LfvHVZ3XX1Wtb2TE40D5QcWjW5ZCYhq367iZhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FubCZOfa;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE638606A319
	for <linux-usb@vger.kernel.org>; Wed, 21 Oct 2026 00:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FubCZOfa
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74E0C1F000C9;
	Wed, 21 Oct 2026 00:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792543482;
	bh=gad02bNQ2Ftsf9QIkstXUbohNA4LJvcWN9Y4HNC79E0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FubCZOfaKYYyAF8ftea4M6SFPFwMsgWrR5o+iXdMCfoDXQ8Z3KNqFZEDVKsKWaVZb
	 ww3IV1XbQjN4l5RToMXMpxZoAZK8471A3vwzkBPZj14xWbQNWvr9SVE+sVlXoE5fC9
	 MbD+5paGKuFh+m2BpYAxaxoZ6CrcR21UBf7Pd6PDz+kJ5B4sJP6szG1quVULcmIPAo
	 1vXujm6/DxOQYF2X97dIYa0SGxYp79ZYw0VXw4QEc7Wafn4CbuZMb99TSqUb8g+cEE
	 zJmTo1TC2+gJ1Nr4J9+Jxpd5JyQu6h8yqIe7NdDRv4JO20bVInUQrYQqNrOkLXK3A9
	 lujnzXMmOw1Cw==
Message-ID: <sashiko-outbox-179646@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/7] usb: dwc3: gadget: Reject requests to a disabled
 endpoint
Reply-To: sashiko-reviews@lists.linux.dev
To: "Thinh Nguyen" <Thinh.Nguyen@synopsys.com>
Cc: =?utf-8?b?bGludXgtdXNiQHZnZXIua2VybmVsLm9yZw==?= <linux-usb@vger.kernel.org>
In-Reply-To: <4ceab6aa5d6af0e4780f9d3a964fd5d8168a0a02.1792542945.git.Thinh.Nguyen@synopsys.com>
References: <cover.1792542945.git.Thinh.Nguyen@synopsys.com>
 <4ceab6aa5d6af0e4780f9d3a964fd5d8168a0a02.1792542945.git.Thinh.Nguyen@synopsys.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 00:44:42 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> __dwc3_gadget_ep_disable() releases the lock while giving back requests,
> and DWC3_EP_ENABLED is only cleared afterward. A function driver can
> queue a new request in this window, and the driver would start a
> transfer on an endpoint that is already disabled in hardware.
>=20
> Clear DWC3_EP_ENABLED before giving back the requests, and reject
> requests queued to an endpoint that is not enabled.
>=20
> Fixes: 72246da40f37 ("usb: Introduce DesignWare USB3 DRD Driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1792542945.gi=
t.Thinh.Nguyen@synopsys.com?part=3D1

