Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDBE03FF8A5
	for <linux-usb@vger.kernel.org>; Wed, 14 Oct 2026 21:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792013769; cv=none; b=ANZ607yTgxitr8pvdTsJT0MSewFPhzl58CHBmmLTFM32w70LQorBWFvHixm31eMnqd3X0Nide50+wRYXBrRFf7bzxcPDohZUvFA0StdA4LNUWjXgBdBnC2hxaJ37coVQfZVr9l8DPsBB/kQSWEcbBNM3V0GRturqRuOzLRWv84o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792013769; c=relaxed/simple;
	bh=vovZx23YJV3F7KusW8FOfjgdiT/uWjwJt+93Jowqe44=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=Qp6TpdMpzt+K8havbp17YHGtVSR2L0VW8MErNkbhtngxifPlSAryOUf139Lazpg+sULS8ngIb8H8jQ43IGjlwMw5kbNBcrCHonMHqGC1FC+VUcu4KILq6Vt44syfDHrBXZm2srQhVHxmcVetvG7xhijLxpODoBLtYxELe8k53lQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dbVgwSae; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dbVgwSae"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70D9B1F000C4;
	Wed, 14 Oct 2026 21:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792013767;
	bh=vovZx23YJV3F7KusW8FOfjgdiT/uWjwJt+93Jowqe44=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dbVgwSaeiuOp8FLxAd8RA29mX+Y8S9uJWGCvfGbIJwDvh6D9EOvarZ6g8zKVvQDkS
	 pmBmxk9zvxnpfxc0gODSaxwbzO9MWje/CMHHcf65GU2gSCCKwJEl4KZFQxqcw87st3
	 zGIllcgfP5MGbWT2LxMZiG+8IDSFF98xu1KkoC9ahw/l/P7zA93T/tc1cC9cYSxxiO
	 lt1FMCXVbrlHMYPFGdra9v9Oa2lir6gK+wtCLuQIDp53UzjINRVOKn83NmjeDEpGYW
	 EYOJQG9anpKcLNjOTBo0IxejOhCu2aijEyK1A25nwMnfMaWoxQ9CkPp92dV+xAcsLo
	 pugyzA9D7Iabw==
Message-ID: <sashiko-outbox-171928@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/4] arm64: dts: rockchip: Use DP AltMode defines
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sre@kernel.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261014-dp-altmode-dt-defines-v1-2-b657c9b6e4c3@collabora.com>
References: <20261014-dp-altmode-dt-defines-v1-0-b657c9b6e4c3@collabora.com>
 <20261014-dp-altmode-dt-defines-v1-2-b657c9b6e4c3@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 21:36:07 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> From: Sebastian Reichel <sebastian.reichel@collabora.com>
>=20
> Use the new USB-C DP AltMode defines for the SVID and the capabilities
> VDO to make the DTs more readable. This also fixes up announcing
> 0xffffffff, which is simply wrong as that allows using the port in
> upfacing mode (i.e. the board receiving DisplayPort data, bandwidth
> above HBR3 or pin configurations not handled by USBDP.
>=20
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014-dp-altmode=
-dt-defines-v1-0-b657c9b6e4c3@collabora.com?part=3D2

