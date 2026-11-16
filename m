Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864765;
	b=qQ8fTfWwMCvKwh1Cyb4NnbjxMoUZRHb9X7z419CJdMtmCI58QHG5FV0AiyWolxqJYae3
	 RQfpCrld+J1hEfxEyg4eKM2ZrWTE4Qb+39yHG8+gHg2PsMLPX7fNKZ1Ikz895oiZCXfU3
	 DOqPmPf5OQuxhCUPKSl6m4BhH+HfvoD1bGreKEO8xJjojsX3puuZLb7zpM2/NEOpp8ud3
	 lCmZWMzuCaHlYdYwRlJc0+fJmXHbYVTYnvbA2Y4NZBxVfojKUdzpxYtP+pkDoasiYXdgH
	 heP/dGV+zr2gtvFP9VXef+J8lvMjoZogD9Y0LRlvZrBSxZz0DMMJuwCaS3Xcuz7SqqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864765;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=KBxoqBkgxgr6VwTNvx402Tiz1SJlJ3dHQsjPDVRD2uE=;
	b=PwFnI/W5IxCLPAMnKw/Hv/9xoCB7fWMTZ2/hO+MJELkiZ9fXndtMTvk/1WaaeQcG+MEb
	 OJBwPAxIigYYxVLAZMtgJrUlGKQckYBFY8eWU2bLDZiTKSf2tdRypL4TAd5hjulNjIoJ7
	 azYEdmYnKU5mLGn1Zxim41xnHynnxSpD2TdUb3FyVttTvsvWITvYQc0bMNXWudrUL6TJw
	 2YgU/V+t8J9sM4BPExhLZZN9uDEfg1o0Z/s0tUjddxw+s+jC63qJNUac8qNN+9H3Jf+Vo
	 ZsJdPjqazFkpQ8erJbLU7805LNrje0sv/yy6evCqfUFJEvWS/RO9kEflte5I94ZXITQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LWZnDezO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70CD1606A331;
	Mon, 16 Nov 2026 21:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LWZnDezO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C64611F000C4;
	Mon, 16 Nov 2026 21:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794864765;
	bh=KBxoqBkgxgr6VwTNvx402Tiz1SJlJ3dHQsjPDVRD2uE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LWZnDezOuf2zAUIfUYjlm10aE0ON8HSjHWvkg8StLwtCEjiQzjZyKZkJaZGfa0IpO
	 ZhbE7zE2iWwr9L43U7Y3HjUKavlBWNr3xd0GLj13Sbw8YGVCE/o9IZzSPKOyiOboi6
	 JfedO0z/wq0d4810jgf68iEdSUPpIXALHyVHx85Qukhfvu8JsjL/J7Muwt0JW4bNXj
	 e+NqEZoZzo+lTMuXKMlQsWdD9TlHbAU/JgKRQBlPcoCx6+hGGKCUQqaSgbNVdCsZHA
	 9WG0hB4Sr0NsdM+Qs1MsWF57Kz7bDT/GtZz4FpHdkxYvByiwP4Qf9xhy6fZoSSLB0G
	 rQKhjow9wyx8g==
Message-ID: <sashiko-outbox-217732@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 06/16] dt-bindings: phy: qcom,usb-snps-femto-v2: Add
 Halliday HS PHY
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stanislav Aleksandrov" <lightofmysoul@gmail.com>
Cc: mfd@lists.linux.dev, linux-usb@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261116-halliday-dts-v2-6-2c92438c6c46@gmail.com>
References: <20261116-halliday-dts-v2-0-2c92438c6c46@gmail.com>
 <20261116-halliday-dts-v2-6-2c92438c6c46@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 21:32:44 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Document the Synopsys femto USB high-speed PHY on the Qualcomm Halliday
> SoC.
>=20
> Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116-halliday-d=
ts-v2-0-2c92438c6c46@gmail.com?part=3D6

