Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794807503;
	b=MrxHE/yThzDaZ1nrUuYbm67cJTEE3O4BWpQvLbvfoOhQDFe17Xx8nSuI96KObAhbmrmm
	 4EEaF7dJqFA2gaCxzror3JjV6E5PvkKK7P8pgy80O418R9fOJai7PzxXyNSYhTUmchc2A
	 CL2yeaV+Tj/VOVrI6OQCKe/uqcPxo+fTvncXtZkWikwyibQUj7wAMRLPV0QPjXXJOc9Lp
	 OCSJsRH2L8s/5fz7UsLBuoKYB6ZWevpNSWCSGDSJxmzFULM9rve2nrTMJkvNfdiog7HV7
	 kE7QqqjKlW1qZZjwqQqaQxzRHNFW92Fj4rQoPcOPlkULICcA+mU9LE8d0pu4MSJK41g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794807503;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=iEh/lzJla58uXSA3uE2YGr7orxpADJP4dNPT1SBl2cM=;
	b=XhLijgDYmEBQ/9uO6dUE+pU8FQqrTnCrVS8sANEuPn/GcWZ37iDPteS9U+ErDGiK5deL
	 EYLtB2j85CgRTqy49nhbYAeYdfzuQeKxiOt1G0bycnZLHj9+XxmpHrlOj29BOKqFF3BI+
	 s+Ebhf5Mv9gipIpZmlTCnNcy5W+Iaw8YKS8h2UNdWon0f/+qhvEs693cijR9fhNPtPfHh
	 67dhh1TECaZX1jql2HUR7MRVYVWxIgRvosVDpyDLgMiOVp62ePri9ImAR8Udw661oCgVh
	 cJ4H3cpy+/6iv7ktIauHLkWEXznJNPKCHsIj6LM06WNDqKHUjwd9pzYbOxYv+v5wDCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JyH9uMOf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A805606A31C
	for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 05:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JyH9uMOf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F0211F000C4;
	Mon, 16 Nov 2026 05:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794807502;
	bh=iEh/lzJla58uXSA3uE2YGr7orxpADJP4dNPT1SBl2cM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JyH9uMOfCccqALFge0HVjnpaLnPfgvsh813CvJg9d7uXN0WL+2SbR6mQmCHx5dZnT
	 K3jyMNaOClDwiusWeAK4hcJTzIJpt9vKI5dcWagZDKXTQVZbZ82j8Y65TShbecbowM
	 XL8JQatxFGSIj1r3g0p39DgxIZoAm9otsnK0wL1PQWU3fKbuZ5VPxo5Gm+d8Nwfgax
	 sd8fLqGlT+MkhcKt5HW2B0VL2UHCHBVk96puItm9HKZ72JDiSlYR+8tBWZWBSc1Z4j
	 BON3YMtSP2x0ZJnxK5y1aWWnGRtIPzBGNUAAUY+w0Ds6ULF0695ggr0QwivwKOR990
	 ixvcyduPSbIJQ==
Message-ID: <sashiko-outbox-216218@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: host: ehci-sched: Don't let a bogus siTD remaining
 length underflow
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gichoon Han" <gichoon.han@samsung.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261116052851.2272125-1-gichoon.han@samsung.com>
References: <CGME20261116052855epcas1p403c518b90d70d98752ad0ca2d9ac05e9@epcas1p4.samsung.com>
 <20261116052851.2272125-1-gichoon.han@samsung.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 05:38:22 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> sitd_complete() computes the received length of a split isochronous
> packet as desc->length - SITD_LENGTH(t), where SITD_LENGTH() is the
> "Total Bytes to Transfer" count the controller leaves in the siTD.
> Nothing checks that this remaining count is not larger than what was
> programmed.  If the controller reports a larger value, the unsigned
> subtraction wraps and the class driver gets an actual_length of
> nearly 4 GiB for a packet that can hold at most 1023 bytes.
>=20
> This was seen on an ARM32 system (vendor 5.4 kernel; this code is
> unchanged in mainline) with a full-speed UAC1 microphone behind a
> high-speed hub.  snd-usb-audio trusted the value and read far past
> the URB transfer buffer:
>=20
>   Unable to handle kernel paging request at virtual address e8756000
>   Internal error: Oops: 7 [#1] PREEMPT SMP ARM
> [ ... ]
>=20
> Link: https://lore.kernel.org/r/87se19ufoi.wl-tiwai@suse.de
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Cc: stable@vger.kernel.org
> Signed-off-by: Gichoon Han <gichoon.han@samsung.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116052851.2272=
125-1-gichoon.han@samsung.com?part=3D1

