Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794904297;
	b=rNGFHS9aSH5m8/mWAx1EJv0d2q+GJ1Fs7WBZple6oo3r9q3RobcQdIzLQ2+DU7Rlxtmk
	 eIlMmRkB/WiHTAZkCJJAmD21uJ4a/N1EkFQpbDdJgji9v/Uq2OeZzAxbNVbohV0Ywv5me
	 knT+cnCTQExoMcu3nQDmLbxET3ZoiWqju3tLK43V9koZRTKLsSGDS1f3YJTnJYc1kWBwM
	 mtGnIU2THfo5sorBaMIBZt9hziqh0VPckHwNz2Id1hLc3UQDLlh2KUuvciFLe0XgQ8+7f
	 NqnW3p0hXmiTkF3R2RF/ju18Id0aQ2nPmXWEWt8naRod7vPx10hfy4MDOQSWvTry+bw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794904297;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=rHf2rUIrk0CWQGWkGkDHgfc2cjnc+OuIG+fy6EKCqt8=;
	b=LLlHsVBHidaqwA8QsG6HpCV9r/SqQ+q44xpsk9An/XAyr5UayYTnxm3TXa8tNnWNfnbh
	 MSPGJgui5Bt3fzEQH+TmwnXCnwObF5DJTxv3V54izbokWgmYlfIeHEf0QcoiqUIuxMSJc
	 Gzk9CUXpAC4/wgxIdhXDFsimdsiZNAY2RMVXK933gsfW+A9JWm4FJexg+LcrRLok1SPx1
	 z1GlWjM6TqqI4SLdOXXDNMLGaM/qp1D6j2gFDosaG9mXeA0fdfhxgBi9OYok7m2uxXvcJ
	 FFBhhNFTOabq9vUsRFoqRE15nrfUnVi6xzLZK/oKD5kvnpN9TF6P/3fGkBgINql6Pfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EzUWHb1z;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 958DE606A33B
	for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 08:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EzUWHb1z
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22B4E1F000C4;
	Tue, 17 Nov 2026 08:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794904297;
	bh=rHf2rUIrk0CWQGWkGkDHgfc2cjnc+OuIG+fy6EKCqt8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EzUWHb1z1p74LEvKlmdCjqyrWUE8IkaLRhgCW2DCq+sy4KF4aGPSqOvnhwTunbVew
	 O/pdTuz4hrDF3ezzzL2eLgirHkGMIP5L58EQ2hv5L7AJEXs6tnibE9tRH/NI0+TtbQ
	 yAF2rDTK4KvU1G/muQctSdnU7g0Y9Wb5Va8Jc5hFeIO1zmCwguvoxSbknvrBzgoh+N
	 wdR4GXhDHsso6aOi11aQnqocTBSWs6t3FffDmkDKId+V7S/Cj4sgbShRKgFCyX8TKv
	 kVV32OBdj9NVhwnXEriygG3hWwNNtAJhQMPCrtGt4unsqFt1EQopReAbDo4HwrJ3XL
	 8OU7Wx/ufG+jQ==
Message-ID: <sashiko-outbox-218417@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: typec: fusb302: Keep interrupt flags across a
 failed register read
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexey Charkov" <alchark@flipper.net>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261117-fusb302-irq-read-error-v1-1-a85d45b91912@flipper.net>
References: <20261117-fusb302-irq-read-error-v1-1-a85d45b91912@flipper.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 08:31:36 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Reading INTERRUPT, INTERRUPTA or INTERRUPTB clears its flags in the chip,
> so bailing out on an I2C error in a later read loses the flags already
> read. On Flipper One, a NACK on INTERRUPTB just as a source raised VBUS
> lost VBUSOK. The driver kept treating VBUS as off, so TCPM never attached
> as a sink and left every Source_Capabilities unanswered.
>=20
> Keep the flags pending until they are handled, and retry the reads a few
> times, as such errors pass. Otherwise a flag left pending waits for the
> next interrupt.
>=20
> Fixes: c034a43e72dd ("staging: typec: Fairchild FUSB302 Type-c chip drive=
r")
> Signed-off-by: Alexey Charkov <alchark@flipper.net>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117-fusb302-ir=
q-read-error-v1-1-a85d45b91912@flipper.net?part=3D1

