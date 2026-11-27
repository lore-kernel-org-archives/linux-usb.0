Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795785358;
	b=JEDIpqCQoQT/ovoeoYpSW4vbvlxkOzlayW/SkPB1NajzuU66t92ja30wwjOjiJSr3D7B
	 xhRSARXC8lU+iYjfZerQGisIk2Nes9TWd8peZFtFzkbaZaPARP5l8dYdiM6jXJPppgL1U
	 7Qze3ru6reTgix5fxs6lmME9ilEXlWtzSEc7CXm8/vNhoHQf5fy7eIEceglJ0S05rpt6m
	 HxBNhpEbw5wU4MBZ75Eb+AorrjYETfm+HTRRMUgG0XLiHQphJOexzvOSxgDcuTiEHA7o1
	 RN7enVX1Vx0RWPeHu9MUj6x3DfQqCRPtznP9+WIZHHGsEwIN02CIxqLJNdSY9SjsKdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795785358;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=V4tA5ti7wcp3Mtdg4SQDPANaVydSwxGpcAGwGZvmU5I=;
	b=fv5Ep2qBYHsHfuMN0LcNv3roL4PrXHhTypZFmCryPBc8icKa+txxjMFM7erPYJn2I906
	 qkNKsfuVPhP10L0+NrxABr8p0htMp9fn189xwfRJhixscNEgHwAZ9KbE3oAdZzv2pp6bY
	 vYwdDkQr8HjASppOsVd7OUVleiGkc9thnuGg0ng+dX4sdgU1W0VguWK4DDf2ex/5JCs8i
	 9euyidEui0G2HhYXLJTEdLTaKMrFzcUEaWMYEMrIj24nrdcWIjicm/nBuCwaY/oWbjGbL
	 BK3DH3hukMMRYVZz3JG2p4SkshhO+eWsFA/KHPD73hWXZlHqhTKz1WKCTJbQIoqNAAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O+2eMBPE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB939606A321
	for <linux-usb@vger.kernel.org>; Fri, 27 Nov 2026 13:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O+2eMBPE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6D481F0089A;
	Fri, 27 Nov 2026 13:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795785357;
	bh=V4tA5ti7wcp3Mtdg4SQDPANaVydSwxGpcAGwGZvmU5I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=O+2eMBPE2pM/SfeplVzL7zAX3v9veFcRKfQHJXBMqAA6v2M485uz/o/dfw31q9HNT
	 7ESjIBHiamPi3f9x1/HQoBr1zY+5ubCpiIwwKZ/B8AA4vpUokcFJD8YnuXt+fV4RSX
	 ASjjHuWt3FdGlJ9LnJblLsHuTtkqhb8hXh5xjJscvFijvU12c2jfaF7zYp0lQNYglJ
	 AD3zqv8/NHeNS+lNzx3mk+xflK5aBWd6EbXWOHiAjRKZp2RJZv9kflWWxQgu47bhrs
	 qY0+yN78HyFOeVK55jCZUebFs1oq1xetgwWUMYixvhleagAmX4zIliNIj5MEuyv6/j
	 s8QQnq3/W2vCA==
Message-ID: <sashiko-outbox-237477@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5.10.y-cip] usb: gadget: f_fs: copy only received bytes
 on short ep0 read
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dickson Wu" <dickson.wu@certik.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261127-cip-ffs-510b-v1-1-740c3a4fb9b3@certik.com>
References: <20261127-cip-ffs-510b-v1-1-740c3a4fb9b3@certik.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Nov 2026 13:15:57 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> From: Michael Bommarito <michael.bommarito@gmail.com>
>=20
> commit 4e036c10e7f4df5d951c69cc3697bc8e209c6d02 upstream.
>=20
> ffs_ep0_read() allocates its control-OUT data buffer with
> kmalloc() (not kzalloc) at the Length value from the Setup
> packet, then copies that full len to userspace regardless of
> how many bytes were actually received:
>=20
>     data =3D kmalloc(len, GFP_KERNEL);
>     ...
>     ret =3D __ffs_ep0_queue_wait(ffs, data, len);
>     if ((ret > 0) && (copy_to_user(buf, data, len)))
>             ret =3D -EFAULT;
>=20
> [ ... ]
> Signed-off-by: Michael Bommarito <michael.bommarito@gmail.com>
> Link: https://patch.msgid.link/20260419160359.1577270-1-michael.bommarito=
@gmail.com
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> [ adapted to 5.10.y-cip: keep the branch's likely/unlikely wrappers aroun=
d the EP0 copy ]
> Signed-off-by: Dickson Wu <dickson.wu@certik.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261127-cip-ffs-51=
0b-v1-1-740c3a4fb9b3@certik.com?part=3D1
