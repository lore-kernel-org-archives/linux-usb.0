Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795429969;
	b=U0I7HrpxLEAg8qAp+Vci3QjSHrVNAWzvyCuwBV3akERV5saOiWKjo5ctyIUbFylrd3Ad
	 Q5znPTdBBlf9I7EAVw5RGrAuxtTEiQ5VfVqcIcbMgz+a1rt+qm1jFMYcGp/QQG+u91J0B
	 6k6g5kPN9Fjktxef/hW04j5W3l+T5sfw6rbvlPYULmhHJPjMad/P8zV1ovHSaRBrk0wil
	 yH/uskRjVIgIkOuorbhqYqnpXMIqFN/oxmoSAG0FrclVTyQ7KpMleeZdKOjFhOGOKSE3g
	 XrH9CLAgCqtqDtmHM7LL/h5MPp4BvcaM257LpfRFKJ4RwgiAGYfD082sBRXavBYzggQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795429969;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=hxI9tMOlZfdoeSyQXqTowT2Ql3H7kg6PjXqz4kJ7JTA=;
	b=xCHDYV7LpSTeTI3B7hnZbaOVEEM64ysiuaAzSiFyfsxXQ7u14RUWn7By/C8+VyWnPhps
	 i5CbZlHn0f7e3eFSS1Y9dDjsZOb3A9QO7or2LBv0as0jvB7OGpTXXhHJmxkBqScl3PgBt
	 o10NTWv3kIeRtofQ2APmSMjk+9IN40BUIsYEp6kRvZqaD1ojWPBk111AtQPFvKLLDaAD5
	 EdPT2szZef+Ol3gG17Af8An/kZrFIR3p35p4lgFijEQ3iLLoeArlDbwIEbeRHB3pVOirw
	 ffK5HBscLKriZJ3Y2uErwCRg/Z+HxzcwTqdVaJe+gNbQuUFrSuWTv4FaPHRvcR1ysMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bLPPHEDf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 357DF606A31A
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 10:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bLPPHEDf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 617131F000C0;
	Mon, 23 Nov 2026 10:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795429968;
	bh=hxI9tMOlZfdoeSyQXqTowT2Ql3H7kg6PjXqz4kJ7JTA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bLPPHEDfxc7yH8v8+QLlKV71s5BaTjOLV+m2L0w52k2kOilnHNtDbLRT5x3s6ba54
	 bZRxkJvN7GH1CGBpuJdcr44WxpdgzkDt8AgBnls/EWyt5jTxtb7UvuVrH3vR4SBT1M
	 o1Pg+TwPjJEmakjCjC7qg9X3KBAGf777FXm6xbIzSoz9CA9a3muIP/QUlevxHf9Fy2
	 hMzyxHRZB0f2HpmXFoQHi/FgIfMbFlFIQxXAiZtzB/1GYk1Y1EKMmwnlTDJ5b5FYvN
	 S9ZhRW+V1hgLziViMa1C/s7/Xj69sYIrs/LP369NwJb/h1Ycr90iVKQebP4Squ1qxK
	 fjE3NqUuYpVTw==
Message-ID: <sashiko-outbox-229050@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 1/1] usb: core: quirks: add quirks for Kinesis
 Advantage keyboard and hub
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shiva kumar Martalu Gachanti" <shivakumarmar@chromium.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261123102950.934878-1-shivakumarmar@chromium.org>
References: <20261123102950.934878-1-shivakumarmar@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 10:32:47 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> The Kinesis Advantage keyboard (05f3:0007) and its integrated USB hub
> (05f3:0081) fail to re-enumerate after suspend/resume or warm reboot
> when VBUS remains supplied, reporting "hub_ext_port_status failed
> (err =3D 0)" until physically replugged.
>=20
> Add USB_QUIRK_DISCONNECT_SUSPEND so the devices disconnect on suspend
> and re-enumerate cleanly on resume, along with USB_QUIRK_DELAY_CTRL_MSG
> to avoid control transfer failures during re-initialization.
>=20
> Signed-off-by: Shiva kumar Martalu Gachanti <shivakumarmar@chromium.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123102950.9348=
78-1-shivakumarmar@chromium.org?part=3D1
