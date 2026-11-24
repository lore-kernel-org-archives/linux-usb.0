Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795513560;
	b=YDLMWQeM1/I6nxvWgrfZ+5Zw9t3OSYZm3R1NLCKvs55Z5HS6/3KOD3eYyUloDYTDVZQA
	 crLOy/uD/6U5OMB279VH/UrmPwWpQ7ySa8MEk8xsKhi8Cgt5f32KK7OoJehkn7alA4s0b
	 QIE4baafitEeh6yHjBUX4SXkFl89TaPvXCoXfOeghDuaYAjJ/p5CcyatRJo6ELi8eYOrR
	 ww2uPEwvOVc/r4l6QRrHUEACFqSuigeDYMD8Z8aa+twkRw2qzdCjA73nCzptrkA2q0P79
	 nmuLSsTqnz6GM8cIa2RLJ2bBzgx7K1VQ96gZhrY+n6E0lXjZZH4cjq/HC7iFwbTh/2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795513560;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=t73kaSUlwTnKPTiWqe3og+82HnH72zAHcduRk3MnT+Q=;
	b=ueL9EcaQuRdc0h3mVt0qCAlegfz3F1XSjq8TsnVHRAFhTFFgjCq/x0ejl74nq1hOfG0R
	 lrkE+E+u1pq8IWtPChA3MWv6d19vl8zqFJE0FhA6xnoUvR8J7YfmqrjmHxYdD+YOUrGzw
	 /aSVezBr3xKMkTv0ZHxkHoeXZ33v3QWRAcI+XPFbzBt4uEugyLpt+dvgLXgjygvC8hZxd
	 xSf4GoSZ+gbCUXM3QSKb8qugnlxDov8h+bCuOpMnd+28sMTNXxJJf9pFWgplNVy7lIIjp
	 6Tchpp5r8EbbGHA+Li26td3lrh7f9CMGd96X9o7+rMbF/SQR3RXFDt5bxnRKFBo3bcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Gtbph+JG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA486070A82
	for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 09:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Gtbph+JG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11A4E1F000D3;
	Tue, 24 Nov 2026 09:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795513560;
	bh=t73kaSUlwTnKPTiWqe3og+82HnH72zAHcduRk3MnT+Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Gtbph+JGiZ07hSGTNa7sGg5ERwsWhYKiWYHErHKtzmCS86JBznXvab0qQFSb/Nj9r
	 w9U2jJY1UoHESvMMBf0u2plGRmyzIVlDLvOvsQRwnjAI4avKB+9oZiLs0NHH5N/v/S
	 tzImwXaxC0HPqYUPi21zuHQDsLtavxq7Kb2eXJmZNngulfCninuRRcT1lzZZMZdSYA
	 0p86b+uAkIawAMkYkalbfYmEREUtKTRMKzsXD4//zn5hkLHxcxHSfUrfMsEVWY2Aes
	 2kFWcw+EVJbAapD7xYai2zwbjU7EUBBD3OIUlbbCFCBEFub4suiJymVBeTgpelIHYJ
	 JIt8ctluUuCKw==
Message-ID: <sashiko-outbox-230865@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5] usb: hub: Set proper message when
 usb_hub_create_port_device() fails
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chen-Yu Tsai" <wenst@chromium.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261124094306.563401-1-wenst@chromium.org>
References: <20261124094306.563401-1-wenst@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 09:45:59 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Right now when usb_hub_create_port_device() fails, it prints a separate
> error message to say which port failed, but otherwise leaves |message|
> set to the default "out of memory", which is somewhat misleading.
>=20
> Set |message| to an error message that is more specific to this error
> path instead of using the default "out of memory" message, and also
> print it as part of the custom error message that says which port
> failed.
>=20
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124094306.5634=
01-1-wenst@chromium.org?part=3D1
