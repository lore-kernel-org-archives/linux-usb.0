Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D577E36F90C
	for <linux-usb@vger.kernel.org>; Sat, 17 Oct 2026 20:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792267278; cv=none; b=t5SacomIDHlKD4vU5KTN4HsJc7m0PfHs4Ktm+0+wPHaQrXjZq6VLjPpHVet02VymYGq2+dg6+AxLakwCGV+u14zcKYhZxOgShwARL2JBeJtUyRHBHRXhvqj8EtbwxQipjpKooZHFkNaX6Vmw0vi4chFh6sX5+Efpyuq3qlj7WKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792267278; c=relaxed/simple;
	bh=QKjgSqSenwXSUAyyQsmP4CnRv7c+8IqfOfGUugshdgQ=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=PbmHfDLoY6RsGeimRoj63UTxQ165mFdbV7adYeNf5rt22VX6igbzz8FKyGabcHbwmmqlHhgh3oi3eLscJOIUuWbZhliyW3MwnNG3uO8mnJyj+PwoiHnPuUK7mBf0iZpYNQNMFppwkPJjMUjEAbyXMGQzYUdo5ycZebM++2RDN3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kk05GmOy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kk05GmOy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CD651F000C4;
	Sat, 17 Oct 2026 20:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792267277;
	bh=QKjgSqSenwXSUAyyQsmP4CnRv7c+8IqfOfGUugshdgQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kk05GmOyHv3dgOye2HDB6oP28FqcbhbN6726PE+AoOPIWLxZk512ky57f/5VNNDY/
	 Rp7UcATh7r5n5QEM4EpNFYwf7kU7/JIWbe6gIDNic2znBEsAfHcW2DIQy/SRityOrX
	 Kb7pDYdW5Cy+iuNQD1xOH9ZbKw9WXFm5XwO4a4oq/8ccxPE2lXG1XcO7ncXFIiG7XO
	 1GLXZUeuDFg7jbKVX0FgKZX/N50jtHsrfAAOUNVU7WYk/sliWvY4P9zC6kzT601x3K
	 5dqSNhbuBUj8ZBh8rlpsxFw4ayz6vgz7I1ai0rQxMGL+kOJIwJv824b2kdN9BuV0Br
	 wmBeX8vTJy3vA==
Message-ID: <sashiko-outbox-175811@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: Use DP AltMode defines
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sre@kernel.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261017-dp-altmode-dt-defines-v2-4-7ab3d93553dd@collabora.com>
References: <20261017-dp-altmode-dt-defines-v2-0-7ab3d93553dd@collabora.com>
 <20261017-dp-altmode-dt-defines-v2-4-7ab3d93553dd@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 17 Oct 2026 20:01:17 +0000
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
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261017-dp-altmode=
-dt-defines-v2-0-7ab3d93553dd@collabora.com?part=3D4

