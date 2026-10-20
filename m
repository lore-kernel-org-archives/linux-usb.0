Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792485472;
	b=jgbdYLYmC1rptDcTGg+hxVBsXKVuHYFiysaEWEGZAicDTbMaFUC3xrU3Ztld9Kehqlkr
	 wZ1cuMhGUM777OkoMUItaP+et+M19m9SeBUb1FgGMRN4Wic+tczz6dGINplwFxIkoxhYs
	 f/PbXrTscEexB2iGv2S+lTTtYkXz5RUrBV8hPn0abUkGGHElp8bCVgcph8b4JKQ639F68
	 R5WQWZ2r8pBCkLjnAJVOCa5ybbfIIokzq1HR3JmaMs01shXo20L9rPIoyBk26bqpezgye
	 Wf4Df7qpk7Glz2uuCFS5CleznC6aowHVNNqknNUTQ6A+9+uSWLXz5+PBQdaoLUgO0dw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792485472;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=xCI4ICMFnHI1tXoqcZJbnnyeDnXTe4ED977SPl2qON0=;
	b=X+gcphUsFgf7UDhnfMHJ41MYBrQZNpNvYYxEu8DAK5O2o72cm8RzdI7YTvVM/wr+1tTc
	 Tp8sV8QZtjyyVzvq8wcz+aPUHmQOomKc13yvfE71v6oYxBYtbGE+rj5Vi8T9HhuQ8UM4/
	 03vQ1stbtDuGGZ1Kie99vHvwx89kKds/sCFvhhnpTooDeiCQ7KpHZKm7jzoIAb5sBsa/J
	 LNDCWo5ruf4yscBecjhNGTN2htAQujD7W3xwGh2jOqW44v0vu/KKm5EgeW0wmhosOg1xF
	 TWPUDsSRkMLz+EDeyYW8dCq8nCOmbgUDVi7FwOR/pBef/nKTQQj31Siu/Bq1LClPzGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Jb8Bi/W1";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39F0D606A31F
	for <linux-usb@vger.kernel.org>; Tue, 20 Oct 2026 08:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Jb8Bi/W1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 942DA1F000C5;
	Tue, 20 Oct 2026 08:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792485471;
	bh=xCI4ICMFnHI1tXoqcZJbnnyeDnXTe4ED977SPl2qON0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Jb8Bi/W11wxwIvXzez3gHGPgL5/c++e89o8hJKnKOipHTI4dJeD58YLCbis5Nw5s8
	 GHIx9WaLzi0EIcWAPz4ZtxPhH2e+FVxrPAWF8sOxibKeE8xxsPy5VAQp/Be7393sQl
	 CzlcgxCVi+PVBF0Y0gFxtfCGG2LT2fB9ymlE+jPUiADo92nwxhhfEX2qm7NbevnB4S
	 WaheanJJQ6Rn3IF+dFtPptp8b/3i4AFFMf7f9e7hZOw3D8NdiHYn/s00uqVy5whbY6
	 pFR4StvQ3J6aj/IHbvwZSmwUW+b5PhVs0HrmXePSKo/ZQVXW7GDWoYVFjAhZ+GVaLg
	 7SMhER0TwtF5Q==
Message-ID: <sashiko-outbox-178585@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/6] usb: gadget: udc: crg: Add hardware definitions
 and structs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Petar Stepanovic" <pstepanovic@axiado.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261020-axiado-ax3000-usb-device-controller-v3-2-3012ecfc0a93@axiado.com>
References: <20261020-axiado-ax3000-usb-device-controller-v3-0-3012ecfc0a93@axiado.com>
 <20261020-axiado-ax3000-usb-device-controller-v3-2-3012ecfc0a93@axiado.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Oct 2026 08:37:50 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> This patch introduces the hardware definitions, register offsets, and
> fundamental data structures for the Axiado AX3000/AX3005 USB Device
> Controller driver.
>=20
> Co-developed-by: Naveen Kumar Rajgiri Bassappa <rbnaveenkumar@axiado.com>
> Signed-off-by: Naveen Kumar Rajgiri Bassappa <rbnaveenkumar@axiado.com>
> Co-developed-by: Krutik Shah <krutikshah@axiado.com>
> Signed-off-by: Krutik Shah <krutikshah@axiado.com>
> Signed-off-by: Petar Stepanovic <pstepanovic@axiado.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261020-axiado-ax3=
000-usb-device-controller-v3-0-3012ecfc0a93@axiado.com?part=3D2

