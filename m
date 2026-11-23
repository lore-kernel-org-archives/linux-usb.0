Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795434144;
	b=MnK8a9i6P7pK2j1DnPb3vOS6IOFrrkRCTKt3EA2HMp9xykmuDHhacxhU5BfDUW9MIiBi
	 vFopZkbgX09uq46pM2ExBhfAsiCjVRXQvIFad0xOF7A3bEuFnPzb/JKdrzFOQQwZkH+ks
	 rK0aMOJJ+MDs7pHw15XeqAsXPx6DqVaEaND29IbHM5yrLilsmDdBrpIGwlytu/tb8ZVTt
	 KP8FpdcCZAfZgzml/mzROdhUSRw+1Jz8v0y8y4jRBEGHOL2AjmJduoQLK2aKOEGgbvGBv
	 rRAW2KXeZnZEvh7QCjpypPqSWwKX+KWdmNI9+LOgRNSpbUV/W+95/W7vJuDcpQvqDuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795434144;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=CixGBXAFpuxdjen0X8OqjUuArf6k4XjeJUmdaQtxYLY=;
	b=D+eP77EXlgy6RtnCHVW1zwhTSwD3freHOLPPNEjDzL5dN/8GXSLn9SL7iYIRvg2ts1Zo
	 Y4Wqm44m6lw84Qhuvl9h//xyb5pxNu4J7hLlo914jIOIIA/xREkPaS5m5ECUsLwgtFUW+
	 B6sEyBROcXUSlR9LkEhkH3+BnEeMREk5sUfsLE9TFgPC9wwQZtgTVSQDQ5Y+7nRfN+eNa
	 YkGNhPZg44Qwf+Og2oK9zm+VWq+ixYCPaTbT6SqV0HPmbeogf1wnAQFF0vMwHvR+ukuKV
	 21sR98VIaJ6kOviMwr4sjHNOzZ9jSlpiYtq3FTdUs0afUlE+1WHaWfE0wfqo6AacbCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RdQ3elGX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B1AE606A31A
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 11:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RdQ3elGX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 228BA1F000C0;
	Mon, 23 Nov 2026 11:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795434144;
	bh=CixGBXAFpuxdjen0X8OqjUuArf6k4XjeJUmdaQtxYLY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RdQ3elGXa/NViRtYz55VBofAdRTeDfltzZYbAFLFuzITH0lY6ET8B7ikUmB108KPK
	 3+oQq5Okf3tkHOS/ElzM42S56buP3PYp3OxZzIjXBmVGV9Y0/AjJc8OoVSJSct18VJ
	 BUXhXS2zDymTEwlV4ANultdlFm2uuMWpv5Ytjnghd3Uz65/beArvVZmp/BZH5hahSo
	 RBFzrpHMkvh2NPNzBGBywIeeXgD3RxXNedFXtnWuHWUy0D2ecNU+2h5HZkKmqslAba
	 aRC4BDn+uOd8CIEk6P5lJxsxQGJJPekGxqsrRDibQCcrZ33nxEu1qAfTyq4GazKQuU
	 Z5E/g2SZGlEcA==
Message-ID: <sashiko-outbox-229158@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 8/8] thunderbolt: Drop WARN_ON() in
 tb_disconnect_pci()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chunfeng Yun" <chunfeng.yun@mediatek.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261123113705.2297329-9-chunfeng.yun@mediatek.com>
References: <20261123113705.2297329-1-chunfeng.yun@mediatek.com>
 <20261123113705.2297329-9-chunfeng.yun@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 11:42:23 +0000
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
- [Low] thunderbolt: missing Fixes trailer for tb_disconnect_pci()
  WARN_ON() fix
--

commit f6a685f6d3f79343c1ba3c57db3636a5afc5f46e
Author: Chunfeng Yun <chunfeng.yun@mediatek.com>

> thunderbolt: Drop WARN_ON() in tb_disconnect_pci()
>
> tb_disconnect_pci() uses WARN_ON() if the upstream PCIe adapter port
> or the associated PCIe tunnel cannot be found. This triggers a full
> kernel stack trace in dmesg.
>
> However, tb_disconnect_pci() is invoked when userspace deauthorizes
> a router via sysfs (writing 0 to 'authorized'). Under dynamic runtime
> conditions, an upstream port or active tunnel may not exist.
> For example:
> - If a USB4 router fails to resume or is unplugged during system/link
>   sleep, the disconnect flow may tear down and free the PCIe tunnel
>   before userspace deauthorization runs.
> - If PCIe tunnel activation previously failed (e.g., due to link
>   training or Type-C handshake hiccups), the tunnel was never
>   established in the first place.
>
> it seems unnecessary due to it does not indicate a kernel bug.
> Furthermore, it causes unnecessary kernel panics on systems
> booted with panic_on_warn.
>
> Since -ENODEV is already returned to notify callers, simply drop the
> WARN_ON() checks while keeping the -ENODEV return.
>
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

[Severity: Low]
This fixes spurious warnings in tb_disconnect_pci() when deauthorizing
a router without an upstream PCIe port or active tunnel.  Should this
include:

  Fixes: 3da88be24997 ("thunderbolt: Add support for de-authorizing devices=
")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123113705.2297=
329-2-chunfeng.yun@mediatek.com?part=3D8
