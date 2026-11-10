Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794293024;
	b=T7TKAH2j1kF4Fmq8/g5sQ6+/c3U0OiSsK+l/P9cqyzti5BEDf1YbvVWThCb0Qx6rfuIa
	 RbDECUY5Z+WGd2MqyaY7sfYZO/yxjiaX7dJAFxTBc7+Fjts5Oc7/OCXRJqNRVT1IGGBvY
	 AvO9wH0qacTWWEYleVeYDvwOimaBFVzHrzUHJJGjF1c3PDdYj0oTKxTWfMbQ2aqS6lCWU
	 jmbP/tFiSP1uJrHBZluK8RfY7w0FdBdHmVzKsHKoYHmfWn1ilyCR5jg6OodcKCAmAKuil
	 1nPguiwNt+gfOO4Q4pdf6q8dfVvBF2jW9P12LAcCHUTQo4YD98JttRtXYAt730dHjng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794293024;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=PxaOxFFSQcXLdTq2DTyoSVsa9IH4TJVbHIwpC0Sf++k=;
	b=H8o9mCsakMLiForKVCkZ87o2kaQXs3Pm3dihhLa9pLEaXqtTAcojLnup8P52E9/3UI1O
	 jiVGQ8ZVoVslQ/pkqmn693w90sgerOjKVTOMW0ylr1N2wPI0WzzJgP3+SYbPXmOMzC3cv
	 kwiiJYWVJ6LLrrzhc41G3SMvpJkyrRcUzVGJCYgm2khtiRCCfkFG9CzYaDehc1eKH2qTd
	 q/dMFAgxBtvgXGbPvPdtTT+7J2qp3jhlPDaVGx/PlMMadcZ8DfM2S+LbtJLnLi8MCQXpd
	 wDL284JUCkx1YmmyuJkoRnT5jHIoLoOviyGDpCFX3uUjxE30FO4krnDspyfcImyVAbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e9HHZqaT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74E1C606B1D5
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 06:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e9HHZqaT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB4771F008A6;
	Tue, 10 Nov 2026 06:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794293023;
	bh=PxaOxFFSQcXLdTq2DTyoSVsa9IH4TJVbHIwpC0Sf++k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=e9HHZqaTVnvenXjiSU5JSjwm3jk2lXkfIero1IRTtt+YUqHmDdXYfuCOqnyLJHjMq
	 QKM6CJbWNG2ozJGIQSAKuZNzE7S//LRceWezUXkJ0aiJ4ipPXLX2aO2yY0p3TYLuiu
	 SPzHJgorKzYNTauxnJXGmvm9L9fxVCZnDC/1v7XWYeFdVLxniD1d4X9Ho95tNLdKrP
	 WjmHsGF/ZZzSBISgZxsnliocfptDxnFqKX1QWWAWmUpCp+rSp5S58McSNt5BQaorp2
	 kJ0VLKSMaFv22aX6IZlzaksBAojWmmBXNsV62tb21ZoRKs0nNyzApDFX+FWDninKeU
	 cuL2TCfuyIoEA==
Message-ID: <sashiko-outbox-206427@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 09/22] usb: fotg210: fix a few spelling mistakes in
 comments
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shunbo Shi" <shishunbo@cmss.chinamobile.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261110064105.20335-10-shishunbo@cmss.chinamobile.com>
References: <20261110064105.20335-1-shishunbo@cmss.chinamobile.com>
 <20261110064105.20335-10-shishunbo@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 06:43:42 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> No functional changes.
>=20
> Signed-off-by: Shunbo Shi <shishunbo@cmss.chinamobile.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110064105.2033=
5-1-shishunbo@cmss.chinamobile.com?part=3D9

