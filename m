Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793879673;
	b=KZ/4gyoOo1aMlhGU/8/lhAJerJA77kMNOzmgUOoKOjaXm9vA2N0ZMSquCLOntvOb9voM
	 r9p1oIk7pJqGF94CosA4P3Nzx0lzK+DFlOInIXQ+2RwC/Ome/gYbQ2TNC+bK0A2DY9VMO
	 SndTh56GOC7blKFaumj9Htm72KIg+WcqG+LTnrdTo94JQ6OTsbgNVeF+q+euLIeDQ+dT3
	 X10ZHHbH6nN7euxTDVovEUIKQ1Vg1nbNM4D0hmvPY4dbrc2u4xmdwpSdYocx+OJYzbHeQ
	 pOdCuqdPhpXSceICvtGpAHo7ERahq4CoyMFYXHs4LGkEEGiYvsg0jLdTrOvu6/5C8oA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793879673;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=LKdzzXLcFdU2/830KihE+FyKs8/m/M6rnLWPiz/5uMc=;
	b=3si2yRfTRa+AKw12mXicMBIYFuVi8XhSo8CG5aM7g+2f4iSxSEE1uo+PyD8jEErxsfpy
	 iinn8Wsp50quepdeETyIRDmtbmAzK86QSGCuoZb3Pav//JpcK8TZxscfhqGafcug3TEeT
	 zj/OxihTayMig5tHEzDx40j+j0y+31z76wxkGMPBnbW55wdCa8/25O90gsYlPeDNwYFcm
	 JSii0tNPDnrhrJUqEvRgAbB2dkMfF8VSutQAho0h2JTPxmW8JhoUniSr0/JYs43ud2zVP
	 2dEtYtHFQvU7xMMUE5hs+x+b02q4xp2ak7WuWavOScFiOneHBOUrEp9FRjlslehOtvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ce1LVWL8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EBA2606A330
	for <linux-usb@vger.kernel.org>; Thu,  5 Nov 2026 11:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ce1LVWL8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0502C1F00A15;
	Thu,  5 Nov 2026 11:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793879673;
	bh=LKdzzXLcFdU2/830KihE+FyKs8/m/M6rnLWPiz/5uMc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ce1LVWL8hvogAj5JT6Hufoa18RqScACBWXc17gCmfmdW6CW1+TvZ+ySSWJ3ch2J5a
	 R2SpDw/bLIxDwM0tOjBGQ/rIHWzqebEqt664qp/6PE2UVb3AYhqgR5rm1pwQ5NNiHJ
	 GBbdD8puEp7F8Yf+goz3UOH+YuUXm+By9aglEOCFGhdfzukU345bDzUcI2Oxq/yZbv
	 udtA1RUM6eazDiJVCnc8L2yqm4n6kqt8JLHRHIilS4z/7dljo8krC3CFRMoKfnjaET
	 kwuH/+lzYUM0vhqTFG9lj2CeNqQvRT2MHXWMUg2SgONRwVsFMf2svv9OBNaicqvh/C
	 /V3VGibkdDJbQ==
Message-ID: <sashiko-outbox-198975@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] usb: gadget: u_audio: call period elapsed under the
 stream lock
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yaohan Li" <shunsheng1218@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261105114309.970899-1-shunsheng1218@gmail.com>
References: <20261105114309.970899-1-shunsheng1218@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 11:54:32 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> u_audio_iso_complete() drops the substream stream lock before
> calling snd_pcm_period_elapsed(), which re-acquires it internally.
> Between the unlock and the re-acquire, a concurrent close can run
> through snd_pcm_drop(), finish the PCM release and free the runtime,
> leaving the period notification to dereference a freed runtime
> (runtime->fasync in snd_pcm_period_elapsed()).
>=20
> Keep the stream lock across the period notification and use
> snd_pcm_period_elapsed_under_stream_lock(), the API for exactly this
> caller-held-lock case, so the callback's runtime access happens
> inside a single locked section.
>=20
> On final PCM release, snd_pcm_drop() takes the stream lock before
> runtime detachment: an in-flight completion holding that lock
> finishes before STOP can proceed.  The STOP trigger clears prm->ss,
> so subsequent callbacks do not enter the running PCM path.  Runtime
> detachment happens later and is not itself protected by the stream
> lock.  On the gadget side, u_audio_stop_*() dequeues the requests
> before the endpoint is freed.
>=20
> KASAN reported the use-after-free in u_audio_iso_complete() on the
> unmodified kernel.  With the callback stalled inside the locked
> section while a concurrent close ran, no use-after-free was reported
> after this change.
>=20
> This issue was investigated and the fix was developed with AI
> assistance (ZCode/GLM-4).
>=20
> Fixes: 773e53d50e227 ("usb: gadget: u_audio: remove cached period bytes v=
alue")
> Signed-off-by: Yaohan Li <shunsheng1218@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261105114309.9708=
99-1-shunsheng1218@gmail.com?part=3D1

