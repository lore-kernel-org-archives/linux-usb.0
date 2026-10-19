Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792426320;
	b=4425sSTkLPJbVbZTeQHytXZd+UGcjuwWE3ID9sPNAsk3AKQ4Yn2dY+9Edy3YQjy2PzQx
	 G3WVyr2h5ep5K9nqAceF+sZY7m5l2FSWYgwVoD+W3+uT7UugFD34t6v2+jD9d1qY4RmaM
	 hC3hxA8dBgA8QfACiADDnMM0kIy/Eb8BA4KBXOoYkFlfrUBnapXhQCdvfNeSR2x/rVS8/
	 k4M1M3GR4be2ZT1oXkK6wQHrr8XZ2Nu9YpfHS0HcqiYj92mtULPfXwz2V2ZHLty0bBMgr
	 Tax9lJpLWfRPJZon2oxKVEQSaxb6Vusmnd2zzq5OchJYh92kdG7Blgi+WvgHJ4UqWkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792426320;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=rbxFKWUuXcG3k/24gTW9SXfxyxb5MxkZ0AGVooR7PQE=;
	b=v6uPzXnK7zcEkNqbMTXcKWXShTyFiQnE6Z7SeOS1LKABcKcr1zjWsxZUJP3XhUKT3mJo
	 Rsi0AHaXhd0SqiFSX5ecLt6ygN1dmKsp4MWFKVwYOFqfi7tMZ24Wg6GQn4/NCKm6ldj04
	 d0HWl/ELj/qIqscDxoYNGrsKHRVMspOd+ve1YZzdJLeVJnBw/m+cQYMVmL5k6fif+8rHr
	 gvWQza0qxFYYAqo844Os1Y9sv5Xusq/0r/1Odso59eDGJmd9TUNrxpxg8JZhMLspi+EpX
	 WpOm5Z3cPTbnpIFiHn6qpmiwR5FYuV1C8xhWSD9IMsz5vleeKVONO/CaA8bleRFgUtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oMdo3zig;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 503F4606AFA4
	for <linux-usb@vger.kernel.org>; Mon, 19 Oct 2026 16:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oMdo3zig
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5A1D1F000C4;
	Mon, 19 Oct 2026 16:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792426319;
	bh=rbxFKWUuXcG3k/24gTW9SXfxyxb5MxkZ0AGVooR7PQE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oMdo3zigXbun3jjUea/kptok7jFwvlRnZXcSatGAFkWHnpdn5pjOLRt9dIgqWRD7s
	 ayIEse0KNtm9Jeu1E47A0aZbB5p2pLCK2MbsPL5impX1m0cEFQG1b3/oHMjkIX2MHM
	 S24ec42NglkQSR5UQ9p71ELN5sLvKkfqoMDygy7G5gOxfK2daES9/nMIZQgwf7rGvy
	 gNRlGi9v7q7acaRxLu41Qz3bo9jqItsCb4VP4UGclvpmxzy+KAs+O2T2UiGEimHMHo
	 Bnh6zcYci3sFuR/TrfWjHswGf6OElJhQBCY04LiFCW645juNz/Td333sgzEWLq8n6M
	 pVScSYDJtDj8g==
Message-ID: <sashiko-outbox-177834@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usbip: vhci_hcd: store seqnums as u32 to fix lost
 unlinks after 2^31
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lucas Pascal" <lucas.pascal@pqshield.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261019151537.112304-1-lucas.pascal@pqshield.com>
References: <20261019151537.112304-1-lucas.pascal@pqshield.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Oct 2026 16:11:59 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> vhci_hcd numbers every CMD_SUBMIT and CMD_UNLINK from a per-HCD atomic_t
> counter, and keeps the value in unsigned long fields of struct vhci_priv
> and struct vhci_unlink. On the wire, the seqnum is a __u32, and the peer
> echoes it back as such.
>=20
> Once the counter passes INT_MAX, atomic_inc_return() returns a negative
> int, which is sign-extended when stored in an unsigned long on 64-bit.
> Commit 15b93f340fa6 ("usbip: Fix seqnum sign extension issue in
> vhci_tx_urb") fixed this for submitted URBs with a (u32) cast, but
> vhci_urb_dequeue() still stores the unlink seqnum without one. The
> CMD_UNLINK goes out with the correct, truncated 32-bit value, but when
> the RET_UNLINK comes back, dequeue_pending_unlink() compares the
> sign-extended value with the 32-bit one and never finds it:
>=20
>   vhci_hcd: unlink->seqnum 18446744071562096407
> [ ... ]
>=20
> Fixes: 04679b3489e0 ("Staging: USB/IP: add client driver")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Signed-off-by: Lucas Pascal <lucas.pascal@pqshield.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261019151537.1123=
04-1-lucas.pascal@pqshield.com?part=3D1

