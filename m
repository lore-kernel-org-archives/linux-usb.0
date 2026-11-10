Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794284339;
	b=4JYISb+2IB7ffaPjDzuC0ctPBdg6gIPp1Tzza9nNqQ7LiWSooyEY4uQoudPX6E9BccCM
	 31BA8X8nbkei/7PgX4V1KENE58yt1DZJdhSsSNwkFzZSHbAsSjISFv5OTY2nrccRh6spp
	 BuKzRvta/w3TK8krba6939eiW1P4okOT8G5Gg8zSDKc/W4nrpEJ++PpEcz481kbbfegzG
	 U6uIaNaqjyu3KLbI4lkj6mrkJ1TtscN6K9+I8i7nirZn79an2Rh3IbjgBKdzod4GoKxkf
	 C1KjEmAPA+zCtgwIDXtMjXDTmKQzXpHMsUUR4miD5gGMLcYKkVeW29xj/Tkr5jST6dg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794284339;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=lThBb8zzXPVUjnZuW+Mm/+6fqy4iSXws3NRnSPi9YRg=;
	b=ORL4sqL3RhLKsgZ02Awr4DTL56rspdGMPk/In/JmJnkC2vYewjXBCg+UF40tTOya9Gab
	 SS9ZIcVKbRiuLZ3aQZBCntE4262eo1V2V0J6xABjlsuRHqhD8jTNn0oiOK/lpdZHdKNai
	 4S10LSKoP5tasKQILRpIl9oyJfVTGAVpuwISBn4TZutwcqRvOyi6tpN4VaOK9qnGtFmdu
	 LPf7AD/Bq9nlmFU72CES4xUzymh/YTTztQi6lYejxBwBXWdSSkNVJyEak/WuofEmp/TMJ
	 ujKp/6MXcDk35Bp1QnmefqyHblYtEC60DJK+EWbmjQJvMtSSs5JCFEvokrNAxOv3j+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g5cmPzwB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C457606A321
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 04:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g5cmPzwB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B3C51F0089F;
	Tue, 10 Nov 2026 04:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794284339;
	bh=lThBb8zzXPVUjnZuW+Mm/+6fqy4iSXws3NRnSPi9YRg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=g5cmPzwBlzb5M+0uCsFjmhfbQdmJHF8QarFWBY+zsm73NnpLlgRyZFt0akWJwEFzv
	 E1XJldZRA1RajqR/a582ImB76jkhWh+6hmmpgM879M73OTtXdYApKBLKy+pyyyP7QA
	 Bkps11wzbxRkq9PGY9ySqMf8P+Ho6o5lfwPAgvu5r+TKDK/M0hfizFyZfr3cVsv1MD
	 gV5uxUCe1D4CYfkgUut7d4u2RIVCOJF8fB++yUwGLw18clgBvI0COo4HIycfVyaTgm
	 Zhpsgwg8kXH/t1ZjNlWJPXjycS8TpD2WZJiHnf6hl3HfWN1bZn2fJKU3MuQx0LOmIM
	 PeSBB7T93JCsw==
Message-ID: <sashiko-outbox-206184@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 4/4] usb: gadget: gadgetfs: avoid writing through the
 const setup pointer
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jing Lin" <kayano050408@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261110-gadgetfs-ep0-v8-v8-4-8f90434574fe@gmail.com>
References: <20261110-gadgetfs-ep0-v8-v8-0-8f90434574fe@gmail.com>
 <20261110-gadgetfs-ep0-v8-v8-4-8f90434574fe@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 04:18:58 +0000
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110-gadgetfs-e=
p0-v8-v8-0-8f90434574fe@gmail.com?part=3D4

