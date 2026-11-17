Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794921146;
	b=Y8xg4Xa/I5zFxlp7bIiKDpXiD8WKGtDUkiXHWtduGf3rB/zUf22LPRLHCY8nkdHJAoxA
	 gBdGxxOkCjrv98yFMu9+HHt2QTWw0vIZ6qBkQPzBNs10H+te/vDLB/lNpX28BKBQaJsaG
	 P4buvU9bETHfMnN1jBHznLVgeJstMalVaIWW9z7v5yKKW0VG725+uslsZ1bdzThljV/z7
	 2uqHSUx7GQJeoyMMAG+ZFcdwfeawNM39/90HggI58OlaBpN+qLDHJI41qs81SbSwvphAE
	 ZHPi0II8D1OEMiIMb8saLomkxHrjkK1hoqEiSDJLpumSVt6XBCAfRbqKUyQmwXqew4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794921146;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=shoRS3JO64t9tcjEMYP83lpdkSsRJO/bHrd4KShVceY=;
	b=AcpETil3I8w0D8moZV1H5Bm6RK1QkBw8MJU+QBUXqouoKkohob1s6qxdIEzze597585I
	 tBNe0KbRpcT9W2BM7MfcfjNy6YL6WNf+ajjAbXXTsmmGcSV5icuLtLGoL+TsmUF2ul41I
	 eM878cYJII388qxth95NGsDwOMKOmhxZEMFR3VPj2PZS3PDf1nJA1v6S1FPoVvhNo5tcG
	 KFFm7JnapExq99SiG8DTc+olYXl21r2WDQTbiDJ2VUbgQJKyzNWD8/o4Mud4BlzUjORmi
	 /tyKiDeNnNuUW/wfXkFst/4Gz8ZtWp0TmsaPVwaXlgDUV8Nx4NtJtcMhfoRZgFQP6vA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=goBIL6Wx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16996606A31C
	for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 13:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=goBIL6Wx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8D961F000C4;
	Tue, 17 Nov 2026 13:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794921145;
	bh=shoRS3JO64t9tcjEMYP83lpdkSsRJO/bHrd4KShVceY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=goBIL6WxbXxNg8RmA5333szuJbfFmNIDuiywl3kV5hoWPcmIp/NYG3nWIWgo+OfcV
	 YfF7RwCUMqgdOk0NnxFUFjcHRaAtDwgsU0cRhB04N+A/DqraklsKytuebTHkdk41Al
	 ekd6af0kjXWadP4g/bSAcZB9bbTXXfxcriF29u103foZTHlzE2bVOKDKIR3NZXDTK9
	 EiOoQ59Q0TUWx+cme6hLc+xF6Me2q2viqc5zv2S66ur9SJJwYO/4rV2bWWf6vf2LJi
	 Qj/1u+9ViTt9KA6z5Ape8FLSxSThMTP1GVmR/r2DhRWJbxEugkwFaMZt3qeYmCvoKy
	 keaypUc+os2vw==
Message-ID: <sashiko-outbox-218845@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] usb: dwc3: apple: unregister role switch before
 taking lock
Reply-To: sashiko-reviews@lists.linux.dev
To: "Keisuke Tsukuda" <tkdkei@outlook.jp>
Cc: =?utf-8?b?bGludXgtdXNiQHZnZXIua2VybmVsLm9yZw==?= <linux-usb@vger.kernel.org>
In-Reply-To: <20261117125825.27629-2-tkdkei@outlook.jp>
References: <20261117125825.27629-1-tkdkei@outlook.jp>
 <20261117125825.27629-2-tkdkei@outlook.jp>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 13:12:25 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] usb: dwc3: apple: missing Fixes trailer for dwc3_apple_remove()
  lock fix
--

commit 96c6a6a050705a0ebc8be7bb5bb8a9f2787d72a7
Author: Keisuke Tsukuda <tkdkei@outlook.jp>

> usb: dwc3: apple: unregister role switch before taking lock
>
> The Apple DWC3 role-switch callbacks take appledwc->lock while the
> role-switch core holds sw->lock. The core needs to take sw->lock during
> unregister to wait for callbacks. With the current remove order, this
> would invert the locks: remove would hold appledwc->lock and wait for
> sw->lock, while a callback could hold sw->lock and wait for
> appledwc->lock.
>
> Unregister the role switch before taking appledwc->lock. This lets the
> core wait for callbacks before the device is torn down, without creating
> a lock inversion when the role-switch core change is applied.
>
> Cc: stable@vger.kernel.org
> Signed-off-by: Keisuke Tsukuda <tkdkei@outlook.jp>

[Severity: Low]
This fixes the lock ordering in dwc3_apple_remove() and carries a stable
tag.  Should this include:

  Fixes: 0ec946d32ef7 ("usb: dwc3: Add Apple Silicon DWC3 glue layer driver=
")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117125825.2762=
9-1-tkdkei@outlook.jp?part=3D1
