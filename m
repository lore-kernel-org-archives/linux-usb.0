Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795675071;
	b=koi3vi5IlpF2TIP+rsL2q0IIefXmmhlBL3PclyzLPJbTdrWXXeUHUkrSAYf142rFm0j5
	 mdFkUVLu3vZyH4HVo9ogMfgsG/gM6R21ynig0iyLjnx9QETEioKcn5MYZ2oQ2XKAOTaCG
	 0lhGdRrqbShPvAmGCTyx5vRgYsIff3KvqaDJ2RJ6YJ9HTEQXsZSl/rv/MCo2bfvZ8qDV0
	 RHlT+kTejJ99L258hycQa4sbxuNSCdFcEgv9+KpCij6jFJ7ETbThyFtS+jsxSBGCwTlNG
	 9/xUNmz1lTsfbgzgvRmMNw3pAeNBxMPxOZmFCFk0sHdzvVFX8FRhSMsqv4Jq8jpLdrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795675071;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Content-Type:
	 Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Content-Transfer-Encoding:Message-Id:References:To:X-Mailer;
	bh=8tgKflnPidiiNdXOO56zS7t7vwJoNVHQUk4AykUsu6s=;
	b=npb669pVHMvM4b7+ObjT87GuDTKH6PD9HCwz9eGqhw8aFhRVXanYGUJJQ0m+KmBLTGwJ
	 LDXrabXbr0N2nyx05UN/66LVWGyaf8m1hVUkXTaZ7P+8JjlG4jE9t7BtXmtuINxpH8VlW
	 52KC+xH3u/sw/mUD53bLFXQunuAIMyDLStCOMcfb3UJ7KCm6X0GmoqFuPHUFnC+DJCQT2
	 UTf1m/liF1gE1sRKq31h94C+RwSH3eYnvKxFuw2zrO6oQUAWOuI8QAjnQgUJMlI0bGNwu
	 pvgf3HIiiRu7I4v+gWQyGtM/20hbNQ3Aac5XXbWQRSvmwwFKLaynm/eIjtyUV1nOxHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o2SaUtJ3;
	arc=none smtp.remote-ip=209.85.215.177
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA2CE606A31C
	for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 06:37:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA2CE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o2SaUtJ3
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cde7e8abf9cso2424913a12.0
        for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 22:37:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795675070; x=1796279870; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8tgKflnPidiiNdXOO56zS7t7vwJoNVHQUk4AykUsu6s=;
        b=o2SaUtJ32EANvWnFdIzswb9fm09qXriRAiP7nup7bAz/zDTmdwUOol9EaJEExeVQ3s
         KcWCyPODW6GLKSsrz5RoI3Hyq0rXY2oxq7JBzg+dVo2JUQhIDamAQrNE2LmLsMoroZ0R
         ff/9ws7/SJ14jU+GAAdL7qcKP0xznqBFFcFzhJ3YWL2eDSrfIB+n4qSJoRS89CnVD9Se
         I/Au91Qq/xmNykvzXrA8uWkv6wwftO7EI3JPE0y4G8qIdroKnqpX72/rpJH7T33T1RXx
         kyynXu54meK/h2CwgIG6No4qFjSLI6OeSWK3UaM7OvrKnKkiMQN1Gnu0l48RB8LVdxia
         MZvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795675070; x=1796279870;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8tgKflnPidiiNdXOO56zS7t7vwJoNVHQUk4AykUsu6s=;
        b=tj1KCy/GDlNtTM+4D4p0xNKMeB9egxm+Rchy13rhFw8b7+H4b4i2XqCFadE5qmbqha
         MXoBKxrMYZNYpk6iBysFHAj8CJyk5n/VdH0E2wxjW0w6IOqHrtREpUlnBljlvAJ20Oj0
         RTLQ+HZ+KBq0XsFO0VwAcQ/vA8NswVg/btr7ysfXDHI9r3EybC5rB7Qj3CBzPhwMUggx
         rDf6DGaR/cSFnsDB5rYDr3z2jDwRNLNiIQ41jZaJtnM4LXlq7LWP4wnqgU9KHWHT/LMF
         J/eOc6h5GpbbzpnORUzwCt4CwycEYXLDjlS5UyApLDjiOiVAIEB+YiSUQ9qW8zG3dh4z
         XEhg==
X-Gm-Message-State: APuU4Z9XJcbTSJz+7eiEZzute3XLN+5S2V30roAO1WAanATdF61Un0KI
	ETjHPu4i161cqS7gvJLauPOiZnyenCEsKKOF04ad0Y+F27QRZjCNW/efg8Tp3zUAP3kALA==
X-Gm-Gg: AZFdTZeYwe5i2keI93DMX8DZXapvj09o9QwGCmXFjDq1HT+j2VDYdZOawYNpZ+G/I9f
	PwONY2glPCNyml5yKN34oeYM/b+GM3L41f/I6/E60wX5208ngTmquwOzDKsLt+iXYCdISwBWc+E
	b04HfmdfDulXTSXr4uUcwmmJx2Z8c+C+WRIklNs25ATQy5CqVMocs7+2Ns1yVeE2VuPp9N8Uim2
	DYZHE3sCxFJjRI9bY9PqXC1KgqOJx5wlBe+pjZMyK8E4od23hTpAIZ7iSx1URv1k0huGiktgiIa
	MLr+IKieSDfy1z4D11gj8XJ0cvexrL/oKyHtf3G04wWp9tcEpk1dSW8VdwOZbjndzANuMScX1hP
	djjd6gKXXh7w4OwaN1ZPDN5YILPa7OOdTTTOMrH4QTqcAjGypZjhEuGxzyVz0O0vHmcAv+SjjSW
	95akgVmrQexPFU21Z0doW1HjRlRozCkTYJgs4+0zHwCiBScLq/VyFefc70C3J0tVkyYNHgx8f0E
	dFSJ/iIpwiiUCslp3lIklTuN9fpZIBO8HkdQXhH/wuxdeHgw6rGepg4a2mxyjEh8Jvl1zoQXmCx
	WhgFBQBcJP4vwcLYjy8ujA9CarkkfTMOt5FDMv9MROzm7fgcJ9rm7GweXyApvhvcBYRykjPH6EG
	wse0syVdrnua5
X-Received: by 2002:a17:90b:2790:b0:3b3:b417:607e with SMTP id 98e67ed59e1d1-3b41c95b3e3mr18364773a91.44.1795675069879;
        Wed, 25 Nov 2026 22:37:49 -0800 (PST)
Received: from smtpclient.apple (114-45-165-38.dynamic-ip.hinet.net. [114.45.165.38])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d96bd3sm34061239a91.12.2026.11.25.22.37.47
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 25 Nov 2026 22:37:49 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.200.71.1.16\))
Subject: Re: [PATCH] usb: typec: tcpci_rt1711h: restart DRP toggling on
 Ra/Open in TOGGLING
From: Ilia Snezhkov <iasnezhkov@gmail.com>
In-Reply-To: <sashiko-outbox-234503@kernel.org>
Date: Thu, 26 Nov 2026 14:37:32 +0800
Cc: linux-usb@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <54727A64-1EE7-4976-B702-74AE116CAE84@gmail.com>
References: <20261126003308.48940-1-iasnezhkov@gmail.com>
 <sashiko-outbox-234503@kernel.org>
To: sashiko-reviews@lists.linux.dev
X-Mailer: Apple Mail (2.3901.200.71.1.16)

Please disregard this v1 patch.

On further self-review I noticed two defects with restarting DRP =
toggling directly from rt1711h_irq():
1. The unlocked TCPC_ROLE_CTRL read-modify-write across =
usleep_range(500, 1000) races with TCPM state transitions under =
port->lock, and an I2C failure after clearing TCPC_ROLE_CTRL_DRP can =
leave toggling disabled with TCPC_ALERT_CC_STATUS already cleared.
2. tcpc_presenting_rd() is dead after verifying TCPC_ROLE_CTRL_DRP is =
set (and the case TOGGLING check is in _tcpm_cc_change(), not =
tcpm_cc_change()).

I will re-evaluate handling this under TCPM serialization before sendin =
a v2. Apologies for the noise.

Best regards,
Ilia

> On Nov 26, 2026, at 8:49, sashiko-bot@kernel.org wrote:
>=20
>> From: Ilia Snezhkov <iasnezhkov@gmail.com>
>>=20
>> When a DRP port using RT1711H/RT1715 or its ETEK ET7303/ET7304
>> compatible silicon is connected via an e-marked USB-C cable (for =
example
>> to a USB-C PD charger whose own port is temporarily open), the =
hardware
>> can stop DRP toggling during its Rp phase upon detecting a single Ra
>> pull-down, reporting CC_STATUS with LOOKING4CONNECTION=3D0,
>> CONNECTRESULT=3D0 (Rp), and (CC1=3DRa, CC2=3DOpen).
>>=20
>> In tcpm_cc_change(), case TOGGLING only transitions out of TOGGLING =
for
>> source (Rd), sink (Rp), audio accessory (Ra+Ra), and debug accessory
>> states. (Ra, Open), (Open, Ra), and (Open, Open) fall through with no
>> state change and no call to tcpm_start_toggling(). Because the TCPC =
has
>> already exited hardware toggling, the port remains permanently wedged
>> presenting Rp: PD chargers never see Rd and never source VBUS, and
>> [ ... ]
>>=20
>> Drafted with an AI coding assistant.
>>=20
>> Fixes: ce08eaeb6388 ("staging: typec: rt1711h typec chip driver")
>> Signed-off-by: Ilia Snezhkov <iasnezhkov@gmail.com>
>=20
> Sashiko has reviewed this patch and found no issues.
>=20
> --=20
> Sashiko AI review =C2=B7 =
https://sashiko.dev/#/patchset/20261126003308.48940-1-iasnezhkov@gmail.com=
?part=3D1

