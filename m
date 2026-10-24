Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792802731;
	b=JZDUT0/xLrkqmTd9i2z+O5nN32gzjQdrhxss4fWwB/+8zGjwLbG2B7A2IxNChdERruUa
	 YrJ6KX6CBFN6qjKaiXVGU4THb9quMq/Pwbs4rmCLvg6FsGSmYo7ATaR67wK3pfSuHb+le
	 YcJp7eMWY9dk7Ow6Rtmalg/5Qi78wEJ0YUPPVAqSplUK8TMlItqa8rzLC9pNCkA3gierC
	 LMwI+HWmMwX3C+9NR1V/+alVoqp3OT+7AkunOiKSxELm+IcbIw33+UhYqCGrxziIIlJJh
	 2KbV6feT5OSBd7US8KMTeQWyCw+dR+MlkQU3+N7zf7LRB40Ef4jZQcrhkXLpRaUCw6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792802731;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=qNj2XNX+ns4Chsvw2ovQfIICuAr7Ytnfo6UjMp3LKWY=;
	b=QqTcSamTXUPzRc/E1HTGT1aX43zK/4prwUQpk5rEaOSCEYbrgYJ7GVZPC1umpSX1IMOe
	 2XYSyJl0Q/E4hB4Fm28BXvRiAgbOKPLXH44wXwZqprEBTaiOmQg0TpDj7zpMygv9mm8ty
	 HznhPTtsU3zfw72Bw9QmtwlzOy2gREzX0feZlikFKAIEjJ/h6wWPTDWo87wOCm0JZR70l
	 nLqrohfMugP0ACAlQUFr4Kk/6r+f4zyDDFs+sri7J8MQW/kdaGwPOBSQurzAjFe0upsWa
	 kmK3tmUqabzqe7EwDSeqJwAJ9brGNgxlLPoS8cEZrfMvBYKaAOhNLcBu8g7N47ms9Rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UzusLmd1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94602606A31B
	for <linux-usb@vger.kernel.org>; Sat, 24 Oct 2026 00:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UzusLmd1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEE081F01825;
	Sat, 24 Oct 2026 00:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792802730;
	bh=qNj2XNX+ns4Chsvw2ovQfIICuAr7Ytnfo6UjMp3LKWY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UzusLmd1dlBMRrv1Z/xuCf9YagLg/H3sp2K5RSgjITmvmvtNbYo0eRIIH4LFEYOD8
	 mrOwidO/e3loU4VQvS16pv9NoJre99fVMEPyJfeVdrJu8l86FXNta7q9zZNdS45BL4
	 m85zUkdrXdPeqRR6hWwIDMgdHVFSgAalHDh4UXPBNu5DmSQTZS1xa2S+PfFlLRBRbk
	 raIx6BMMvqfCh5Zgik91K7kAlVhGuoLxIkdZmjlw2Lx/cF1RQgFn7uvNJ9t+mrPgPT
	 30pRSvrJicqMPt5H4ryl9Kag4jgKJpsWKKmWGowGm2iAEEi9qUUIFgH+EhAFGC7vwI
	 V6ISj3DlgM2aA==
Message-ID: <sashiko-outbox-183468@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 1/9] drm/connector: report out-of-band IRQ_HPD events
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261024-hpd-irq-events-v8-1-6ee949e7a384@oss.qualcomm.com>
References: <20261024-hpd-irq-events-v8-0-6ee949e7a384@oss.qualcomm.com>
 <20261024-hpd-irq-events-v8-1-6ee949e7a384@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 24 Oct 2026 00:45:30 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> The DisplayPort standard defines a special kind of events called IRQ.
> These events are used to notify DP Source about the events on the Sink
> side. It is extremely important for DP MST handling, where the MST
> events are reported through this IRQ.
>=20
> In case of the USB-C DP AltMode there is no actual HPD pulse, but the
> events are reported through the bits in the AltMode VDOs.
>=20
> Rename drm_connector_oob_hotplug_event() to drm_connector_dp_oob_status()
> and extend its interface to report IRQ events to the DisplayPort Sink
> drivers.
>=20
> Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261024-hpd-irq-ev=
ents-v8-0-6ee949e7a384@oss.qualcomm.com?part=3D1

