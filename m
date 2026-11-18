Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795014542;
	b=uEDiwWgd2D8xsW/Y5uPyuYl1krr5B3xocAo7F4oxoEBW3YEIgeuvFnZ6xLjnRdUp4xnL
	 IzX1+WURWnyTHlO7ZKL3tfa0ksOLDz/r2oWDjUteQm+nsr5ufa2U0gTVeSyDMNYCQCVlg
	 BhtlHaPGPIv/5i6D06jPph8AiI27AcQVwXk5znH4+jj5jrvqaV1nesK/fXtwnWZJaxIYN
	 8UfK90TofWUGuVFAJDYVRqbQNm6LjusQ/ppwxAPcv3Z/GiodTcgMfr34ZgaWoJrs+qApX
	 X0O7u753TpgsPB8vvXhX+Gy67lTzGqTFKE7tJa7ZVSFkvkR/YlAUvXnROYbgQn2eJGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795014542;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=BV8FPOT6d8BD/SLg+T0LsFBKNYt4JOtTK6tX5cygF98=;
	b=za/EQtMi2b2oU2eHt8nLkC0BFOaahyQc6ZCbLs2QnMLzVbSE2SAXyMcdUxXtTw8Z8vEl
	 HlLgQxPkrLtggIJ8QZdqVBgQRMT6UMcQFsAYdUiA8COWA9P15y12cUfdVQe77zIuNRD1m
	 DqEOPH74+tP4WNmBUZTuSaMsVSAmM/xqMlfItcct2rJZ3TyVfRKi47+D6/UXL4kA5FCQO
	 lo4Trr7HnmmGqUZdbTNbzGGrvmKRt2GNZ9U+Ib9bMPpa7yCB2QyzkYNRDoPPggFIcTH5g
	 /PthrpBkk1O8jr0D2/fGtoqouIRpv9xn75MiAxAtbFoxJWbDikF6i0WSE8XLZT3NlrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gyzadTY2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 699D8606A325
	for <linux-usb@vger.kernel.org>; Wed, 18 Nov 2026 15:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gyzadTY2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB5171F000C4;
	Wed, 18 Nov 2026 15:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795014542;
	bh=BV8FPOT6d8BD/SLg+T0LsFBKNYt4JOtTK6tX5cygF98=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gyzadTY2ra6+OImA7IFY6W4hoVT6jDkptqGke+ENoQvAfE/YsG4qXGbwUSTMhF2/D
	 8BfLECtPq3/A887B8QgCY3kW1OsvOTCMgIzJmMyttj4mhPuMaoqz956vEggZyJBO0R
	 c+ekzdld13zSt0eCTwrjqqSNjFFKqkC54v9PW42h2CSP75L/gk0zUaBtGEZRl3d92t
	 tlutI0XtYaV82LWoeoepiEW3BMEXhuziyl/vYTKDIwAOKu4+WQAHebdES/AhjEwsTU
	 03r/imIsCa54lorbCAWt7T95VcesIYhX5/4zWpbYGjCjXIthHyXQspZSl5p2Ze4+lx
	 tdtJTb63NyXhA==
Message-ID: <sashiko-outbox-221296@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] USB: cdc-acm: refuse writes after disconnect
Reply-To: sashiko-reviews@lists.linux.dev
To: "William A. Kennington III" <william@wkennington.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261118145636.3534234-1-william@wkennington.com>
References: <20261118145636.3534234-1-william@wkennington.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 15:09:01 +0000
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118145636.3534=
234-1-william@wkennington.com?part=3D1

