Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793554348;
	b=mtEcVLu3T2kuHrX0mCPabzGyk8aXb8sJprg+s8RuWpKctbsIuXWLI+Qd3pVpIiFgO4b7
	 J0yvLCG6CpupZeNLLziFXF7o+kI6LHEVhg77Nm1iNqWn8aebqQ6/7faqsB5At0spUWNTD
	 1qFA1WBZ+80PGxAavtpWn1EQSm+X4dkhXopH48aFtbUCfXMsziWKIcxdsmBGOSG3xqveQ
	 lEoeWcmrESesYs1sVKgCFqa3wdCo0ghNy9Q1FLAeVHKVdB99y2wclSLsxwWGPEEg5j8X1
	 CU08xn5Ye+lo5T8aq1tcFRCumrNyahNMs85heyRg2Hc71hVMCt6ZM2KnaUV0ughXnLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793554348;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=4DpCcrFX3/a4M+JWpJvS9fFLQqJR8YbhFOB+uVaruyQ=;
	b=hyI4jPO439V6v+poVaYchUD3i7A0xmLEm8KQ1ogQdlRSVKxbb+gZLD9/TW1Msflpgmkd
	 eJ315Uuf/Aytl3xnf2Esm7Is3QRdGZIVxe95Njp0gqMRhDPouUKgfjcUH1ofSi5776n1C
	 9CXP77a0+Lc/1YrdBAVb/qtgv+QySLWxhRcPbtDkgBmTTizdbPQD1WSl4rYe8ky0QUC7o
	 2zSQ8hBedeHCAmeHrpA0cns3u95nFAmrEHqP1F8CKX6qxV7SHsUiCjQeuvY8NfVtkg2Gs
	 nLgowbDRgNsIt1H2POrQ9ODHmG9nPGK0U4sJsj9Nk9+2OOfahRGzsaIbqJGYwZ2u72g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dbiYYVRE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D043606A330
	for <linux-usb@vger.kernel.org>; Sun,  1 Nov 2026 17:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dbiYYVRE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 178121F00A02;
	Sun,  1 Nov 2026 17:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793554348;
	bh=4DpCcrFX3/a4M+JWpJvS9fFLQqJR8YbhFOB+uVaruyQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dbiYYVRES00jvV97DlwHj2HsF4mKQgm+TxUW1yCyqYVfrbjZMZB5mY2DsDB+RQDK0
	 Fhs0BzvKnHO9qr/m8nS7+7yLRaSg/4oD/paHSfaMhyYfsenbrmX4wP3HV+5okI3nCy
	 GbN+ZB9etgxxPf4MdSJ8uFTZj0Kk3VOJFr5fC01h1zpQ161PrpJ7ZAVv1ewj2VRUEW
	 AwQWhdb9Tya7EMQImJKGx95mkDee63KSfg1owoUT0FlFuUIHX2RF0tmyBEwaYyPl45
	 eBHK9rIPUkCGH89CUqGNbTkMIGSHYWDLlb/1waTE6DMWrDdaZYoatsEiQ85xA37pjI
	 RAnk0dSGqAZMw==
Message-ID: <sashiko-outbox-192533@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] USB: quirks: add NO_LPM for Kingston DataTraveler Duo
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bram van den Heuvel" <bram@vandenheuvel.online>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261101172944.59384-1-bram@vandenheuvel.online>
References: <20261101172944.59384-1-bram@vandenheuvel.online>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 01 Nov 2026 17:32:27 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> The Kingston DataTraveler Duo (0951:173c) repeatedly disconnects and
> reconnects when attached to a SuperSpeed root-hub port with USB 3 Link
> Power Management enabled. The kernel logs only a plain "USB disconnect",
> with no I/O errors or resets, and the drive re-enumerates about 0.25 s
> later. On a Framework 13 (Tiger Lake TCSS xHCI, 8086:9a13) running
> 7.2.11, one drive re-enumerated 72 times in about 5.5 minutes. The same
> drive also disconnects repeatedly on a Dell XPS from around 2016 with
> older kernels, so the problem is not tied to one host controller.
> Several drives of this model show the same behaviour.
>=20
> The disconnects happen about 0.45 s after the host sends a command to
> an idle drive, such as the first INQUIRY after enumeration or the
> periodic media-change poll. Sustained reads are unaffected. This points
> to the drive failing to exit U1/U2.
>=20
> Disabling LPM with usbcore.quirks=3D0951:173c:k stops the disconnects
> completely, including during a 497 MB read and accesses after idle
> periods.
>=20
> Another owner of this drive reported the same problem in 2021
> (linked below).
>=20
> The Kingston DataTraveler 3.0 (0951:1666) had the same symptom and
> already has this quirk, added in commit afaa2e745a24 ("USB: Add NO_LPM
> quirk for Kingston flash drive") after bugzilla #208257.
>=20
> Link: https://community.frame.work/t/device-incompatibility-kingston-data=
traveler-duo/11477
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=3D222222
> Cc: stable@vger.kernel.org
> Signed-off-by: Bram van den Heuvel <bram@vandenheuvel.online>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261101172944.5938=
4-1-bram@vandenheuvel.online?part=3D1

