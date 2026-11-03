Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793741063;
	b=amqKeViRySGSfmAkpEQu+jiIz/GOzTJByYhDtcS2l++QZPkhp7Xzsp03cAQtdQQ/nC7E
	 yg8DwTTNbd9kbzj2zJoLMrkcWC6YATA3k8tlhfbEFx1RAKEmFK5J7IOZsjyR/E4bQyLJA
	 DvaTIMjJspH3LgqrB2xgb9XmVDDXmLfsZgNZQMXi8xP7YKZzitxw1+7J4laTkNvhNldkD
	 GJWywYCa1rai5MNPzBZcXwNEtRqFPgrfkeBcXhQseEwpbxjxLE+yUlFAUJcT5OiLOGuDy
	 WDQdbs/CxhQKSVGa+NgGePDxtdzpOk+HCvsMSfTKKI2PJ+Nr3bFZWxXQ+xE751y33uw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793741063;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=pR7GuEQMUlmsI001IDGVZ/M+/HrXY8YpKBGSjsmOI94=;
	b=J06YmK2+UuLFcNQ+fc3f2ipzxXp2duL3UFiZwEqofOSCHV0D+jqMTh6TEKrGlC43n74/
	 sKOk/C8kbAZ04wpsLgCwOK/pMZ6w6IvzZUEQDLAeGHQQHrJ4JgBlvBowVRgubSPMX2OZC
	 pERzceHw3i3NJMksC8/BdYmsoB7+Kaj7nn9vk/I5JRzZbRCZrHgnb+2sC6xkKYkRPcxXg
	 3yj/huuVo20QjxZeO6FsUp7gsjs2aZMm3bBItOLPUw4/oGVVSyjJLIPE8akGUKvJpSXZC
	 3eiaQFvp8PNdGUkOvHm2vJLimEQjvSx+7eaywpHqaVv2NNxWNcQ5lazu7M8y1x5erBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Toe0XQXk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1023A606A326
	for <linux-usb@vger.kernel.org>; Tue,  3 Nov 2026 21:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Toe0XQXk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 949DE1F00919;
	Tue,  3 Nov 2026 21:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793741062;
	bh=pR7GuEQMUlmsI001IDGVZ/M+/HrXY8YpKBGSjsmOI94=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Toe0XQXkaSATcx/R17K4TBnkk4+oBOtrIu2C0qeXjayK8uhNJb61sADuUTjyyY2W5
	 orFJ0V0HPYPZpobEBx8JfhjVQd06UPpmaoJjTLf0Ecwa5q7LI2NzXQfA3PYiAAoUSY
	 84KTGBVL5o3kYKgwQq6J+V7MqRWXtZSTrvxqOZun14myd9fTOpXb0vFnY8+wjfjj7n
	 tAGzw6hBLjbgQ/Ma3ONKGWEyJiUjISQdPACmYqTw3z0/XY6E4Eri1OGutUyIMqJoIl
	 9i4aPYeuofNO7EE/hWj6NE+hY0q2MDp6Sg2jdqe/xltPKsuE4eoSirzQFmmFhdYebe
	 NRCwV+bLAl3DA==
Message-ID: <sashiko-outbox-196050@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/3] usb: gadget: f_uac2: allow explicit channel
 count independent of channel mask
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyle Farrell" <kaf@nwlink.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261103211434.996135-4-kaf@nwlink.com>
References: <20261103211434.996135-1-kaf@nwlink.com>
 <20261103211434.996135-4-kaf@nwlink.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 21:24:22 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> The UAC2 gadget driver currently derives bNrChannels from the number
> of set bits in bmChannelConfig. Since the bmChannelConfig
> channel-location bitmap provides only 27 predefined channel locations,
> this limits playback and capture streams to 27 channels. UAC2 allows
> bNrChannels to specify up to 255 channels, including channels without
> predefined locations in bmChannelConfig.
>=20
> Add ConfigFS p_channels and c_channels attributes to configure the
> playback and capture channel counts explicitly.  Preserve the existing
> p_chmask and c_chmask interface and semantics. The default value of
> zero for p_channels and c_channels continues to derive the channel count
> from the corresponding p_chmask and c_chmask.
>=20
> When an explicit channel count and a nonzero channel mask are both
> specified, require the number of set bits in the mask to match the
> channel count. Partial channel-location assignments permitted by UAC2
> are therefore not supported. Additionally, reject Feature Unit
> configurations whose descriptor length would exceed the one-byte
> bLength field.
>=20
> Signed-off-by: Kyle Farrell <kaf@nwlink.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103211434.9961=
35-1-kaf@nwlink.com?part=3D3

