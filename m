Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794019965;
	b=5EG5rVzJxCgCTPGpmmIZdcmuYXLtWdV4wd2gRjwYhre7jm3ev2lrMx7QWkkVnUDWOGBf
	 DHLeNNxbvEINjpnOuJl/QQXGSMrfGqA40aHltI7/jBIemlRR+WmG1iTM4k5xiZQBfs56Z
	 MZeIFNHZoZfhz1Q+UO7bT7UXYF3D5qLbu4958CO3mfkMrVNnoVudnUEw1iPtaoNRI9afW
	 6O1uaVp2XJkKW4Mpe7SZ0FpWjAeLqbAZ22OWXsilzEmqzmnphIHhoG+bh0ekeqTa2moxE
	 BHCY0+viFWu3beaSin3Gvd6EntzC82JtnNW6gatwIKxBcIzWqK/9QlTPERWAheeYmVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794019965;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=1OvRU5mIz+VnfLoWdTOVDXF7vLdZ3E0iTCcFrJMOYqs=;
	b=KvxfbybJllfU04Q45VbIYuBQUFieKf3yFIdvTlEDme3jTjxYv8VboQPWGvpxibsHU/dh
	 P3fXx9X6taxTaVrrnpqkaiOwead3g8W3u54MLiyCVIiqpHGlK85flxz/8Hk4B81UC5pVW
	 xt62Vgal0eQeR3h5qCs48niXs8edqKnonCyEEawdYUffC8kRba03CheAi80v2Cfi/Ishm
	 vuFu5XyMIbQXuaDbxF7XXPJ2RvOfH0gkjO+XXz/F/5/xo/IL5zrx3qVDNOuvw66aSaP2Z
	 O1eie66ecZdtZnM2WF8SkPy970TjkkNNzT2bld/ssNNMubZzP4bOpYWd1yl0YsV8sUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O5XL5IPE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59A92606A334
	for <linux-usb@vger.kernel.org>; Sat,  7 Nov 2026 02:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O5XL5IPE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10B111F008A3;
	Sat,  7 Nov 2026 02:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794019965;
	bh=1OvRU5mIz+VnfLoWdTOVDXF7vLdZ3E0iTCcFrJMOYqs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=O5XL5IPEHFdqhPK8qFdZnq3IeKfsqG0okKitQLaM+LfgzMbRegz/eINuPprr80kOg
	 5F71zoz/3MpvklOyYb8G1DktrQLCV9jDHvsMgDy4H5hjRqR4jkxMx4DpJuRnjYf6nH
	 2srBsM/r0Zp74mUnyTz3jWbdpzpBIFRixuF3Alsrmnty+kt55YiC0aR8rzhAk3z7S9
	 Mc/uE7QXT3FYNNxf3OFFmjUePnaDnjQnLK76z/4mTSIS/UWmZKWS6s/NTCtNSsQCF+
	 V/1o/20LkAVzuJEVfJRvwYWQLMGCvFV5eWUjuuuT/x5ouSVFRnFENOlclRWkbRthGf
	 UflcLv8+ZiQUA==
Message-ID: <sashiko-outbox-202517@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/2] usb: core: export the generic device driver's
 operations
Reply-To: sashiko-reviews@lists.linux.dev
To: "James Clark" <jjc@jclark.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <50db3bea8dd8bbc09bd8a9c3b38f44d6523442eb.1794018128.git.jjc@jclark.com>
References: <cover.1794018128.git.jjc@jclark.com>
 <50db3bea8dd8bbc09bd8a9c3b38f44d6523442eb.1794018128.git.jjc@jclark.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 07 Nov 2026 02:52:44 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Export usb_generic_driver_probe(), usb_generic_driver_disconnect(),
> usb_generic_driver_suspend() and usb_generic_driver_resume(), and move
> their declarations to include/linux/usb.h. This lets a driver whose
> probe may return -EPROBE_DEFER leave generic_subclass unset and call
> them itself, so that it can defer before the device is configured.
>=20
> Say in the generic_subclass kerneldoc not to set it in that case.
>=20
> Signed-off-by: James Clark <jjc@jclark.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1794018128.gi=
t.jjc@jclark.com?part=3D1

