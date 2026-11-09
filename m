Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794185687;
	b=i9AI9fkNfXbs6LG9DC+ozG6rfTSFDQAbgYpaMaaqP8pi32LEG9a7GhqauiiVMcbLyZOu
	 uqA0rCunXkXaUR3CQyTTdSV00WkJEBshfr9mpdtKav0BwSa5jpQhIszKl8RIjF/zo2zc1
	 UihARVw0+WOdx4Zy0rmZ/LfWNP2+ZGYiq3sGN5JVs94oRqO7T9X34UhBecJ3kSYM3ETb/
	 X97m/yLp2qk0UN0QxqybUyvzqzS8BCXMEov6Af61wbJ2m3IObjJW26iOIdPrnZaZHUrNP
	 LT8oWljYxqtL6BiShbUXJ7xuXj0PPWLADr+hEnGnWGdHtxe+XBVliLvFxXCiQykSG9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794185687;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=k5tV+agZ0egr8pspBrbD3QZMCnT7EsrD3kVOLEuWzoc=;
	b=XJ95C8TJZmJQXY61s2CkAcIT7IP4cegzfbU25hnircSi3KhzaiYj4kOGRXLyOdzYnOeF
	 XvJJYpc49tq5ZBSVmeCE1RglgQfOnW8PrmpU0dv4h91DOpZaJ3/kJpMNeEyR7SEtlGmK3
	 R7BFDbqpnjV/lIGapWjCuYm4ZqUaMN4Yk71FvVCskNWzT1Fcm9Y0aTmJAYqBQ/KYP2aU0
	 qVq/zTLoawt4ZWIs0cM16gFDlv3bIG3GaIFUxlGPKFxK0FM4/2lDN2WnHomiMxd1q67U1
	 eFFHtsJ82X773SCzCiOMyaVdUF5+immMpgTBnOYny3/FhAX3E41l8Mbgyz5UkcjopfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IQ9JMGv6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC4CF606A31C;
	Mon,  9 Nov 2026 00:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IQ9JMGv6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 149CA1F0089F;
	Mon,  9 Nov 2026 00:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794185686;
	bh=k5tV+agZ0egr8pspBrbD3QZMCnT7EsrD3kVOLEuWzoc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IQ9JMGv6Jty0LLKlJxPbHnVcrsoJZIAkBiB7VKf8MTsgUMIWM+wNvd2WZ2WOPvir8
	 Wib02sL/hjbbHbMrxCjQNTwQBBKOAfv5iT2e9jzNq8XierMCen11wy0eJcS3kIf0dY
	 odCbhlxrl8D9HibWC7OcH4pMIqZXYLINxWcgb2IUtW8fdiXk9e9AxH/6CJBqkNTDh4
	 R+0EC3sOuEU/T6ynjtP3digUSrgx9WLTJO2b0KXCBj2FIoBl9qnTOwlUqe2owpLuJ5
	 +QJKCLm+cvUsBVmrylSNOqciKDmS4SAT9JfflByPno36d1yOEmAK9jeOKZcjVnw/px
	 x+dRS1aY8V1Tg==
Message-ID: <sashiko-outbox-204262@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 16/17] arm64: dts: qcom: Add initial Halliday dtsi
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stanislav Aleksandrov" <lightofmysoul@gmail.com>
Cc: mfd@lists.linux.dev, linux-usb@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261109-halliday-dts-v1-16-289114ab8197@gmail.com>
References: <20261109-halliday-dts-v1-0-289114ab8197@gmail.com>
 <20261109-halliday-dts-v1-16-289114ab8197@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 00:54:45 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Add the device tree for the Qualcomm Halliday SoC
> (SXR2250P / Snapdragon XR2+ Gen 2).
>=20
> It describes the CPUs with their idle states, cpufreq and OPP tables,
> the GIC and the PDC, the timers, SCM, SMEM, RPMh with its clocks, power
> domains and interconnects, TLMM, GCC, SPMI, the apps SMMU, USB, UFS
> with ICE, TSENS with the thermal zones and the PMU.
>=20
> Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109-halliday-d=
ts-v1-0-289114ab8197@gmail.com?part=3D16

