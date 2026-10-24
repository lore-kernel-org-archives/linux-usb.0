Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792802458;
	b=ao6veBToW9aUKyELXZx7eSjznjbey0m//ArB5MV2zti2ldj5qUeq1pcKBBMhjVEdhWmV
	 6dqs4wsbc45VjeXdqLkfN42SUDxVptqvtASDd1zCOtt1dzJ5XMNH0DhWJAgh2yvIuSjpk
	 pio99FIzJV+q2NQFUGro4PINj8OAWnzsdjUUL6t1l9ie/ejSfmdOilLMK156J0qmxT7IH
	 V6WUAxCRm04mGR01wt9ZEWf4pTlqgWp9LZMT1D8GFpFqlCvztS2LlpMcJ8iyA6GmpOgZD
	 lMKbN+udvi2+ICNIH5DyBT2dOa/HvfRXrD00lKVh5cbCo03aWSIWdsh9AFtK8K0l3XQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792802458;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=9w2BgOjLwsJASDHf6Bf0pn1KbUuEt2GQL0IzilHEGtQ=;
	b=x6CfXTUp30Xz1E+HVEFdaF+iOxeqE5kxg13RQbvFiqTk7MYQdcy+L0yW4hgwb5RqAfJF
	 2xDLvM9gchSt2mhWHzyEjJedPICA7BZ3XBWXjjU+sdtRQ/YqvX37jsChFv7EVm6r3Lj18
	 t8EwPdcQmR2IxcwJYsOy0lKy3XLvFJz/a01Ato55R6HqCTw3Cjx8OZoqbVsTcCJa0kOwN
	 7mz6bDYyHzbKfrNiaJfWw5G/8XN8r3dcW8DaRQ6Rsz6rrdnD6EFI/iTu6PdYwLSWj6qTs
	 Wn8ozJ3ykzt6y9cKMHKmZWy9u4u6U0ppBqv1wCGig7sc/oeRJpAL7GPfgXEWtGO0VIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="jY/xNZnT";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B8EA606A31B
	for <linux-usb@vger.kernel.org>; Sat, 24 Oct 2026 00:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jY/xNZnT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9FBB1F01825;
	Sat, 24 Oct 2026 00:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792802458;
	bh=9w2BgOjLwsJASDHf6Bf0pn1KbUuEt2GQL0IzilHEGtQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jY/xNZnTJ0MYbJpK//fDeVs3td/FybsUCLWfgzge13EF8WuSu4goav11m039GX6ae
	 +tlN8PcuxDciT6OamfhE+NchOGjzsx4WlvMaXE1E5DUv2LcD6XjbGZ2tNqd2YD+y32
	 9p33MJzMEOQxnY7C2L+vxHd5y4HYdbJBilYllYPCso59N8BGu2fvPjxkzcXsMYrTSs
	 UrrWjc/EGgMOeNke9O/BWWbrPdM28ehRrIWSCeloc6BxyakJzyeeD+7P1CauSX/hso
	 95VVbfSnB+CH24TKZ9J9Q884N1gZIphp0UKy6cErkRdfh3mPUd2ItXjlQjIfCNTL0x
	 HN30BvakB1Pig==
Message-ID: <sashiko-outbox-183464@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 9/9] usb: typec: ucsi: huawei-gaokun: pass down
 HPD_IRQ events
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261024-hpd-irq-events-v8-9-6ee949e7a384@oss.qualcomm.com>
References: <20261024-hpd-irq-events-v8-0-6ee949e7a384@oss.qualcomm.com>
 <20261024-hpd-irq-events-v8-9-6ee949e7a384@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 24 Oct 2026 00:40:57 +0000
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
> Pass IRQ_HPD events from the EC to the HPD bridge, letting those
> to be delivered to the DisplayPort driver.
>=20
> Reviewed-by: Pengyu Luo <mitltlatltl@gmail.com>
> Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261024-hpd-irq-ev=
ents-v8-0-6ee949e7a384@oss.qualcomm.com?part=3D9

