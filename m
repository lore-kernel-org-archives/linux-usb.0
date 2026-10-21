Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792570314;
	b=nq5+eL2B6WoPbQMMPrv8Fi45Wep/c08VlLA1bDCAuby2/q6gZEz+zmC7MmH4IowdeVXR
	 dYUcyPKw7YVUKU0VuglhAL/mLzk/CVvTGetvx9TwmS6IgDaq/fY3ZexXw2cjKX4OVGpVu
	 iRM6IpTCfs3X5DVlpGeitjOrEfbVrCvY4U/B2w9e9Pl0sOXqAPVizw/0Qi7O1g+hHjMIB
	 0Lne9qM42xwWbS0thosTdhe7tc85C/pbGt5GVPY4U5CGGvGCEMwTlSyv6xAdSols9Hmun
	 c3RaX90O0JOv4ybAf1umrHaVbsthREC5XDbbm5thO+T+WuYfeAev3wIUP97vVGYwk6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792570314;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=TLhTjXPcuzl+uACgERYLAa+kgFLFN6kSXU1oOuZ6PdM=;
	b=C/Qf9pEHu5ZvjdALlovT6OGbACJC642QyO5lV0Fu8caS5k/N0yR8S6TuwFO3bhAQYea9
	 qWnXeaDwjsaX1xHWgI732STA9NBhO6y+1E1uWQOPSujW2tDVuvNVGrArec1fCmAk4nSvC
	 e7u6aRG/kNQftD+hZedo2//8mhlImkLFHiRF9BMKxnxg0cipvSzc3pQwHmxLdpU9b6Emc
	 SoxbZGosYNgXPr/6URZLZoXNEhs1SBmuoH2SRCne9OFbqDDI0ZxxbLoymJF+2oS74aEJp
	 JEz4yYX/7bsrcUE2iTvqok05JhtgO0mfJTWl2Z3TPp35QbaVlA72J98QvrEN84FANPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UnApP2H0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D76606A31C
	for <linux-usb@vger.kernel.org>; Wed, 21 Oct 2026 08:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UnApP2H0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D15AF1F000CA;
	Wed, 21 Oct 2026 08:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792570314;
	bh=TLhTjXPcuzl+uACgERYLAa+kgFLFN6kSXU1oOuZ6PdM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UnApP2H0uBmsE9YxU27HflFZQBpxMTQgePXIu84Phd/xe4uEVR88UdWNeregwsJRw
	 G2id/73CL10PE42or45vGNFsf42asOaXYdGISHKqb0kjakrlJnkXN3C91I8FXdKhMI
	 CcQmZVR+/zD6OagYzLtWD9ug1zbxLhyKHRHhdG3r/eUWRZDs7iJUvw736Ghri7NiVS
	 TfZypjNfnKm8HKCLaEPjlm0Vhl1VKKEwNKnuh4AY12zp10jrJsxBrD5zluzC6Dzl+G
	 us177r74ldgDXikrktBFo49bElWJKYzhSvl8HRX1XhwGfAc7bVPVIhvPyCW8lkoB8p
	 h7Pzq7uypGYVQ==
Message-ID: <sashiko-outbox-179944@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net v2 2/2] net: usb: cdc_mbim: don't enable BHs in
 tx_fixup under netpoll
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nicolai Buchwitz" <nb@tipi-net.de>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261021-cdc-ncm-netpoll-v2-2-8818965bbb69@tipi-net.de>
References: <20261021-cdc-ncm-netpoll-v2-0-8818965bbb69@tipi-net.de>
 <20261021-cdc-ncm-netpoll-v2-2-8818965bbb69@tipi-net.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 08:11:53 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> cdc_mbim_tx_fixup() has the same spin_unlock_bh() as cdc_ncm_tx_fixup().
> Under netpoll it runs pending softirqs while the txq lock is held, and
> a transmit from one of them spins on that lock.
>=20
> Use spin_lock_irqsave() as in cdc_ncm.
>=20
> Fixes: 9bf211a30b3f ("net: cdc_mbim: adding MBIM driver")
> Signed-off-by: Nicolai Buchwitz <nb@tipi-net.de>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261021-cdc-ncm-ne=
tpoll-v2-0-8818965bbb69@tipi-net.de?part=3D2

