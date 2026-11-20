Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795158782;
	b=B4yeVqaucMdS96XgesQjxRBLuZrJIKReWG2qGSjf9g0p/pUb+invqeh4dHBCbs8H7v0H
	 UrHC1kIPYsvlMOnE7ehERfEkYdqt6KWJj6NRsejcaM2ndb/99MJSuRhB4W3RpWEnjbxrx
	 cyIkUdRYkAPNmoXiTJ4xr+CH9WsVElMOd/74U2wOdiYdGvofP+UuihLC7ESe9Wguq3HwS
	 sdaWFIgNWHIZ4vPLtwk10U+F+FIVJX0/0CCYFmauAf8OTXNe2IEisomzT0O0aQQLOKUPr
	 VcS3gQfS4etGqBn7xk+KKqEfqyls3mHzVAhlq79nKSfcIUk3HVRV61qz7I7rl84tpgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795158782;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=7bIMw93Tp4Z6BTcZ8cjweQJvegaLlicncunGKlf9xQc=;
	b=gXISZtiVFtToti066Ux2bEzb6HudTb+pVp07Kf6ua5vMLrpcAp2hL01Xtm+ddkrmJz3i
	 +FXWOxRWhxKpyfwU6NPKYD8HxarFueSZSoMH7rdn/b+9yA6m397VdGBQH+w7WvweGP8tp
	 ow+k7t5CwvsZpRbZmtR4EWzZb53F2BmWpJ2fOlcfys4kGfC10cusN0GOhzVshxGzjANSz
	 KlWceIyIZL5VEtk2v5sD0nTXVcE76wrn0+axJG33NMGiEp/iBS8xBHuUqtXhr7eHt9Baq
	 fjgigyusFgJm2i2ZNCAtcfF0LCZg6RpB+6vK0wOcbPN63cdoFQi14Zy1Th+b7VTB6fA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JUSPyjqI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25638606A325
	for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 07:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JUSPyjqI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A5C21F000C4;
	Fri, 20 Nov 2026 07:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795158781;
	bh=7bIMw93Tp4Z6BTcZ8cjweQJvegaLlicncunGKlf9xQc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JUSPyjqInXHnZLlzYDnHWNv3G+4IaJ8s7tqhoUSJMohpErq6jtQ5cFSk9SDHTPtGX
	 61/fRpUdG5bQChe/zptRpmW22jGMDH4m95hFfaPGjwEacEbnnFKqLBKXGVqnIl/37o
	 qIC0Mcsjv+3JuxxDqoMv5FVIDBQOo+7quInk7TDACyBcSIJyJ6EOhG1YTKUMvoR/JT
	 AsoOSE4WiE/xpVnmChjGr1/nXV5Z6GHA2JMY22BQId8e2MvtymjlHbkfowe54FvZam
	 Q7RZTdDnD/TXCH0uVHWb3pq6umG1/gn1/S8kKeHESQ45ZxmYumdTws6ZNfGN49leKY
	 ptYv9oP8BZ7PA==
Message-ID: <sashiko-outbox-224604@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] USB: cdc-acm: refuse writes after disconnect
Reply-To: sashiko-reviews@lists.linux.dev
To: "William A. Kennington III" <william@wkennington.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261120070353.956978-1-william@wkennington.com>
References: <20261120070353.956978-1-william@wkennington.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 07:13:01 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Commit 7fb57a019f94 ("USB: cdc-acm: Fix potential deadlock (lockdep
> warning)") stopped clearing acm->dev in acm_disconnect() and replaced
> ACM_READY() with acm->disconnected, but left the write path checking
> !acm->dev and dropped the disconnect check from acm_tty_write_room().
> Because acm_disconnect() frees the write buffers with
> usb_free_coherent() and acm_probe() only pins acm->control, a late
> acm_tty_write() call dereferences freed memory.
>=20
> This can happen when a CDC-ACM device disconnects while a file
> descriptor remains open with a line discipline such as mctp-serial
> attached. Hangup closes the line discipline, but a subsequent reopen of
> the hung-up TTY calls tty_reopen() -> tty_ldisc_reinit() from the saved
> c_line before acm_tty_open() fails with -ENODEV. Because the original
> descriptor keeps tty->count non-zero, the reinitialized mctp-serial
> instance stays attached and faults in memcpy() inside acm_tty_write() on
> the freed wb->buf when transmitting.
>=20
> Pin acm->data alongside acm->control until acm_port_destruct() so the
> unlocked dev_vdbg() in acm_tty_write() stays valid across disconnect,
> check acm->disconnected at the start of the write_lock critical section,
> report zero room in acm_tty_write_room() once disconnected, and set
> acm->disconnected under write_lock in acm_disconnect() so any concurrent
> writer finishes before the URBs are poisoned and the buffers are freed.
>=20
> Fixes: 7fb57a019f94 ("USB: cdc-acm: Fix potential deadlock (lockdep warni=
ng)")
> Cc: stable@vger.kernel.org
> Signed-off-by: William A. Kennington III <william@wkennington.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120070353.9569=
78-1-william@wkennington.com?part=3D1

