Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794382351;
	b=s5CdvxXgKXQT2k5mIyDomhR+Ry7WjUKhTL0XaflGiN2CmFkEvOtHP2j79x8IKf+nD5lk
	 SwC7EQOcm031d5iEPxNvVUgpihM7inJe2pM/czDSZDn+NLzD2ttgZaRaduq9ziuF94nWo
	 zkRi0rK2LZsr365cyxi3CXSqJr0WpfuHFLo3k3ddWqLNJUINp2cB636fLJ9zgk61P7tH2
	 AOCpTeH5uZHllmD7HaHHLFnNT5MC3adf6hCoycmJXM/BLMpjVxjKoLgt3saEdFcLfYmMa
	 oFW2D3RgmkeJ7JzUQeUMnkuEVtGQpxE9ArUVKN3elrNkWPUcS2L6Ws9Vmuwe7+xdjbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794382351;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=zdJJ03fi+FV+3qCKJq7QbE+iSZet4qyzmPGrE7xM8RU=;
	b=Go4kSUojOe9tH0okE2HoGry9BafVXW7SofGPN3y2MCyozWdOmQKTRxmQAH5L7CxYOhld
	 hjVEpoclQ8tVW2rWV0cLNbnF9ngSKFlUSH8jd9GJZcMT1eWdfvwK52Pg3p3aBpF/F+ki0
	 JMwfuoMqUJNjD4PF9X+zl3eyYZbWnkLALGCzuVlD6MGrJ8iotLx0Rz8urXUdissYmLzsP
	 +qCR9G26sywm/AvJXHVy0Hd/DWdAY+DKNdvgD4fMvTp6owhC3L33uC4MD0VPwP/SDBCYX
	 3QZokweojt4IOqA1pggPPLPENRq3qbjvAgnkUH6+ld3/TR58v4Lci8XhHVTclH9s7jw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="WlUleF//";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 261CC606A330
	for <linux-usb@vger.kernel.org>; Wed, 11 Nov 2026 07:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WlUleF//
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D868A1F00A05;
	Wed, 11 Nov 2026 07:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794382351;
	bh=zdJJ03fi+FV+3qCKJq7QbE+iSZet4qyzmPGrE7xM8RU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WlUleF//vyOXHdGjzXtD9QfT5GfOoLUFUlJXRUsWFaHQ91kH/LPbmVtSxH1lrRPQZ
	 fW2bryc3kguuHtgv7elRoZVk/thbgLv2/kSYH/P3tjA6XOf9XzwrLmhnytg1mjxF2f
	 WlOSuvwByakb6jBQYW8QQp1XXBHAPJI1kG971YC8bvZj4vCNMJYSt15iwiYRzLribz
	 ZtPzlxBUyk2HjyA9sPZnbmx/knLYCGq7fENjD0R6McFqRyTgzwM+rUEtnVtNsrl7I7
	 7R8iUa8MBDgElYgL6fJJwHYvMNY/hIAaz+P0C5cUdasYfIMomZM9VQfC04tc5CuJf7
	 d2U0TBdRwcQWA==
Message-ID: <sashiko-outbox-208526@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: gadget: bcm63xx_udc: don't sleep under spinlock in
 udc_stop
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hyunjung Ko" <hj351016@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261111072310.3005580-1-hj351016@gmail.com>
References: <20261111072310.3005580-1-hj351016@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 07:32:30 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> bcm63xx_udc_stop() clears udc->driver and then calls msleep(100) plus the
> PHY/clock teardown while still holding udc->lock, which is taken with
> spin_lock_irqsave(). Sleeping in that atomic context triggers "BUG:
> scheduling while atomic" (and a CONFIG_DEBUG_ATOMIC_SLEEP splat) when the
> gadget driver is unbound.
>=20
> The lock is only needed to clear udc->driver, which serializes against the
> interrupt handler. The settle delay and the bcm63xx_select_phy_mode() /
> set_clocks() teardown only touch hardware and are already called without
> the lock during init, so drop the lock right after clearing udc->driver
> and run the sleep and teardown unlocked.
>=20
> Fixes: 613065e53cb1 ("usb: gadget: bcm63xx UDC driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Hyunjung Ko <hj351016@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111072310.3005=
580-1-hj351016@gmail.com?part=3D1

