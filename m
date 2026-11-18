Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795005824;
	b=SVUGuTlJy/CWp7V/opNkp2uzv7FgmOQKHbM9fYbqnzhbgP0KsZVEZfcThbIp635mzOds
	 ZU63jxXnWqbknu2B3tKcUNnyNM4aCk2Hbs1uxPllbDPVNIteDyv6+Ao/v6V1tjppt/sZJ
	 Xhyb6jc6hSExLEBxbR667R6Ifv6Jud6HKSQMLYarFE1nWsI995FcpHg2BxJW2dODrsk4j
	 f0FyMjz7I36ihpgA6L/9qONu4j6i7cbfBAC3IBkMwjjO+bt4yHvN0Hu3Myi/T4NzIsEaE
	 vJ1H/GAmGoku5N8jFWgtH2xl1kBWQ7FMmXXT30XsWsC8V19DZsKaL3AO6mqYw1obVQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795005824;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=1e0TcB3r1ARSy1RGweeHZoZV1RKMeb4FhU6CmyXjvM8=;
	b=cqLcs5xfdbuikf9p71Hl/eNHDcvuHdYwmNRU+sOdIvZuY7xZivmwZzh5ckVzhTSXrb6j
	 aBUMbJfMXpkL+2ULQP5+zLe9qo0Lkf9o4SyE6tm36MPXm2U1mG4R5bh4f3LyJvmMMdPSs
	 IDQAy4vgIr0DJ55Aw9zuA/qH4YcN9ZLZZmtP41mh1+6Au9dDazkergTQZwXKcokrTymA4
	 u7YcSID+icqeX2gq5D7Z1s8kECbPh20l1nnsu9qiZNy/GOBRR48u1m5O7Bnz/AQ+odkqQ
	 3zEFB9Kl5GOP2cDaDDZ12zM73VffbPNw+okaC4V7Z0ZbPBWo5RXRxj+NkXWOAU7y9vA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="eKtJh/rL";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FF20606A31C
	for <linux-usb@vger.kernel.org>; Wed, 18 Nov 2026 12:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eKtJh/rL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1ED621F000C4;
	Wed, 18 Nov 2026 12:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795005824;
	bh=1e0TcB3r1ARSy1RGweeHZoZV1RKMeb4FhU6CmyXjvM8=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=eKtJh/rLNeRHRE4aDRKfTnbF+ly2NSdaH/2ud2JvVWAZco3wnqPpsVWVTHp9FvuYF
	 AZfODAuNWNM3UR33TSuN+zQuEBYMM48b9jaQYspxXay7nbOlWrN3+UAPqGR8fmhCqs
	 O1liEkbuXz76rpLCDAzUw/JAGMoDyV0lp23tXmJicnsDkrSagykmx+KLhaQZ+BmPM/
	 N21FwFfT3WdkaG1kgSqzkoTCHwXrT/YXndM9pWzr2C7DK6r+px2gnQRGhf+H85NxnP
	 zP7afxFmNj1dNLjMnKuJYpNWqLH1Dfk5dkftVzq9VyLb3vBbLVGJJtzjvtT5MldI86
	 k56YJH32vz7Yg==
Message-ID: <sashiko-outbox-220935@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 1/4] usb: gadget: f_tcm: queue the BOT status
 requests with GFP_ATOMIC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yehyeong Lee" <yhlee@isslab.korea.ac.kr>, linux-usb@vger.kernel.org
In-Reply-To: <20261118124005.2428068-2-yhlee@isslab.korea.ac.kr>
References: <20261118124005.2428068-1-yhlee@isslab.korea.ac.kr>
 <20261118124005.2428068-2-yhlee@isslab.korea.ac.kr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 12:43:43 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> bot_send_bad_status() and bot_send_status() run from endpoint completion
> callbacks - bot_send_bad_status() via usbg_data_write_cmpl()'s cleanup
> path, and both of them via bot_read_compl() after a BOT read.  Those
> callbacks are called with interrupts disabled and must not sleep, but both
> functions queue the status or drain request with GFP_KERNEL, which can.
>=20
> Queue with GFP_ATOMIC, like the other usb_ep_queue() calls reached from t=
he
> same callbacks (bot_enqueue_sense_code() and bot_err_compl()).
>=20
> Fixes: c52661d60f63 ("usb-gadget: Initial merge of target module for UASP=
 + BOT")
> Cc: stable@vger.kernel.org
> Signed-off-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118124005.2428=
068-1-yhlee@isslab.korea.ac.kr?part=3D1

