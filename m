Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792832164;
	b=XN8sA5YHHkH8AeLY8hxmDVDBhD+lYxRHQVMZMRFm8vyOvvstDfGpPsxbOZz6gPjPdXyh
	 /f/aUxUKhU8xVt2itdREQojwh6xDItBu3Nv/l14BFWORSvExO1As79qAaSDZQI/JZnYTl
	 eJrgjNbGm7chzCB2WLZCkOs149RtVCpQ/Ixn4zAdtsaaxDjSGA7GBNBD05xYBXdWs9lrt
	 eNBcc6xjRkHmevBEZAFlnrnUCbKXrj1QWLK1QpMQJDMX22Jnhg8bOiqZJIX7IyBocLcHQ
	 dvCYG9GaL0Ra5eOJQYG3TRsFjPu2TqBwJdmnj7LpFaEARogZgYKbXnVqiyryVN3iQig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792832164;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=bZVdqIZKy4H7erhd3izUD86W6EVBfHoAWm1mokVhceo=;
	b=u8AHQt6FpZIi39IuIYbiCLlUO/oRewrwsOaq70DfZ8Gkr/qcGPB2SaG971+Nauex/Y27
	 hBu9cK0JolMfxGii6fGO0Nlc5DTbZXvSYvdui8tQDO96UplOdal3jn4ICLOz8y7JWJoCZ
	 Le92epTR5rzR7cE0IxJDoG4E/Yrw/AJhJZ6QkrmzwKv7TdRf+VlmOhWufbECXH+F8QTns
	 SEI0DXUAaEqLO2DKo5uTqLH7ienFFl+GXuqzDAgkaoUgXGWb4YxmW6iuMvvhR3/aXc43a
	 hxaRv+KzeKe2JWYY9/RFBZqr5VRAhslEMGNg//lKEqQAOaQ1nPhhiUitlhRe53EM1sQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fVfULXI0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD97606A31A
	for <linux-usb@vger.kernel.org>; Sat, 24 Oct 2026 08:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fVfULXI0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 946981F01825;
	Sat, 24 Oct 2026 08:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792832163;
	bh=bZVdqIZKy4H7erhd3izUD86W6EVBfHoAWm1mokVhceo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fVfULXI0cuWTqd+AGOjoxH4Kd2NpqcbYrGLxUF+2cKaJmIjaGsAFPrU1nColEQIVw
	 K+bN1Jwk8MmpubPxrDGk0dNEQSWZ5gOa6+ZgBy3W1Wg7yy+V8oH342spWeGg/T5h40
	 YkmMRBAxPi0SPEM89K99cfXIVSWBKE9x6iMaDBSjiDPIdZCb67Yu5oo8Ll/YxfttVG
	 D3E3bRoVSOFEn7OmbeSqbJs5vqORj5Q4+UZ+qJ0cZP/f/Oofv8kw74bOzugHuGrVUl
	 klFiPcWKLX3h1J792KFQm5BjutwOjoXxXbYuyz8+3yeYTQvccwk++WkvR+2VOTDjT/
	 c4IlanEimgYkg==
Message-ID: <sashiko-outbox-183602@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net v5] usbnet: fix EVENT_RX_PAUSED race in
 usbnet_skb_return()
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?w5ZtZXIgTWV0ZSBLYXlh?= <omermetekaya0@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261024084538.256596-1-omermetekaya0@gmail.com>
References: <20261024084538.256596-1-omermetekaya0@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 24 Oct 2026 08:56:03 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> On SMP, usbnet_skb_return() can observe EVENT_RX_PAUSED as set on CPU0
> while usbnet_resume_rx() clears the flag and drains rxq_pause on CPU1.
> The skb can then be queued after the drain has completed and remain
> stranded until the next MTU change or device stop.
>=20
> Synchronize the EVENT_RX_PAUSED state transition and paused-queue
> dequeue operations with rxq_pause.lock. In usbnet_resume_rx() splice
> the paused queue into a local queue under the lock, then drain the
> local queue lock-free. In usbnet_skb_return() use a double-check
> pattern under rxq_pause.lock on the slow path, keeping the normal
> RX fast path lock-free. Use spin_lock_irqsave() to match the lockdep
> class shared with other sk_buff_head locks taken from hardirq context
> in defer_bh().
>=20
> Discovered by Sashiko, not triggered, not tested on real hardware.
>=20
> Fixes: 43daa96b166c ("usbnet: Stop RX Q on MTU change")
> Signed-off-by: =C3=96mer Mete Kaya <omermetekaya0@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261024084538.2565=
96-1-omermetekaya0@gmail.com?part=3D1

