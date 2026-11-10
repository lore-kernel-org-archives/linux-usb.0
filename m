Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794278693;
	b=EfAVrYW8BmP8qP/4G5cdvu6VBv1JVWwH0TjQK8IFAdnnf9j1puqMSp2WogzRVF0I5S3A
	 QTMRPRrLu7xUKo7/ETDZH0yF1a8tCoo5LFtg09VnIau8hYRvjjm9+xgn4MSPdWwCg96kT
	 c3pirJX7iwZM32zQZ9apey/NndOOskkhPyNEdoJkIqmZA79Iz/aVq2d8R5xRt1Yee3aDU
	 JrG4jj3KW+z7qUBoKTOwW9YMvbtk+0b1/Z2Y3hSmcD9aw49XirqHYQPQeGEcnI4/hIunc
	 xQw9zAE2kk9LsWOZ4vlyCwkrkGIYPPjYv/kRWnnXxkh4yCXIAd9pIzA/a2AD8WvW9DA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794278693;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Pz65u94ztwjCdj+kI+TqR6AlsrG0A/ywYZtaLGkhuXY=;
	b=yPezohv7pRwe/4vUqhxcGnJFbMdA7rB9ww/WTjbTkfLtzi38AsIm7jq8pDSKDyR03P1A
	 SZGGrIcdGxiSTf3jEL0ir9sy6qYAlkqqcFDnZsZ+x/buxO1aUWhCNN0hVXAKjq6wi7LrZ
	 XtU4wZNxHKwqnPI5zgw/ktTN4rFnMmRH4iTYgnRLaFP/hkTaGeZRI+OUOLas2ksVUyjyR
	 r7NtJH3IE3HxiBMH/K6NbOCH1VRW7H9hSPPAh7qdRpy/bQxnKU6FGMnDyn+hfDTVPUCcu
	 t9ci1qvv5m/x057ivmeS2Gu7fbufGfb3j6s2+gCg2/42G6wa41wLirkWN2zfQ8R8u7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LHp69Ba9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68456606A31C
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 02:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LHp69Ba9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D29421F0089F;
	Tue, 10 Nov 2026 02:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794278693;
	bh=Pz65u94ztwjCdj+kI+TqR6AlsrG0A/ywYZtaLGkhuXY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LHp69Ba9d2WOPYJrwK/JzlW2nyu5Gy+OsV7i2bYaAukCuTCfRBnnWg9KSPyJjG0wc
	 XK+TBlq5xARCJEEE4Ku8j6ojMTWC/Cgyjv1EnedWlpk/Zu7KUPg9lrHPOCDzEuMhce
	 sooYey0rJKSTK4aoTmxs9vVe898NtXxNxT4LniD5gxJiqqTIrs6P2FVbloiC8hP4wr
	 stYfw1OsCypQ4lMea3JE011EKLQMDA8RU/nZAvtkOtWwUqzwUB/MbOOi+kGUAmMTc2
	 oXUVZ2bJ3AsRpr4t9yMIAupdOqouhT4cHcNn6VcJwLMMZHfbAZnT93Itf1XAeJny2c
	 +F40SH4Wh/5qQ==
Message-ID: <sashiko-outbox-206062@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 4/4] usb: gadget: gadgetfs: avoid writing through the
 const setup pointer
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jing Lin" <kayano050408@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261110-gadgetfs-v7-v7-4-6d05409cc61a@gmail.com>
References: <20261110-gadgetfs-v7-v7-0-6d05409cc61a@gmail.com>
 <20261110-gadgetfs-v7-v7-4-6d05409cc61a@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 02:44:52 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> From: Jing Lin <kayano050408@gmail.com>
>=20
> gadgetfs_setup() receives the setup packet as const, but clamps an
> oversized control IN request by casting away the constness and writing
> the truncated length back into the caller's wLength field.
>=20
> The setup() callback has no business modifying the setup packet, and
> ctrl->wLength is only used afterwards when initializing event->u.setup.
> Store the clamped w_length into event->u.setup.wLength directly instead.
>=20
> Suggested-by: Alan Stern <stern@rowland.harvard.edu>
> Signed-off-by: Jing Lin <kayano050408@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110-gadgetfs-v=
7-v7-0-6d05409cc61a@gmail.com?part=3D4

