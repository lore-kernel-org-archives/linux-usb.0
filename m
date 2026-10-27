Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793107594;
	b=QeypL/w7iLL5YyJWfZLjtreJ1TMLVSaghSbEFGntEAoSvCxzxFntx9C+ActKbV4TLsL/
	 RGiQgrX/vG4cRr/VzZg5X0uoCKbWHB7Cz8YXi8lfXBIdz2VE+xVT10LHp+hPBDMEq3GbI
	 7xtCMx8nluaeHthUEHnsCALkL3Ou7m5Gwl3OW2nK3W2ZnElI+u0aHu0df6ncFW5+fnRlv
	 bPNEesZVCrayMHhgBsEdy5ocxaId/2uhA3mgmk4sfsgpJZoeMIf5WvITDE7D8V3qUAwae
	 YXe26ZDe3UNMGB/HDgGPyv98IjavXsSq3eRuDvzAOUKz7FyzA6WGaqc+iVRIQUQb8aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793107594;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ypIhietrmWKL+NuERmvvv4dcYoWhFsoTPVMkBXtKTOQ=;
	b=lOlDLGPW2MqZdZXlf8tKtEC60jnEqUcbOpJf8WAC4WqBpYmMDALgXYMZmMPtpiVzO2B6
	 962UCNt8oWtq7E01tEaexmhvnaBsAa1fMySuRJHDBOPC0cfcXTeEvpM1J0rO/+XRcojjS
	 tuHyy2T6PBW7l91xhDeq+VFzAUpegufWXH+Kvm1GLTl/L40P+7mH6w8NEUBHWbLxJfwj1
	 gXotAPkodoalCHkp0aqlBaJ62uDnrfDm0urxHNji7Ldk5y2SJseXWLNOl5fSDVNuLKQg0
	 I0FtFtlhMmQxHzkVaTwdNgMg+4DUi1zT+PecEUduzoF1g44ezLRwDgEionFrJBR60OA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NvwPAXf+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9F05606A31B
	for <linux-usb@vger.kernel.org>; Tue, 27 Oct 2026 13:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NvwPAXf+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 145931F01825;
	Tue, 27 Oct 2026 13:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793107593;
	bh=ypIhietrmWKL+NuERmvvv4dcYoWhFsoTPVMkBXtKTOQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NvwPAXf+wreqw2NKTV3LtddJpiBSmjFHuyhlgTvLSFGu/SgSaDIIWF0dUYwGhCj8I
	 HWDYhw70QK2ejCFSXpKd5nR8fWINAJJNn2kZ/G3ndHUfylcKlE3n0kl03LqW+zH4dM
	 txCJEZSxe1DCY8FPEHotvp3pDgvesgCwnd6N0EoOZDROJIn5D0Tm73JbN+SoMK3Gp2
	 s25I0hWr0yIIURIh4FPgMmNLF5Obx9aBZBY7gxqdIMhpdLiYxoo9i92I0JmMpZk2qe
	 s7+7o15sU+6+UIXiLCwFYQ012bu63u+Dg35b0I4SQS04vFyy/fKMFTvPnkxYQj6Qzc
	 KKRvNCMy1MP6Q==
Message-ID: <sashiko-outbox-186620@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] usb: uas: wait for pending commands before unbinding
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jiayi Li" <lijiayi@kylinos.cn>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261027131458.983241-1-lijiayi@kylinos.cn>
References: <20261027131458.983241-1-lijiayi@kylinos.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 Oct 2026 13:26:32 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> USB core normally disables interface endpoints before calling
> uas_disconnect(), cancelling URBs while the device may still be
> processing the associated commands. Some storage bridges may then
> fail to recover after a driver rebind and require a disconnect and
> reconnect.
>=20
> Enable soft unbinding and give already accepted commands a bounded
> grace period to complete before teardown. The disconnect sequence is:
>=20
>   -> cancel pending scan work and block new requests
>   -> stop software retries for accepted commands
>   -> wait for commands that can still complete normally
>   -> set resetting and unblock requests
>   -> cancel work and URBs, then clean up remaining commands
>   -> synchronize scan work and remove the host
>=20
> Commands needing a retry are left for the existing cleanup, while
> other accepted commands can still complete normally. Stop waiting
> when there are no commands left to wait for, USB core marks the device
> as not attached, or the grace period expires.
>=20
> This does not abort tasks already accepted by the device. If a command
> cannot finish during the grace period, an affected bridge may still
> require a disconnect and reconnect to recover.
>=20
> Signed-off-by: Jiayi Li <lijiayi@kylinos.cn>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261027131458.9832=
41-1-lijiayi@kylinos.cn?part=3D1

