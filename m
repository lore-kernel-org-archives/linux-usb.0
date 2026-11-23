Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795443479;
	b=brtKHfNk9Td9bx8I+MUxa+v0IfL5cVQmZS+Mpzf5FLcsRJqOC7kHjtC4PRULJi11rBQn
	 i9TuCbvAz15d//gEF5KzF1p10bfd9SYUdZFKvtJX+Vw+SWN5QoGdvCdaBHQCxBh4DOWC/
	 vgJZPTbqBhPkuUvTdXOYSoBxig3pwYQqy2nVKgrI2vy4vJFqNV+lZAbkCU/DXMY94JKET
	 UFtQ22ilGKuSZJc5X2rRqQ0vzY4rXX7ciripPljxv20AvEqjz95TpgM/hERptAaZ8q3/v
	 xprDcxJ9qPL/erEW6VmMBMKO3UIopZiZ+oGD5F67vNl963uxXGYrNBvu0zFBizFYfcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795443479;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=3VPJ4FadqZnRNoSeoTkUM7J1ywfvm3r/U7/I0ybWcG0=;
	b=PditPeb44Wr9UEXYP2BgzO5o0TAXQOFSUm/qurpuCCPr/yOBZGy6tqQP+HDFCDXEwZ6d
	 9SaffeHz4R1ESuG3mAGs3u41ouJei5NANyVLMf4iGqyndaCiSa4NiaxF3/kSMn/VvzlNU
	 l48wXcKahIkjtCDKS/Kh3dBnex6zpKiprO2OIoYH03714klEy49WsbU20gx6tlInRhS0U
	 AF8oUCPQ13jYbpj4SL8czVcD7Y/vZQzhMmyR6eWUNoTU2bJt/968CtKSgFKWOueC5sOBK
	 iWX3H5whbQSzS+cfRQ055vYQNbqcojaXbJjwERIS7eeTRaSmPrgciKF6KOZy7a47FuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bFPeYqB7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 986B2606A31A
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 14:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bFPeYqB7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFD361F000C4;
	Mon, 23 Nov 2026 14:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795443479;
	bh=3VPJ4FadqZnRNoSeoTkUM7J1ywfvm3r/U7/I0ybWcG0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bFPeYqB7NwZn3mds8ii5uLxDUjLpen0crI05FHEtbTEDJZvls150aqdJ0qsUo+sBM
	 1n7gcs4zf9qTJHOBblPq0V7tgh6814p3VPP3pOIu4Ypup5W5mHOujcaGpejVgvqFv/
	 NIOUc/WIow5nlm31I8gcooW39lnNJi2bmQLpHNlGXCN3oVfMBOkzgJlAGI5jhe2M24
	 hCdUbdMIw9otMjl1wLyoiW3ovvn+qzrzace6iMre4XcnrMvEc3KbekNTLQPePcDcit
	 AAEoTAVEZ+BiO8wJycp+e40TrIcrzMt15B0eHmOM3R6pL2SokAAP38qxVQ49nlrGRk
	 2PxA8oMXNw0Xw==
Message-ID: <sashiko-outbox-229383@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] usbip: Stop tracking work context in event_handler()
Reply-To: sashiko-reviews@lists.linux.dev
To: "John Ernberg" <john.ernberg@actia.se>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261123140902.2177108-1-john.ernberg@actia.se>
References: <20261123140902.2177108-1-john.ernberg@actia.se>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 14:17:58 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> From: Wiliam Puranen <wiliam.puranen@actia.se>
>=20
> The work queue used by usbip is not pinned to a specific context.
>=20
> When usbip_in_eh() evaluates if the call comes from the event handler
> it doesn't actually check if the call comes from the event handler but
> if the call comes from the same context as the event handler was first
> called from.
>=20
> This can result in "sticky" devices on the client side, due to the
> teardown path in stub_disconnect() being lied to, and thus skipping
> the teardown when it shouldn't, or vice versa.
>=20
> Fixes: bb7871ad99ea ("usbip: event handler as one thread")
> Cc: stable@vger.kernel.org # v4.6+
> Signed-off-by: Wiliam Puranen <wiliam.puranen@actia.se>
> Signed-off-by: John Ernberg <john.ernberg@actia.se>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123140902.2177=
108-1-john.ernberg@actia.se?part=3D1
