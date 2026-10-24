Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792802469;
	b=DQ/CODB6whkm3eQ+VkCMVFnszf34cOmYvghWTd2xXIRk7YG+AsT+pPUAekj+5lGxnzsq
	 zMqesyZHGGgOMis3LaFz2MEE7KXJBj2lsBcClT37WGy+hZu8AKDDM5tcmPfutiHSlGjtg
	 WGJKVwBCP8KF6PngnvCI1xCC8twRaSsRK1Xs6PWzRYHG1bc0zyjb6iAI6ksa8TSnzZEwD
	 r+VB6WK4X1bJRT5ciwg3vKIANzut9t7kXEb3RbxcYs93ROBpGFv7BzG9Z7zh4aWUT9E01
	 ZTaF+XILyamGvR0wvCFnzzBOsHKsAk0THjgZX4V0AAG855J2iPsC+PLENzSGfmNXWBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792802469;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=i2RSK1iu7WsNBXJqr2dnRlvMgEpq3cbuKp/2ZZWCTjI=;
	b=RJ5G08OUiyNbtAMcp+z28C22Zm0TGZevY81/I+sWVMQTsaXKyxhdtXYscw0dwystNWHZ
	 0uZLl1Z/y9MVnoH1GzawvA7ocuXsmGwQZnduVVq9TkJ0qT46tKPW7KZpBkVH6DAVp0Qjf
	 KMfqM4pr2xI47oBM7xfAMEv4Sa3PWngRhXMm2wmlE3WbdwhFJA1HI3wOyoLrwexz1/kFK
	 rdTf+4qpkRwrmeN2RVLnqAiFGYJn6EYQH6oy+NA7GAdar73ZgbGOWGoWQC4SMnsd1JpuX
	 w00bmrz8/Ae73JmG9t+E669qM3pQFzQD0aaq+7q4CCa99hGylWZyd4xoAGUGQKQToTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Cil6KCXN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C57A606A31A
	for <linux-usb@vger.kernel.org>; Sat, 24 Oct 2026 00:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Cil6KCXN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27EF71F01825;
	Sat, 24 Oct 2026 00:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792802469;
	bh=i2RSK1iu7WsNBXJqr2dnRlvMgEpq3cbuKp/2ZZWCTjI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Cil6KCXN6qqdNQ3b2WGT2IUv3rn5jxv1vZ9/mWNBvkCIdkLGIo7VglN+N8MK1uHej
	 n9sZyNHte+UdrqsZqpSK9iVKhQQ4eV+miE5anTTyA+AViBZmKYNxHhfz9ppuiwyvjE
	 DlZsUuenXOdQxZHY+ceL0PAts6E8ywVPZ9SFICyu3xul/wYHdZasPJr4XtYtbeahye
	 xH+wV52XnkFl+fhpMQKtqomFS2X4n5SbIVtZQTvyZO28EzeeSCZCacCv6b8rxt62UV
	 njt2zxWCq/A9Td3jC3Nd5eOO9y0p6w78zZY5ZGLgKHmzDnwBerScfX1CEYETRCIUmE
	 5/MeQlI0ZZvAw==
Message-ID: <sashiko-outbox-183466@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 2/9] drm/connector: pass down IRQ_HPD to the drivers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261024-hpd-irq-events-v8-2-6ee949e7a384@oss.qualcomm.com>
References: <20261024-hpd-irq-events-v8-0-6ee949e7a384@oss.qualcomm.com>
 <20261024-hpd-irq-events-v8-2-6ee949e7a384@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 24 Oct 2026 00:41:08 +0000
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261024-hpd-irq-ev=
ents-v8-0-6ee949e7a384@oss.qualcomm.com?part=3D2

