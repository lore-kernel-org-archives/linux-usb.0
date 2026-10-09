Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D48F4582D3
	for <linux-usb@vger.kernel.org>; Fri,  9 Oct 2026 10:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791540681; cv=none; b=ClZWKRhXEfE516xFvNc2zcSAu5K+urn1LcvFyFO07SfImCfj1aQMCORed3aZO9jSuOUE/GtwJhQN0/Xb9th5V/5HnE4vQCBNazmGheM0A5HPo0Tem7B6oqs+DByWNLfDFGK6UgM2jZ+zk25poMGZDmhP6cl+KvQBl7ZgWRw6Hrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791540681; c=relaxed/simple;
	bh=spXX0GCURmW0lmLcwaGJeuxXF324Dv+hQKIk0Z1+3b4=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=VHTbA9TVq5mycS4CazAWfSlrG7M1tSe0ifHVlakz2fjoWC3eD1m1ZNt+N0fiXC3OXIw+5aXFdZPuzwCGBzRCia9WGlTERsxaeJh6RFcUEid2Wa4gNKjn/RLXGnokJigh/IgPHR8Yski0YKrJA0YmbKr1xgyaJxfZ6MV9c97jTsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hXbMkRew; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hXbMkRew"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F4B21F000FF;
	Fri,  9 Oct 2026 10:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791540679;
	bh=spXX0GCURmW0lmLcwaGJeuxXF324Dv+hQKIk0Z1+3b4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hXbMkRewE/MfZQLBzbwjhrO+riHihvaShNuZx8rfRa1oJXiX8mGZHwAGjgrB0eJqY
	 vKnI4xe7GT9BRUgqdYsKXWLK1OGSfEY0dPtxeb0aCqJW/fmTrts5OA3RaLYVTDMWdA
	 28eWJMOsJEXLxK+LffYd17sg9FpEWdFj4VT8dUfrlqPEJLImFC+qTce1/rkHfgm2bj
	 x3+uJ4FdXu2Qvx0qxNBH1y+upPzRrc/XU2k0dIGxPdPzk8nS4DeLVaZ50XyWkX8TB6
	 WThKvb01oHgYQztj/O62ByYKMAyLQQOdzfEM48SwzPGymGd8tSFdT1P3s5kJURToAH
	 PcUBuXlZ8BzIg==
Message-ID: <sashiko-outbox-165204@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 09/14] usb: xhci: Guarantee URB giveback on Ring
 Underrun/Overrun
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mathias Nyman" <mathias.nyman@linux.intel.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261009095834.561578-10-mathias.nyman@linux.intel.com>
References: <20261009095834.561578-1-mathias.nyman@linux.intel.com>
 <20261009095834.561578-10-mathias.nyman@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 10:11:19 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> From: Michal Pecio <michal.pecio@gmail.com>
>=20
> In this case we know that the xHC has released ownership of all missed
> TDs, we only don't know which were missed and which were queued later.
>=20
> URBs are queued atomically, so we can safely give back all TDs of the
> currently executing URB. Unlike the previous policy, this does actually
> ensure that the class driver will learn about the error and won't see
> all of its URBs still in progress when all TDs are missed on xHCI 1.0.
>=20
> Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
> Signed-off-by: Mathias Nyman <mathias.nyman@intel.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009095834.5615=
78-1-mathias.nyman@linux.intel.com?part=3D9

