Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793750581;
	b=yy5gi9JH3zcT5ytIIW4dmwMSJMDLBfPNKjfk/NwD/FwcclOVGt0uBYBENi8f2mcxjCU5
	 gsJ48As4PIwEC2frM+ScL5CetNJFU26MwrsEL39QMEInArfX1MmJBZCKhUPHJxs4PEgBv
	 oWZVMtONyqjjlqA3FHaRGwKtfjlb1LGBlxEUgXolVUtVKnEDX2gEeZyLAlsbBKyYoCwam
	 KRt2E2sJUHfivOlTwim62HvHEYKN9G7UkWFEBO9o5rciWGCPUfQgYtw6dKmIw62NksZ8n
	 IqYQL9+dP57BvSR6y6TCi3Veb7/mQipBCsa9yTWx3BPIbWCT7HkJuolragDPHVsuVFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793750581;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=XLp1mrd85IHR6q1P+LMTawfTxszeAS0gvZ1A5zcXkNw=;
	b=kJM4M5sABJ53cTYuev02iUYCltT++RuHLWLYAWejqWRddlbnc0oID2jKX1k5iQtF3O6g
	 gJBkjv+i3Pta/NnIoj5qv3JOvTb9MbDSwtBkr2x2bXUjrC6GqpGH2TPEtwVCxvnwFMqSi
	 dhrJ/jc65uTwa7wpm8+1EfYJVFw01BmNRuKfgAoRrrgGi3TBXSPJpdaDUb7oM9n4Ls5rs
	 ZC9pumhjGc/rS99fg6A8Un4yaRZNWOv/odn8P44N/bMNYNTE/uTwfTcVIbWsZGTQrkUtV
	 lJJu0ktKXdEjS/+AAW33mw1NxCx5fberCM6sAYQkR4PLZkhfoG2NUgO6h2wpaSKbKvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CrBQ9u3e;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB211606A31B
	for <linux-usb@vger.kernel.org>; Wed,  4 Nov 2026 00:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CrBQ9u3e
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C4E91F000C1;
	Wed,  4 Nov 2026 00:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793750580;
	bh=XLp1mrd85IHR6q1P+LMTawfTxszeAS0gvZ1A5zcXkNw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CrBQ9u3eBW9W/oAZb0kHgHFNFIV4EJZECu4617OyGUDrkJxzum8HolfGqAZIzgT7N
	 gBOnrheYBpupUPoSNYxYYz+/20d28jmvJaSdKE9K/CMlCeCdx6FI40T+ZxYuLAcaO/
	 lls8h4P8zt0CJQKDR78ZRvfSQnlKqaBSpLh8RVOFcZ52EZUnKF963LHoqSb02uh1rW
	 rVMAKsPJ4ggnkapB3OVDV/xYAIiF3rmuP/QTEek52jfSFaqC9iQ9uJhVhObhwcn65K
	 TUz0ih+OEAtLPdtcy6EnsE/5nJE7VOJM1QH/sckLMMNawM0lrcASUbs67y910ubvA3
	 wxd0f4WenGlmg==
Message-ID: <sashiko-outbox-196270@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: typec: ucsi: Do not report surplus partner
 altmodes as firmware bug
Reply-To: sashiko-reviews@lists.linux.dev
To: "Paul Menzel" <pmenzel@molgen.mpg.de>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261103234750.27510-1-pmenzel@molgen.mpg.de>
References: <20261103234750.27510-1-pmenzel@molgen.mpg.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 00:02:59 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> On a Dell XPS 13 9370 (BIOS 1.21.0) with a Dell USB Type-C power adapter
> connected, Linux 7.2.12 logs:
>=20
>     ucsi_acpi USBC000:00: con2: Firmware bug: duplicate partner altmode S=
VID 0x413c at offset 1, ignoring but please contact the BIOS vendor to fix =
this issue.
>     ucsi_acpi USBC000:00: con2: VDO mismatch: 0x00000001 vs 0x00000002
>=20
> The port advertises one altmode for the Dell SVID, and the partner two
> Modes, with VDOs 0x00000001 and 0x00000002. Only the first one is
> registered:
>=20
>     /sys/class/typec/port1/port1.2/svid:413c
>     /sys/class/typec/port1/port1.2/vdo:0x00000001
>     /sys/class/typec/port1-partner/port1-partner.0/svid:413c
>     /sys/class/typec/port1-partner/port1-partner.0/vdo:0x00000001
>=20
> [ ... ]
> all partner altmodes with a per-SVID count, so with altmodes of other
> SVIDs registered first, it printed the VDO of an unrelated altmode.
>=20
> Fixes: 67c92c6419ea ("usb: typec: ucsi: Detect and skip duplicate altmode=
s from buggy firmware")
> Signed-off-by: Paul Menzel <pmenzel@molgen.mpg.de>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103234750.2751=
0-1-pmenzel@molgen.mpg.de?part=3D1

