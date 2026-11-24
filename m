Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795487470;
	b=xsBmgVg9SMRnoP+tgUGbqt7AfWn5jyJFzPmIgmLd2+OSA88sxWIuZl+vT94EwU8Ghw0V
	 QRl6r9TajfC31chQ71jRAGYdr8IRVEH/eIrWIqWEgYxwGm91bogmbYWQ8+DQndNk/uqtO
	 fB4DuJ9Tx/DxsGK2p+vYMbrmZTETT/3oHrzz0WXqaJNKbAZeRaducSgb4+ahYhFbdniVE
	 QsebaNue9WiwbGxXrHJMvX1t0XoQhyYfSLl6i/hMXrIFYFYZRURVAAsiUlfn2qIl4vjmj
	 XFHAsU5kX2ulS5/gWHGCKX21bFcOSZG0yM11YNwbsFuqG1zZAV4yLjTwCmo7Cuvc0TQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795487470;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=7qp45bH7ukAIlsLxdLkL5lcDEaZM9o6jZUChHdVEo8Q=;
	b=03Zac3e5N3KpTwPCvjCnw2dVkIAFVoJs8/Q3DtcbdQzaTGZcADGwGVxQAe0c9QRv4ydi
	 BwGjG9XE4/Z5lHUk7scNQ4sHDsz/a8kZC7cxSNcF0KPlmzESYw4xXuxMr/t0A5cNjQYIH
	 c7CJN6EhZT+M230S8xGgDWuh2T6k7IQBtNNzyuii7clZmncIRt0iaHtnRH41UbCtQHraP
	 NwKvXdN17A8wH6/R8743vku6hDBsWPV8XpiHcQkNAwdiKujgI1GDKFn/15Pxb8oQEx/F4
	 GdxnEsFXqlqb+rSTvy9ERvvLWEcc4fV80Cl9w8LqVVrV89AM6X89rZx8JCfVWReaBTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QD+7dOhB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C849606A31E
	for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 02:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QD+7dOhB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C2771F000C0;
	Tue, 24 Nov 2026 02:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795487470;
	bh=7qp45bH7ukAIlsLxdLkL5lcDEaZM9o6jZUChHdVEo8Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QD+7dOhBYDhb/jg2Ta5SusN2Z6llOkLQ5+jv5nF5PCy43vS0WAAuXK2VWbf51QaHn
	 H+v00sJMNxqfEWhLRZK1VPOZH9YzXKdBPoFWbrHCD0ntSlCAM1IyvBfTDFOeKQnGkv
	 lQL8tG3mGgaaROmWO+UbkspKQQUw6JeKSOBTmtKeAkhJx6ZHnvXUI3/for0ec9geMJ
	 XVIX2Y/lByEkSxEL5lsEdNTLsrK4RjQxgojgBy8yebV7+LC5ijlWWGq6YK4/YGhIb8
	 HXJR5GrgknerGgydE67FapbjeguA1ROxV9fVRzN8rqBDf6ArlABVJuoo5LqCOiDzty
	 M75szM3ADHcKg==
Message-ID: <sashiko-outbox-230407@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: misc: onboard_usb_dev: check i2c_transfer() return
 values
Reply-To: sashiko-reviews@lists.linux.dev
To: "Siqi Chen" <chensiqi@uniontech.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261124022500.1020611-1-chensiqi@uniontech.com>
References: <20261124022500.1020611-1-chensiqi@uniontech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 02:31:09 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> i2c_transfer() returns the number of messages transferred or a negative
> error code. The USB5744 I2C helpers only check for negative errors and
> therefore treat short transfers as successful.
>=20
> In particular, if the two-message read completes only the register
> address write, the driver consumes uninitialized data from rd_buf and
> uses it in a read-modify-write operation.
>=20
> Require every transfer to complete the expected number of messages,
> preserve negative error codes, and return -EIO for short transfers.
>=20
> Fixes: 1143d41922c0 ("usb: misc: onboard_usb_dev: Fix usb5744 initializat=
ion sequence")
> Signed-off-by: Siqi Chen <chensiqi@uniontech.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124022500.1020=
611-1-chensiqi@uniontech.com?part=3D1
