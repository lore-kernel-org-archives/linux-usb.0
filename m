Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794921579;
	b=OT988yCgF/0xO/owASCOUJYIST6DhDqrb1oRLyTqCq2RQxa6FJi2RzAkAII9OlhXZtdy
	 AqcYoO3vvFm2xFxJgJp6FHpC5yu/HbMK2MZ9j+ODRe/b5IAB1A1z1FReXyySuJaUnej4a
	 HWdCLS7YnkhTZGEo8sgNdQdi+zAhyn2hWh/8xRcRf55IcTt2HUWbSjPYCr2NhuBTi2gxb
	 PqY3VQ2shbzg5dmPYMoC3ARdS5NBlaLxfFmM/U7j9i1JnuBlILPJ5GZSGj7RKcQn5suvu
	 hjsqD+Prdf6ePvwAE0DtJGgIsQ5wMF4uJWjJqQxmAnP4dDGu2rjdQxxuaPpum64Oiug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794921579;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=qNEF4XOKOPBvo32zla6qdpASomUjSC2nDcWZrRS/XT0=;
	b=Umpl/r+mDqc1x0o2OrzclaN6tbHEmQ3n/fpC4ODTCX+ea57jxlVwR0eAuY49Q5lpQoMZ
	 CRiwYe36k7QIU4dN/HCdkUzw5ApXFTtKv99vvNNw+i/PNcrHZAG32z+QvPApTOGzGr7xK
	 Ue7wnegroTF0qv5NM5WPKAebDEktBHttjrYrq2vxkUvOxSkB25Twrn8nEmrtU4vXmhExp
	 0JwlA3CHGppn7WRErzbWBQwep7bFVrdq+bO8zzd+E17+DWDw0OpQB3K+5R8ohWGs2HHkM
	 c7svNH1sGfsQ34YtSNBq4sexvM7Wdlmcrj8JZVLExGaCPqgGLEi0eZ160Y/O6bb1nqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KKWY7EAy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BFE9606A31C
	for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 13:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KKWY7EAy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE0401F000C6;
	Tue, 17 Nov 2026 13:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794921578;
	bh=qNEF4XOKOPBvo32zla6qdpASomUjSC2nDcWZrRS/XT0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KKWY7EAy4BASeT9mvtHwKbvNzqpaKANvzqDWFyX0kzlL5RqzEckj1Ib5+Rv8owKsN
	 3TVo0jbRNG72N3Ym8B5mv+j75F+7RcVrSKLzKuzqoXiwu6ENmgVbinWMFosKeZt2cG
	 CBvhBzD57ETtmCcG75wazkfh55jPWw4qJDUZXaIhFQUDhrgEqVfH5973Ti5wfuWoM+
	 FkYHw19cJZiCRB7ecfFKQjLPxmMoxTk9wP5ZrTMPz64pXpilFWiwAjprp4hZARr0y3
	 dgryYAYzRewHwkGNhVfMnhwu1g/FxgUqiuqnoSVDfR3RVG66qQgfbDvxCKCr8Ncooq
	 famJTNDDmphqQ==
Message-ID: <sashiko-outbox-218864@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] usb: roles: wait for callbacks on unregister
Reply-To: sashiko-reviews@lists.linux.dev
To: "Keisuke Tsukuda" <tkdkei@outlook.jp>
Cc: =?utf-8?b?bGludXgtdXNiQHZnZXIua2VybmVsLm9yZw==?= <linux-usb@vger.kernel.org>
In-Reply-To: <20261117125825.27629-3-tkdkei@outlook.jp>
References: <20261117125825.27629-1-tkdkei@outlook.jp>
 <20261117125825.27629-3-tkdkei@outlook.jp>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 13:19:38 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> usb_role_switch_set_role() and usb_role_switch_get_role() check the
> registered flag before taking the switch lock. If a provider is
> unregistered during a role request, unregister can return while its
> callback is still running. The provider may then free memory used by
> the callback, causing a use-after-free. A caller that passed the check
> can also enter a callback after unregister returns.
>=20
> Move the registered checks under the switch lock and clear the flag while
> holding the same lock on unregister. This waits for active callbacks and
> rejects callers that acquire the lock after the flag is cleared. The
> preceding Apple DWC3 change avoids a lock inversion in its remove path.
>=20
> Fixes: fde0aa6c175a ("usb: common: Small class for USB role switches")
> Cc: stable@vger.kernel.org
> Signed-off-by: Keisuke Tsukuda <tkdkei@outlook.jp>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117125825.2762=
9-1-tkdkei@outlook.jp?part=3D2

