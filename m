Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792595636;
	b=pcN8nO49GL+fmDd5vAWshCmOLXEAMDMsJmBebMqnwsvaP4PEraf4x8KLnzXf2zQZG66m
	 rM7KPj15Hy4drvFmqbXzjzy9NDpoUMCVX51uDv3QCcGe/mjLOMHlbLNIpKr908Logf0Ws
	 MR4uPEY+iK7fijhvl1hyycEdhFr7qwr93L5wZMME9Fi/p17l3ECoUlIru55FJpXrhfTiw
	 DhXR1wsBbMZaFvaiijfpG2jYWF8C4Mln36+vRC0AjvDWREH72ZliDplEeZxpVHzvjTKOw
	 MKX4rULdateLP1o9MFTtx6BXrYDTCrU8O7HIc/RKOySBLjHKGaiSBxI/2WHjuBNnwRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792595636;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=eaHqi8dqAgCsYrVX1Lrz5g+B7WxoafPHg7phyR1cgLc=;
	b=ANYqfrAWyafGRVmp3HkSBkg51E1eecjEKSaQp9jiCSZbo2AoZceqAwR5mZM975TcLHWs
	 a05PQ5q/R8yCBNfh5/S+MdqzGiAKKrpwB0/6VtaENXTtRYW/mBcsxmBgik0KEroKI5Tap
	 HeGiPaDQkwWSQcbM2XU1981mlmxo37zyBoYEyZrDUNcWikOUpAQEhA1g6HgByo97rk52k
	 HPo5nUL5NTDgYiA7Rsf+B2w8sZGMp5fmAC+ri1490zTw+6VpQ9HBi3mbgunaQrK3Hk2eB
	 uZ+3coQHHz0rp+GYKvSQLEdK0kLid3OkhSdoHsEADSFtDpiamWuu9rzCqgw/rTIKMbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WGTcmqz1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C6D0606A32E
	for <linux-usb@vger.kernel.org>; Wed, 21 Oct 2026 15:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WGTcmqz1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF7CB1F000C3;
	Wed, 21 Oct 2026 15:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792595635;
	bh=eaHqi8dqAgCsYrVX1Lrz5g+B7WxoafPHg7phyR1cgLc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WGTcmqz1hcgSwQLaH2+ZR4AwSVPBvZhlfVSkhLTun7b9Xg17/A+Th+h82qDr8GLYQ
	 hm+R2n2rfqoZB9RuATSSukdUbg66LeQCdNfF3MvEi4ToNeDMfglFaW/ypKoGADe/cp
	 fg0cvSMDdIDpfVD5z0KDCJMZNq+wnFmoT/WPqOGKM5DkvnioSJTUTaqrqouIZ0IP2g
	 OomuNYdCM/3efB7WhBYFj0CgDVepCfMZSo9/WSVHk70nzI1r2ecfNfi2ZILeS7T9DY
	 hgtkv0WTbaluduIYpG0kRrB/sC39/oj751IqP8gnrp0StopLfWQcgYnBq1bgkoDhdE
	 82zOoIwOzhHLA==
Message-ID: <sashiko-outbox-180422@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/6] usbip: vhci_hcd: protect urb->hcpriv with priv_lock
 in vhci_urb_dequeue()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Raul E Rangel" <rrangel@chromium.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261021150704.3129446-2-rrangel@chromium.org>
References: <20261021150704.3129446-1-rrangel@chromium.org>
 <20261021150704.3129446-2-rrangel@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 15:13:55 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> In vhci_urb_dequeue(), urb->hcpriv is read and priv->vdev is
> dereferenced while holding only vhci->lock, before acquiring
> vdev->priv_lock. However, pickup_urb_and_free_priv() in vhci_rx.c frees
> priv and clears urb->hcpriv under vdev->priv_lock without holding
> vhci->lock.
>=20
> If vhci_urb_dequeue() races with pickup_urb_and_free_priv() on a
> completing URB, vhci_urb_dequeue() can observe a non-NULL priv pointer
> just before pickup_urb_and_free_priv() frees it, leading to a
> use-after-free when dereferencing priv->vdev or priv->seqnum, or a
> double-free of priv.
>=20
> Resolve the race by deriving vdev from urb->dev->portnum (matching
> vhci_urb_enqueue(), and guarding against portnum =3D=3D 0 in both) and
> acquiring vdev->priv_lock (nested inside vhci->lock) before reading
> urb->hcpriv.
>=20
> Fixes: 04679b3489e0 ("Staging: USB/IP: add client driver")
> Cc: stable@vger.kernel.org
> Assisted-by: Gemini
> Signed-off-by: Raul E Rangel <rrangel@chromium.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261021150704.3129=
446-1-rrangel@chromium.org?part=3D1

