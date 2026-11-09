Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794185037;
	b=38V+6IRKgrO1zyZqf8IvLCvvKNaU9ktfZ1jiQSxXtYIqSj0z8ty9hTrbO6FTDKxotRD3
	 kgLy65/Bw4SwQ0z8160r6zWJmZgIgFIY0J+RcfsQ3bdKxLGFVpyJujbR8uZzz1M7eszRx
	 g/4OswsncsBDKIFCjYMaRFJGKvsxQIrjb2YzE/oSHYQCINVLeq1Bl1qDACPPUvkSA11cA
	 ihCQGEmV9203eMfc1MVZkk0a/wuhDF9z9hVMyixBCucOVKT/QqKeR/oCeuxjefwvyi6jT
	 Qt73m48eYei7Wpu+Ab4vuKZd+UMDiYt/vA/WSdVL/3W7/C1HOphQTP87nn3GL7JZC8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794185037;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Z7UsvAkfV290ccfTD5tYE9gHWU/E1n05DPoqM/9uhVI=;
	b=wR8ZIctW1TsLQrwftaw+jYKSZLFtUgucltvO6Q5wAP3eYuBjLIjYIbn0EfLQNhCtE5Iu
	 cVhYgBI6R26PsmOFiuYmwjJXUxlsVyyNOm7vCJZp6Gt/GnCd6jjyhikyTP+RwOOvrbmfq
	 ATR4AZYYMBXGFKag3WGpodZE65NATWwcSuPL/0S0gGzv50N2dAhL0+9OxsS54DJQmPlY1
	 tHXjyW937PBGfKXIfGJAGA6+qMTwOHjiR68X3giHW86i9iPVohWreR9zigDi4Miy6Ir72
	 jyaWf2Z4DfSL7VuZvg9NczqR6Ov5leQI/BeUzZk/1/ZWzq+VZvcqrsUsggvW2B/UhDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H9MWON0y;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50AEE606A31C;
	Mon,  9 Nov 2026 00:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H9MWON0y
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E9441F0089F;
	Mon,  9 Nov 2026 00:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794185036;
	bh=Z7UsvAkfV290ccfTD5tYE9gHWU/E1n05DPoqM/9uhVI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=H9MWON0yOds5bbo762FxSLWoL9cc1D1mR8I9Vn2xkV+kvu5qleXBZ/vrkw8C+fVAe
	 i/TUCS3br88gwulg/miZ0m336MIKnDQGyK9VIMkO4Cbr9SZ4sj44aURVialBgU9lnH
	 agyT1sjNFpD6k7VSQt/ZftivzNCj0iBa4fsaMZ/KWdSNMEbvZuxoFbPIs8pjyT3jJn
	 YRbKUWlh6AxNYEVF9v+ECbfUcAiDL9muj4hD9iu1KbGXAxEZnC8Jz0nNhtb6a3V3FF
	 /S+3ssRexhFAKXH5o6CqR6HJATf/i8jdD8DjUlEQi5I4Zo5qmfrtu68KRFqQpKaqtn
	 FJzzCF/WFAKSQ==
Message-ID: <sashiko-outbox-204247@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 10/17] dt-bindings: phy: qcom,sc8280xp-qmp-ufs-phy: Add
 Halliday
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stanislav Aleksandrov" <lightofmysoul@gmail.com>
Cc: mfd@lists.linux.dev, linux-usb@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261109-halliday-dts-v1-10-289114ab8197@gmail.com>
References: <20261109-halliday-dts-v1-0-289114ab8197@gmail.com>
 <20261109-halliday-dts-v1-10-289114ab8197@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 00:43:56 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Document the QMP UFS PHY on the Qualcomm Halliday SoC, which is
> compatible with the SM8450 one.
>=20
> Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109-halliday-d=
ts-v1-0-289114ab8197@gmail.com?part=3D10

