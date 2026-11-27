Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795777852;
	b=svmrt/fSi/CnlHM9jJuiGIzK/cEmLfmIeWYFjXd2vvOYW4H/D+zrx/6IxxQTE8mqCQaJ
	 vhRTDDRYu5Nv8sRB5IaVEz0G9yXpBk30tAcpJNvJzm9El9AoeZyWG9Fwmd3WOT8Z7hCuG
	 CyvIdWDkzc7sJ1Tm5kkzbClyLhg8XSA1HfRpYNhbR9dQsMVdle4IzXSI8XZ02krKy2dDt
	 DgFLxrspr3FZ0lyhnYLgCu3v5/T5cWrcNwz6thhff8llF/JSpeDebNbFQZ5zOe8grKfRx
	 Zdxd0kMTFnMkuQ08O60PzvfJRMWjX1yOz8QlZA49OeQeCUGs3QmQFUehX/cF6hh4pdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795777852;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=/oOKsPFBJxPLj9zWwnZIPwNKVWC47S+i7mc6SWIzRiw=;
	b=Kx+SpoFEH335k1NbInkDMi6fNb3vtdXEun5GZgbDziH33tenUW5LiTG8yK2OzVhAjfP1
	 Dpow9GERUZ+67T1cE3RA/60aWfrInq5S/hcPyviLSyJQCP0cVctqQOHwmnwIJdE6hl1X4
	 zwQLAUbu82kXV3PnhP3Fs+nGW51BWqjhtQCruZVKgDB5t3SfBktbLQvB1D97P3mIIOW2n
	 PG39Zxo9Js7jJYN9a0o2fa15NdaeWdova0iThZdBeIub5CS8sR6cg2FQr1UxaTsbl0xoW
	 PBra8UipLT7I3m6ZA2SuCb9C0EW3Ae0yC4Tg20lM9AqBu7wJ8C+r+0DUgU4axQh2KHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EncNiHb0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6872606A31C
	for <linux-usb@vger.kernel.org>; Fri, 27 Nov 2026 11:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EncNiHb0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 473591F00897;
	Fri, 27 Nov 2026 11:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795777852;
	bh=/oOKsPFBJxPLj9zWwnZIPwNKVWC47S+i7mc6SWIzRiw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EncNiHb0/wyhlKnbfUhn5XbV2X3DOoPaUCctUinqXUh9RfplKyEpFsy9uVXeOFUkX
	 9QBwd6k7VbDcL5Oa9nOhW1oPZ3PJLL5SYQ/+b3VFlfNoWFlD3CFi9hWklWktHd2qat
	 uxRhVUeJcOO5bh2pm+tOffP1gWNwpWDO4UjfkIYOe+tX8R3SxIMmtZVN1jLY9eJvGn
	 c/xwM6r1TEEmHVYYuM/lMCh7Rvr8WV8unIZROF4E1zL4yTeliaalFT7MHZn94pRwVU
	 EdoSg7Y1NvFl6WTCGnHFo9dU0kp+pU9Xic4e9CsOHg/hnCxOZvi0HsLLyCUZkJvkPJ
	 70EM2x4j+9bug==
Message-ID: <sashiko-outbox-237226@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net v2] net: usb: cdc_ncm: send the NTB once another
 datagram would not fit
Reply-To: sashiko-reviews@lists.linux.dev
To: "William A. Kennington III" <william@wkennington.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261127110521.1235409-1-william@wkennington.com>
References: <20261127110521.1235409-1-william@wkennington.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Nov 2026 11:10:51 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Observed on BMCs in real use communicating with a USB NCM gadget over an
> EHCI host controller, where bulk TCP traffic caused steady tx_dropped
> growth and retransmits. Tracing the link with kprobes and the kfree_skb
> tracepoint during iperf3 TCP runs confirmed that every drop came from
> cdc_ncm_txpath_bh() calling usbnet_start_xmit(NULL, ...) into a stopped
> TX queue.
>=20
> cdc_ncm_fill_tx_frame() only learns that an NTB is full when it is given
> a datagram that no longer fits. It then hands the NTB to usbnet and
> parks that datagram in tx_rem_skb for the next NTB. If the stack sends
> nothing more, only the TX timer is left to send it.
>=20
> With 16 KiB NTBs usbnet allows 5 TX URBs in flight at high speed. When
> the NTB that was just handed over is the fifth, usbnet stops the TX
> queue. The timer then builds an NTB for the parked datagram and calls
> [ ... ]
>   4 streams, bidir       62 -> 0     36.7/150.3 -> 78.0/130.2
>   4 streams, MSS 512     81 -> 0    129.2 -> 152.8
>=20
> Fixes: ad70411a978d ("usbnet: fix kernel crash after disconnect")
> Signed-off-by: William A. Kennington III <william@wkennington.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261127110521.1235=
409-1-william@wkennington.com?part=3D1
