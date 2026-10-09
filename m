Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC4DC47ACDE;
	Fri,  9 Oct 2026 07:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791531383; cv=none; b=eUwMxELyhp2CMVFpzndvrb7tP/j3NGR35DqkFdQQ4b6uedjo4Hcgc66JywoWpbNqjfL2N6R2NOSZXUVR5nLvTho3ciVRXSRw0llCVZzrBuE63JmWbF93d4wWsxDbXSQ8aYuN9Q7PPJFb8FcQvGqbvwoamp4Jr7rBIvqE5LPNvDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791531383; c=relaxed/simple;
	bh=ZI3A18/6p+FuaD/mbU4cj5JQzA3uU216YToorTl2Cas=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=EroZn17YKHhik8/OOhtLGo8DFoltEI/UEgT6VVJmtTRDrSEXRT9jltbYjRF10WDfzL+qjaWKXQJebD25SDEKudmYxxhXhKNvcOOws+2gykQRCrnChC8G489Y0W+OCI27LQLFejMYOplDY1bQhhtjHhryZqZLABFqiHWzhGQppXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e71tWJS/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e71tWJS/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A68F1F00893;
	Fri,  9 Oct 2026 07:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791531382;
	bh=ZI3A18/6p+FuaD/mbU4cj5JQzA3uU216YToorTl2Cas=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=e71tWJS/W66m6KDrJKKSDWU06ph6NnpLHV1+BWfrxa8j3tjGYDTCREn15QQdYwTH5
	 wtcJpB2CR+QWyYbwHTsfSxHPXH9E9EzYQ4DHZcvkLNCwrlrHNTCB7iTL1XcvioudQF
	 Fp+baQOv/DTqHFI2j48cUR5i3KuhiwhvdUjoztjkNHsie1L5ZR5/pSTzz2PSawLlpl
	 RjHbhIMRoDj5BfBvD3MAfkrgiRKbcjLnfpTiX5GhA+EtZFRTdsa+dYdjqhJI8KtXz7
	 wC1lw1g3gRhfgKcBWHR8je43rXooJdudk73YdpyqJu0Y3DaFGwsSSP6d06UBDagWh4
	 GVgOhrzv6/1dw==
Message-ID: <sashiko-outbox-165014@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/8] dt-bindings: usb: ci-hdrc-usb2: add
 spacemit,k1-usb2 compatible
Reply-To: sashiko-reviews@lists.linux.dev
To: "Junzhong Pan" <panjunzhong@linux.spacemit.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, linux-usb@vger.kernel.org
In-Reply-To: <20261009-b4-spacemit-k1-usb2-v4-1-2d98e5324d9a@linux.spacemit.com>
References: <20261009-b4-spacemit-k1-usb2-v4-0-2d98e5324d9a@linux.spacemit.com>
 <20261009-b4-spacemit-k1-usb2-v4-1-2d98e5324d9a@linux.spacemit.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 07:36:22 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> The USB2.0 controller on the SpacemiT K1 SoC is dual-role capable but
> has no internal OTG registers, this requires flags which disable
> related features set in platform data. Add a compatible string to match
> the platform data.
>=20
> Chipidea USB2 Controller on SpacemiT K1 requires 1 clock and 1 reset to
> work, add constraints for it.
>=20
> Reviewed-by: Yixun Lan <dlan@kernel.org>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Junzhong Pan <panjunzhong@linux.spacemit.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009-b4-spacemi=
t-k1-usb2-v4-0-2d98e5324d9a@linux.spacemit.com?part=3D1

