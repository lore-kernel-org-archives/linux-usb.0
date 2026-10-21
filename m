Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792543766;
	b=Ii2NrLl8LxA5tcefzQggu0qy7UYsaZUgpwxPuVlxnHnLSX3IrfM1w1DquZuCrS7upGfr
	 htJj62qL3CYMCtmPcl+vlbQs9DZueZ6jj0PvMC8CjPV9pw4JiemAZ+FiOhMaVgrrUIO/x
	 XjOWGIDdeApl+fZ84OGE1Y+J5tMrIJDhUdkpe/Uw6CG+hTHasfe2oY+0wXB4Ejz9Z5UF7
	 8DmmGOMEZlDV9jUJ46yA/q6m+XO5XWwnp8apoc/XqrTHddLG8/ygTQ8u9aGadd6vhg6CN
	 Ixynha9KPa4ypA0jpDuul45LxOqiOd28Eis7l6Sv/rbB8tTN5pByKwkKxqs7i3tv13Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792543766;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=nXksRKm05C4yuoaqBConZqhezuQ0QptQqr1wbf05Czc=;
	b=BPsC2I86yWRLFFf0gdSGdNcdTDKwJRWcPtc6PYa6E6pn9BeQXffei5KjPR5uVa8WQdxB
	 9nkg1bo+JubttBS1hCGjkUHvhoFTI8IM2M4RCP0YjQzH4w6JoJfoP1hcfoMSdDgpq57I+
	 Y3c0TVhSmC+/nY8maYYGO5ZKBBecs7nf/YVE5t3o/UfKF+Fx3s0eREXNRRR8/b9+V67G8
	 XcRgzSekT00Eq4oeMF4nesZ4kqMy9rq8cco96KC8EoAAyJKOpGqGUgoPvD4i6ml+hbP50
	 E8mvfbXANaWEWUd8gSsh1GzVZ2wG9mIIZWvTiv29ri2H7WykwFVIoBodYWbUuzKgbOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c6OVkJkk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E146606A320
	for <linux-usb@vger.kernel.org>; Wed, 21 Oct 2026 00:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c6OVkJkk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46D4E1F000CD;
	Wed, 21 Oct 2026 00:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792543766;
	bh=nXksRKm05C4yuoaqBConZqhezuQ0QptQqr1wbf05Czc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=c6OVkJkkRPui01SPNit32q15Ei+nMdn9s0hsIE4TfLnzgLeBNzxrj0m96Hy1hwCXf
	 hyCbh6UkqobNHERxhW1sBDWU5wgCzSsusQATRcw1ujuYO6EQNwM/a6ZN+xuLKNBk++
	 WM4Kl8Y/otgYwAAylurSMvjrWo25xlSOmt1gBbhV+N1+XOECTjBe0Ef5zQkC+jgA4t
	 EMXw0ntZ2bKg8UnHPTliTtsXbnN61Ub3BE6HvWN0Tz1tg8x2UyWk5BJwamOESJ/ZPw
	 zqIteVY9ZVOiken/lifs8muEMhL1WJyZ3ePcaQWsMWjBjLfdWhDWRFG/gaRm10Et1N
	 F9zQyMGF1fsuQ==
Message-ID: <sashiko-outbox-179648@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: dwc3: trace: Restore request name assignment
Reply-To: sashiko-reviews@lists.linux.dev
To: "Thinh Nguyen" <Thinh.Nguyen@synopsys.com>
Cc: =?utf-8?b?bGludXgtdXNiQHZnZXIua2VybmVsLm9yZw==?= <linux-usb@vger.kernel.org>
In-Reply-To: <8bd045b136bfef8ce5de79f1fa2f09db639f0707.1792543567.git.Thinh.Nguyen@synopsys.com>
References: <8bd045b136bfef8ce5de79f1fa2f09db639f0707.1792543567.git.Thinh.Nguyen@synopsys.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 00:49:25 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> The commit 0a06917432a7 ("usb: dwc3: Log dwc3 address in traces")
> removed the __assign_str(name) call from dwc3_log_request. The name
> field still exists in the trace event, but nothing fills it in, so the
> endpoint name printed for these events is leftover garbage from the ring
> buffer.
>=20
> Put the __assign_str() call back so the endpoint name is logged again.
>=20
> Fixes: 0a06917432a7 ("usb: dwc3: Log dwc3 address in traces")
> Cc: stable@vger.kernel.org
> Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/8bd045b136bfef8ce5d=
e79f1fa2f09db639f0707.1792543567.git.Thinh.Nguyen@synopsys.com?part=3D1

