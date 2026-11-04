Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793778577;
	b=l7dHxEFpA1baG3+AK7Izh09lwp3mUzYkiGZ9zX5sm0tp+cHHPfn/Nqz+TykJVY6RYg00
	 TVtkJADNbiX217gldkG4kD02VoXtbNr9YtiTbrfBhGj57bXo50NZn3FTtS44j5QULZ9l5
	 02Rgr5lGdUz+1Szb18GVZ681X2jm4qMDaEr/DDw/4O36PqG9xBWpe471uwCWOBRWSoVM1
	 5CZhhUxeFy7Tf4XbJ1j5qxk25iwB5wmSNVkBZ/HKMsmka9SumYxpnipwotbC7FXwrakt0
	 F1ZMYU3oOp7jMTXxBhha8oS5QKC4pGU19djSMy0rcMmSDCv73I02ja/TnqdT+ky5uxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793778577;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=HZ6AZJPUPRH7BOl0iKMUO70Iv/aN6tHW9fcYphR0+Og=;
	b=Ba2dP3Yg7unrkDazkFlFDloZ2ThcBpd64s1I8zM3vx4scomLEZU/0rjh0xg7SGj0oQbB
	 J443M5AfUMV+0UT0el/3rO1svhQ8T/hIlhsQXopG8rofDV8PgR8kx95CHEBrnzX3IHbgq
	 VXZm4R7GWVR+2vh4AWnrd9Agx7QPS7W3Vn7U7cP4p+rNHO/lFqi9JUI0dbRmaB05Jc26+
	 9RFu4zC4/DsC1dlYIINe12lqIerKS1V+UhDQMjVvP4bHM/YX8xjsEEbVjR8oV9f++/4bh
	 PwliTI5/ZA9sZC/QzRtSoXPY5XSUo6kMlisxpG2uJxjZacPD8V+9+ezhinMT2zvAmAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Uw6uyjgl;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 824A5606A31B
	for <linux-usb@vger.kernel.org>; Wed,  4 Nov 2026 07:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Uw6uyjgl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F19A01F000C1;
	Wed,  4 Nov 2026 07:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793778577;
	bh=HZ6AZJPUPRH7BOl0iKMUO70Iv/aN6tHW9fcYphR0+Og=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=Uw6uyjglSxWnFfdnWAXAVga8CUswmiAfx7u4PSA1gYL7LRrPOWBoj2iHyMhQ5ezPG
	 X5iSKbmxOSJRxiA2fGM0PxJtpPfZeEop6QOs4lIvJpIsagopwqATW2qRime6Z5RWZE
	 j43r0dLOiHHveWbcxT25kC/jkENOhA++mqM7llvee7y/eNmCL5x3WJxthHdppMs0ht
	 vkas8WhSm7mr0pBhVCCnlihR/sEgW+cBw7Geuf5B/NUyxdGDTP2XkhXu2ACgHNrhBi
	 LeynFaACrlrH259ZgKfpOcRtvq1PwRnFCXmkt+0rmGLzF3XNd0ThFPZ7KOTKv9kbdS
	 350GsL9G6Dumg==
Message-ID: <sashiko-outbox-196824@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 2/2] usb: typec: mux: tusb1046: support HPD_IN
 override
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ajit Singh" <blfizzyy@gmail.com>, linux-usb@vger.kernel.org
In-Reply-To: <20261104074202.76712-3-blfizzyy@gmail.com>
References: <20261104074202.76712-1-blfizzyy@gmail.com>
 <20261104074202.76712-3-blfizzyy@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 07:49:36 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> For boards where HPD_IN is not asserted by hardware, software can
> force it high over I2C using the HPDIN_OVERRIDE bit in the General
> register (0x0A).
>=20
> Add support for the optional ti,hpd-in-override property to force
> HPD_IN high when DisplayPort mode is selected. Clear the override
> when switching to USB or Safe mode, and preserve the existing
> bit value when the property is absent.
>=20
> Signed-off-by: Ajit Singh <blfizzyy@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104074202.7671=
2-1-blfizzyy@gmail.com?part=3D2

