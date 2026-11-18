Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794987583;
	b=PeP1bEXWk2gTVt48yBLDVM2BO6h8RoXTa78VeQI8mo6ZUIaUr1v2QClAhtHuqDHrYQUC
	 qeionYasRrNHvMnBuPEw7jfMMpNlxv7zJZjTyyKPc6z6W1BmkfqVzHMB1QGxqMiXVhA8F
	 sZip1TKYybeh6A983O1z09fUBSYB7AokPtpeMTtmaD9ZBfPejWjIYdyIEqcA3ONdnInRC
	 t7rJtdsoek8d9nYUFIYYCcCv/TPFPtauq3xzewOvM2PrABVR/AErKU66aXWvid9wtOV2W
	 Tb1QnYOl7usT56zJ4n1R0fdFwPs955t1T4vjhZoRJWrY/cON/mDJYcJs5HlpCCdNx2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794987583;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=hdfwA00LLjsabkKUTsyL2zKr+0kWJLJ+yTGmX0Kgzxg=;
	b=fVKVUiPDN2Tf0yvok30++RHwiTCRlAekOM2Ggb2H/rCmlBJjnUthAlEEo5UOOtxzrK8b
	 3XTfHZn0QfEsLwtbKkbRH8RSL9dGGQeXmAxmIyLswWVngKcvD2BEGk5VZhwjwYhbZt7n+
	 4gy7AwXzMVF8cacKVIjbi54tOKwnKi5f8E2x9VAtBdu3O7zZSi4ihm5T33GafC5HP2gGP
	 MZvnZxMqPn7zgmzMxEazUTHoqm3MWZJ5gpxodUt7DDK18eLVtPNV1QWWDwNstvDpYuBmD
	 Akd+xSXyxCUV8tFjzPuc4WZsHKoySj9RxF1PemrBP/f2XQQQQ+0uN6/AInZ4+Tyc6fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a2nmRoUt;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7142B606A31C
	for <linux-usb@vger.kernel.org>; Wed, 18 Nov 2026 07:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a2nmRoUt
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E53A71F000C4;
	Wed, 18 Nov 2026 07:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794987583;
	bh=hdfwA00LLjsabkKUTsyL2zKr+0kWJLJ+yTGmX0Kgzxg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=a2nmRoUt5Loq2YYqe3oHFrUe+1TXEmxoI+99UFEWYjyHmitmBm0m/57ldWDAmQeJb
	 11bAKbiR89LG87xz2z8E7wN8EF+NGQr7dlJGuzEtB1YdJ2AE6qM0LvLyOgFT3EdKi3
	 BMcgTonXeHV5Ig0Ijzcm5ah42i2rCOeBjsOlTHl4a9B2U3L+6WtTP1tWlSW7jkemhu
	 foGg5gpn6HTDELOrvu9sfNYRMEvtAJ3UseDfUN8PwT4FZWIy+o7OaFMJM7pySMXJHF
	 GkOUzn65UOjf+JfDObdPKMHKqvf2LH3//gsHG3XUvNAlcVo8G3gA+O5DfwZo5eEh1O
	 xbBv0xLflAlkg==
Message-ID: <sashiko-outbox-220321@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/4] usb: typec: tcpm: Stop replaying
 Source_Capabilities after cable discovery
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexey Charkov" <alchark@flipper.net>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261118-tcpm-soft-reset-sop-v2-2-b6decdc95e66@flipper.net>
References: <20261118-tcpm-soft-reset-sop-v2-0-b6decdc95e66@flipper.net>
 <20261118-tcpm-soft-reset-sop-v2-2-b6decdc95e66@flipper.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 07:39:42 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> When its first Source_Capabilities goes unacknowledged, a source that is
> the VCONN source asks the cable plug for its identity in
> SRC_VDM_IDENTITY_REQUEST. Entering that state sets upcoming_state to
> SRC_SEND_CAPABILITIES, for a message from the sink that interrupts it
> through SRC_READY. The ACK and send error paths go to
> SRC_SEND_CAPABILITIES directly and leave upcoming_state set, so the
> first SRC_READY after the contract sends Source_Capabilities again. The
> second negotiation can cut into the sink's own Discover Identity, and
> once ended in a Hard Reset between two FUSB302B ports.
>=20
> Clear upcoming_state when SRC_SEND_CAPABILITIES follows
> SRC_VDM_IDENTITY_REQUEST directly.
>=20
> Fixes: af8b627046bc ("usb: typec: tcpm: add state machine support for SRC=
_VDM_IDENTITY_REQUEST")
> Cc: stable@vger.kernel.org
> Signed-off-by: Alexey Charkov <alchark@flipper.net>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118-tcpm-soft-=
reset-sop-v2-0-b6decdc95e66@flipper.net?part=3D2

