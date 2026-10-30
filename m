Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793342052;
	b=MEY8nQNVKQBZMspdswGkwWK1wMePVy4V5H5F5fDenRY3dVGoYD7h7P/O+uPiDKC9JK4v
	 pEWtfbL4SfGXkfXBVneemNOFSIEc24KV6ZL0tBD0otQDfh3I6ViRHLv98dW3utW49I0Gj
	 7nE4GPNADz4TAlFzKnikmDfCBUuPLLUdwcTEAvDwpqa6O1A41eWzTRQkmZ0u14MmZEzkz
	 RvzBB3DrzE53g5tCgjK5tXUTWkIn7SMEoxopp0hBp91nsw1ANnyRDmmwZD38OWtypK3uS
	 Tet8WBnhwJCM16a8CS5G98Cgz14KOXWa5NclBgbwMj5kwVqw7U8GVr8I9ZfXkS9rsFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793342052;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=NfqVDabXD4fqRnQcs3xAsk/4sp9pZ4DY/LNB73onr0Q=;
	b=X/XuNwQkDqW585Qu2sA9ZBuIS3Cy6ZtzpwWEcSDRVdkuodDvHFNuvZaiB9qj0Q5O8Srd
	 UUfv2DecBdDP27UJCgCMnbs+NNnSjQ0Ni4qbJk+V9F1IdkzMaErUxte7iNMTmnCW3VIdG
	 vQDacIzoYuz8DB/lh6kVfAD4cMsai6MSgC/YT07OPnUwJuAENrgIb78CkLTLuR14Z0BBH
	 rUL7LA0EvX6aECeDnu/O35G3WfoYX20fDjpYiWdYokhd4Gwt+5udtFcOK6uqH3ykg8nKd
	 KeQ47pO/Xx9ZWZ04mA7td9GrpD8fmWhCsDnI9CpqFhuwkFD0GH0wi/frL2zbfJpuJHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=odG94FNP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 255EF606A31A
	for <linux-usb@vger.kernel.org>; Fri, 30 Oct 2026 06:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=odG94FNP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A07831F000C1;
	Fri, 30 Oct 2026 06:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793342051;
	bh=NfqVDabXD4fqRnQcs3xAsk/4sp9pZ4DY/LNB73onr0Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=odG94FNPdC1X+gB7MflKQ/JqcHaMYLsEsU79r6eU+deHk/KKcnwiKkQCOZP2cmrbn
	 yUnEHpr8iBVKPgoYLK0jKHndzVO177ynmQ/VuDv60ALox0aSM7hzgZhWXsP/P+G05O
	 6HJHmCHjMjBvh0yLAj4DzjOlj6b0iMJ5fLP3tmUYAN3+OlnV8OeEPgFlVSY1s2YgpB
	 3CZRwYb6jwH+7yvOoVNX6BswfTZ5Yyp4cf7bOBK4zrVjuFIgmD4Uyj7mb2tMZYj+M/
	 kQ9iX17vxJa3UVdI8/nhyJjtg79IEPYHwIwDBDpkGC8lU0c4eNrda2pYB31CcJQbak
	 KSBmwv2N8K69w==
Message-ID: <sashiko-outbox-190602@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH] usb: dwc3: wait for USB2 PHY clock recovery during
 role switch
Reply-To: sashiko-reviews@lists.linux.dev
To: "Uttkarsh Aggarwal" <uttkarsh.aggarwal@oss.qualcomm.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261030062509.3475322-1-uttkarsh.aggarwal@oss.qualcomm.com>
References: <20261030062509.3475322-1-uttkarsh.aggarwal@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Oct 2026 06:34:11 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> During a device-to-host role switch, the USB2 PHY may still be
> suspended from the previous gadget session. After clearing SUSPHY,
> the PHY requires up to 1.5 ms before the UTMI clock is stable.
> This was observed during a device-to-host role switch with
> a USB earphone attached. Traces showed that SUSPHY remained asserted
> until __dwc3_set_mode() cleared it, after which host initialization
> immediately started accessing the xHCI PORTSC registers.
> The USB2 PHY specification requires up to 1.5 ms for clock recovery
> after exiting suspend. Accessing the controller before the UTMI clock has
> stabilized can therefore occur during this recovery interval.
> Wait for the PHY clock recovery when SUSPHY was set before switching
> to host mode. Avoid the delay when the PHY was already active.
> This change is limited to the role-switch path. Runtime suspend
> requires separate handling
>=20
> Signed-off-by: Uttkarsh Aggarwal <uttkarsh.aggarwal@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261030062509.3475=
322-1-uttkarsh.aggarwal@oss.qualcomm.com?part=3D1

