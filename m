Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793705964;
	b=aKR7lCTSDQYDHQBF/z2+W8dJ/aPjoGD4tH6/S+voIyZ/0VRF4mD9QlM060Dl/Ix5jZqX
	 5nH4+P9XC3+1ZrLznuotemn2T9F1VX7BiEE7mGmN1MyS0y4nQi8HX15AWhEcOAJ05OK/J
	 HOVcgq9SJmrUUTrqZXSydw134H0aOp5yFFvkqATwuOvUKI/GA+6nWF9vyFAhFOCVu/5VC
	 oAO3ZaIFSJLX7MeJAIfHbIQDrg4GTK/WlRGauWcTUpSAre8x2PJAcbaexOoEXlRubDjXU
	 Dvvva6MEjXBiS/koqY4XctFvUChVhouOI02jYy5RVTg5LAuNLU1MtgH1Jh+hUDaV6gw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793705964;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Q0rqvLu2xwltuvFbDtV00KM7UsqK92LsoUqMk5YBwL8=;
	b=MMiq8+NvW5MYntqBbhNyRk1+GVkSX1WvHp2QqFAwME/kal+lRROU/iaC46mwuhZmfDd2
	 zENUef3vO5WG/zJatFRH9tvhhuxJD/UZM8zwnSPWOTtXwq/R3qNhE3qBKTeQx20gaXDnr
	 uXOOk8+rNIBKDfC5R8OlEVP7oqPsfF0muJO8TUyS79nsRehX+TffEBwkw244bP/19uvnk
	 Pac2wuaqz9LP/u9RC6rZfgE1qIc9hVhANPKpmeglZngBxBStHT3T7UNKnTx0EOgNrhVoH
	 Jax6fBoAfka8YtQk+pRRfuaWkTDfLDfUaYPvHiUWB9VYMEpAZBov9hBLTX9M1USAMxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ChllCp2n;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3D9C606A331
	for <linux-usb@vger.kernel.org>; Tue,  3 Nov 2026 11:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ChllCp2n
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3774E1F000C1;
	Tue,  3 Nov 2026 11:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793705963;
	bh=Q0rqvLu2xwltuvFbDtV00KM7UsqK92LsoUqMk5YBwL8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ChllCp2nADAa4aiI+VHqTbmwJ9JaZnfMrWMtwNXUYYfAR+DU9HSZdKxF1okn6N8tg
	 zFzC+jL1w/U+fg347Rge9qQ63g4QdVnjcbvX0C28dOmzKk6nUa3D9USdmTbDp8Gyd9
	 cV5ZAfX/hUqnZrOOivDcupE5cXJ4agki4eQfK6P7pr3eP18tT1QAk+ItWM5uOGfE+q
	 dd41+6+tAcWvaAtawHns6qmLUCUL691bWk88WtJCdiZG+MJnon6FX5jpb6iXE14d5i
	 QwkF8A9bpeARKWZRwfjmNR4WawgjXAy9rmOLamMF+J29H4d+TDwzZnGfHhwsJ7VRmu
	 wvev3/0Bf0ewQ==
Message-ID: <sashiko-outbox-195167@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/5] usb: typec: tcpci: Receive SOP' only while sourcing
 VCONN
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexey Charkov" <alchark@flipper.net>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261103-husb311-cable-comm-v1-2-6217dabc1a85@flipper.net>
References: <20261103-husb311-cable-comm-v1-0-6217dabc1a85@flipper.net>
 <20261103-husb311-cable-comm-v1-2-6217dabc1a85@flipper.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 11:39:22 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> A TCPC acks every message type enabled in RECEIVE_DETECT and passes it
> on to TCPM. With SOP' enabled while the partner sources VCONN, the port
> acks the partner's requests to the cable plug and the plug's replies to
> the partner, colliding with the GoodCRC that the plug or the partner
> sends. TCPM also tries to answer these messages as if they were destined
> to it, which for the case of a partner's SOP' Discover Identity on a
> HUSB311 made the partner soft reset the contract every time.
>=20
> TCPM talks to the cable plug only while it is the VCONN Source, as USB
> PD 3.0 section 6.3.11 requires, so listen for SOP' only then.
>=20
> Switch SOP' reception off before VCONN goes off and on only once it is
> on. If that fails, warn instead of failing the VCONN switch: SOP'
> reception left off only costs cable discovery, and left on is no worse
> than before this change.
>=20
> Cc: stable@vger.kernel.org
> Fixes: 3bbb9ba4f660 ("usb: typec: tcpci: add tcpm_transmit_type to tcpm_p=
d_receive")
> Signed-off-by: Alexey Charkov <alchark@flipper.net>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103-husb311-ca=
ble-comm-v1-0-6217dabc1a85@flipper.net?part=3D2

