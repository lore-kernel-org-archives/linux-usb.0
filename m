Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B82754E020E
	for <linux-usb@vger.kernel.org>; Wed, 14 Oct 2026 12:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791980401; cv=none; b=sg559EGooGLTThc2M/bbHZGFsYs8OQV8Igf0Sj6eM+gb1fDkS6kix6GeMoSArxCc5gQ5T1yc6KolgVxZfRDLNI15+rP6DzwGrukfUsao0eLddOJ1ERYIBVB/BLPBuYryrSQsxqDSHvQjtbm/Q1gwc90KDZmJQxnaqeDp+3c9mzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791980401; c=relaxed/simple;
	bh=H0rvq1Lnujz2zzMM5UQGNNvNcTyK5ff6gd8ioXPpsSY=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=T96MqsjDYBPQWPQa+QFd5+OddkKdzZEOTh8X1JOiujOzG8A1j9voLxgXa5ADW6HwjauaVBZV6LUiTJodkl+kM4X88TzEgPq2EgLw7064WC/EodFHUENAYow5hKdv1pVlwSKN/s3hry4R1VD6e55arbSsbhIXSnYU2pJnagXXNNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kb5AK4MO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kb5AK4MO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F15471F000FF;
	Wed, 14 Oct 2026 12:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791980400;
	bh=H0rvq1Lnujz2zzMM5UQGNNvNcTyK5ff6gd8ioXPpsSY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kb5AK4MO9qRBb+AmaAAbOMkVYDP4ZeXREe7rDW16LErb+VAybfIn1LkZa8L9d1Q71
	 y0CKBOoESyLDu4GGFgnysDNOqXCiNvIy20U5QmzPz993hddfcsm9A3cfP0Zqddo8Se
	 4S7HtoqfubCcSS3fBXr2A69Gh8bFljbjCPZCxIc99623VO5Y2YVrMgnde+8fAgMWQB
	 UxBVDkclrhbPdnePqdSP6NYhavYlGOUGFNVWamxs9c+UzpXCh8sjfS9TnAgBrScrOZ
	 mcSqH8DhJWJqcYkupJoLBT1qaYT23DBR07S3SjBelErEmXLpcr1f1tmidFMFxpNbCr
	 AuDkyfgap19lA==
Message-ID: <sashiko-outbox-171266@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: host: ehci-atmel: Use dev_dbg() for debug messages
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mihai Sain" <mihai.sain@microchip.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261014121656.1634-1-mihai.sain@microchip.com>
References: <20261014121656.1634-1-mihai.sain@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 12:19:58 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> Use dev_dbg() instead of pr_debug() in the probe function
> to provide a more specific device message.
> This ensures the log message is properly associated with
> the corresponding platform device instance.
>=20
> Signed-off-by: Mihai Sain <mihai.sain@microchip.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014121656.1634=
-1-mihai.sain@microchip.com?part=3D1

