Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795430275;
	b=zrxnR7zM10pY4wYrpMToEuUwppMoKpdBOE2AgutNAByJSGY5edD5zc8dVMWgW3JVBNXE
	 siTGZXHOEZxoBl9hvQYQYjyl8SN4KkFhSrG34TkQECzGDNp54geLaNQz4Ye5RhtCpz3F3
	 12hJBMwAM5sEKQ9oEGrAoDISJ6bENwoicr9Hc3CB+CFH0hFxKE1KvoSPCTLLQ3HP0xrhW
	 VYxpzIFN9Fgn4T+qCEDk7S0Swme4Zx9srHx2GUrQYo0jWnF2zgORG/3vbmw1AK6vShCPX
	 JSWtqkfxKGM6YmmWgqcqhu+jqn/PJBbDfHNdpDqoeUUI1+BmhtJZyuC+htnEBwGjD1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795430275;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=R4J640rk97bhlyX3hRdh6NadvGz5V2N4oEZxOs4Goys=;
	b=aLMOIdqmqsIUXQWNImSk9K/IPoSWET6/oG7yAYQflqTbM6VOxYZ4GFr0L7eIP8LUNApK
	 abeAdyfSnwXk4QfY0XXQzE79zI3pv5XfUuCF9ejqOexr7IcKFw/56VHMnEK8vM2rcCahC
	 1aMKNNHPCXpAzIV4H5uQbTHjAieYsCNaHTN/b6h5Yo1cijF4SNjwBZeJEIZmrPlAm11Ft
	 vm1irkjQhO/+sQVpj1ZX368WE7sCbIAOdTJE2idUUFzQ9dcjUtpIM+Cr3eS/O+7XwpOYo
	 gYDqtK5F8ffLO/R5pBltyQ6cPvtMy4q5IneghfQRlMOxuVNFm/kp0m3sVkejpEZNWMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CNV+WYFx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43EF3606A31A
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 10:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CNV+WYFx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51D081F000C6;
	Mon, 23 Nov 2026 10:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795430274;
	bh=R4J640rk97bhlyX3hRdh6NadvGz5V2N4oEZxOs4Goys=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CNV+WYFx+s0OOCLGla5hr+Hnr0q+EH5wsKLikWR9PrDLpqh2he36uGgSZdlA84SIz
	 rWN4+ZHuVHkfDODPABCyelHYq2ky9X6fpk9SZX8ajwtsxQB1gKnAYHkogY8nWN/OAL
	 oZT1HwbLyCmJhocB62ZAKHNEttLL/2FxdpyRssP2Gae8aPiwgG7jxVoa2J4ANalyy2
	 nMnaKg9F2szgBnjG2Lln5/IJH/oszRAh/C3k1x1sy4XAZDJgIfRzzbMb//g31I1rlj
	 yohP87npfLjHWaox4HsvlYeGkJXuvJv07ZlCJVd2bcgZGvYfMROomHSSMJVfq0tKjl
	 +/Pfb6TIQkAYQ==
Message-ID: <sashiko-outbox-229059@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] usb: typec: fusb302: Keep interrupt flags across a
 failed register read
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexey Charkov" <alchark@flipper.net>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261123-fusb302-irq-read-error-v2-1-5539a09127d8@flipper.net>
References: <20261123-fusb302-irq-read-error-v2-1-5539a09127d8@flipper.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 10:37:53 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Reading INTERRUPT, INTERRUPTA or INTERRUPTB clears its flags in the chip,
> so bailing out on an I2C error in a later read loses the flags already
> read. On Flipper One, a NACK on INTERRUPTB just as a source raised VBUS
> lost VBUSOK. The driver kept treating VBUS as off, so TCPM never attached
> as a sink and left every Source_Capabilities unanswered.
>=20
> Keep the flags pending until they are handled, and retry the reads a few
> times, as such errors pass. Otherwise a flag left pending waits for the
> next interrupt.
>=20
> Fixes: c034a43e72dd ("staging: typec: Fairchild FUSB302 Type-c chip drive=
r")
> Cc: stable@vger.kernel.org
> Signed-off-by: Alexey Charkov <alchark@flipper.net>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123-fusb302-ir=
q-read-error-v2-1-5539a09127d8@flipper.net?part=3D1
