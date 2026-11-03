Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793706443;
	b=BNjtQAcL+zs2zjyeaGxta6s33IYDlnIfhigi/k8gvHOv5HrvJnevxR7AQ8L4y6VGr7NQ
	 WRDrs+xU12kZSu14/nEonRJrHXtUDMqZQnj1OTc7PzoAqDNwZgz7lvc9zlnHXRnkGzRj6
	 WlbzkSz6sQ3MUKNk9HAQ1Xrt5dZRScANZYJIBnzQvS1nE86VaOLEoHVvoI1ECVh4udJpm
	 eQSK+VviajmfYCsO3+tALKydxiL7dP1c2SGORa8xRTGinRv0qJHbDTIg0EJM/KufURxci
	 fgl0sNQ+SGkU9XYMDTTH+lf444CXPbKGIVbGoY+HlXetlx+3yCheCt/lf8vWfCBrN1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793706443;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=iyfn+AzfuYkdHmDDNcJLIaOfvZqiLntaUzcgbMl5H0Q=;
	b=giD0bNVdtJaRrkj/CLwcJkqi8c3MK4QQXKq7H9ugI9iBPhEwP2XEGlOAP9w6vS53Uq4s
	 cTBWEYtsCvEiT8MVaLE43LY7DuoA34cG+7EXlIIIKbGTUfz1zIEqEA/SaB7UtDaLLzWL1
	 NioHkcyliPzDoEXvvmQEqeop5SL4ZdehJ0H4wioh8jo+ThMV6aZLO6Dg5/OnD+3mBSrdd
	 mdV1syyqBZWvzL6PGibY9OGjpVKQDX45+dUUCneq1dNb9My98I8BSp58Yx0h1vXlU+wg5
	 OlGv+muh8c8pysT67OU8r1ZFqlKEAwBlsV5SB2Yz5U9hUs6wqP/F3nMrKwOHW3eNG2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XMm6OcK5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDFF7606A324
	for <linux-usb@vger.kernel.org>; Tue,  3 Nov 2026 11:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XMm6OcK5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CCEB1F000C1;
	Tue,  3 Nov 2026 11:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793706442;
	bh=iyfn+AzfuYkdHmDDNcJLIaOfvZqiLntaUzcgbMl5H0Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XMm6OcK5mSvGjLYvS7lXsl45lgS4Ep2xK7pPcR81GPzlTm7AR1BvIwVJigdVJqLjw
	 ETykYfVtOnk1C5cMZIbmNcqh3c10aJrL+tYhq96gitk5+wkhxj0aYK6/+ZzRqQxGEx
	 kyIukwKjAeXzw8L7tpM/RipuGA29GD6vKAIUJfngkk3vCv5y+x1ycV8K8W14hcP2aY
	 9M6MuBfkChWW8W/J4Qeo4yE44xjpcWLify+Kb1aQHVC32+VLoi4s2IBZmh6PtKhbIO
	 hMZDufcV1G2Jwu3HcFYCT4Rp9be4DueTTWX4XHKOS5W1z+9Tx8C0R92SvMeBddszt7
	 n2pBIY54Jg0pQ==
Message-ID: <sashiko-outbox-195186@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/5] usb: typec: fusb302: Tell SOP' messages apart from
 SOP
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexey Charkov" <alchark@flipper.net>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261103-husb311-cable-comm-v1-4-6217dabc1a85@flipper.net>
References: <20261103-husb311-cable-comm-v1-0-6217dabc1a85@flipper.net>
 <20261103-husb311-cable-comm-v1-4-6217dabc1a85@flipper.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 11:47:21 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> The driver sends every message with the SOP ordered set and reports
> every received one as SOP, which leaves TCPM no way to reach the cable
> plug. Start a message with the SOP' ordered set when TCPM asks for it,
> and report a received message as SOP' when its RX FIFO token says so.
>=20
> SOP' is Sync-1, Sync-1, Sync-3, Sync-3 in USB PD. The Sync-3 TX token
> and the RX FIFO token codes are from the token tables of the FUSB302B
> datasheet.
>=20
> Nothing changes yet: TCPM asks for SOP' only from a port that claims
> cable communication, and the chip drops SOP' packets until ENSOP1 is
> set.
>=20
> Signed-off-by: Alexey Charkov <alchark@flipper.net>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103-husb311-ca=
ble-comm-v1-0-6217dabc1a85@flipper.net?part=3D4

