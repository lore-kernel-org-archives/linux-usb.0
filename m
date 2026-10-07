Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AAA345D5C0
	for <linux-usb@vger.kernel.org>; Wed,  7 Oct 2026 16:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791390348; cv=none; b=AWbTokJP4tRqTUmEQ23Qo6K62DkfhnLqk8SoSoSGOJaKb6koMSGVHG6AzWUYg+Okxd/JLwGQ/P6BgLK8LHQiU2lOzovgu5yE6NSONOw4CFm3TUB4fxPUXsVtVIetPBDrhewC02iR/LP2GN6CNu83lCUKvejm1vizD+fKyKtWEoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791390348; c=relaxed/simple;
	bh=pacGlriplSBBILxNis0FWmuKNG/xK7PBsOJd2Nzl0GA=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=YfZhU+qAR9w74RNf2U/ccdIx94aQrujuZiqniWPL/oK2MwDgZGfQB+h4M4ohExbtNUVR5YLWk84IsZhQqDDfRas81UXlBbI5PUTqb/qUvyE5HGbnnc1rlb9T+ZBhnhNEUqmSpiX04zbaz2QDyCo8JRLVE9hYq3RSKxo5Qqj5zEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e0FFqD/g; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e0FFqD/g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F08B1F000FF;
	Wed,  7 Oct 2026 16:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791390347;
	bh=pacGlriplSBBILxNis0FWmuKNG/xK7PBsOJd2Nzl0GA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=e0FFqD/gs0Jno1E2JTNzq8izWuxdmyyNsoxj6P6IBufzttCSiOkAODplA+wlqJMVL
	 I0R67TWEBFOojhGIQ6ra9xiseNfdHjye1uul0XKm9lqMgc6GDX54vTzmGQPikryflZ
	 QfZ9QzbMLk4tR20AOjxGm5nRLxSvi2F66oVHkA9bF3f+gG9Y4WoMxpLKeauBzhjnQu
	 e3u2sr1X1c4/1bBRaD5kbF2Juh/OHsJuvFcOs2I52AR5oDZDzC4nxGLBZcRVY0P4GW
	 I/GXwer/7JBS8Tpgw1r2W4749TcYznxculv4bnfznyoWRGzDF9+XhL4qpBoX9x90T1
	 f4C2+e3jyLqdA==
Message-ID: <sashiko-outbox-163193@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH] USB: core: emit a device-level modalias
Reply-To: sashiko-reviews@lists.linux.dev
To: "Giuseppe Piscitelli" <ooonea@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261007161721.60593-1-ooonea@gmail.com>
References: <20261007161721.60593-1-ooonea@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 07 Oct 2026 16:25:46 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> USB device drivers can load from interface modaliases after a userspace
> client has already configured the device. Loading apple-mfi-fastcharge
> then reprobes the generic binding and interrupts usbmuxd transfers.
>=20
> Emit a modalias on the device event, with unknown interface fields left
> as wildcards. The existing udev module loader can load matching modules
> before consumers receive the processed device event. Keep interface
> modaliases and the driver teardown paths unchanged.
>=20
> Signed-off-by: Giuseppe Piscitelli <ooonea@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261007161721.6059=
3-1-ooonea@gmail.com?part=3D1

