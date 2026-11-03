Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793705683;
	b=Jcq9ngp1x9Q4U47wNIxQ1ckYaWfI+kf2iFK4Nfv8W3HsdIQgiyveGijeB43QWWTvM9qJ
	 G5vWLWRQV53+SCatSrD5vcViNJmbtUuPEqNTGdPN6nQy2ljHrlUJp3WXzBxoSSlZt6hCI
	 FxP7+AbGMR40ks3ch3ChkFT080rbkpZGmVK5NYMXmLZh8YExtj3rNME+0uXuQ8ubIMCTa
	 60dvCX2rFqm2ibrNhXINz7x19iuffNTXX1tGZV/HMcW+mcfHTLKqHxzK6kIl/vNgP/aIz
	 AH1CCNC3kaDx19za8WNtQ2R++7cQ+aLMJf1IApQNeg3SsXawUCqm00MdV9uF9nURgSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793705683;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=IgWZeTmljUBmafhfi8fvERxG5ptYH1WDY8S9UcQXm8Y=;
	b=DNWx7kFEf7uCguzWwzam9mhaWMHDosegH6ymdALTp5x4mGnsbpBYrGXBMBHhYyj0gqbZ
	 YBzTY2cU22tIUo7KZslLJMY2wy6j9SADYSF2D2Xl0JUaFeHLtDTPRvfI8a2FRphoJqtMZ
	 T/q1hf6c7g+yHLzafRO3at+TeoPFZE2e6QoJd+3PBiRx2wi9+rVQZkvcFHtBhwVr/fl30
	 bvuuqq7D/6gK02oEsqZKhR5eWYB5yNkfgnNBK9GsEdyBoNMhYVZYxFkRjjFsbMHOLrQpU
	 glbjdHyDExqhB1mxeKGMxflTueX43rGZT2YkETBsqWp3Ad1xRYnim6YTcE9BP1Pfwsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mTsIYpQc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29DF0606A32C
	for <linux-usb@vger.kernel.org>; Tue,  3 Nov 2026 11:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mTsIYpQc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98EDC1F000C1;
	Tue,  3 Nov 2026 11:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793705682;
	bh=IgWZeTmljUBmafhfi8fvERxG5ptYH1WDY8S9UcQXm8Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mTsIYpQc5+36lTW2oXyjccKdTz65lEL+SHT7f6KiniMl3Y/KjfnH7j1XXX/Ly97Sn
	 w2PJCl+HWmKt319F6nONPLsCrV6DUqxDBk8gCnLkwf5wP8/Xl0JsMAaKpkFttJhbd/
	 MmN6X0DvqHrxfV7p72vW6cYrJETwX4yAARGyM2tnkT4o5hFz0wqRru6g9WlQqCE0Cw
	 N8qFdv5rQrraHm0XvZz63vUrrVITCwTZStrKDWcleexD7JK6rbl3kTIBQKm+DxE5ly
	 JF9rlFd1xuiiaO9O6uTZ0dJoV3FsjGkr1zswL3MDQLzwtpDvt+qIzpfIYcI3ASazhL
	 dfGxsSYg/ooXA==
Message-ID: <sashiko-outbox-195156@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/5] usb: typec: tcpm: Stop a source from repeating a
 cable Soft_Reset
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexey Charkov" <alchark@flipper.net>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261103-husb311-cable-comm-v1-1-6217dabc1a85@flipper.net>
References: <20261103-husb311-cable-comm-v1-0-6217dabc1a85@flipper.net>
 <20261103-husb311-cable-comm-v1-1-6217dabc1a85@flipper.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 11:34:42 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> A soft reset AMS starts with upcoming_state set to SOFT_RESET_SEND and a
> call to tcpm_ams_start(). A sink then enters SOFT_RESET_SEND through
> upcoming_state, which consumes it. A source enters SOFT_RESET_SEND right
> away and leaves upcoming_state set, for the next SRC_READY to replay.
>=20
> After an SOP Soft_Reset that is harmless, as the Accept handler or a
> hard reset replaces upcoming_state. The SOP' Soft_Reset sent after a
> VCONN swap returns to SRC_READY instead, so a source resets the cable
> plug a second time, outside of any AMS.
>=20
> Clear upcoming_state when a source enters SOFT_RESET_SEND right away.
>=20
> Cc: stable@vger.kernel.org
> Fixes: 6bd181ba60e1 ("usb: typec: tcpm: add control message support to so=
p'")
> Signed-off-by: Alexey Charkov <alchark@flipper.net>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103-husb311-ca=
ble-comm-v1-0-6217dabc1a85@flipper.net?part=3D1

