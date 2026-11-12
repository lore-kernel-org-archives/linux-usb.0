Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794493586;
	b=Ts9d951kpmXK3vqdgfS3A0A0AbXM+w72CULNWr7tsbBymiwYKhcy4mLx7vuyrHWCptSt
	 ImrDRGCklrMPns6XB8savchT/Y2Mb58N/17Qol2ygcj8/Jib25Jv9NKeht49hFBv0KLV9
	 TfwHf/z2goE4ebEHqsVQ/r2kwF/Q4NdKFWrx/0mQlEJkHwwJmcC/VKPjQfxaU3p6mQ+5e
	 MejdlXiHB19xKuSSO/uw457+nS2lGjpwcFggmh034QWyC/yDeG83IwQem8dBlfz8a+AFd
	 SKSQP6DFyJ59CnECKmu5SasyWQQRTPTDx7PXk6vXVso0aQlW7GIS+RBeFRZ2s17In8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794493586;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=CoV7aFzNIVCILECFp0oMLv+CJ5zi4PfeFdp7Oz12nUA=;
	b=sDRCXb3DJsFjp5OUx1w6kPSGi0EcpTvDoPo8Zwrv41dJwH72m4Lg0l5VGoFknSDjLfBv
	 L5oNsaC24h/bBHmk40Jxzsjd2rZbQVCbGMqCg0eCwZU/wBrfecYNkkWtjIv0sQWluwQvH
	 kt4je1gL+1QUIw/jOJ6Tj3XafB7tGqaL+gQGH1SufDkCRb9blJ28P2Fpq3MTCVmSf4Suw
	 n3/kojEDMFp4Aci/xLSZ9BvFCJPzqYMPikizQyEjXAzvp08ZiJUb6ZH/3yq3RzT53ySlC
	 m8CBP0gzWuxPyPtrSuTk34f0ZQ9XNjOMo2GwH7HqDPpN0y6Sq7Uerwbd0ONsncbbo8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mux1Ut5V;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA13606B2C0
	for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 14:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mux1Ut5V
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F2D01F00A05;
	Thu, 12 Nov 2026 14:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794493585;
	bh=CoV7aFzNIVCILECFp0oMLv+CJ5zi4PfeFdp7Oz12nUA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mux1Ut5VS0Q/72ptIYOsG16cMXBrLjvzQaYmq8RT/MM6u1npcoWQUyNAZuRHnKCzv
	 KpAJy2IXN3dlN70E1VNbyQFZNWVycw/fBd/wSKlw+bZCJhmmHsT5LvWgtlDPgn7x7M
	 V0qgJk0RdfhbD3gBaSfq+f+2ETAaBEUrpqIIFIQv6Rb4uU5PIekNq4lZURdEEFd/EO
	 9Tebz1NqnJi8y9lF9pUaJq1u1U4uPGgw8ysp07bozm7MVtdfoJ/gLjPOodwieqMvIN
	 8clJ9totF9QLo862Kir969CGofIz4fW882/Bli0/rtIhiFOSYU8/YXbABXGDwX4LaB
	 sJSlkJ7x8fSKQ==
Message-ID: <sashiko-outbox-211314@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] usb: dwc3: tell xHCI that it lost its state when the
 core is powered off
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joonhoe Kim" <26rote@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261112141512.1840-1-26rote@gmail.com>
References: <20261112141512.1840-1-26rote@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 14:26:25 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> dwc3_suspend_common() powers the core off for system suspend
> (dwc3_core_exit()) in OTG mode (DWC3_GCTL_PRTCAP_OTG), and in host mode
> when the controller may not wake the system or needs a full re-init. The
> xHCI registers and the state saved with the Controller Save State
> command are gone then, but nothing tells xhci-plat: xhci_resume() takes
> the "state intact" path, writes the saved registers back and asks the
> controller to restore its state (CRS).
>=20
> xhci-plat has a flag for exactly this, power_lost (commit 668cc6bc1178
> ("usb: host: xhci-plat: allow upper layers to signal power loss"), used
> by cdns3), but dwc3 never sets it.
>=20
> On a Lenovo Y700 Gen 5 (TB323FU, SM8850; DWC3 + eUSB2 PHY) with a USB
> 2.0 hub, a USB 3 flash drive and a Billboard device attached, and USB
> wakeup disabled, s2idle then broke the host controller on resume: either
> [ ... ]
> the dwc3 core is suspended does not reset the controller.
>=20
> Fixes: c4a5153e87fd ("usb: dwc3: core: Power-off core/PHYs on system_susp=
end in host mode")
> Fixes: f09cc79b4b33 ("usb: dwc3: add dual role support using OTG block")
> Signed-off-by: Joonhoe Kim <26rote@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112141512.1840=
-1-26rote@gmail.com?part=3D1

