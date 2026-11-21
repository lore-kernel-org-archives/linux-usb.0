Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795273526;
	b=IqOa0W7BrmeZDk3jj2/TdNC8A1cW7TPKIZF8Kjsvj2gsRn7aIlNdGx6q04JblZJX+dJB
	 dxIYE3Zy41ohmeRghC8mSgYIaKewnt0b++XjGbKJozD/Rgnsx4vHXlRx5AvYyUSEpfR2q
	 yIUDo8COEqnacyNRxDU9MrnZNIt9mhaxTGMglc7PZU1pHr1QYNUpoLyshFKTLQOuCWapk
	 rbaQiczrzc2S+47QN+UixYavVePyFtlFZKN0/mLaRzYI/TzRbFAm5RBXva+TfHq91Wh/E
	 66Xxbi5Lk0Mr73m7x0L905wT5iFGxau54/3HXnjmbobda2cZXJsoPdW++yNC3uTsPWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795273526;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=b3v8Ok6vLhsxDGhUTy/8AADVesxr/FJ5uIcaDNO21kg=;
	b=NvLlCU72iMWrrT18Qj1kYrXrnzfO3gDZjxjvIgrG+6dddzUcaatf4CHBFLk7tCxqaQS0
	 tE17bVpoZAnm5WefwRmxUOw65y5MLsV9e0NljnWW/0yk9vhX5Uo1GuQhSz9HwL07SSHTy
	 6je7nWNjfEkJc6s/Xb/YQpCDO+J6c03PqgD9KRRBbx+GaPGWIRtr+HcYqYZhH0hF7aJm8
	 iFWeGIUt1VV4sTBi6LN4vOrM5isFgfcpifElSoTSArs7m39KYGoe1/wAq5LUhku0PZz8D
	 16DMEV+qft+lskJYqLRy6Zsg5Ig5xz/Yu8f6RM6SxkhN8Oaw1wZzsPMrRzD4p3D6Pyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Uu8eFBmW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55B29606A320
	for <linux-usb@vger.kernel.org>; Sat, 21 Nov 2026 15:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Uu8eFBmW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFC161F000C0;
	Sat, 21 Nov 2026 15:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795273525;
	bh=b3v8Ok6vLhsxDGhUTy/8AADVesxr/FJ5uIcaDNO21kg=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=Uu8eFBmWugsQH7Wl0EyQIodkyuVt3s2zXHC3uvhxPGjaXN1jPkt+OigsXg29p1q53
	 zYWwI6f/F4K66ia3QFW88MEEcDRaoUrvxM8SxKESmitBxM8A+eF1NgQn9uCnCLZF5t
	 upR+sTeZTCYUlIFOjTB1S1PhgfjalrN9i8rXp5MGoG7SsgGYWci54BTrYUv2gIRB2X
	 8Kdtc+jJWS7PhgS9yuA5K9siXhAZ6F/EhtZJwmqkAgTTgDCOstpA9DLzo8/8ehymY+
	 aZi5e0TAF2BvbdyT/b0hibTqj7ZZT37AYM/m6RWkY/j/4WxJiZdqT1JYk6fjjd7ef5
	 6GD47To6FAF+g==
Message-ID: <sashiko-outbox-227115@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] usb: bdc: Use devm_clk_get_optional_enabled() in
 bdc_probe()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Markus Elfring" <Markus.Elfring@web.de>, linux-usb@vger.kernel.org
In-Reply-To: <cc916c01-fb49-43ae-ac08-047f5fc5001e@web.de>
References: <cc916c01-fb49-43ae-ac08-047f5fc5001e@web.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 21 Nov 2026 15:05:25 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sat, 21 Nov 2026 15:37:14 +0100
>=20
> * Reuse existing functionality from devm_clk_get_optional_enabled()
>   instead of keeping duplicate source code.
>=20
> * Omit a clk_disable_unprepare() call on an error handling path
>   and in the implementation of the function =E2=80=9Cbdc_remove=E2=80=9D.
>=20
> * Delete the label =E2=80=9Cdisable_clk=E2=80=9D.
>=20
> This issue was detected by using the Coccinelle software.
>=20
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cc916c01-fb49-43ae-=
ac08-047f5fc5001e@web.de?part=3D1
