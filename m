Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794309544;
	b=CAOG5BVIIo6OeXnCxRNO6C78/YECJErWRM2DcX5t7eLviaEVwfKFQarMMlFNCIcxrtfM
	 /Gwaai+29OsaHKsDWUGo/B9nJ6hkxNaFLEOZI9DfiFIG8KL9poA5dB8Y3SRob2guxT7mE
	 Z+JZB6cfmIUiMPl02kGVuFNdW24INAXolWAGxIR4KXbkoVj/b7O9NSbJfCu3UMIE5spnm
	 61JJ2C5aV1WMKVGZTOV/yKD93ZL1mdhymsd4QtwzAuXEQ7a+HjuzQWOpRnti6tIbwmzXw
	 c/BlT9QhMEAVv5qx032618mw/tRgNGIk5tjDvXfwGx24Ct5yeU7VIVz4mmAzmIwApCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794309544;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=8zq1nrudihXiPZpxUF5v9HisYgcNKm2jeYVTOSceXn4=;
	b=d/YVBP6a5Efy6mXz+eSf+WOUU2T4cmRMERcrBjvVVoXtShfqj9GmP9ha6k6e0k+onJ/H
	 Ju9CZAO6mAyHU6vWVQ71nDeOzJfjMfvy7aDBtE9dz3rMeH30AQtMScVP67zQEPHOrg7bY
	 cz/PxH9HLCbOyAACkwhMaKwkRitUuUZ8boxR60rDuoX+WTxg86cohvop/mjCc+MqDbgu+
	 QZtvIHXXjS6CzB4KyU2MMviBsNgxazH/ljApzHt44Z8g1UadIQySJ8+pEzxICGYv21S0p
	 DIucdp1ztrKc79aDW7NU0z4i7FM1B57u/6qciiHJJDRhOmvrMLeVGojYYf31XxirSDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GwEhG0kg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77352606A321
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 11:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GwEhG0kg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBD311F0089F;
	Tue, 10 Nov 2026 11:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794309544;
	bh=8zq1nrudihXiPZpxUF5v9HisYgcNKm2jeYVTOSceXn4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GwEhG0kgFPn8msdTZWyvKfyu1uivyYjnPCvJTeuBiuXHIzG6gIS2okWiJ2e5RuNxX
	 fZqmqpXYcfI9hOO5AcKpLY0SIMMs//Jg68ViG0dpYXgP8mKuYIgwC3SnnPdvpNPJTL
	 lIO9GmQzxm3qPvHDJFGDAuyn06XJLtOIq0llew9A6tBwyRoMJ4X5Cyu/mvPgfhZ02Y
	 tzxu/wmDNEjKY+CCBPb5sxIsPZeWwcTPumboo0pOUza9t5aoG/0/gbW+h0V53GhCQz
	 w81tjeJ12Ao1tRi1Q4U9CAYub+iIh+l1Rkl/oO2h5bja4jaetxQK2/AeuQAkyCevmF
	 8ihVVVDZSWbyA==
Message-ID: <sashiko-outbox-206926@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: chipidea: core: cancel power_lost_work on removal
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hyunjung Ko" <hj351016@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261110111402.2504885-1-hj351016@gmail.com>
References: <20261110111402.2504885-1-hj351016@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 11:19:03 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> ci_hdrc_resume() queues ci->power_lost_work on system resume when the
> controller lost power during suspend. The work (ci_power_lost_work)
> dereferences ci: it touches ci->irq, ci->dev and switches the role.
>=20
> ci is allocated with devm_kzalloc(), so devres frees it after
> ci_hdrc_remove() returns. ci_hdrc_remove() never cancels power_lost_work,
> so a work queued by a resume just before unbind can run after ci has been
> freed and dereference freed memory -- a use-after-free.
>=20
> Cancel power_lost_work at the start of ci_hdrc_remove(), before the
> devm-allocated ci is released.
>=20
> Found by static analysis; not runtime-reproduced (needs a chipidea
> controller losing power across a system suspend/resume that races unbind).
>=20
> Fixes: cc509b6a47e7 ("usb: chipidea: core: handle power lost in workqueue=
")
> Cc: stable@vger.kernel.org
> Signed-off-by: Hyunjung Ko <hj351016@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110111402.2504=
885-1-hj351016@gmail.com?part=3D1

