Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0BD13AE706
	for <linux-usb@vger.kernel.org>; Fri,  9 Oct 2026 08:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791533841; cv=none; b=J5P2Z//LptOGYJzFAb6H57DmoeSlG0P8FdoIXZ3fWatF8B43HXKglP1Dq4ZXuObiKmfw0fIPQ5W1r8jRSFrxN5a820whJJf/e7hYZ9evcOsIUpv4yNek3i+iG8mkCjZ8AYYFy+WmqMIY+diNf+lJtnGzeDvPWowLlDVPOgVptBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791533841; c=relaxed/simple;
	bh=GY2gk9O/iXgDC/t0RJDCka19fSt9Juzd5+I/QLzu5f8=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=TNG7ugBPU+tRgaNmSmyU2u/Esqcq2YV/quNh2VASZka4lPW5NUPdKmjJTKZwIizN6a1ggSm7Xc5wJu98YNBteQtHjEja7VrPADqOgaDysF7rIdwPklbuS4zSHowXiv52KnPa4PLezBRRF8Z24v2rdZ1Mv8jsE4nRAOg9DMAgQGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mKN+wUJk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mKN+wUJk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C0A21F00898;
	Fri,  9 Oct 2026 08:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791533840;
	bh=GY2gk9O/iXgDC/t0RJDCka19fSt9Juzd5+I/QLzu5f8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mKN+wUJkdY4gfMLIZik/lIqNIZl1tqdumsU9B9v2TnDMeq0lDtfUYvHkzE9AJEcGb
	 +3o42USc/ER8ERDvDMjjdmKj8N1L0sSBtNdAYxziBj5RNf3xyiNHjw9mS64Ids6iSf
	 ihi8Rknj7qw9ugoJDpiOH/mhJmVKkaohcQFS6jEevczRFj6HMno5WMMUqYb4zxQsI3
	 CjTEjmvN404065Ln40fPffj6YGNck7xaRo3sQTXOt9URfOw8iG1D1Pt7Ju2b/+uKOc
	 Uz3dOdDhff6kYAAc64c66f0som8YKtpDit/MW/yv/nSyMOZR6xNz/xLcEsvb00svBg
	 53vN07k2lBJTw==
Message-ID: <sashiko-outbox-165063@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v6 04/10] r8152: split rtl8156_enable/up/down
 into per-chip-family functions
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chih Kai Hsu" <hsu.chih.kai@realtek.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261008081556.47901-5-nic_swsd@realtek.com>
References: <20261008081556.47901-1-nic_swsd@realtek.com>
 <20261008081556.47901-5-nic_swsd@realtek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 08:17:19 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> rtl8156_enable(), rtl8156_up() and rtl8156_down() had accumulated
> tp->version range checks to cover RTL8156, RTL8156B, and
> RTL8157/RTL8159, including an early bail-out in rtl8156_enable()
> that skipped most of the function body for RTL8157/RTL8159. The
> result hides which settings belong to which chip, so chip-specific
> register differences cannot be reviewed, and cannot be added without
> touching the other families.
>=20
> Give each family its own ops callback: rtl8156b_enable() for
> VER_12/13/15, and rtl8157_enable()/rtl8157_up()/rtl8157_down() for
> VER_16/17. rtl8156_enable() keeps serving RTL8156 (VER_10/11) and
> rtl8156_up()/rtl8156_down() keep serving RTL8156 and RTL8156B
> (VER_10/11/12/13/15).
>=20
> Each extracted function reproduces what its chips already did, with
> the guards that were true for them inlined and the ones that were
> false dropped as unreachable. The one judgement call is
> r8156_fc_parameter(): its "tp->version < RTL_VER_12" guard becomes
> unreachable in rtl8156b_enable(), so the call is dropped rather than
> carried over as dead code.
>=20
> No functional change intended.
>=20
> Signed-off-by: Chih Kai Hsu <hsu.chih.kai@realtek.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261008081556.4790=
1-1-nic_swsd@realtek.com?part=3D4

