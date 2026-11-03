Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793743664;
	b=akywoGSuZQFVvJELKYUzNWzVvSJHyCWzAUIVQ2PpWep+mMSb6fMx29BfVHyxs7Axcylt
	 CKhEbayE2jcuWFA7XPKh7KcCfLvtXYX5Ha31JwluJPtoinhpTLBXnuj17zIcsOuDdWGMu
	 kqsRVYuZD1qnQCZY55cxxx3B84Xz/rkspNjMnZwbrQoMy9REOJLU88uzbe4RASHqIq4vg
	 Y1dARzuOop1Uwr/WWkGvk2NaZwNmqDeSWRSE9QFb2m5/KUM457WuQOKLo3iXeVlWkzVLz
	 5LjPS7K4KrpqhSiKDOeuJWIUDZdbtDrv/tfsXIWngjOuppzDtM6NJkSowGnOHEFIHYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793743664;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=/sVPMEc3sUu/EW2c1BKQQDmmzwBiQVgYTx370sdvxTE=;
	b=ZzdlnGi4944nUggVG/bF3KSwgnRngyUhm9DRdR24x0/Db0o+oQUXurMKhnuDHK39BSHb
	 /n1YsW45J7CJKl+KV2/5kMPppiEH9t5wky7YwForUg8ybYc2OewF0hLyIc1of9FD3i81a
	 yIUJuBN5THvaPEAQTG2hBr8szPbkYvk0S5eh/JiGwNtKLOmt/OVPQZvzN+QDyftJZyiLj
	 xESJrcNED6dGiEZvQymaPc1IAlFDJ0rv2ttENxhQImKBD4uYEBq1kCt85WzqLfMCBP/B+
	 4+aXTYgawoEia6nMSvVVT6fcwHiEmuhpbgES+yt/f4egfSG2HJZylJGcre/+JFy4Uqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="gsV/L4OW";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79AEE606A338
	for <linux-usb@vger.kernel.org>; Tue,  3 Nov 2026 22:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gsV/L4OW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F33741F00A17;
	Tue,  3 Nov 2026 22:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793743664;
	bh=/sVPMEc3sUu/EW2c1BKQQDmmzwBiQVgYTx370sdvxTE=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=gsV/L4OWR30L6H9f6sTujV0G0ZEWdlRnnIjQavNNokE9SynPujLzFUbHSCCbhwS3F
	 dDeSqAsqFM7yP5eRC3TDiRkOXJUWPPlHftMiWQNzGfK18wOQYwoL7LpzTNy4imvUKB
	 SUrDJfo0pNq3mIMe3VyWKfM/AZcxkazDxGcqkde5bmFy9vjZrW56Z+e58CMKVW6gna
	 QPOLNrHFgkpdxFLhleVi2Dnd6c2KRFtQcsn+EE7JEky6ot+VUpFRZHYG2svObB3U4M
	 62WKjrToxtLiF55wKsvATBNSYh0ivp3moDEQcdf9nBU3E8jLYIdL4qUd9ptg19pd/K
	 Cr+ZiRtegE+IQ==
Message-ID: <sashiko-outbox-196097@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/1] usb: renesas_usbhs: use
 dmaengine_get_dma_device() instead of chan->device->dev
Reply-To: sashiko-reviews@lists.linux.dev
To: Frank.Li@oss.nxp.com, =?utf-8?b?b3BlbiBsaXN0OlVTQiBTVUJTWVNURU0=?= <linux-usb@vger.kernel.org>
In-Reply-To: <20261103220538.1836027-1-Frank.Li@oss.nxp.com>
References: <20261103220538.1836027-1-Frank.Li@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 22:07:43 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> From: Frank Li <Frank.Li@nxp.com>
>=20
> Replace direct dma_chan::device::dev access with the proper
> dmaengine_get_dma_device() for consumer API.
>=20
> chan->device->dev is not always the device used for DMA mapping.
> Some DMA engines support per-channel IOMMU mappings, so different
> channels may use different DMA devices.  dmaengine_get_dma_device()
> returns the correct device for each channel.
>=20
> This also prepares for making the DMA engine provider data structures
> private. DMA consumers should not access DMA engine internals directly.
>=20
> Assisted-by: LLM
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103220538.1836=
027-1-Frank.Li@oss.nxp.com?part=3D1

