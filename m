Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C77C03546FF
	for <linux-usb@vger.kernel.org>; Mon, 19 Oct 2026 02:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792376393; cv=none; b=SZ+bYQYUuvtH3INIlyw3sU6P/LftBYaxAy6Th64qowrLgiF4R3T1GV8eXAkJdvDhVpkevVnP5q4R71Ajq7CgVKXtmxcgLN07Ij+XeOYbr/C92H5BvMzITv6y1sXfdjBwupllfw2r/go171wSQEe4HDvvt6lckro2AEPziFpILWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792376393; c=relaxed/simple;
	bh=JosN+5POFRQqf5NiwvLXqy0MIbkTD4RRUf5rhPWxRYk=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=HzY8AN7QksfnRVwrZUZHWz8jAFdsQEboQmw54w9dT53714CpvqgTyVHxQchrlHHc9px4Cfajr1JGyK+shyavgYAj87e71ZQgmWODVbPOPa1C8RvXft3/swx0wTIXRSXkcsimS3XG8HGZ+/vP4jUPTYQ1wT2fWzt2RIsq+EK5BCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jEEbvUqy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jEEbvUqy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 424221F000C4;
	Mon, 19 Oct 2026 02:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792376392;
	bh=JosN+5POFRQqf5NiwvLXqy0MIbkTD4RRUf5rhPWxRYk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jEEbvUqyT5i5muR7WBa4mYQGwWi+ZOKorP4+HYYTtZIOWGsdXsvwOjG3ICT5anIII
	 cofv6l3I9XCANg36dijHT8zLb2CjyPK3XnacFWkPJetZxVqObhODQpaWUGhSkk+OW1
	 0N6FcatJGEb8rpuNLBvxwtQuIqARIL5IMKLorFmpchSdqZihgPK9Y016PxDzy9bWKw
	 tjLhKlqot+YnECifTEd7fhwDbazh8RYztXJdU/2onAE6R+1L63CWxQsSsVE9wYm602
	 /aAzzWqZsGt4jxFr9J1cqK0GmaAtH+WE63/jqDd71ieRYk6HV9QcL9svMUcG+Ri6Vr
	 C4Lhc6E8eBjTA==
Message-ID: <sashiko-outbox-176529@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/4] arm64: dts: qcom: sm8750: Set
 snps,resume-hs-terminations for USB controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Peter Chen" <peter.chen@oss.qualcomm.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261019021547.1694088-3-peter.chen@oss.qualcomm.com>
References: <20261019021547.1694088-1-peter.chen@oss.qualcomm.com>
 <20261019021547.1694088-3-peter.chen@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Oct 2026 02:19:51 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> The DWC3 controller on SM8750 is paired with the M31 eUSB2 PHY.
> According to HPG, host-mode USB2 L2/L1 resume with this PHY, GUCTL1[10]
> (RESUME_OPMODE_HS_HOST) must be set.
>=20
> Set snps,resume-hs-terminations on the SM8750 USB controller. This makes
> dwc3 core set GUCTL1[10].
>=20
> Fixes: 7a5bb9f60527 ("arm64: dts: qcom: sm8750: Add USB support to SM8750=
 SoCs")
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Peter Chen <peter.chen@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261019021547.1694=
088-1-peter.chen@oss.qualcomm.com?part=3D2

