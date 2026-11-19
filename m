Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795056374;
	b=QZWrIrbz9hrYus8WLxAQajyWMG6BY48faB0nyyfErZvJV2vHi6D5E94RjW55YLJ6A9ia
	 mrv2q8TJ+NcXk15UID8CGXpFZItZ+8EOZAf38DeQklirhQTrbECgfrpH5Y4q6CbQ1F10E
	 Xfsl1jc9biOgDvj4EkPifsOmbUbY8MoZeJn/qeSDZNS18ELjUhqXPH9U85kXiSOUlKxf3
	 i5NYFyEoVcOtelfADkui/mD0QQ2JQVib2/wTZqYPs/GGv2V/4Yl4+ejq2CC3kTdpNyQGJ
	 y0RuBMz/K/tIo9fXPrV3jZ1I7XepsRzKCKG8XJfFfWZ7R0PcaEfk9rKQoOLsE635tOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795056374;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=bSCz3CHjo3VtXQ5IVuBmtdvlfzuEeOc8GzN8IMYjNa8=;
	b=giwu4WsMMhrA14s37OWFW8YAnTwvU2x1FSRmFmryKYWx8hkOuo1gh2qIBCDvIuWZSFQI
	 6n5r9pUk51A97HJfdvY2Haju8/fNBxphosqeGiLBUANo7GhlmYAsUAE5ihirGEpe3vmFH
	 NX1fDquGVdLg3/fU8MSkOfUQbIEuZkmMWNa1Gk4kdvD+ynHFjSUJWz/4LxRGYwaAmLX9j
	 zb+0OCmvK1fejycjosTiDpA4nnFL7nGquOgmMlvKpIQNHp5acEb6T3P/Ht2dwoaDv/sUY
	 eIxbvfHAem6rPnbBK/HT8zvbsgwAZ4fyZEDzNRnkT/4jMafo+FcW27kOopz625aVf+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U0+nn9bk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA290606A325
	for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 02:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U0+nn9bk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C00F1F000C5;
	Thu, 19 Nov 2026 02:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795056374;
	bh=bSCz3CHjo3VtXQ5IVuBmtdvlfzuEeOc8GzN8IMYjNa8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=U0+nn9bkzY/uEVlNSIrkzeg9Wspq4BotmqucpY53W963xh1sVd4VExAofZiCf2iYB
	 crusSE1i3uZx5T7nKiTBdv9Pxu8HyIz6JNXMZPVyEbB0c4whSyyPVXdzAuZWsu91KS
	 6XXJEzOPEB+lK0tv/+9mhF2hjv3nDkSD+0pC++Q5E4HhE3GsUih+36UTGTdpjeTJdt
	 rsyJuanNShWIWETbRGH1mbO7wv7miolyqfx+ayA9kTwk5IgGaeZnHnTEkW0gxKQHNn
	 zEwa2IGgZX4zi+06wrWMUrJiGZoRvOSx5O9J1NfOJ2T/CiVHHdSvv/SxVY46DGu5rP
	 bHAnBBHE/9x+w==
Message-ID: <sashiko-outbox-222339@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH] thunderbolt: cancel pending DP bandwidth requests
 on teardown
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yaohan Li" <shunsheng1218@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261119023558.1495581-1-shunsheng1218@gmail.com>
References: <20261119023558.1495581-1-shunsheng1218@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 02:46:14 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] thunderbolt: missing Fixes trailer for DP bandwidth request
  teardown fix
--

commit a1d5bdb78755e49d17ae3a6f04ee54979d0f9eb0
Author: Yaohan Li <shunsheng1218@gmail.com>

> thunderbolt: cancel pending DP bandwidth requests on teardown
>
> tb_queue_dp_bandwidth_request() queues its delayed work and keeps no
> record of it.  The retry path in tb_handle_dp_bandwidth_request() queues
> the work again with a 50 ms delay, and tb_deinit() only cancels the
> bandwidth group release works.  The flush_workqueue() in
> tb_domain_remove() runs before tb_deinit() but it does not cover a
> delayed work whose timer has not expired yet, so a request that is
> waiting for its retry can run after the domain has been removed and the
> tb structure has been freed.
>
> Record the queued requests in tb_cm and cancel the remaining ones in
> tb_deinit(), which runs after the workqueue has been flushed and before
> the domain device is unregistered.  A request is recorded and queued
> while holding dp_bandwidth_lock, so tb_deinit() either sees it and
> cancels it or the request is rejected before it is queued at all.  A
> work item that is already running hands the ownership of its request
> back to tb_deinit() through the canceled flag.
>
> This covers the list and the delayed work, not the lifetime of @tb.
> dp_bandwidth_closed keeps new work from being queued, but it is not a
> reference on @tb.  Both in-tree callers are reached from the DP
> bandwidth handling in tb.c - one from the bandwidth work that runs on
> tb->wq, one from the control channel event path that tb_ctl_stop()
> stops - and tb_deinit() runs after both have been drained.
>
> Signed-off-by: Yaohan Li <shunsheng1218@gmail.com>

[Severity: Low]
Commit d6d458d42e1e ("thunderbolt: Handle DisplayPort tunnel activation
asynchronously") converted tb_hotplug_event.work to a delayed_work and added
the 50 ms retry path in tb_handle_dp_bandwidth_request().  Should this
include a Fixes tag?

  Fixes: d6d458d42e1e ("thunderbolt: Handle DisplayPort tunnel activation a=
synchronously")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119023558.1495=
581-1-shunsheng1218@gmail.com?part=3D1
