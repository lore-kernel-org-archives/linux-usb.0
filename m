Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793901313;
	b=t4LSxHBAtKI5uLNb8ZUo44qLPYR8R96rcJIgyHVAI5dVHnz8dqmpB6w6uNe1ozWhw5vd
	 rU6P9tqr/ctwK1ZhETa1gY0IC3GNw2jvt7yT+8eEYlc3UP4c6tX3+1Q3KWiPEhVR3+uPp
	 b6uWi5owbvy5OL4y56r2DLBjtfDxs1SWj8r9yjM4Y/mAax+Ut6gdYOXiUJx8w9KLEqEzJ
	 SkPL93NIQFxVx6MBmveFI+zksy4g/4p209savejOff8GJJeaB/pOZDgulYb+7vb5M7B9q
	 CbdhrOJ2SQLQi2PuLVROxkMqOhu2Ht5VHpNGa3GvOPIK020nwfYYsgsoEz3PVMzwGpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793901313;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=m8UMJcDjdKx6+K8sg8lxsZGjfDbA+Qjwm+43tpQEH7E=;
	b=Ml6LIsTvSEJYvNdvjmnZzoC1ZEfyifRtPIypyAGM+mlIXk+bcDnJNr2aNRZ6RY4YIZGa
	 XJ/Lzw/3zssftJx8t26DJfDe6+/27+f8jnfwDEw2ZrUX+p6TNV2RNMOG3L9nZX2t3I8Cd
	 xir3Tt+XP5/h+80KPjs5Fo+ImyVrJk4cLgurnhlSllCG7/Hu2TOW6uZ9esEiWewioIa0E
	 LpRvzK7bL6XCVmmqqJqPhm3fXe+TOhuPzQI84AK63/Phn/qTaCmC86Vas8enOGZvz14xH
	 DcLDZSio0Wr6+jVEzvJQhoizCPNFRCU0jp7uVN88ikF3T3Zcs/ioRgAVmIj+VfG6A7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c5bNzwx6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F07F0606A31B
	for <linux-usb@vger.kernel.org>; Thu,  5 Nov 2026 17:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c5bNzwx6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83A101F000C1;
	Thu,  5 Nov 2026 17:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793901312;
	bh=m8UMJcDjdKx6+K8sg8lxsZGjfDbA+Qjwm+43tpQEH7E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=c5bNzwx6kjxF5owric2PSWIrG0kWHBDcBLvxhAqfzumLR9HVAX3m2gy/4DQdO9isP
	 uWLL0QDk/hpPu27kj1HG61o+WnSu6H5rfZo+ejALaCVVgD9A6pzW6x/8DcfJbMmzsY
	 VNDZHHZIK8+ICiYBe+Q4YtpriOKzIpTuXH5tM81QFRVAJWJCHiRDJi+Mb2B0V4A8ey
	 VDg7qCFj5CKeW7cRLDvmjDdaNTnpW35GCTi6Rn2TntOY/+DRSJb2hhE1s8o/rw4VKB
	 WB9jbKgSVrFhsC2XDrFmO4SqGObW9LCxi9UhMdhWRlhtpcn0zmMJS5NVTM38U5Nkh5
	 JbyPLBSRZTzXg==
Message-ID: <sashiko-outbox-199670@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/5] usb: xhci: fix 'num_active_eps' accounting on
 allocation failure
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mathias Nyman" <mathias.nyman@linux.intel.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261105175106.241182-6-mathias.nyman@linux.intel.com>
References: <20261105175106.241182-1-mathias.nyman@linux.intel.com>
 <20261105175106.241182-6-mathias.nyman@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 17:55:12 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> From: Niklas Neronin <niklas.neronin@linux.intel.com>
>=20
> For controllers affected by XHCI_EP_LIMIT_QUIRK, endpoint resources for
> the default control endpoint are accounted before the virtual device is
> allocated.
>=20
> If xhci_alloc_virt_device() fails, the slot is disabled and cleanup is
> handled through the Disable Slot completion path. However, because no
> virtual device is installed in 'xhci->devs', the endpoint accounting
> is never released and 'num_active_eps' remains incremented.
>=20
> As a result, each allocation failure leaks one endpoint from the
> driver's accounting.
>=20
> Fix this by undoing the endpoint reservation when virtual device
> allocation fails.
>=20
> Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261105175106.2411=
82-1-mathias.nyman@linux.intel.com?part=3D5

