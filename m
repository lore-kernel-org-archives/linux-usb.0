Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F28A5608481
	for <linux-usb@vger.kernel.org>; Mon, 19 Oct 2026 14:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792418605; cv=none; b=RIj63MA6ryfqAJdOyKVNpxB4wxLFWleWGwx1CkIgHLj2gR9w4dq2cH+m0dHXfKB1IAWneZh+u8xx85IsHh4EfQTs0K/lxxHL2jTlu5LTw34nrGXcEr9ZoAEviqCBGIS/g0d6V44p5waNg2EX62pD7nbKkhWZD/llrjUhk+/hCi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792418605; c=relaxed/simple;
	bh=B+vLMGxzXyELCvJL/d+s1RmA2fR+uLTbtfgdflIN9Jk=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=tqEcYzl/QWJNDzEkYdTMnp41Xs8RFIAGMJ1FN4OQGJwIKMJeH2yEc+n6TCoXCKY+DzYtAs8ov/G2p3R0yvz6Izh07uVlr0htWENfizD0fg8kTLedL5+IUz6ODDekYNDVy1yEGfoKViZpUHn+1NwuYtgISxntjg3Ze4SwMCgiir8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PgR7E0Ga; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PgR7E0Ga"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6A711F000C7;
	Mon, 19 Oct 2026 14:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792418603;
	bh=6WupqcCGeZVWDyTkMKF3yYlBXXR3J45Evge5Y1nnv7g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PgR7E0GaYUn6tbqCK+ws0sIm+9X2nPlH7SUncp2mkdJTj3keQSGlboyYfx39y2KzY
	 YIFZ/0pRA12KQrOp8+hConmOv+wWR9OQivPRmnbEdra5pKc+wvhaKUfHcmdrDhD+Bq
	 b2ZHaQDCpVuiY89Is7yBNypg4kCA2OptQURQaduUVRSqH40oKqOr2r2eoiuH0ORKpR
	 VLe0mQrw5nwwFLnqg1AF8prCJxhZjLa1dvubBZSkhq29dCGEF8FShZ473UBt3dJDEU
	 dU6hQMEZEfjBN3PCDFLdRLus6FIxm79tSXYwhWY4utaH6EIjBRNWkgEhENmkt1cx+V
	 wLoD1AyAVHfJg==
Message-ID: <sashiko-outbox-177269@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH AUTOSEL 6.18] usb: typec: mux: tusb1046: add missing
 MODULE_DEVICE_TABLE()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Levin" <sashal@kernel.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261019135441.1420968-29-sashal@kernel.org>
References: <20261019135441.1420968-1-sashal@kernel.org>
 <20261019135441.1420968-29-sashal@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Oct 2026 14:03:23 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> From: Pengpeng Hou <pengpeng@iscas.ac.cn>
>=20
> [ Upstream commit 5e4eb5c96324b226220d29d025a334df28054ed3 ]
>=20
> The driver has an OF match table wired to .of_match_table, but does
> not export the table with MODULE_DEVICE_TABLE().
>=20
> Add the missing MODULE_DEVICE_TABLE(of, ...) entry so module alias
> information is generated for OF based module autoloading.
>=20
> This is a source-level fix.  It does not claim dynamic hardware
> reproduction; the evidence is the driver-owned match table, its use by
> the platform driver, and the missing module alias publication.
>=20
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> Reviewed-by: Romain Gantois <romain.gantois@bootlin.com>
> Link: https://patch.msgid.link/20260704124714.18404-1-pengpeng@iscas.ac.cn
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Sasha Levin <sashal@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261019135441.1420=
968-29-sashal@kernel.org?part=3D1

