Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794520687;
	b=ADkPxW00jNcZYJUONsuLvXy+EfdX8XyfJrdGTWnFRm47gN1T33AjEdkmQ5OVMX6yv1W3
	 yDOiW+5LgBVtH0trtRrWYYrhxn6bqoBPuvgClyqY5xgI366QOvsFCANlu2WPfmPGaT6j5
	 BbH7d865ASox/cKL6kydaKgcVk2qSN6Gu8A+mAROdyzbSqYmitTIzSvApn5Yd2jbGMhHM
	 vuzmWZK5kzC7qT7w9PjIesbOxEjG5owD1152b/HR0z8vRxqKpLr7Rjkd0M3OnY70dSCJT
	 WqE9q7PPZbQlGhLCr1FIpsugv46lv24BjEu2+bRZ4Li7OtMC+fYX1fYUxOMmfLc5h2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794520687;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=tMaQYpvoD2idrJrs3LZq16ycS7mr+gFkWfjAIQlD3+Q=;
	b=ilH7npWYcKQCFk9QN/zP+3+cfisETjDWGi3VuS51ctCZXgSbwL2h1DJTn5ZULbu9nonA
	 TOKDJWTXjuXvW6edWVZmzcQC6aVKLa5Q8lKyqYNECMxohC8SJlxWA62++liGhYYMWH2XE
	 LNhCMBPzw1YPaoJeu09t1s9SSKIyQ1FC9WmfcbKQjL4UvsUDo0oR2aCPZckF4O+oYy+t3
	 6okPNDAxDTN/aw7iPornmyQZeBMzPqtWzkNh8r7u+WHU9rNctCOm3aGwWZNjE0gN7U4OC
	 rXZXhOXV2kBk1njrr8a+zUWqVtgJ8vLOdEGxZE3dkOqZy5jTcneGPMks3OOB2+ZbspA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Iaatgesl;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA29E606A31C
	for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 21:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Iaatgesl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BDED1F000C4;
	Thu, 12 Nov 2026 21:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794520687;
	bh=tMaQYpvoD2idrJrs3LZq16ycS7mr+gFkWfjAIQlD3+Q=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=IaatgesllczLF2+yRZhs1Lb9nOKAn/FKdRT/t7rZAiYfgIFMKGzX23ppmS+IgQrcd
	 YZuk9W7YRsTskeSY9yQFmGqL4rPLyHpC5pXAUtZt+yfq6YCDvW0HYRcgxqv9g1TxfI
	 uZFJuVYSmFKCyJYPu66RkzjRNVnhVI18cLpDtcFIcyAqSOS0EcxtMH0UWbrrzwc6AH
	 /dN93EyDPVPj6ZBpn+v0RdVkNkJA5daAwp/DnUaehCJnETNstas/NoF82Acn5z/jWB
	 pD0m5W97pxiYJ3ib5R7rhrEBCLFax+fFvzGhS64piNGLZVogb/wM8ylXuRSR3p5RPr
	 XgptpnKMlZ7fQ==
Message-ID: <sashiko-outbox-211881@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] thunderbolt: Do not match XDomain responses to
 received packets
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sven Neuhaus" <sven-kernel@sven.de>, linux-usb@vger.kernel.org
In-Reply-To: <1794520303-5758-2-git-send-email-sven-kernel@sven.de>
References: <1794520303-5758-1-git-send-email-sven-kernel@sven.de>
 <1794520303-5758-2-git-send-email-sven-kernel@sven.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 21:58:06 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> What happens is that __tb_xdomain_response() queues a request that has
> no response buffer. tb_cfg_request() schedules its work right after
> sending it, and the request stays on ctl->request_queue until that work
> dequeues it.
>=20
> Until then tb_xdomain_match() can match a received error packet, or an
> XDomain response with the same route and UUID, to this request. The
> packet may really belong to a tb_xdomain_request() queued behind it.
> tb_ctl_rx_callback() then calls schedule_work() again. If the first run
> has already started, the work runs a second time after the request has
> been released:
>=20
>   refcount_t: underflow; use-after-free.
>   WARNING: lib/refcount.c:28 at refcount_warn_saturate+0x59/0x90
>   Workqueue: events tb_cfg_request_work [thunderbolt]
> [ ... ]
> The analysis, the fix and the tests were done with an AI coding assistant.
>=20
> Fixes: d1ff70241a27 ("thunderbolt: Add support for XDomain discovery prot=
ocol")
> Cc: stable@vger.kernel.org
> Signed-off-by: Sven Neuhaus <sven-kernel@sven.de>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/1794520303-5758-1-g=
it-send-email-sven-kernel@sven.de?part=3D1

