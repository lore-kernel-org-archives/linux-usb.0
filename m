Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABD6E1F94F;
	Mon, 12 Oct 2026 09:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791797002; cv=none; b=ryAFTWKiYiR+eSW0frowAlm0QGDwqq8Ol7XncwYG/FR0mSQtjfZJpxMSwc+AdjHatff54gU6G3EdbLESSDt07rfwxOjDrKPVeLT6tfM6ULUkDU/7n8fwIaQsD4dLTI62Za2QYTOqC8+Q4kGL5HLBlcWC/mX6FmCBw+fVDXI0RPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791797002; c=relaxed/simple;
	bh=5v3VovCCYtdU8ji3r7HjtEnX9Nv4lHqvbkOVY2gw+Jk=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=paorlqdkmA2xORAAAhl6pw+dZJqCP79smkCVVZLmzszvlaQdYpSaY2YsjeYC2u6otPX4x9PPemB0BstZPVIPYss767VHB+G9meSlBE4e8sSZP5/6hInSejEChUsFnigehPnextS9tQ1uK5jQsLc7iO2nHhQKOHAoWv/yIYKeDNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jvpdghvw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jvpdghvw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E18B71F0089B;
	Mon, 12 Oct 2026 09:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791797001;
	bh=5v3VovCCYtdU8ji3r7HjtEnX9Nv4lHqvbkOVY2gw+Jk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jvpdghvwzh0nH8gfY7qW4vJ+RxM1qGgziZ09821CnCp8oLbUK9gHQrIWjJDt57F+1
	 pjwoPzup95YBqyTKPs/5bljH1mHwY4nR+Vxih+IZNcUqZQEwA5RVWTI+7Kq3di6y3L
	 LphDQaY9BvUEiKe0QdlTmuXPU7bB2pKiXKAiresg/ygr+ZyNhlWSU1PK2APFkQgwwZ
	 n+SXyps8KCwhA41ybhcwHY20sevhWRcl6KBBJM3CcLtl6wobSC4VBJDdJT7vrLIpeC
	 JyBz2M6a+YvGX5vWQp8WXZPkmmbgrikcMksG3HxL92UT+yvGfArHJ3P2DOKpGV8b5j
	 9AXYjPeEhnieA==
Message-ID: <sashiko-outbox-167895@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] usb: typec: ucsi_ccg: Add cypd6129/cypd6229 OF
 device IDs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Akash Kumar" <akash.kumar@oss.qualcomm.com>
Cc: robh@kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20261012091658.635441-3-akash.kumar@oss.qualcomm.com>
References: <20261012091658.635441-1-akash.kumar@oss.qualcomm.com>
 <20261012091658.635441-3-akash.kumar@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 12 Oct 2026 09:23:20 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> From: Akash Kumar <akakum@qti.qualcomm.com>
>=20
> Add compatible strings for the Cypress cypd6129 and cypd6229 dual
> Type-C PD controllers to the of_device_id match table, matching the
> corresponding dt-bindings update.
>=20
> Signed-off-by: Akash Kumar <akakum@qti.qualcomm.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261012091658.6354=
41-1-akash.kumar@oss.qualcomm.com?part=3D2

