Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794618576;
	b=FOpC28uyuWUP9PJN5RRpHugNflm0z1IB2hgeAkRMvVGU5S2trKw9jPlppzedlEXjBI21
	 vsHmJV6VN0l7QFIi+JDxB/jwIuvXs7cjOF4pwxbzBUX3HUavivLL4WHSZcA84oldyHW7H
	 ybXI3Qez6wl9Gq2k+tnHG3JUQ8OZ4xFEqSSAQhDzLLDvzKImGY/upGdl9aoBIChrbO1ic
	 /Y8zRAT/mig0ONrSEFlIT1NGQNv3FhDE7BDD0YEv1KrniZj1DT9N92MYo5ie3KpvV411y
	 GYnQDYItNwz1HzmhhbguE5bSqnCcXoqLGUI9KWmEFIw3kzgbxy8t0fHvcU48q58nayw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794618576;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=rWlOfczdjWy28PrCsdHDh040rvj5xGXzYHIB5H5AXD4=;
	b=CmM41fyKyB29LXg4pzn2iH7vWkC1NemQ5tAy8wltJOJSChxGLQjpji5eKQ1kshThCEgy
	 8Lvms36LuZW5d/pOLEBifOM68hTMXDCezm6u1Dudfd6xSI8co9FjsKmHDMk7Q3k7VCzqw
	 Ja6wTDR49qxuxYStWZWrhfhACCDtt147WgI/l4SC31jf+zRFy019U664ulxu7MJg5P9eW
	 iMesuvvKegTkw/ATplsMpANQNWzAeJ2dY2dZzThL/QlRTkt1OXDsZMsSS25a7nRWzD2CS
	 TXQtCGSO29heFEYaCzf/2PsXzrFOcyBMagsZfO3as66HtkXX9DbRqbdp0QsCuks+heg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CmzjH9nT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BEE0606A327
	for <linux-usb@vger.kernel.org>; Sat, 14 Nov 2026 01:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CmzjH9nT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2EEB1F000C4;
	Sat, 14 Nov 2026 01:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794618576;
	bh=rWlOfczdjWy28PrCsdHDh040rvj5xGXzYHIB5H5AXD4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CmzjH9nT0UYq9QtQnGCx0AZX1YpxpPXK1nmrLxE9Drb56aHlYIIM6amenrPQkVKEH
	 NhWnrlkYHPqI/sRC628zudOHndcJ7ttkGcYla0d5I39qDj/0BLY5qayd18FtgGWOJP
	 fLQnD0EHOkd5+yX1d5vclEzYycCM9+jIuBZZ5zvNBM32eZMkvy23GWrT3SY6hEwgau
	 hgsX35MdyUG7YI/buzrPhUrAtxUXgcUeGDIfww6Oi6EGgFbiYHg539OcHYSKbz7Quc
	 Pb3pasW5RiH5kxF3OSke8EqxAQw8iPQCLxU9qMK+v/wJyI5UTGDBC04nNu2eurDKzQ
	 e8Ou0BnoTEAWw==
Message-ID: <sashiko-outbox-213979@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v19 5/6] usb: dwc3: core: only access GUSB3PIPECTL under
 lock
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261114-b4-rockchip-dwc3-rockchip-glue-v19-5-b79fb5f4b42a@collabora.com>
References: <20261114-b4-rockchip-dwc3-rockchip-glue-v19-0-b79fb5f4b42a@collabora.com>
 <20261114-b4-rockchip-dwc3-rockchip-glue-v19-5-b79fb5f4b42a@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 14 Nov 2026 01:09:35 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Update dwc3_enable_susphy() to take dwc->lock while updating
> GUSB3PIPECTL to protect the read-modify-write cycle from other users
> accessing the same register, which is soon introduced.
>=20
> Note: technically there is already dwc3_ss_phy_setup() as a second user,
> but it runs and finishes before any call to dwc3_enable_susphy() should
> happen.
>=20
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261114-b4-rockchi=
p-dwc3-rockchip-glue-v19-0-b79fb5f4b42a@collabora.com?part=3D5

