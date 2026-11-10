Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794285606;
	b=iZ4vsZtb2CRLXZW//xCo0jDcW2rzbxwDtRKdWaENAyIRZDr+TH/dBic5kQkcDbiliCQo
	 uzfqbdRGA62MSmfWfIikOMdyByoyoWx6tWser4vvVoAEMA7MV8RJc3fnRlpd8KqktMxjL
	 gTSfo3ONjepXVac3YS4CgrsO9S6AtxMC/onQ9jl8+g4gZPHxeNVaNDcj1YOLUIBwfBgVf
	 svUc+Xm3f1ga4L4ntEtVtZ4r/ksWNYDHrGPbYiYaK8+0fih5adMwuxWoYsFuA0WIJ/llV
	 H62VKjDpKnbzBQ8vLsXZ+9gxDiAohcD0jN4xG8z5ii83X5ZZr7LQa+tZSGCxmgZeVkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794285606;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=LjdbblTE8zjz0Wbxjwgcnt2I/+0Og5fZc8hsr30VGLM=;
	b=Vc9yLJxjCTNQx+ti6HtKqIDQ7JGdwGEyls8hJVvNuFhnlUFYr4qrcN/+yr0eJHAOaZ6z
	 Mtk289hSb28LsygWRPJbub5yISqtzmsMpqmLGBP5h7BRseOE5CGYSQj8D98SoYhk6SjFS
	 S/biGk2Bp8choAb2WiU3UF0ioRwRsNuk9m8hAn9mxm+4Bo2pAKLsefp74wrBH0u2JwuTb
	 p5EQBxJZuBo+7j/rtUr+gv58/GOT6K4cjygEDOU0VPvl/+EyODUu5zFrSaSf6ckB7vp2n
	 6haBSKECp1CqR/GR4f7NorCKq7NINnNYG2IJSkK7f2uosvEQyZoY/BTm+gEDF4TCkpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DF0A9D2s;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5CCE606A321
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 04:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DF0A9D2s
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3AD81F0089F;
	Tue, 10 Nov 2026 04:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794285605;
	bh=LjdbblTE8zjz0Wbxjwgcnt2I/+0Og5fZc8hsr30VGLM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DF0A9D2sWBxSbTk3odBQRIGwKr4Wi1BHv8J5AcPDIivPt+hOhjf2tCTb6HppmgHbK
	 sBN2sBjtWC+7O8gC9gYrTVqZQPkqlBZzeaZMvKcV+BQafR/AKQTtk5CexUM6kJzm0R
	 e3MeQgmJkyYcdKXuxgXfUb5twj9VxwrCyaHmeVujHvUcP5JkkVnaAnOg+PWEpbXuR9
	 5EwE/F/cSBHp/I+6qtJVdOw0eUMqrTOejZqVyZyN+aIAe4OSUwZUXJTIX/sZprD5gJ
	 030TgHWfEMpfhh6gCEplfybxLR5OsgUvT3e7rpXBA3K3u29vRLwQ0BqPLOtzwGxFtQ
	 P09ipSBQ83t0A==
Message-ID: <sashiko-outbox-206222@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 1/4] usb: gadget: gadgetfs: fix ep0 request lifetime
 and buffer races
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jing Lin" <kayano050408@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261110-gadgetfs-ep0-v8-v8-1-8f90434574fe@gmail.com>
References: <20261110-gadgetfs-ep0-v8-v8-0-8f90434574fe@gmail.com>
 <20261110-gadgetfs-ep0-v8-v8-1-8f90434574fe@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 04:40:05 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> From: Jing Lin <kayano050408@gmail.com>
>=20
> gadgetfs_unbind() frees the preallocated ep0 request after disconnecting
> the gadget, assuming that no I/O remains active.
>=20
> With controllers such as dummy_hcd, disconnecting does not necessarily
> drain ep0, so a delayed userspace response can leave dev->req queued
> when it is freed.  This triggers the warning in dummy_free_request() and
> a use-after-free when dummy_udc_stop() subsequently drains the endpoint
> queue.
>=20
> gadgetfs_setup() and the userspace copy helpers also race on dev->req
> and req->buf:
>=20
> 1. ep0_read() versus gadgetfs_setup().  A delegated control OUT request
> [ ... ]
> Fixes: 1da177e4c3f41 ("Linux-2.6.12-rc2")
> Reported-by: syzbot+c73e1942197af9f54ca3@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3Dc73e1942197af9f54ca3
> Cc: stable@vger.kernel.org
> Signed-off-by: Jing Lin <kayano050408@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110-gadgetfs-e=
p0-v8-v8-0-8f90434574fe@gmail.com?part=3D1

