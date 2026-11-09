Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794220480;
	b=cJELGCiovf8HFewuA/eD4VvDu5Udef2Q3t+X06Jmhor3cmUNQsfUI+5ZIvvlB423cIOc
	 jthwEAmn2m26sjj5ibcGXQQnLVpFwvynJBI2B3dOEBqJSBJYy7ElQ7wTC4E1aDCjtFQiY
	 vBKOn50oxhD5DlSo/OWai3cl4nZsUyrMn+7icYbUK06biTVasI0tHuNpjFENAVLevvgyG
	 1/fCA/P/duJriSoAdLFE/kEQQoWjzcs1XsLF6oCc3lnu58GgXkM48Vz0+5G1FABvnavLW
	 qP0P9wDxIOSC///X7510jFKZb4IPAPBp7HJ811AUE34qYcQnrv+GUkRUCDK7wMbjOlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794220480;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=dd44aJTKjIJ6wKz3jqo/SSE0ytNxuRCH5j/kJZBVp5s=;
	b=JEbPyhMPMpVQ+FjQdaauO171NV0DMgRHcI2JIqM3yqp5q+rtSg1HNktMZVKHInv6uRkU
	 +i+zohAccbt5YI68o3NzN0f81o7cqWcvM6pQthD76XGLVtUmQbILDETIw6T5zJdtZwbVv
	 RWphkSuiHsI+o8anBHK6qDVQzCdg4MYHVbUBlVTbCcZdocidyjCtwEkbUwsfJbpo4uJpB
	 VSKBAiuDIiKdX1X1LtSwoVheC2+KyBk9qpudRTzCc3uzyjN9aPBmRhdvx1kFqflppMGPK
	 jZJ+wnxDBYUpZ0hvA/v+10x2Owy+2vOThrfJuWBaHTkzhxdtNHqulv+hTE8d9ghF3bQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NOvkYUvW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5916F606A33C
	for <linux-usb@vger.kernel.org>; Mon,  9 Nov 2026 10:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NOvkYUvW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C10781F008AB;
	Mon,  9 Nov 2026 10:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794220479;
	bh=dd44aJTKjIJ6wKz3jqo/SSE0ytNxuRCH5j/kJZBVp5s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NOvkYUvWjbZaT9n/Gg52EuC8WXo/IXxdfJ+Uythc0wnDF1/poMztvcrcztjFMpKY8
	 nSf/ScoqcehoQ6za9dYVhoj2l/i78JxR5rCt+PEaXOS1C6aPpgIAIStOtdMgkRfdxZ
	 H5nWJ5JPXk/MenrqUx6eAPL+opN6g/Q6sk1MG+HhTc4bKZaDHIuoKhZ6g7r21l/cUG
	 vRiwueIob5HikLyJYFRYVepEboTxX/jar3ZU8kj7eBKYfZfYwMB4F9e/ir+MfWN1ph
	 QsukRQoH/+AX0NHLb7jA66A67FF2h/4AVMuJOYtDHz3r8ou3yysuCCc03r4zE5CWdq
	 hSEkkQYk+nFTA==
Message-ID: <sashiko-outbox-204826@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: xhci: Fix ep0 maxpacket update on enabled slots
Reply-To: sashiko-reviews@lists.linux.dev
To: "Michal Pecio" <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261109112846.04bfeb0f.michal.pecio@gmail.com>
References: <20261109112846.04bfeb0f.michal.pecio@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 10:34:39 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> A slot in Enabled state has uninitialized output contexts;
> it doesn't need and cannot accept Evaluate Context command.
> Attempting the command only results in a (harmless) warning,
> observed when core uses "old scheme" on a full-speed device:
>=20
>   WARN: invalid context state for evaluate context command.
>=20
> This problem doesn't seem to have existed before ep0 update
> was moved from urb_enqueue() to endpoint_reset(). USB core
> doesn't use URBs before enable_device() or address_device(),
> but it may call endpoint_reset() on ep0.
>=20
> A more serious bug has been identified by Sashiko review bot.
> Transaction Error of Address Device may cause the slot to be
> reallocated and left in Enabled state, but the input context
> [ ... ]
> at the time of address_device() and enable_device() calls.
>=20
> Fixes: e34900f46cd6 ("xhci: Reconfigure endpoint 0 max packet size only d=
uring endpoint reset")
> Fixes: af8e119f52e9 ("xhci: Fix Panther point NULL pointer deref at full-=
speed re-enumeration")
> Signed-off-by: Michal Pecio <michal.pecio@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109112846.04bf=
eb0f.michal.pecio@gmail.com?part=3D1

