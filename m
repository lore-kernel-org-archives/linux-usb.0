Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 203E41E0DE8
	for <linux-usb@vger.kernel.org>; Wed, 14 Oct 2026 21:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792013713; cv=none; b=nEsIIcnoCE2HiqTwd5DPAvJYW4ba1wCGiR0+0HaTId+QQPky4QsBG1ooomflFc2fxBMhlGauhB4QnP326VAqR2yRmuqwa/QYbs7JFhPCNPM4tKTOiUosBsEWj9DHAb4n2IX4o4wjKm00iB11hZVk3aRBrlkwqWKXqqVhmsLA4f0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792013713; c=relaxed/simple;
	bh=uAjDF7zf+lGjTc5etd5P4pMYVRD/OCQETe0jh+4Bagg=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=A22ipGx4UC8ckNeJ6a9Om09FDF7o+KunnhHmLSAxYRaLDqDJUDcUFLh0mskVJxi/hmi5xYGPoUuKJCSIBB/MqVu3kr9fHfnclGOsORQMXHHl5OG5pwzDIeQApsnjDcs7CvclJos5ykmAOvC+R7GFQusGnhnAbyoZJPor8WszOds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RYHUeHZ3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RYHUeHZ3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84BCE1F000C4;
	Wed, 14 Oct 2026 21:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792013711;
	bh=uAjDF7zf+lGjTc5etd5P4pMYVRD/OCQETe0jh+4Bagg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RYHUeHZ3kn38BiLniAauDfsNbLrz/sPxl8YQQn0TddTI+nTlNjIgPrapIifcVnPWH
	 RWHjQuWuneIEeppSv/VjaZCzWQUlOjLjEun/VfJTDWjC3FAgN2yt7BcBWl9za/0HUH
	 tOJWQx4Ko93R8C7X+70ruwPupKbrtNhyRYMV+fCrhQEut3oh8rLEnrAWOsStjy4BAn
	 DgXGtujxWMAM39szM/kRYyAJ/1beXGEaag+dmC8PKSlSiqGHiGNuAZTQHYA+sCYvVR
	 6/s/MxY8t3e/QBQNJ9HD11XlxPbhR8x+drKq/1eRtL5QK68NDlCy+ODHfSG0UiIRME
	 YywHOKMnKi1nw==
Message-ID: <sashiko-outbox-171927@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/4] arm64: dts: qcom: Use DP AltMode defines
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sre@kernel.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261014-dp-altmode-dt-defines-v1-4-b657c9b6e4c3@collabora.com>
References: <20261014-dp-altmode-dt-defines-v1-0-b657c9b6e4c3@collabora.com>
 <20261014-dp-altmode-dt-defines-v1-4-b657c9b6e4c3@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 21:35:11 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> From: Sebastian Reichel <sebastian.reichel@collabora.com>
>=20
> Use the new USB-C DP AltMode defines for the SVID and the capabilities
> VDO to make the DTs more readable.
>=20
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014-dp-altmode=
-dt-defines-v1-0-b657c9b6e4c3@collabora.com?part=3D4

