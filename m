Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793731160;
	b=KFzxprMZBwSTflkRe15JhvQzICCLaOpnJRgvBaTj8ZanBcV4zWDXm+P39VDS0hPLw8P1
	 wgSl+CQUCUHWoLPk3zpZSk2E13lzglIq7dZ+Fll7tq+Fwozk1Fcs8jLsJBphTG+kpJY2O
	 y5ab22ue41CXbOybrNdi2tx4qS3nfzX12UgkvoCTWrpPbpgxZJ0dMTM/qf5vqtwF/3FjS
	 QQQyrZvwOOv/YEE4cctydiBW5Mo3QsKDiDfSksDdfZ6m+i7ClYZZMmoYISfHKYXMr6ki2
	 7GJfKbV2jXmouNp5dZr/sRIsyPNH/pqJI6pGzvA/qQY3U/QYh1aL6Cj23mNsenGIDKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793731160;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=PFewww6lcO0g0MW5nXE1YWlpaMC6WNzA3VZG7vOT9Nk=;
	b=2/ny0YfSxw6j7RzdVSJVphRwK0r7TFewfYKxvEA110M8tvvv3dpTe4USmm6po7mfq7ix
	 /jJj10RTwwrcH8OqSFKBzCVc4Fc6VW0KtThPhdwZ0EBOkGltnvLKpFNtjWfeLSRL6uC1t
	 GSK+pjIvjPbFblLPoeajEJ8GWf2h5lNm+WcDFxypWUI1Jx9rpEyU7uNuR9gFz5Jras3aQ
	 3a7CGqPd042Ae7ZHAnvmx/nNx1il8diga4QAEvHPBOcdyL2GtEx24CSvsxzZowfa2H9u+
	 1ENyU87mu/39OhUdC5S0YUSJZN8z1MJDT2nHVeSrq4ezZ4tL/TXjQgSojog+8tIWU+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="eB/iKJqJ";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E147606A329
	for <linux-usb@vger.kernel.org>; Tue,  3 Nov 2026 18:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eB/iKJqJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4886D1F00919;
	Tue,  3 Nov 2026 18:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793731160;
	bh=PFewww6lcO0g0MW5nXE1YWlpaMC6WNzA3VZG7vOT9Nk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eB/iKJqJ7WTBHlkBRK2X7SRGmtXOiF5yCyn7zZaBbbAK1aUzkptNz6TETS6RrMHCV
	 le/WE/u71t0gJBZHt2ptkul8F3MSuQs5uYz0u1ljo9Gw9XxIwp9bBYGe80EMSjfeGz
	 DZmAGg/5X5sR3kccWpsTMaPP7zloHys/Z7/6scx/fAisqVPH0ycJefvk7EuXT6zkZ5
	 fdacrPD75NGrC5OlzvFyB5s+9XU7BgGeKjMCQRGCgrTbR3eCjR7wk9mJhMagGODme1
	 sUu28oIx1y9LtE7I8yuuetDrpDqMIpOgs/KQx5k6xqUabUybtXH2h1De7By3qHXFHP
	 eIaLCREUTstQA==
Message-ID: <sashiko-outbox-195852@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: dwc3: Increase no-IOC ENDTRANSFER delay
Reply-To: sashiko-reviews@lists.linux.dev
To: "Elson Serrao" <elson.serrao@oss.qualcomm.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261103182953.3437202-1-elson.serrao@oss.qualcomm.com>
References: <20261103182953.3437202-1-elson.serrao@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 18:39:19 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] usb: dwc3: unupdated 1 ms ENDTRANSFER delay in dwc3_remove_request=
s()
--

commit fee87ffa001e1c9181771b93176db403ea8ec8d4
Author: Elson Serrao <elson.serrao@oss.qualcomm.com>

usb: dwc3: Increase no-IOC ENDTRANSFER delay

This commit increases the fixed delay after issuing an ENDTRANSFER command
without CMDIOC from 1 ms to 2 ms in dwc3_send_gadget_ep_cmd() to prevent
SMMU faults when unmapping requests during teardown.

> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
> index a76f669a796c2..a907fdfac8d71 100644
> --- a/drivers/usb/dwc3/gadget.c
> +++ b/drivers/usb/dwc3/gadget.c
> @@ -445,7 +445,7 @@ int dwc3_send_gadget_ep_cmd(struct dwc3_ep *dep, unsi=
gned int cmd,
> =20
>  	if (DWC3_DEPCMD_CMD(cmd) =3D=3D DWC3_DEPCMD_ENDTRANSFER &&
>  	    !(cmd & DWC3_DEPCMD_CMDIOC))
> -		mdelay(1);
> +		mdelay(2);

[Severity: High]
Should the companion mdelay(1) in dwc3_remove_requests() also be increased
to 2 ms?

When __dwc3_gadget_ep_disable() tears down requests, commit 1338410c21a5
("usb: dwc3: gadget: Wait for End Transfer completion on ep disable")
changed it to pass interrupt =3D true:

drivers/usb/dwc3/gadget.c:__dwc3_gadget_ep_disable()
	dwc3_remove_requests(dwc, dep, -ESHUTDOWN, true);

With interrupt =3D true, __dwc3_stop_active_transfer() issues ENDTRANSFER
with DWC3_DEPCMD_CMDIOC set and sets DWC3_EP_END_TRANSFER_PENDING, so
dwc3_send_gadget_ep_cmd() skips the !(cmd & DWC3_DEPCMD_CMDIOC) delay
above. Similarly, if dwc3_remove_requests() is called while an earlier
CMDIOC ENDTRANSFER (such as from dwc3_gadget_ep_dequeue()) is already
pending, dwc3_stop_active_transfer() returns early when it sees
DWC3_EP_END_TRANSFER_PENDING.

In both paths, on controllers without DWC3_GUCTL2_RST_ACTBITLATER (such as
DWC_usb31), dwc3_remove_requests() relies on its own delay before
synchronously unmapping request buffers via dwc3_gadget_giveback():

drivers/usb/dwc3/gadget.c:dwc3_remove_requests() {
	dwc3_stop_active_transfer(dep, false, interrupt);
	...
	/* Give the controller time to stop accessing the request buffers */
	if (dep->flags & DWC3_EP_END_TRANSFER_PENDING)
		mdelay(1);

	/* - giveback all requests to gadget driver */
	while (!list_empty(&dep->started_list)) {
		req =3D next_request(&dep->started_list);

		dwc3_gadget_giveback(dep, req, status);
	}
	...
}

Leaving this delay at 1 ms means those teardown paths can still unmap DMA
buffers in started_list and cancelled_list before the controller finishes
processing ENDTRANSFER.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103182953.3437=
202-1-elson.serrao@oss.qualcomm.com?part=3D1
