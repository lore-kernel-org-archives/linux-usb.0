Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794473122;
	b=z+UeBYCmakr2o9yDVcHN8KxrrFnqukgUPatqCcCAs+4VvOc8iXyGjU/k0taROXUkVjik
	 S7+dkHEr1OzD3guQkzGuyoDAxNTDOTwILkr7iGDfp/Y9O90l+M3Rf+cyw5H7zCXW4gG8i
	 QkU+ib5uUf8msBLSI1vU28mZoAa0Uv99J0gqJMg1ZyjDKygN8H587JrK4dyPzYgfVT1z3
	 MpAruay109IDdsozYRizQwZk+D1RRBeKBr+WZ79qfXYaZPBnVW9yttFH/CKlJaW2WelGh
	 7ecDgx7PK/mjrM+DdqnjHbTq93x8xvMr7X2a6NQbBOxXaKRikHLUNg7TR8j908XuaEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794473122;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ayAEG8T2w2MrJarmnmphwCQwvNJjUZCQDT6meiNDKXE=;
	b=mAxP8HdgupCT3zmPqBvUAjg6OBzSKbJbki/3YI/7SbRlSEWiWbnOFrDtk+cncBer4MJr
	 0j+wopIeT2VfrmekI2sYTFlqwEWjsB9ztiKkRfgSQVDlZ1gBYg95z6miUoraUyorus5d8
	 pWdAQ02BjvcSZZ5YPrLDMsb8PaAdeZmxpKqx+suPWDkF9cA73f9hNTLpMes82eaFTu0mE
	 cVOPzWX/XyYCuPa+eVCRhDDIpH7Sxj+KIUwH0hkL/JME1F8bun2RHcCDuIlxfiMWe4MGa
	 rXd3L8Xlym4ihWIryXGxkMd5EsFremoSgqNWLaHT93Zh00EdEwGvdf75g4A5hi0fF1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=blhUVT2x;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC77C606A323
	for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 08:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=blhUVT2x
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B8441F00A05;
	Thu, 12 Nov 2026 08:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794473122;
	bh=ayAEG8T2w2MrJarmnmphwCQwvNJjUZCQDT6meiNDKXE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=blhUVT2xI0QyBc2uF5d/DATsRxDCaTCKilgz5P5cihHOOhBF1ACKoQ5QPHUSRIcn5
	 g5aLoFgeR/67vamNVHWiOJBR9ShgU2zpGKmevojyvAx8bNJCtzcOe2uRqdWnp23S+P
	 WwDQrijia16dlKXxge7d5h6tw6hs73piMgcP6T60a+OoTVLBAStPqULhpeT86cQcK1
	 Dmea1SQeX4Jj93LXbUfr/947md0w8Sxbk6dL4DjBwzv3wvCIX0YclWJ+gq5CyyI4Yy
	 bQhDcBcNtqKEycroL6M0KExkEToqN+62ps/MaS4RePDEz1EdkYl7BuoulOIX9c3Rub
	 RlwXiJTcvlwOw==
Message-ID: <sashiko-outbox-210776@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] usb: typec: fusb302: Toggle with the default Rp
 current
Reply-To: sashiko-reviews@lists.linux.dev
To: "Arun Iyengar" <aiyengar1990@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261112-tcpm-attach-reboot-v2-2-b4bc6ca83490@gmail.com>
References: <20261112-tcpm-attach-reboot-v2-0-b4bc6ca83490@gmail.com>
 <20261112-tcpm-attach-reboot-v2-2-b4bc6ca83490@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 08:45:22 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> From: Arun Iyengar <aiyengar1990@gmail.com>
>=20
> tcpm_start_toggling() programs the Rp current that tcpm asks for, which
> is the current of the source PDO (Rp 3.0A on boards that can source
> 3A) when the port starts toggling from Unattached.SRC, and the default
> current when it starts from Unattached.SNK after a detach.
>=20
> A Genesys Logic based USB-C to DisplayPort cable connected to the
> Orange Pi 5 is often not detected after a warm reboot: the FUSB302
> toggle state machine raises no interrupt with it while it drives the
> high Rp current, but finds it within seconds once toggling restarts
> with the default current after another device was detached.
>=20
> Toggle with the default current, and switch to the requested one when
> toggling stops on a sink, before tcpm is told about the attach, so the
> sink sees the configured level from the start of the connection as
> before. tcpm does not set it again after attach on every path (not on
> ports without PD, for instance). The Rd detection threshold used for
> unplug detection follows the restored current.
>=20
> The FUSB302B datasheet sets the toggle up the same way: under "Toggle
> Functionality" the processor writes HOST_CUR for the default current
> before it sets TOGGLE, and a HOST_CUR change after attach is applied to
> the CC line immediately ("HOST_CUR Changed After Attach").
>=20
> Fixes: c034a43e72dd ("staging: typec: Fairchild FUSB302 Type-c chip drive=
r")
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112-tcpm-attac=
h-reboot-v2-0-b4bc6ca83490@gmail.com?part=3D2

