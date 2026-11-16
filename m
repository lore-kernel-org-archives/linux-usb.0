Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864764;
	b=22Wqo1HLXTP6NNS/9lg6H2TZH83uWbSpThsFYCFJVo5YLq53QIVqycBYLm2GxC/+D22o
	 1QhhfSudo4nkMWmnTL5qanpuomny/h1Lr2Xio9WzZHtG+RbFMInsZr8XmWFR8cf5Z04f7
	 rDFhw/ezpzoh5fBiGHPbrDK8vyDkRJjP+m5SG5jPSq9TOQzr/zG1jEDEk9vMZK5UsQiEh
	 rfIw5hJ+EyXJaZbYC2RvCBuj85IiAvtE0OjPKDlZzsy1AnvTDtOqr9PqyeOOGNnnhhEC2
	 XL/xRJKODEBETNeHhgnZkRzQRm65mVV45vSHqHTGwIXFGhuJ9yVmr8SoSBpBVFmqAJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864764;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=QePWuuBP65moMRMxY/UmY3jkj5TJpsVx/EYCveL3yxw=;
	b=CrNB2Hgcx4sO9RJVaneqeC2ZlasbnCOE1wyiX6I3a7GW2P64FrJ6civ3WXoOotq2nYAA
	 3MQFh8nHxOBwhtaJkfwgPTJu0wk1f5UecXIw7gi1rP15ctKQGsMBhl9Si5hCH92HGyq+S
	 Z7OH3E6m5dTxh8kJbPqXu6FMOA0XFrwbUxuBf2t4bBIEyE9i61OpbLdLpGo8GIBLKkIVU
	 NH2RxaZQyW+umMkxxmuM2Gnx96YS7jHu+gbtjISp4A0PVdy6A/S+ycSiGkYaS+Cqq8vmF
	 PcPIHDXbBH0TSqQZsrNnNM7IicjStlG67vjYQQGFbD7bfe3x4PHgoA20IamtVQTkSjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UaBbSJqE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FEEC606A329;
	Mon, 16 Nov 2026 21:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UaBbSJqE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CCCF1F000C4;
	Mon, 16 Nov 2026 21:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794864764;
	bh=QePWuuBP65moMRMxY/UmY3jkj5TJpsVx/EYCveL3yxw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UaBbSJqEjQ12Y9opiZd+Gdb8AhO+ExXCtbevuN0laR9lR73S/AqwvINiR1F5S9+5V
	 LwrgrgphfC9n4wSdREwm7u1RiV/nQm9f9B3Un6QqeVKqHu4NVWg75T9wM5lgJZgm5t
	 6M3vrl3xSB563aWPt0nw8/F8zOQTYBESOuJHZ2V4wXaNWXI94UrBf+sRigGwuL1mtE
	 cyGqy5MrCIRA8hmW8JUzrh07jsZZjeGW5Jr/xn/XRHmIqT7zeqW8JU+bq/VpuSSB0e
	 FOnYPtntHaOrgiSR3aoOe7a0km5ykRZ4istbI4xObjOO1vs5LUUY3KcDveiwnu+jeF
	 ISK8z7gRCtM8w==
Message-ID: <sashiko-outbox-217731@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 07/16] dt-bindings: phy: qcom,sc8280xp-qmp-ufs-phy:
 Add Halliday
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stanislav Aleksandrov" <lightofmysoul@gmail.com>
Cc: mfd@lists.linux.dev, linux-usb@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261116-halliday-dts-v2-7-2c92438c6c46@gmail.com>
References: <20261116-halliday-dts-v2-0-2c92438c6c46@gmail.com>
 <20261116-halliday-dts-v2-7-2c92438c6c46@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 21:32:43 +0000
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116-halliday-d=
ts-v2-0-2c92438c6c46@gmail.com?part=3D7

