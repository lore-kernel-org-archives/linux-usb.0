Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC6EB411FAC
	for <linux-usb@vger.kernel.org>; Fri, 16 Oct 2026 10:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792145569; cv=none; b=nwiTSFjVQnaD+TtP2qA40chs1tvYtMtrnRKMBNCMfriSJQhitcSB5CkrTKWsZq+EbA4yAV9GL2FWu6RCpVoo9613PygEE10GwvVfkf1QDwTK7FYOR6b6AMjsuNcCmYKL04u2g1SvSmI+C9JNmoAhJfqEurjknrY4JQ4MXlJPZM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792145569; c=relaxed/simple;
	bh=R7rS+XDA+mC7PBuA6KRcHLRifZcEuh4CAKgPZwOI2xg=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=tkQENNA7fkXObiKbh1pUpwTzgRl+RuROkDeXtwAZ6N1ZtibsBZWrXpExRSDCyrdXKeKtBbREPsBKt9aUlsMoHTzppX5ZqVl8/rUqje5CzYHhQ7iJwpp5fioqHMmlcZ4AZabdIgnE+t6wgkorErJBbMUroRko/SumfYYJ3imRsdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y5lt9xVF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y5lt9xVF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7219A1F000C4;
	Fri, 16 Oct 2026 10:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792145568;
	bh=R7rS+XDA+mC7PBuA6KRcHLRifZcEuh4CAKgPZwOI2xg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Y5lt9xVF8EWFdayTDh+JHxoyAf8kpcybkAel9ENFyPUjH0c980S437SZqExmsFFFx
	 kkkFfa5d0lMhErn5L78m29oprljrMR+BdXa6rKuZXLco2G3rsT7HDCi6e9QagkD9Ru
	 QJXcT3M79qbS0OrUOg5sio0M+zpWLDnJ1Gg/eS0lcq5cBstBuaey6qcFqjhFoxMLYA
	 3RWdGcxazL0Y0LucKpuJOszSTstL+8u/EUc2ISi4WImf1mj1+ng7MmY3+e80yhjMAG
	 FMYlZd1tyOr1FNmrSlJnH+unkDYJfXZ0JcTe33y4iJTafJFFAh7P8yEUYPGqv48HjC
	 BDgBk+4JFgaIA==
Message-ID: <sashiko-outbox-174128@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/6] USB: serial: mxuport: use usb_control_msg_recv()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Crescent Hsieh" <crescentcy.hsieh@moxa.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261016100351.681390-2-crescentcy.hsieh@moxa.com>
References: <20261016100351.681390-1-crescentcy.hsieh@moxa.com>
 <20261016100351.681390-2-crescentcy.hsieh@moxa.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Oct 2026 10:12:48 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> mxuport_recv_ctrl_urb() uses usb_control_msg(), so its callers need to
> provide DMA-safe buffers. It also checks the returned length itself.
>=20
> Use usb_control_msg_recv() instead. This helper provides the DMA-safe
> buffer and reports an error when the device returns an unexpected
> length.
>=20
> The three existing control reads all expect four bytes. Use stack
> buffers for them and update the callers to handle zero as success. This
> also keeps the original USB error when reading the firmware version
> instead of replacing it with -EIO.
>=20
> Signed-off-by: Crescent Hsieh <crescentcy.hsieh@moxa.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261016100351.6813=
90-1-crescentcy.hsieh@moxa.com?part=3D1

