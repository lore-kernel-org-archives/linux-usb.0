Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91DD92DF719
	for <linux-usb@vger.kernel.org>; Fri,  9 Oct 2026 10:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791540387; cv=none; b=pdNFRSFIm3p5KEaKDUr2CWT2oDYkarOE1Vi46ubEKMDVmARWcKabfBG4X2LFwS60Q5gq/m5NFep0wFn33V9MZzwOkIhImj2j6KOiWxcEeX/qWXtuN6ohzRWZ3Hq+oOxlTe1SQ/FQ2GKHNHcP7BBA6PIuDwva2GfL+pQEWNdiOtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791540387; c=relaxed/simple;
	bh=HI0HjCjKOzjjr74guvkXiitutX39QenlYmVCBMlyFnc=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=TgqBH/kukeJeBYeaWn2kOLRazx9UEqS2hQefLFbhlWTW/MgRMorLkn+zd41zzhxqqgBHvwGKkAqEc4zVxby6mKWsRMrO1pdNtocBRN7LsVWYshOXcRJFjS4l6eehYWNSW0zEg7gstur2wje8URj0Y5QXyno8G95vhLDWgy1ekfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ygjb9CeQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ygjb9CeQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A93F31F00898;
	Fri,  9 Oct 2026 10:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791540372;
	bh=HI0HjCjKOzjjr74guvkXiitutX39QenlYmVCBMlyFnc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ygjb9CeQmCrWN2HjX7319M/etAyauB6k+028SGnfXLblseMkDRZu9+Y1SZ1xA28D4
	 rco0I3X4JNtZhSZWwMbzbAvRMB2ZDClEqxZl4FFz1/2JBwrzKCOX57pRP+fNNjAuT+
	 sEKpMpGPDjo5aKQ2+MunZu5SgQqM/gH5ofpuzlFwrU0LVb/CDXwhhBdtdBwX+U68CS
	 0V5ix9BtWqaLrU++e7DSPs0tH5x/s/DmM7H2mQVbteZwa4tERdPFHtpBZ3PMwEQBzi
	 pwcYIC76zz3DqBXlBnleSEKzAulKw+W+Czl947ghPBdAzr5YLomYe+c2bHMMuxjdKA
	 c7gajevuQ6hUw==
Message-ID: <sashiko-outbox-165195@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 11/14] usb: xhci: Shorten the TD skipping loop
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mathias Nyman" <mathias.nyman@linux.intel.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261009095834.561578-12-mathias.nyman@linux.intel.com>
References: <20261009095834.561578-1-mathias.nyman@linux.intel.com>
 <20261009095834.561578-12-mathias.nyman@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 10:06:12 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> From: Michal Pecio <michal.pecio@gmail.com>
>=20
> Half of this loop is code which only executes once to deal with cases
> where no TD matches the event and then it returns. This code needs not
> to be in any kind of loop, so get it out.
>=20
> Optimize conditionals remaining in the loop body.
>=20
> Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
> Signed-off-by: Mathias Nyman <mathias.nyman@intel.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009095834.5615=
78-1-mathias.nyman@linux.intel.com?part=3D11

