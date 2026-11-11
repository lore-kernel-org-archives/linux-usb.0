Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794377356;
	b=1F331kPYtIp27ZehICq34wCFCzsonYAZ4teSvW0VaUuW7zvZt7uxYRyOo9DTmz3Taceo
	 r+TSXMaddGkS87Qv78E9P4ykHkJMaLxDGBnIyxecNxIzAcDpgYo6BNFHNXMUxYUMUagrK
	 7LekoGns0KCsGUH/gnzW7jrlR1+vkiCB88psdRUEK8u2MlIcXoirVOHy6JgdxRGKZBVRJ
	 V8bpehCD/PVFUKhAQ/xnc3GGkVusCw+TnsdbU6wnNAFLvHSibHGmF+aK0mFQkultmXNlF
	 j7FUaBiBW41uH/VgNnXlIsldZBGtKvYTVPh0+h7DBDpoPBvbXK1hGgHLBqmfqQmUgjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794377356;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=i1zNO3CbaSCewS/FoHPr+CXpSYlARePPfy+KFbbi9MI=;
	b=NBr9G50Z8M+7jq7iAd5bmw9x9xjj+nP8b1uhtiCnM7N1n2HbSzJVy4+RyJ9lbNm1PFpt
	 /YDcICOY0+wZtekqff2rzIEHTQqMF4SGABQGvhbBuliKvhCmW77vG4/mLaE8kk8eEwcOG
	 0PXrQNQrt+m/w+ljfwlzwvMJnbbo60pOvfKRD1aSZBEi3l8ksN3iFxB1j/PYFj0Y4xQjw
	 zV30KsBzMwossdmOdwP+LMPU88GowfI9Vmji/FyKeCB5BpsZBJJVdDaFAxp8tnn1sAwas
	 748Yb++RH79KLFGxZ2c6mLWXZml41Mz+DqKfjxT33oinDlwt0w/RXn/qJqccvYPC5KA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Rjmgbjyp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7360A606A31C
	for <linux-usb@vger.kernel.org>; Wed, 11 Nov 2026 06:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Rjmgbjyp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2B721F00A07;
	Wed, 11 Nov 2026 06:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794377356;
	bh=i1zNO3CbaSCewS/FoHPr+CXpSYlARePPfy+KFbbi9MI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RjmgbjypaHuXrbhy8ZQpoq2XUcLDvMMHqIEEhbqQspP4JrjetkZoR+IDRDpkxQ3ji
	 QgYI85axNhSPoSI3A/hwar2IGhXa2DE0UMio0wPPMMjI2PUXF9bFw1QrFBxm1Gro6r
	 EHpX4iIySJV3gr8FusiY2deH6jmVE+iNpCmqt7pT0gIoelFGQ3Tp+QQtlEFdmqOaKs
	 fTE9MZ8bHNBApbrukKU7mzLp4JrrnYrHs0gKcEIv1d8Vjpd8/gJIRSYbUEu4R6LxrB
	 oRIFDoufll0PkXjaB4zzQD3B3dWv/OnfrN2uVvAYKBeoZJp6nh+cIbzjcXmftbh7XY
	 ZgqGtAy9yL6dw==
Message-ID: <sashiko-outbox-208389@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/3] usb: dwc2: gadget: honor pullup requests in
 core_connect
Reply-To: sashiko-reviews@lists.linux.dev
To: "Inochi Amaoto" <inochiama@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261111055628.183891-2-inochiama@gmail.com>
References: <20261111055628.183891-1-inochiama@gmail.com>
 <20261111055628.183891-2-inochiama@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 06:09:15 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> The connector ID work initializes the peripheral controller and calls
> dwc2_hsotg_core_connect() even when no gadget driver has requested a
> connection. After a host-to-device role change, this clears SFTDISCON
> and lets the host enumerate an unconfigured gadget.
>=20
> Check enabled in the connection helper. So the device will keep
> disconnect until the controller is ready
>=20
> Fixes: 510ffaa48eac ("usb: dwc2: Initialize the USB core for peripheral m=
ode")
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111055628.1838=
91-1-inochiama@gmail.com?part=3D1

