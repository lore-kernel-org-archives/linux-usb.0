Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794218083;
	b=KxpDzPngqqTGvDa0k+F9o9TeZS5HeU/uV2A3pqlk1AXBk+KZ6HPkTSoreeJMpVWlh6Jm
	 JIZJbbnBjrvm2OAP8ngTxXKvBtar2e14pO+rQoRbzM63MBe6/0P9gDUw2EhbTeXTfsjvh
	 Zzjt2433pwefBF2lSTqCrEQrkcyWS85r8503HmZQ+VlZMyLH6JzEgm2tagTCmnWEtjRHi
	 exlHxke81IUc3yFKnIi8mbbxgDXkkMtB/l74WiDmlD7uwW4VJ/7B6O+vsCOsLGsPoUXnv
	 e7Y7RBaESepJGczzuFQNusLU1FufG8Nfsuq7/5yDu6bEiFk8bUt1aaUIE9lZoLoxrGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794218083;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=AGLKJh6NfFqHkEYbyBjU2IytAU+YrOnsegMwSCymkLs=;
	b=b0eKTZYEne0WoqkiUIGEaTZysYU5sA9Vz6MnWDdnfXA7vTDeE15sN54Odx52nlv8i0ZY
	 FZH5Mv4ASKuazOOezEPgZUJY5q/gwQj4HDj6W5uTbnWnk5sjohw2cX1nobZgnRYtuaqjb
	 2POsNNdSGEQ6xQMhBXFrFItBriqjWbv2xk8yp3oIVTddOE3ASHmVqsFTy2eB/MoBit+DG
	 oqSGXd/xSNWXQ+RDrdPt6rWap5gvQxrMWzJivf86w4/cU31DPIqHFjh96mI200sIE9KYC
	 X6zx0qy9Vp6SOAYN+hAtXYH0OB8LSwpeTbbHXi+qSx7kVIWvojqAsNy7lgqOBDN2GxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZWPxYnZQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBEB5606A31C
	for <linux-usb@vger.kernel.org>; Mon,  9 Nov 2026 09:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZWPxYnZQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 855E91F0089F;
	Mon,  9 Nov 2026 09:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794218082;
	bh=AGLKJh6NfFqHkEYbyBjU2IytAU+YrOnsegMwSCymkLs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZWPxYnZQDTSIphGsUlGvv0eZ3LTWny87x7gYOUR9Q3/0iqf4SDPsvJtgLiN+m2r/7
	 WNW82y8MwIo/z2C3nDoM6l85uP8V5lGTyvdRZcEZmv/mcVCkLIVGS+SM5F4rHdUIK/
	 4FFkHyYXzp4RXKVo/dGmAttkMqDGq5L/Y3ilRVBZ/5SCCsHLAbh8eJqbT+1DYiiFoB
	 dktpRecMJqMZ6DK2qJtU7jo8CWPnW7O7TsHwYeoXvekm3Df6+NNEHvGGfBkFfQ8scz
	 ndX44Drzo96YfqQ2LMZUx8kIXaXqJMSFPSl9qau3d7T3G4JRCjDMxxKwDetK2BJtua
	 o2jHRQUgVGJdg==
Message-ID: <sashiko-outbox-204761@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] usb: core: hub: Re-guess ep0 maxpacket size after
 reset
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pengfei Lv" <lvpengfei20@huawei.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261109093935.2634235-1-lvpengfei20@huawei.com>
References: <20261106031625.1824732-1-lvpengfei20@huawei.com>
 <20261109093935.2634235-1-lvpengfei20@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 09:54:42 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Per USB 2.0 spec section 5.5.3, the ep0 maxpacket size is fixed for
> all device speeds except full-speed devices, where it can be 8, 16,
> 32, or 64 bytes and can only be determined by reading the device
> descriptor.  During initial enumeration the USB core guesses 64 bytes
> for full-speed devices; after reading the descriptor, the real value
> is stored in udev->ep0.desc.wMaxPacketSize and applied to hardware by
> usb_ep0_reinit().
>=20
> Commit ff33299ec8bb ("USB: core: Fix race by not overwriting
> udev->descriptor in hub_port_init()") guarded the ep0 maxpacket guess
> block with "if (initial)", so on the reset path the guess is skipped
> and the host keeps using the value from the previous enumeration.  If
> a buggy full-speed device responds with one 8-byte packet and NAKs
> all further polling, the HC doesn't recognize a short transfer but
> keeps polling for the rest of the descriptor till unlink, and the
> [ ... ]
> data stage.
>=20
> Fixes: ff33299ec8bb ("USB: core: Fix race by not overwriting udev->descri=
ptor in hub_port_init()")
> Cc: stable@vger.kernel.org
> Signed-off-by: Pengfei Lv <lvpengfei20@huawei.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109093935.2634=
235-1-lvpengfei20@huawei.com?part=3D1

