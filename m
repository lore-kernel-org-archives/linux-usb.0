Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794552537;
	b=oeLV4AiTcnN85xgkvhnFTEMq79+a2jSLT7Bz/2y+4MptJNtQQC/qPijliOIlTqstsYZt
	 QqTz7EJa2pIdlAwFtvYF2KHbE4jXtzu07CIhNEwZxcPoMQQKYbf7d/V6Q93PBneuoc0F6
	 2/DvOYXRR+mdWyOS3f4/lsqrOHc+egTL6H3jLCfbitb19D5cZtyJeYhl8RQ3DcxbmAQ1+
	 r78Lv3iHP14FuO2PV1QU1P0C88wV/4LhkK/TedFdqQ5K9sNtmKFCBWhGsOkQfwtIRbSuN
	 zXDOIG00PjZ8vMfsCLFEagZSAZBup1gNI2/tXtOdY/rnA4/KCy5hWyAXKVX6Gqa5cxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794552537;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=avZGffoxN8otzjZBy0bYDSrSa0EAiAAy8L2MmgO5b34=;
	b=1ckdcZ18PF/n3miNRMQ5WNPxgxvtwlqaJyJnoaHy+M5kDp/RE8/XSD9AkPQYauxjmuUc
	 k3EDpmwY2AkE7Vw577h+dl3TLuLG2nt6uJZAaxOtWTvfi3xdMBN6JDfYlu3wipyxJYu1x
	 8iDj/U6sC2O1roRbfT2SWWhs/GlcJzV4P8oenZi6slsHTe5IbPT9zFvB5T6o53eErafKZ
	 roysrc398onZHm/SbSO0NKG0F13drot2JsR3XpdZ+OsuW3tR2BP4OuF+nr4zVvBjjDBGN
	 6XpNOPqrxj+JeJ5V9wDls43KINnV0nKi9LGCJ+BxGKuuiNtBb4nJqtJB8f3/ZmTPmQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Il+e7dG2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7387B606A31C
	for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2026 06:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Il+e7dG2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3ACC31F000C4;
	Fri, 13 Nov 2026 06:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794552537;
	bh=avZGffoxN8otzjZBy0bYDSrSa0EAiAAy8L2MmgO5b34=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=Il+e7dG24AEOH9DX5ZBB1LiuUeLSGKGigQ/MALzA4LdI5K5H1ChQe/KvU6oOHmWDy
	 /rExpEcU/V6uCaqBCXXWax409zOlQawISoHWE3qfI7r99jGbq7zH/jIuSrYQcXKzCV
	 qpPYzgS8f2uCeNm0VXaUenCUiJoptGJCLVAD02Nd1O+5exp5yfxI6g8pgkxzjKx2PH
	 /z/XZIMVofpYm06/f0yTMcAA4rxHbguWR4azhcGEySsQWotYO0/mRS0lDetVpgGaG4
	 3EmkbFMbZ9Z9BsOGz935yp9H6HjkNUDckkEoDzeGfiAiF/a4/eLSFeEv/IIrn31Flq
	 FzAUeg+3zAg5g==
Message-ID: <sashiko-outbox-212286@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/4] usb: musb: dsps: free the VBUS interrupt before
 the child teardown
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chengyu Liu" <lui2012qwq@gmail.com>, linux-usb@vger.kernel.org
In-Reply-To: <20261113063409.47485-3-lui2012qwq@gmail.com>
References: <20261113063409.47485-1-lui2012qwq@gmail.com>
 <20261113063409.47485-3-lui2012qwq@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 06:48:56 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> dsps_remove() unregisters the musb child, which deletes
> musb->dev_timer and frees the structure, while the glue's VBUS
> interrupt is devm-managed and only freed after dsps_remove() returns.
> dsps_vbus_threaded_irq() re-arms the timer via dsps_mod_timer(), so
> a VBUS event in between re-arms dev_timer past its deletion and
> otg_timer() runs on freed memory.
>=20
> Free the VBUS interrupt first, which also waits for any in-flight
> handler, so nothing can re-arm the timer once the child teardown
> runs.
>=20
> Found by static analysis.
>=20
> Fixes: 369469a92393 ("usb: musb: Add support for optional VBUS irq to dsp=
s glue layer")
> Cc: stable@vger.kernel.org
> Reviewed-by: Neill Kapron <nkapron@google.com>
> Signed-off-by: Chengyu Liu <lui2012qwq@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113063409.4748=
5-1-lui2012qwq@gmail.com?part=3D2

