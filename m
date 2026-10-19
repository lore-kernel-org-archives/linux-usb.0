Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792423089;
	b=djQXq8h7pzwd5dUnObw9/1CepMd68GzdwbXUPuSSjYBC+dzelfBVwqIHrZQsz4oV2gYG
	 H89IzO6TeONs/X1yeB/zxoyDxU1cC77V3k4KvRKIBV1WfiApdudisYhwL85KgNwShG1UJ
	 e2wLymx5NfkSHo54+NfcBUN88cG2WhwF9CvBn2TwAMhBxVDeRxEMlLmBEM/7TQbXP5Gcu
	 Da6G+8OkdxaegSs1lwly7JfVc2SsYMjKbZcDQfnF/U0L2SCrQ77QJcyTRTLBLRnC+CXrt
	 ytigSyLT8g5YazHKyrC3CySo0bQfjvvl6CDfQF3D4CK4Pc7OoivUDPW2Vb5b6FVby9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792423089;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=mt6lzHGeY0MpJKhIoi72I+ybP52eDFQfDrJgt1ceMwo=;
	b=VS1UGeV0MuvoKKqourbFIoJAnBWK9OTL5dTHFF0keRELbu7CH1FQWccokKKEi493yKHy
	 3CO3QUID+I3/aUnmeenOSEXnPshtSMfP17Hh1A3nfLEDybEpkisDRQJbMitMoutv8CAI3
	 nLyBPhipbDH28+zS/BU16gS5bid8YMGuSTD/qtGQx59C9YSWc0V9HzDRLoga7hXIdPgej
	 AMwdZHhV74YBViQECaAtuRu46T36zoCRzNrilQMggifwoTSLS36jF22jGWzci5R8l4XrH
	 ArDl3xvCW2TAZpvhhXCK8Ys41lEiu7DQCutj97sKCDrzvQEzQ0TwmGEsP3OoXeN6hnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CXXvJgAU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61BB060A3807
	for <linux-usb@vger.kernel.org>; Mon, 19 Oct 2026 15:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CXXvJgAU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDB0E1F000C4;
	Mon, 19 Oct 2026 15:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792423087;
	bh=mt6lzHGeY0MpJKhIoi72I+ybP52eDFQfDrJgt1ceMwo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CXXvJgAUM1VxcVluzju8YLZ0ImD7w3rh1ia5bb3zRvlUOlvegk36G28RMVY/BwVBa
	 Mtp5T9H4LTvbPbgoJd3dorL4aKEFQLTnmi6gs0g4znKZ1YbwmUdZX7kpyXCfxCJfuB
	 S5t7I4WMDt47BZPoMrlXHplEY2fP4wQpwLvWNeIwzyYBwNPTn/kYduX1ybfxxc2I/v
	 K4a9RkmhEcU+JA4s6f7yuz3dIcR5lfkQcV3Olnw+QaAQuu0y0z9k6ajWLR0y4JNr+f
	 Hu03msk7BE5b9Zfp46GMJqwGEzlF/ucsZ5YBBuIhZIpKdH1tDs/UQykZOu8sAc/BJ7
	 23xWe1ZFtV6AQ==
Message-ID: <sashiko-outbox-177673@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH AUTOSEL 6.18-6.1] usb: gadget: u_audio: clean up capture
 endpoint on feedback failure
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Levin" <sashal@kernel.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261019135441.1420968-435-sashal@kernel.org>
References: <20261019135441.1420968-1-sashal@kernel.org>
 <20261019135441.1420968-435-sashal@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Oct 2026 15:18:07 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> From: Xu Rao <raoxu@uniontech.com>
>=20
> [ Upstream commit 7a0d4f60da261f61dcb50c8e05fa53cc7d4d4427 ]
>=20
> u_audio_start_capture() enables the capture OUT endpoint, queues capture
> requests and marks the stream active before setting up the optional
> feedback endpoint.
>=20
> If feedback endpoint configuration or enablement fails, the function
> returns an error while the capture endpoint remains enabled and its
> requests may remain queued. The current code even leaves TODO comments
> at these return paths.
>=20
> Unwind the already started capture endpoint on these failures. Also set
> fb_ep_enabled only after usb_ep_enable() succeeds, so the software state
> matches the endpoint state.
>=20
> Signed-off-by: Xu Rao <raoxu@uniontech.com>
> Link: https://patch.msgid.link/183621D513E0DE8B+20260611091229.4017443-1-=
raoxu@uniontech.com
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Sasha Levin <sashal@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261019135441.1420=
968-435-sashal@kernel.org?part=3D1

