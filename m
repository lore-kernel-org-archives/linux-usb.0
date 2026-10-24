Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792802464;
	b=139+TOyPuN4SKM9VtyWTSUxQQpfORNivC8Wf3ex1RU2uF1wv4IsHMq9Y2GnSOUz/Vd8X
	 IlYBwNrk8em8029HFitxhmqRqJtmgfXrVLykGRSoej81fUUvmxP3IbS4x5xvxvauAhNHn
	 888n596MoqKw5s1fwIsL/XA5rjy2GrOrpRG0/4SWd1/88WqiwJFVUA4PRUrklgs3U04fG
	 QXQFxZSQ4IyPcvwLpJiE4tsYnvONCydxSPFgBC7NfT3aPHXJENpdVEykDePxbqmRYnQay
	 osQ+BwrMqS+0EewyzuLNNjSW08/W6+ZO96UfEGnXG7hakTv38WFGq2Aq4s+vt8r5Mxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792802464;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=+OVCLRqCJjt1xVD8TEGfndo9rKbHATp42u+Ysl3vgJo=;
	b=B399lVwwDAZ7VoYryt7oDlWmlikiYXn9darWBigfAoev4s4U7CM1fn20S4HFUxWUtyXK
	 SHmHVriesI+1rlDXaagwG7e4VVpV1U0kWcs7EGpKM0M0LSRiVpOIY2VMXXDBS5cz96XP4
	 LNuGQyg66BhPm0VwLEAQrH/1Iylc7ACXAdaWDldMB9l+JLPNtPT5czDXaw/ipEjhfA8OZ
	 HT/DJ0RM42wn9LJRJGzNORRB4qFXXExULabxqUyjIPCfzkU+GMCIHn5qlzJq39XDU+P5Y
	 1xXpS7SrjoPHrAAAfUT54S2QmzKZpnNThTxtm3R1eUTg0QhqPbSZEY09Vfu1gEFDrFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OLE33z5v;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D02A606A31A
	for <linux-usb@vger.kernel.org>; Sat, 24 Oct 2026 00:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OLE33z5v
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8709D1F01825;
	Sat, 24 Oct 2026 00:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792802463;
	bh=+OVCLRqCJjt1xVD8TEGfndo9rKbHATp42u+Ysl3vgJo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OLE33z5viC7uZgLxzPcvmqYyleHcR4effzMEIkaOhb9+ZxZgQx33K6pd1sLQghK9U
	 Bi/bax4iTxiF2+qy+Gnc6irNtM+izqs5FWBU5OeJ/EEOshmAd2ArqENj7jpApeJFjB
	 dNGYzMZL5PfnHKgt3lyJuXR/XJb4CY427JT8/BQMk4lKMyqLBe3lW+UfCl+Wroo/Mq
	 RHm3spZfx3glSJ6BmcdPwujtCJ+fLCR9Li+xI4GnAKnXrWztv9pcev32NljpkjyTdw
	 26Fn6tHOFDpjxsVnop2UgrQylx5pfwfk8+54Tvxf+l8eM1AlcF3dIe+YEF/10oz4hp
	 pr1aSDNjOU0bQ==
Message-ID: <sashiko-outbox-183465@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 4/9] drm/bridge: pass extra events to the HPD
 callback
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261024-hpd-irq-events-v8-4-6ee949e7a384@oss.qualcomm.com>
References: <20261024-hpd-irq-events-v8-0-6ee949e7a384@oss.qualcomm.com>
 <20261024-hpd-irq-events-v8-4-6ee949e7a384@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 24 Oct 2026 00:41:03 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> The DisplayPort standard defines a special kind of HPD events called
> IRQ_HPD. These events are used to notify DP Source about the events on
> the Sink side.
>=20
> Bridge drivers report these events through the
> drm_bridge_hpd_notify_extra(). Pass down the extra status to the HPD
> callback, specified during the drm_bridge_hpd_enable(), letting
> underlying drivers (e.g. drm_bridge_connector) to receive these events.
>=20
> Acked-by: Francesco Dolcini <francesco.dolcini@toradex.com> # lt8912b
> Reviewed-by: Pengyu Luo <mitltlatltl@gmail.com>
> Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261024-hpd-irq-ev=
ents-v8-0-6ee949e7a384@oss.qualcomm.com?part=3D4

