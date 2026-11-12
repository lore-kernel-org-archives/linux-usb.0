Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794472051;
	b=Yso8po4jztrtsXDeFf49vlzy9O2yrqkelo8QTg6+UBEVURoqx4LmbXNDuEghsoLyq9Rx
	 W2yqrcY0i3sgaT7nIDjhLalDWXDCilPs1xtOVEVod5vS5gJfHtcZKoGRyp/TSibzeF27u
	 WudRcL3ITWW18oEKEhbY4oYBq0vzziSCCTsbK7WBarf10IMfHZ1XJvBaA7lngeWTS7hni
	 EAeAug4OEbnINiqiT9X/6/DsPB1WV4RxZCKdlOcHyOx6K4mIyHoTnylHCAbjUt4TSuyUS
	 Yvd/5pGpuh6EKwpJEcgCORSk/aQUFzGrpAnMoO6gVSlYXFTBGSdeGk/3yLY5pYbjKVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794472051;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=75xApZ9YgPmKmXCnWLFZ0Xr4eeRbU1GZWz2SpXpWFPU=;
	b=F3vQq77fSZ4ZvsfObV+RNfj8MNSWbWpoTuEjUBxE/xX22+XrqNv6Zefer8iwtCfy6ePd
	 tNMCaqHuKqmrRrA3oHE3p4vVvGTbjmJr3RFbVtJfdUXhfeRDSLKv2BdrqPJnXyt+2ByjA
	 Nvlmevv0gP64mAhubYaQmLUdRzD06GzF2ofFnJ/YEuAT/UtHnInmPyApXy4avqom3F6tf
	 rPWi0jrFiYZ+yGKtSFpfqCtIe+RxT/fGgNPfj3lmDG3T928Xi2u0kEJuXX9disQjun43D
	 zP0Ntk6kbIS0mCvKRA660yoVkcHzWEH0V0Cob79OiO6HkaYFuBf2zGrUVkaEZkRgkYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gPc1Icvb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6487A606A321
	for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 08:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gPc1Icvb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 246E21F00A06;
	Thu, 12 Nov 2026 08:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794472051;
	bh=75xApZ9YgPmKmXCnWLFZ0Xr4eeRbU1GZWz2SpXpWFPU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gPc1IcvbEQDayn96JEIKkR2VCEob7srG4WcWPj1dUPIJTEJ3pBkuUhU44hOGqBkeW
	 A2bw6S4ZfshTlJ0yvaQqWvcJg5/ZKKiLP5HcW3jj8+RJsx6QLRuvBnhvtboag+CJ/K
	 oAIEJ4OAB9xcCIM/TmYoz8E2fPZ6UpXQAeELfGQpaMHD7wERdgzGZ53BvTpGSlivWT
	 OT3rx+P+tQYXNZndjcrB8nkwqM8kbZ6NaH1v/dVvA+h078NCBTMeNiCFmRAkr3+9gO
	 +NcuhtXrDEx0gJMyGMDrH1NGyyp3iJl0PyG232T0FJnpD8DvocCIbUhRqoQib0Ymjl
	 bCj9oDyi3xT6Q==
Message-ID: <sashiko-outbox-210716@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] greybus: verify the received message size covers the
 message header
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shunbo Shi" <shishunbo@cmss.chinamobile.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261112082230.33584-1-shishunbo@cmss.chinamobile.com>
References: <6af55517.a0c627da.5d811.0010.GAE@google.com>
 <20261112082230.33584-1-shishunbo@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 08:27:30 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> In gb_connection_recv(), the size of the received data is checked
> against sizeof(struct gb_operation_msg_hdr) and against the message
> size encoded in the header (msg_size), but msg_size itself is never
> checked against the header size.
>=20
> If a peer sends a message whose header claims a size smaller than
> the header itself (e.g. header.size =3D=3D 3), the two existing checks
> both pass (size >=3D sizeof(header) and size >=3D msg_size), and the
> message is dispatched with the undersized msg_size.
>=20
> In gb_operation_create_incoming(), this leads to an unsigned
> integer underflow in:
>=20
> 	request_size =3D size - sizeof(struct gb_operation_msg_hdr);
>=20
> [ ... ]
>=20
> Fixes: d90c25b0a279 ("greybus: let operation layer examine incoming data")
> Reported-by: syzbot+0b456664585fa81a47f6@syzkaller.appspotmail.com
> Closes: https://syzbot.org/bug?extid=3D0b456664585fa81a47f6
> Signed-off-by: Shunbo Shi <shishunbo@cmss.chinamobile.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112082230.3358=
4-1-shishunbo@cmss.chinamobile.com?part=3D1

