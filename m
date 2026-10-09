Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD33E39768D
	for <linux-usb@vger.kernel.org>; Fri,  9 Oct 2026 10:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791540802; cv=none; b=Ysn/DBB3U46XtKAMnypATPBccH7vuGo3OV/C0I6N9tedg9Q+uLMNYwOSnl7IF8nLCgmdIkWU3wcjA+w/QWkPEnYuEfAzRR5Wavw7++PIyI7ZxhKr69P38v96xJ98vTrHv6Ub5hk1M31lejO2YP1m7qoryJ+Z4JIdHiRTvCzzIFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791540802; c=relaxed/simple;
	bh=/zmzhng50eY7eQPVjjfhYf9/cz+N3R3pwSh5eAdkbx8=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=SG0CeKDS0L2F/CCIaSpsTnVTSxqsBLitBTxiaXphPFt0ynkNPO79TjLrzX+9giOo3C+uXpinX2RPJbFDSjqVa2Qw9YGO05JQ1+bN1/YZDZqqQgeVzxyxIJl4CZ2Koojm3Rs56u/Yoa/n3jewkBmRNfQhjQLsSUhXKr2ZzmV3bCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GCaC7ON8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GCaC7ON8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C29E1F000FF;
	Fri,  9 Oct 2026 10:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791540801;
	bh=/zmzhng50eY7eQPVjjfhYf9/cz+N3R3pwSh5eAdkbx8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GCaC7ON8+vptT2XBeVvUoPA79LqZVRrHkk3LjgR0uQE5u4PfwWR7PFC8l0Yq74lLp
	 Z+R7Kw0vkx3KraV4o0Odd8RmwbdjQs/QE3wR74kNr/fcWpL51jnoj+NYJOrIx3t8k6
	 aQ42iqQo7zDYKwAd/al0i+0h2YIh5w3G0dTkD5vRpExKB4QhNwrOEqYJg4BZgP0QV1
	 dKdcUNpkQH5LDhfCaZVhrpANrtkkq/M9AsKaBlcre7gxfi+wjBm6QOgHMYSKRSc7RR
	 ThTIytLpb/ckGS92hiC5PFipspBRqpH62RxRgpdIiELV9bmcHdsV+oqh3fSm2TVGoe
	 U8Dw+cLvShluw==
Message-ID: <sashiko-outbox-165208@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 02/14] usb: xhci: return an error if the host is not
 halted
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mathias Nyman" <mathias.nyman@linux.intel.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261009095834.561578-3-mathias.nyman@linux.intel.com>
References: <20261009095834.561578-1-mathias.nyman@linux.intel.com>
 <20261009095834.561578-3-mathias.nyman@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 10:13:20 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> From: Henry Tseng <henrytseng@qnap.com>
>=20
> xhci_reset() returns 0 when the host is not halted, without ever writing
> CMD_RESET. Every other path that fails to reset the host returns an
> error, so callers that check the return value are told the reset
> succeeded on the one path where it did not happen.
>=20
> Return -EBUSY when the reset is aborted because the host is not halted.
>=20
> Signed-off-by: Henry Tseng <henrytseng@qnap.com>
> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009095834.5615=
78-1-mathias.nyman@linux.intel.com?part=3D2

