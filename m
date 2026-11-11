Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794385065;
	b=GUPy8bct5cMx3qgv57pFg2MCeArPzBuRDBQscDRnymgWpujvBB0vzoHiVDgBep/n3Dpa
	 AhuMPsVkMdVV/lxUZdyz98cISiPngQjGve67QK85ts5uvmmufL9TzTOtnuaEeiHcv1pvt
	 zVGOv4qLNbfiEr1e5naLap2duVtAYiHYI3rd1+1HFU5NxpZukFZgyqxeCWWus9EFWtmuP
	 ONhAExUsZFn9aKINL3rVStSEftylovhO+RQizGsBtzrrU0Q2I6tO3OmgdoI/JqeuSHaWo
	 TbZpXrZ6CadrA4AsZ8cxFC/BgjYPJXpmet5GIa1U2r0MX2EtEKo59XJpAhwu1lqtALA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794385065;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=bDf3c0tp7NLsJ9eGa3MruXDoV1tpSrCZ8Kd8btcEWQQ=;
	b=1qKBnq5BREmbyVFOG7ZZfBWrnVcgTmZHy9AN2w3bK9MEvJaPdUqbJkgk38UAe4CYGg+U
	 kdcSsX4f/ywJr11a9K4A8ht6vu9kZpJ3xWcM0S1uV0zjMD1DAvRtuDAqP3Ls1KuVooQsS
	 4Z8vZFrLDSnBaYGcUCSiRoafNBVsP1QJ9o5/z9vXEU4Wf0N2onmSp1rNFgE2GosvlvCr5
	 c4bmvNEXxKWAaGqYnTDRKGTwnvEjpCC6KV3hRRVSXD9UafL3JUlABzem9PTKRQLgrPiJ0
	 YdcDZNLJNjlNhFtohtCaYVYwKIgHpJR1QNj4hryH/RKslUZ7uCeU4OKudoSeoZVB5FQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Btx0grXU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11151606A31C
	for <linux-usb@vger.kernel.org>; Wed, 11 Nov 2026 08:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Btx0grXU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80E3A1F00A05;
	Wed, 11 Nov 2026 08:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794385064;
	bh=bDf3c0tp7NLsJ9eGa3MruXDoV1tpSrCZ8Kd8btcEWQQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Btx0grXUAoxJwRINGuL0GOufvJIgnOeHDXaZSda0slzoU0k+wfrNS20rhGJPgfACC
	 46o5vuaS4dsGloMb7yJenoGjf4KkGmTqmo1V2dE1uh3pgTBcZ5K61XsTVONnmdOtqQ
	 QZm4zSLZ5fWuoVSu7PRGvpWQya6GS4OeFSoALNH5vPmIw+Rcmj68gl0Nk/uBUoxPAS
	 WD+fOIWMVm3QYscOIhxXKFzXicixi+o4LR+DKYGfoh4W+si2TL6kZUXoOVihV7vv26
	 ZIWfnv0Kfagklejy+BywzzcTbQ3s/0yHVMt/YKzUOY6Uu8eYQif+N47kawbKYUEcuY
	 ZC2Eg/nEl+I7w==
Message-ID: <sashiko-outbox-208585@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/4] usb: gadget: f_hid: fix report_list entries leak
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shunbo Shi" <shishunbo@cmss.chinamobile.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261111081313.16626-3-shishunbo@cmss.chinamobile.com>
References: <20261111021655.37851-1-shishunbo@cmss.chinamobile.com>
 <20261111081313.16626-1-shishunbo@cmss.chinamobile.com>
 <20261111081313.16626-3-shishunbo@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 08:17:44 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Each GADGET_HID_WRITE_GET_REPORT ioctl for a report ID that is not
> yet in hidg->report_list allocates a report_entry and adds it to
> the list.  hidg_release() frees report_desc and set_report_buf, but
> never walks report_list, so every accumulated entry leaks on
> function destroy (e.g. when the HID gadget is unbound and the
> device is removed).
>=20
> Free the entries in hidg_release().  This is safe without extra
> locking: at release time the function is unbound (the workqueue is
> already destroyed and userspace has no way to reach the ioctl).
>=20
> Fixes: a139c98f760e ("USB: gadget: f_hid: Add GET_REPORT via userspace IO=
CTL")
> Signed-off-by: Shunbo Shi <shishunbo@cmss.chinamobile.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111081313.1662=
6-1-shishunbo@cmss.chinamobile.com?part=3D2

