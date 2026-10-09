Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54022346A14
	for <linux-usb@vger.kernel.org>; Fri,  9 Oct 2026 10:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791540135; cv=none; b=Pptu3gPZFzAv6r19z7UcSKkltDdSbSgv2M/KU3APx4Bhr3YOCGUh4uDFhROfY6ai++4TGCzLAzbhiNZfjWFr4HXEY+UQO/3n5yXbecKWQDbAGLB6qYoXojE8B3hkKC85Ezg5DSVZFg0kVl08rKbdScMgJfUU/D2svLgkZATM3VY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791540135; c=relaxed/simple;
	bh=7y6WwN9cIeqE2Oo1A/kMI7u8g+TVZ65+JSkC+ATY2Hw=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=JAgwdnAeLKpmFg++CBwl3EtgYgB/o6ZlrRYINi1oPvLqD8iVPhLVg7X3ixb6Er2mWpdjPGwZu8pwC4/tqVOp0ohTXo+8BFdbFo5hgugaDvYi0CWw+qw1oMzcaHZFd01Pj0P2Ejg8pi8CIsSeQ+mDsacZcbZcK8lrwe1/f98mgG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Uv00KGkZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Uv00KGkZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF12F1F000FF;
	Fri,  9 Oct 2026 10:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791540134;
	bh=7y6WwN9cIeqE2Oo1A/kMI7u8g+TVZ65+JSkC+ATY2Hw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Uv00KGkZ7VdtgMsbP/i6YnX2OC43A7x5d275jwb51N8Bp0u9d+oPkGFPh4KPB+S5e
	 CXGDvQVKydm35bcmbw50s7EqLW8jYjKQDyPmnXv2oJJr+rtDP8Gvf380eq/bdxoDRf
	 5CnlJfJ7YQuwizNy4IV5evq8Txmnhd10d9pSu1fkUUSfU1kQpXCHkteZJhVySSV3wm
	 7O+YaH6Ti0oPlEaC8zvRy9OLXy1HhjnORlTDkyV6CcNvuE8rFTvBXUZcXUzDbtiCWr
	 eRQ5hhY7Yc39gvWA35UQLt2CQ7EJSsCNjFX3/1iQ3hvM7ZYZ8hmxZF1QIZt93Jv2RP
	 GMeHY9MSq5tQg==
Message-ID: <sashiko-outbox-165193@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 04/14] usb: xhci: fix typos in comments
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mathias Nyman" <mathias.nyman@linux.intel.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261009095834.561578-5-mathias.nyman@linux.intel.com>
References: <20261009095834.561578-1-mathias.nyman@linux.intel.com>
 <20261009095834.561578-5-mathias.nyman@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 10:02:13 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> From: Zain Aboobacker <zainaboobacker33@gmail.com>
>=20
> Fix various spelling mistakes in comments found by codespell.
>=20
> Assisted-by: Claude:claude-opus-5-5 codespell
> Signed-off-by: Zain Aboobacker <zainaboobacker33@gmail.com>
> Signed-off-by: Mathias Nyman <mathias.nyman@intel.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009095834.5615=
78-1-mathias.nyman@linux.intel.com?part=3D4

