Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794379014;
	b=N1tOD1vlfezA2dRT2DIGIq2aOpQed2wTUagEfGRv1e8Wds5xfwQ77ou/i1XHemjT+hUO
	 IXX91hRhirjlQwGhn+GKxSanvQH1DswnlEjIKSIj4mF5gnd+7ovCi3DMe0sBwwPg3IU6s
	 v4EG9ZhUrnRypQLn+Yzn5XD01efTIwzIp7o8GQzXK9HTUtonHDz/AlA2N1B9BsLC1BRYZ
	 +pWiKCVCY25U7uEvDNM6wN2VsGgb6aJnzgaBFC3HBXGscFG/5NaQBaM8O1EQq0YgBbwfe
	 5Wm98m89bPefooT+XE48+3KUCl8mWE4YRx72Qfz89d4koS0EQ2SzFoCwdiFP0B13mfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794379014;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=G8ZtRAKTeDTCIpZh66k5BrdCNcBAqcUYJorqXYFXScg=;
	b=ew4MNHcj9RA6vd825bcHLhk/csQY2NBsFnU7x7tLF6yhlui953PLFA4+rrZv0CewuLHj
	 Ah+ETWP0f5BLvqNtAZ4xrmUgMGGRCNOWm0qmQrbWNxwlhXTBwHY1wwlVSeGqix5HxvNpU
	 u/w7/4XSAWgGUKRLMEtO4Rl/eSbsEmaA0GvZLKhUl8sNEyiD7BuB+ArdxgW8xerrXEr9A
	 vaYq/n57tvqA3CUMrjPgHKmjRKvRUfy5MVkOyun7YfwZd/0KjZ9Q19i0DMXAhnrvEjWGA
	 2Lwi2T3fPy3aAxG/Ywj4xHmX9ovhRsDHZfplr09zYqNN575043DDpsCxj3d1smZmGfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Tk/UujOG";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1426A606A321
	for <linux-usb@vger.kernel.org>; Wed, 11 Nov 2026 06:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Tk/UujOG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA0B51F00A05;
	Wed, 11 Nov 2026 06:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794379013;
	bh=G8ZtRAKTeDTCIpZh66k5BrdCNcBAqcUYJorqXYFXScg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Tk/UujOGyXd/b1kj/t9IGM2NYJaR7s3wxlAQIAHHIuv8i6QqDtyNzC2HcpTfkUmIu
	 IFLTlG2X2bi6EFOhToBgFMi7ebM0A/uI68IrcBeswNG7iHVjmSfiDrc+twC5wtYC3L
	 Obgi31FDo1AuaUyhXLSSxoWrTJlp2pyutkOfTmAlLMwP32RdiAzsLQEss8thU2at/n
	 fuhRjLUZZALbgbU7jJRc6N5DVsDwXjXPdMg/Z5aSJlQX3kMJ9EMfN3zcbCzzGtNQsO
	 bdqgwY3Z4L0ukPeSI1KtjzvlH8r3Rnu2aUqRGiS7fPxAeBd37Mhlu7DVPzGShf7hZr
	 bFBwK4gI45IHg==
Message-ID: <sashiko-outbox-208453@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: gadget: udc: handle NULL request in tracepoint
Reply-To: sashiko-reviews@lists.linux.dev
To: "Liu Junyuan" <2058432396@qq.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <tencent_08E401ED34EC47C550C71A0462C8161D5D05@qq.com>
References: <tencent_08E401ED34EC47C550C71A0462C8161D5D05@qq.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 06:36:53 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> usb_ep_alloc_request() passes a NULL request to
> trace_usb_ep_alloc_request() when ep->ops->alloc_request() fails.
> The udc_log_req tracepoint assumes req is non-NULL and dereferences
> req->length, causing a NULL pointer dereference.
>=20
> Make the tracepoint handle req =3D=3D NULL so allocation failures can sti=
ll
> be recorded safely.
>=20
> Reported-by: syzbot+2a7ce560c30c4ca3bc22@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3D2a7ce560c30c4ca3bc22
> Fixes: 5e42d710a108 ("usb: gadget: add tracepoints to the gadget API")
> Signed-off-by: Liu Junyuan <2058432396@qq.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/tencent_08E401ED34E=
C47C550C71A0462C8161D5D05@qq.com?part=3D1

