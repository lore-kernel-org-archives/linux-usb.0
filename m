Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795855563;
	b=3j7h++YHsw1oWWeO/6QVWbctt+gYEZIElYNGFspQEQwdTGUro7KTUJ80jvZLVBwibQFw
	 40YiQGRtMkKf6FeWcdjYpK9jNvbZ2CZq5rRg4XE3UeDS41le3odLkOABVopPQCHWH4R6B
	 sCtT5p2/lQCtRKyV9CXIFMDNSeuG2goZHCVDLDJLaskbm4wg02Z5/igV3rNDgzo2dJ3jK
	 hmHnNofkfigqFW9SZslSy2zZjPa73g4DQJISrRw3ES6gDDZpNCoKn3b5jf9KK/+oY9Eyf
	 c+aEPHTXkDjV4D1rTbMSD1tU5wl5uKGqjK3fJUjU8UKjr2p77s5kWSSpdBXDPRbf09g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795855563;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=CwN5r8+X8px1v33HgKUcif3JrPM1ce5O0QCfgB1JL64=;
	b=MutTG7aUmdCt1HM6DXkUTwowEvMffcRXtk1B9IoV49ERRbEGI9YttOCVzEl9YAxAVQs7
	 PJc0qAL3zUMY1irLCIg17ZtecfyWNAeiPMep3OZqNb1sjRpA+jml3VUuI2AEtSlsnIJFz
	 MopbmVlPAvYo0wI6WjfuNyebvKeWtCJ2t93boZwlaPBlJlWeDw9Rx9d+6umqXSPnE5M2Q
	 QOPN91Xca8Gh7afuh0nXF0GV8YoLCtN5tTMsRdHgW+JucBFTDMKjiEHvDjWVVoqrk8YfM
	 5wR/s0dQRJUBUEL7jkD0gUUU3LAq9RmpJ94UuxgSRWdrWu4KVWYTbkZh0MQB8CtXKRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LFhw98xj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51CB9606A31F
	for <linux-usb@vger.kernel.org>; Sat, 28 Nov 2026 08:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LFhw98xj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC9661F000C1;
	Sat, 28 Nov 2026 08:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795855563;
	bh=CwN5r8+X8px1v33HgKUcif3JrPM1ce5O0QCfgB1JL64=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LFhw98xjkNmJLmSuhmI3p9BTYw388HcXy8goQ4uTGF6tO0kAjnTf6cizmg2Awmpao
	 +rTKh/skvbPE1QOTMQWGsr0D1sh97tdSjVWYhQ/XpDFRhqrvdKuvGozWeH/Yqu0Jer
	 qBb6OIXhyFWhNs4j18dmU4hZu8OaCCnJ2iuCmRqj0se6LPQdjrb01JZGuc2W5nipfS
	 t6jPjZT3XoNzpgppv47PQxDV0/CcSkWCwEhn3owTS7XFXAZmgzbPIdHvj4eicKHHP+
	 d2TeeVth5AL3a2QGvtwZyj05fx3XBDVT1KvrQQYwQEcij9RnLWqAW4yEznUD1MnAX+
	 z85yWgQRlLQCg==
Message-ID: <sashiko-outbox-238560@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] USB: iowarrior: ignore short reports
Reply-To: sashiko-reviews@lists.linux.dev
To: "Maoyi Xie" <maoyixie.tju@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261128084355.721820-1-maoyixie.tju@gmail.com>
References: <20261128084355.721820-1-maoyixie.tju@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 28 Nov 2026 08:46:02 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> iowarrior_callback() copies report_size bytes of the interrupt-in
> buffer into the read queue. It never looks at urb->actual_length. After
> a short report the bytes past actual_length are stale or uninitialized.
> iowarrior_read() copies them to user space.
>=20
> The vendor's datasheets describe only reports of a fixed length. Ignore
> a report shorter than report_size.
>=20
> Found with a CodeQL-based static analysis tool that we are developing.
> Reproduced in a userspace harness and with an emulated device on
> dummy_hcd. Not tested on hardware.
>=20
> Fixes: 946b960d13c1 ("USB: add driver for iowarrior devices.")
> Cc: stable@vger.kernel.org
> Signed-off-by: Maoyi Xie <maoyixie.tju@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261128084355.7218=
20-1-maoyixie.tju@gmail.com?part=3D1
