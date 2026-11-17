Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794919674;
	b=UQuYhst9FjMU2R+4p2zE5N/XOAk5qDLBCWaawUgBhGm8kLDM/vNIOP736r+/e6TG63p3
	 TgWEGEKHMo+G70fbOG2Ip//5f9wDLL3WVpX+Z3BQqCv2KqvfeLIQEEYQFdgF6nTACrF7d
	 Nr42/eXxkHk66KzllbBRA6hljk4LFMT/touyG1s0pNsqI71x4Td6IKZd/+jZL4dZfqRKV
	 ZaNa8KzbvpCrgm9vmYFeUiJdAR8R3uuSF/yB28JpXbUgACE2nTHSMx7j0EtQfgAq1Ca4Q
	 I0Uu35+SyIIChOY/Q1EZafE8JIvsxnR5kSKxOlqWEYGu6pX7nXpvXvsTVnKqeaKD6Uw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794919674;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=5xKGkrlrzVVpRUKlH3TPTOYKgVdAoUzz3wbai1buyt0=;
	b=kPgFvNyOV1m0VrL3wfrPmt0Jxd23HL2L1gRc/RDsWCrgqieEYrUHYBFDWGXLAgPqVNb7
	 K40U4YDfas9mAD5e4oaq9i/4ONj9ny9ZiJgJVVkRpyXZ98VbnEHn3br4KSSoKy0ylQGCX
	 RD8qbICHmf8kSdivSFBWbP4kwdRQDoQqelQ84Y6X3kl+sLkxIL7d7/9IILcjgmV90RgEP
	 JRGAaBqeHKYDdrSg3P2IUSpnDoV7YBDaCVUkaj1jMUskeAiPGIZQkrNPrJOQG+CDbwsuh
	 peWAYIngwXmxGgmrsnVEhEzFGf8EDmPBXBPmMU4/rAiaWaE8IIJ+M+pF/iy4wSrjpaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TiA79bdu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DAD8606A329
	for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 12:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TiA79bdu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0EF01F000C4;
	Tue, 17 Nov 2026 12:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794919673;
	bh=5xKGkrlrzVVpRUKlH3TPTOYKgVdAoUzz3wbai1buyt0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TiA79bdukCxQW/naBZ2t0woM3Ig9qWSXDRXmc6VNtZkQaIr8DEKQ70rCnfZ4pHwus
	 JGlKxpMHXecanAI0nwcUSBo5fQdo+dgsl/ANNhlBjve+0p6BS6sfLJl4cdM6YQpSgO
	 PiKJZ44+WQ654fjn+H00I7CBmWxhZWe5+XIVV7ngGhRdFWcpp5iQ8izSliN67inCWq
	 5/JXrxNfOTjQQ0/Uiv0Tsag6+eU2eJ3eDauoK6UIHPZI0ag8uohZLdWnC3rx1IXtbP
	 GmEauKVLfE82Y5MS2vU/ItCVPBKNAGRP3wcTYz89qgCFcKh6/XwahK0q8FZCHQUIV+
	 T66DUzdOV2WuA==
Message-ID: <sashiko-outbox-218792@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 4/9] usb: chipidea: usb2: add optional reset support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Junzhong Pan" <panjunzhong@linux.spacemit.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261117-b4-spacemit-k1-usb2-v5-4-52c3829cca69@linux.spacemit.com>
References: <20261117-b4-spacemit-k1-usb2-v5-0-52c3829cca69@linux.spacemit.com>
 <20261117-b4-spacemit-k1-usb2-v5-4-52c3829cca69@linux.spacemit.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 12:47:53 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> The USB2 controller of SpacemiT K1 SoC requires reset support, to keep
> compatibility, add optional reset support.
>=20
> Tested-by: Ze Huang <huang.ze@linux.dev>
> Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> Reviewed-by: Yixun Lan <dlan@kernel.org>
> Acked-by: Peter Chen <peter.chen@kernel.org>
> Signed-off-by: Junzhong Pan <panjunzhong@linux.spacemit.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117-b4-spacemi=
t-k1-usb2-v5-0-52c3829cca69@linux.spacemit.com?part=3D4

