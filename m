Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792763113;
	b=ly+5I//f9mYpUSmTao/7bB8VGCTM7bnSMgae3E6bXs4Ls9d2iGurw0dWO84k1oRX6DG3
	 zQ3rJ9BZumcJAHf92NOHYRboThfSi+NqK4e2eQYwwLFv8VohJTU7E4DMyBcjo9nhsMVZ8
	 6fJIjtELIWJjEivG8R3mk1NAdJaNQA8C0yfSvQGQClmckSfSaKee28x2AuUaJoqrGK7Ng
	 b9NwdMpWSbluKWn4DkBfcDh2XBPnwawQktjeRyFlRw5kt3q4v6cBYH7m/Pksk+KF3vGj2
	 rGVdK6KILUWtwE8+IZak+s0oZ2j9btVO6MFJcchPL8SV2PC/vwoioPL0Y26Q89Wt+Sg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792763113;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=CrWqL/bfFKcrc882mTujKpI0LYbKDZSdJMdx6NO/CGU=;
	b=5nmPUgaqpswPbTiUazn5YI4eyTXgyO6EMd3qJZwZ5hlScG3oSvtjTl6G9btOF2q4/bSC
	 aNbpAK35Z+eP8HbJoJcqQ8rNY+FHum6bMuY59DXjOJrqiO5gxNA6HkdgpAP7nmKyhaBsa
	 dzc1Yz8mwtJOu9BWGH0beeLkePvxWDJRSqWtusDjrFLggoio3/l+2/MYsiJPqXzs4o5zg
	 k5rnrzCET9NZuUZCQofn2YDiVY4GCKSKJakGrg3tXNwmetNYh74olG6yGTJOWnCLsJ0R6
	 26m/4EA6Wk9bEcNLXoyiLxCyI9hZaMK1C6za78oovIIzrWiETLk69z2jviG0fIP2C0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=C9KwsIrZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8B20606A31F
	for <linux-usb@vger.kernel.org>; Fri, 23 Oct 2026 13:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=C9KwsIrZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58A491F01825;
	Fri, 23 Oct 2026 13:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792763112;
	bh=CrWqL/bfFKcrc882mTujKpI0LYbKDZSdJMdx6NO/CGU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=C9KwsIrZR8C9iIT+5pWAvo+/SahUbm94mBofMMncPbM4wTriGDnzwNlsCcyRyIDqI
	 NOWWuBIQWdxK3luWZKL4kX7Dr32/eV0dkMhmwvkgYX7/h6W/5P2roAE+2K1oO7L/P2
	 4naZ5i+D6dOeTgc4djw7/aK0xVBd6YcfmSYPbyJ1HZ0+cIbTpr4QefyAZ8whvEqkhh
	 LE9TLzioRuhAV0I2EJTL49slW1ioLCFsdeefOjARSgGo2f+tc8D5EjQccJpz+UY6fA
	 oOwprWwYLWc06s3gYm+wnFinUSGMDMDJoJdSYM8pWtYr+iroYhDuPwr8p1GCSSJ47i
	 9lh4iYauOdHfA==
Message-ID: <sashiko-outbox-182847@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 2/9] drm/connector: pass down IRQ_HPD to the drivers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261023-hpd-irq-events-v7-2-57a3aea3f09e@oss.qualcomm.com>
References: <20261023-hpd-irq-events-v7-0-57a3aea3f09e@oss.qualcomm.com>
 <20261023-hpd-irq-events-v7-2-57a3aea3f09e@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 23 Oct 2026 13:45:11 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> The DisplayPort standard defines a special kind of HPD events called
> IRQ_HPD. These events are used to notify DP Source about the events on
> the Sink side.
>=20
> Extend drm_connector_funcs::oob_hotplug_event() to pass the
> notifications about the IRQ_HPD events down to the individual drivers,
> letting them handle those as required. Bridge core is converted in the
> next step.
>=20
> Reviewed-by: Pengyu Luo <mitltlatltl@gmail.com>
> Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261023-hpd-irq-ev=
ents-v7-0-57a3aea3f09e@oss.qualcomm.com?part=3D2

