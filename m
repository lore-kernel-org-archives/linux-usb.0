Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794448392;
	b=wbPqn2hZuXvuok1y1MPnJ0VE0u9UWzfu/ULSCZCOFeK5GpaNjVA42qPDC5QtJwA5jkjZ
	 bOOVVRMzyI/y16v1o0nHuGj4WUrebXo1Csq/9j9THQ1SQxfDw56JyawbX3eoIE8+CFyzo
	 nPxGDtlC+BK8he3j+T0gQURKNW5FkMtOKG1dyCJtN1P8pOlVnu5qyCdxYejB355kzqEH0
	 PAQG1LdJfD7u9tWHwKzQPzhFp5axZCocyDkXH4kY6hNXhaMIB6b5gOd+0Aj7Rvz/lWNB5
	 9YqeQqAZ0JL9aylD8QpAb00zncF/EUMwdwU88uViqyLr5DvoyKxAd877mgti6l4+Lvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794448392;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=2g31r9t1Ez+6/kZfNY28c9fyw5TWDoWcfd7LjzaX6KY=;
	b=Ynp+dk6lwlw1kioSGZfBg0+EzC3KxaTSNCBpRm/z9yKyre7fo2UNV1/+MuCaAA19klgS
	 9cBSpwX1WiRVXbxJeGiddaPUf4qj+MIEP4e0ghY4Z80ePrQ60w5JbCg+nERWk3NO4CTck
	 w7Mq1XA2VRaXDFfnkCJj8X7bHUJhQmwnyxxoqYSj79AXDoH3hoY3RWqxNQIaDcUqlAWsl
	 3jNOZMSCrQauZ1cInTaYMvqJ66DHcRJxFiExxW2gkGGRGqoGH1g2Pbi93p4Xxl7nI3eMq
	 wXHmYhQYV2JM7UW/39CmIpirpworpxIv2s7xwwQmM+c3nQj3wuCGWJlUOhlCai2+d7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ccKHVZ1g;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45599606A31C
	for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 01:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ccKHVZ1g
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFAF01F00A05;
	Thu, 12 Nov 2026 01:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794448391;
	bh=2g31r9t1Ez+6/kZfNY28c9fyw5TWDoWcfd7LjzaX6KY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ccKHVZ1gmopf5syrXVYEQnUawjfgeNQnOjHw3Xeh2kk7KukATVweX0KhwkyFCo0Jm
	 ZEm4Ry0WCflIJjD9gMSFWPNgO97pbZQCZtv7IX75Nkd3gkBTAo7B5WTRVLUtEV0SJk
	 q/Yug0keEjm+7GvC+rLbU4jqLh6xMviAII2SVOJmsVld4Zg0CayvQbaXBCpjR7M3tP
	 TXSJ42SyE72pJsZR6YkFVIGWPCwENqeM3oXQeI0iI3zhaTbwFwhje49klZn9/HVZzm
	 YUA5yL4h/lKBjZQ1glT4aH6M1vptmL/cvRY/1VmldpxWBw73eJn1t40FyqcidOHlCW
	 px8isbq+WQ1oQ==
Message-ID: <sashiko-outbox-210109@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/4] usb: gadget: f_hid: fix race between userspace
 report update and GET_REPORT response
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shunbo Shi" <shishunbo@cmss.chinamobile.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261112010928.23716-4-shishunbo@cmss.chinamobile.com>
References: <20261111021655.37851-1-shishunbo@cmss.chinamobile.com>
 <20261112010928.23716-1-shishunbo@cmss.chinamobile.com>
 <20261112010928.23716-4-shishunbo@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 01:53:11 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> The GET_REPORT response is served by pointing get_req->buf at the
> data[] array of a report_list entry and calling usb_ep_queue().
> The request completes asynchronously, so the controller may still
> be reading the entry's buffer after get_report_workqueue_handler()
> drops get_report_spinlock.
>=20
> At the same time, userspace can update that same entry via the
> GADGET_HID_WRITE_GET_REPORT ioctl: f_hidg_get_report() copies new
> report data into the entry while holding the spinlock, but the
> transfer reading the entry is not serialized against that update
> (the lock was already released by the work handler).
>=20
> The result is that the host can receive a GET_REPORT response that
> mixes bytes of the old and the new report (a torn write), with no
> memory-safety violation but corrupted report data on the wire.
> [ ... ]
> This also removes the now unused get_report member from struct
> f_hidg.
>=20
> Fixes: a139c98f760e ("USB: gadget: f_hid: Add GET_REPORT via userspace IO=
CTL")
> Signed-off-by: Shunbo Shi <shishunbo@cmss.chinamobile.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112010928.2371=
6-1-shishunbo@cmss.chinamobile.com?part=3D3

