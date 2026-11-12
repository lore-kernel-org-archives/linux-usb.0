Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794500311;
	b=U9wjtl+qL0f6esKx/FUckeGZMb7M5/Ojz4cY7xxtCjk7I6VwpxATTJipwHxclLBLQlNl
	 0e/RX1+xHRml1sxtF7LpFyZYehd2cpT6p4Kni3RN22ilV0NU9vhF4qolg8VN/P66rYNYP
	 dJoJDR91KkyWqvEIiZ8VoFBkvWjg6CzRiSpLc9eiGuUXncInlgNVQ8SMiDJEqGse5nFht
	 3hGwCgYgPz9g2jSy/CsZ7ffCPXlbBu27tBakFwXiUcMPn1yuY7pQjQ4mr/bPb6mBlFehy
	 A6ffYsbUfMqfuPyhIBf9i94g3m+maWEWrH8fu6yJCw2YVHTznI4g393z6wzqvVRLRYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794500311;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=WBlxMakSf9GXGvksOGIqPI6nyglkl2WUswh7ObKbbS8=;
	b=TVJw4b92YNggMzXa5/A9TONo5T4OC0iTex+H8MJMUGOjTZTe7boCWP/phbDylc3j1x1w
	 AGXZ6KfVY0llvNiBCV0wXIH/NtieS96zf7HNZUHcBu7TRAbNs89IzVAqz4xjXyQRMsBK6
	 QoX6a1FIkbjN9V3+L79I+NDJo3kSUMm5WPyPLYSuuDB3Vg2/TK4VQEHrmE29o4jwc9NMM
	 7MEzNYWBhCgMgxU72pTsgZa4Qo5QunLLGc40FxMM70XXR74nnlm0TwPHfAXCAujsQTVKB
	 NQUOTNvku0TnTRfNYn/vNYmsQbgS595KMUczglq0zXI4AD5Fk+psKzhMmkCmXWIE/9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QNn8Cu9s;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72EF9606A330
	for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 16:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QNn8Cu9s
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBE2B1F000C9;
	Thu, 12 Nov 2026 16:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794500311;
	bh=WBlxMakSf9GXGvksOGIqPI6nyglkl2WUswh7ObKbbS8=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=QNn8Cu9s29HIbj8boghW+zvDrEU4kukkm+91eMyS6wc2jfwkUPS7rTeZtIv5dXk+f
	 TK6OOBAHfFcNTINswHZcP8FwakG1zowEUgItfBtKLPZTP/2K2+XKq6ynTBU+xrr5qM
	 PAe1ANUJE5e5X/oueDQe2jFGCQM4szWgwyOH9GgXDa26XaDGXbHmlqE9LZZJvMzM/W
	 9FuxnIoCptPZsao+SZFNEAsic8U4/XeqcTsYJHvVfAFhR20xfUzwNxtGDIX+y/KYQm
	 DkC2v3WRMeP/C4yh1WZZu3l2pMUihc1TvVmJiXi6nIse+pocbRI75A8S8vnRsZjjev
	 of901yM4xvk9Q==
Message-ID: <sashiko-outbox-211487@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/4] usb: gadget: r8a66597: free the IRQ before deleting
 the timer
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chengyu Liu" <lui2012qwq@gmail.com>, linux-usb@vger.kernel.org
In-Reply-To: <20261112160448.41566-4-lui2012qwq@gmail.com>
References: <20261112160448.41566-1-lui2012qwq@gmail.com>
 <20261112160448.41566-4-lui2012qwq@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 16:18:30 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> r8a66597_remove() deletes r8a66597->timer while the interrupt is
> still live: the IRQ is devm-managed and only freed at detach, and
> r8a66597_irq() re-arms the timer when sampling VBUS (VBINT).  An
> interrupt landing after timer_delete_sync() re-arms the timer, and
> r8a66597_timer() then runs on freed memory.
>=20
> Store the requested IRQ number at probe time and free it before
> deleting the timer; freeing also waits for any running handler, so
> nothing can re-arm the timer past the delete.
>=20
> Found by static analysis.
>=20
> Fixes: c41442474a26 ("usb: gadget: R8A66597 peripheral controller support=
.")
> Cc: stable@vger.kernel.org
> Signed-off-by: Chengyu Liu <lui2012qwq@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112160448.4156=
6-1-lui2012qwq@gmail.com?part=3D3

