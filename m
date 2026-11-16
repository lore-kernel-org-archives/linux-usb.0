Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794815342;
	b=fDqtl34Hjmw8ANKxAhVWt4uW9HD4/Vt0OGOid2el4yUHhGPq28w2AB3mHnnNqLOvhEOp
	 8+BncQL+dW9mhgM0gxTIyyCd4cBOz4XD+RnujVEGXADfbHL7OMuIhNBeZLM+oYtkcMFbt
	 HV+aedRwTuIcztAafrwsCGdOu+fQlDJnP7+dDwMC4VAGkzmBul/od7Z9LXXfzoKRaXL4N
	 it6LsrFnt+QC/kVnaNCPGQmo7aXav+dS7AvUQsXy7dsrVAGY3/F44AISSWXVLD6QRk7YK
	 KAeBRPsMo1pj0Tmghn6168B6xJOR+rt0Z+j3/AHRsgjRtzOCDBeChVPn/UHuLqnSIZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794815342;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=RJo/hHq7IYJwVpdjlbVH/WXeTeEdeL0jpsXB6+0z0rY=;
	b=MuWEV2N7+2mRLeVFB4BF02TQt797haCO5JY+nPD1RrHcaiNXT6+Lz1aa2ZuFwC2upP+A
	 3FxtTloHdqA9mMdDZYI7KegZAzLqvIEarVzoQBiIZo36w5YDfJFGthkYYxRJ54jNzyAF8
	 Uxf5/fJZKbEURf3LHU2bJwxdyN68RshQ4l8jwbJpvoECQpCzh8JMApENFriFWCGGa+wyE
	 8w829I671SWTfR3/2LBvr+cZBpz3frohdAVdrGXn5pj4+uugd1SPOk5A+OqlSK9mEN9vM
	 78oUMvTAteUW1ISua1TAd6xHCzzQmKW8UdnMtIC/zsRGUqnN3/0Saer35AerBhXF+0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="okFK1/6V";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77543606A33A
	for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 07:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=okFK1/6V
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF8A51F000C5;
	Mon, 16 Nov 2026 07:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794815342;
	bh=RJo/hHq7IYJwVpdjlbVH/WXeTeEdeL0jpsXB6+0z0rY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=okFK1/6Vxbnioy9IeTT0KeLMFcYyD9aFyQ31MCIv3dTamj4QIpIgK9ZQD8MnT9vKx
	 wY/bWICWCqyyKQ7dxzkCJE0X1opz8AiVyC3OapTsCLXbHNCi0F3ptYdKfUi0LK6I5c
	 XHpR2xoLuAgZvl9yU4SkqEwqqV52dybEQZLIBIekPM7oi5/g1zJr7q+QsZUQ2cPNwD
	 2BIzRTBX1x/RPLs+zQlUhMOEJbvVukwXH3iKBOH3+pbJh07zef9sTsC3M2T4npH9+H
	 a/CR+xccbu7CPeSqqgvrZZmYgUIcgfspa161qq3a0lUQW5BF5B0wyxylkDoN75EDQM
	 Y4LgjdbjEZvWg==
Message-ID: <sashiko-outbox-216467@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] phy: sunplus: don't read the disc_vol cell after
 nvmem_cell_get() fails
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andrew Gaylard" <ag@ffroot.co.za>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261116074006.20357-1-ag@ffroot.co.za>
References: <20261116074006.20357-1-ag@ffroot.co.za>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 07:49:01 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> update_disc_vol() returns early only when nvmem_cell_get() gives
> -EPROBE_DEFER. On any other error, such as -ENOENT for a device tree
> without a disc_vol cell, it passes the error pointer to
> nvmem_cell_read() and nvmem_cell_put(), which dereference it.
>=20
> Use the default disconnect-voltage level on these errors, as the function
> already does when the read fails. nvmem_cell_get() never returns NULL,
> so IS_ERR() is enough.
>=20
> Tested on a Tibbo LTPP3G2 board.
>=20
> Fixes: 99d9ccd97385 ("phy: usb: Add USB2.0 phy driver for Sunplus SP7021")
> Signed-off-by: Andrew Gaylard <ag@ffroot.co.za>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116074006.2035=
7-1-ag@ffroot.co.za?part=3D1

