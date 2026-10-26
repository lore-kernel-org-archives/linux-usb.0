Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793018930;
	b=ppWwdmhCgMJjb9FBjEiRzx+xgWV8cUBFqmIGCVU5UVVj4J6zovjltW3ohT7KprumDT6B
	 n8N3Ad9obH1NyIm1YypONfZN6OXzUqeCyzzAXCQku6qk6JnKY8hzt8LWxHpm7LWYnAQJl
	 JNo/MawOG0xvBs98ooDS7m7AmnmHGQOBDv/X2NXql767TzR1t8wm3V21BTsFAtHoBoVU3
	 c+k8cl44uXfRdh/CO3ZgIDQrEs9uvlm8ZSlDJI6TnG+s9+SHCnPt4sjeyrhMjS0e3bqj7
	 i1L9Q3cbgcTF9VDc8W8Dj8YOCfGbVMsiDPsTC9RsSOYH8MasuomRQl1dUc9EiEctlWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793018930;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Ji5K5kB3wCNXv8P02SrIN0KP1ZGK0qwInLeelo3wCVU=;
	b=T5ewUsC2aaygNYRXeTGA/1+dWDycNKkE5Db2cNUQjorSx/1Y+ubVuziodPMzdlPIN1z+
	 gYoSzmkNEPkT1lPXLCBiexyww8n8HF0YKGDJ5xoDEi/DppOdDEo7h29KccImC64spEzyx
	 4TEk6JZD6ifHPGxXaySG+FVZ39PbQgoGXJYTeuuU70MUqbZ5eWSEPPt33V025I0T5EwgP
	 sHH70QGHCj2qHgC5AMsH4uiD6EVXAUWf8uL5hXVAHkPkxs7m9DXLwbAwz7gIK+GjKSQ81
	 37wDgSBcJ0P1ksA+Y7/7oSnl9O8rR9jsTUVuZjrfEaO4V7cC4k7yE4yzYHBnIdG0Dxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U+Nj5NJ9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FCCC606A31A
	for <linux-usb@vger.kernel.org>; Mon, 26 Oct 2026 12:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U+Nj5NJ9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F6551F01825;
	Mon, 26 Oct 2026 12:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793018929;
	bh=Ji5K5kB3wCNXv8P02SrIN0KP1ZGK0qwInLeelo3wCVU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=U+Nj5NJ9Loo78LJySydKjzFy/d7dUcRKelED6ek9lZzr1VESgEP9RWhKiP5o4La/3
	 FdAjoZeOUoavfB6HcsaT9zvJK0NbucUP/natzDTy9XE7OO7C6cyHovhIphH2YSNp7B
	 MFhHih5f1jiyz6jvOHvsYc+hgXZn05I5W0ZHZwEMZ+BokuXFcFzrAp9MZKbpwu9KnM
	 s3HGfVMcMM9VGJojSXchqPj/j/hztg1ZQdvGlT+26uIE/7PelYxl1iUC+uQxlw+Z7l
	 009aPgf+ifdTBp3wOFcRjTFZA3574piwuQ6X5OenXpumNIOy4vlmbcxJeIH30IX8AW
	 cPLDvXqZkMT/Q==
Message-ID: <sashiko-outbox-185246@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] usb: xhci: Fix use-after-free race in
 xhci_stop_device()
Reply-To: sashiko-reviews@lists.linux.dev
To: "YuanZhe Liu" <25031212351@stu.xidian.edu.cn>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261026123628.7493-1-25031212351@stu.xidian.edu.cn>
References: <20261026123628.7493-1-25031212351@stu.xidian.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 26 Oct 2026 12:48:49 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> A KASAN slab-use-after-free read was observed in xhci_stop_device():
>=20
>   BUG: KASAN: slab-use-after-free in xhci_stop_device.constprop.0.isra.0+=
0x395/0x430
>   drivers/usb/host/xhci-hub.c:479
>   Read of size 8 at addr ffff88804e85d2f0
>=20
>   Freed by task 585700:
>    kfree+0xf8/0x390 mm/slub.c:6566
>    xhci_free_virt_device+0x3f/0x50 drivers/usb/host/xhci-mem.c:881
>    xhci_free_dev+0x286/0x350 drivers/usb/host/xhci.c:4131
>    usb_disconnect+0x6b6/0x910 drivers/usb/core/hub.c:2391
>    ...
>    usbdev_ioctl+0x6f05/0x86d0 drivers/usb/core/devio.c:2826
>=20
>   Allocated by task 572283:
> [ ... ]
> Co-developed-by: Bin Yu <byu@xidian.edu.cn>
> Signed-off-by: Bin Yu <byu@xidian.edu.cn>
> Co-developed-by: Cheng Wen <wencheng@xidian.edu.cn>
> Signed-off-by: Cheng Wen <wencheng@xidian.edu.cn>
> Signed-off-by: YuanZhe Liu <25031212351@stu.xidian.edu.cn>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261026123628.7493=
-1-25031212351@stu.xidian.edu.cn?part=3D1

