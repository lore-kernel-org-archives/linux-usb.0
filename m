Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A3B9223702
	for <linux-usb@vger.kernel.org>; Fri,  9 Oct 2026 15:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791559434; cv=none; b=s74mtUppTgB7pBNvebErk6F7BQnOH8nnNqntS1U4hEgXYk7P4VBjqphUzIz52WlFCiUt7untlY5AmSgaHVRNgXhkGmoKJBuVIyw3f0OCcLfTwLrw9Y7kSVIH+4FMD9hyawUHc10A3u1OVgVSMCRa1QdYX5V9Zsv3ojLdMUQRGww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791559434; c=relaxed/simple;
	bh=bbK4jk72unsoTYSzBO19lW+MT7RaGU1vLR4uoxw4bco=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=YtLPmlEgdbWE/XtE9NJi7kEGhEo0+ls2fA2z7wKi7mMZp9w3/wHozE8m+4mMsdhBbWI5my6E1RX2jBHgFoRlVDarJqh/84UP27WxSnKm4ZWaNvB1l2H+Ffg2bZNLqZJXDruNhCZWRnqyCWGyxkf6p2sxAjodBj/FLoL7CkZOa68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QCsGKV5+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QCsGKV5+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79E2B1F000FF;
	Fri,  9 Oct 2026 15:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791559432;
	bh=bbK4jk72unsoTYSzBO19lW+MT7RaGU1vLR4uoxw4bco=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QCsGKV5+dSZyomjsC3Yd+4goztq/iNpdi4gia9BWvI6S1CWK3Ex7Miew/ZyAXZFmB
	 CsMlYpE7N5SLzR2euiniwo4bEc7y2SYlD3YvlQ1UNMExfpvbt6uM8Ontt6+Uabz6j2
	 DgrhxiLwyOrwMgt36fGVH0w7nr+yc6ZpVRfGZ1lS8giWMCrQl4H5wGYCaHbLsnHJF5
	 R4anKmliieO/AMGruCaBOnyiOo721e04xtzDTvajM9GZSAOxlM9q0Y844huBpbZOvJ
	 1BV92Vn2HdyKDQ2XRxojpROYCnZJ3dMcvlydLiKcM8dEz9AAsLiPX7RrGftSsWkEQH
	 2KAsDZOGdolRg==
Message-ID: <sashiko-outbox-165763@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 07/11] usb: xhci: Don't set the skip flag on non-isoc
 endpoints
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mathias Nyman" <mathias.nyman@linux.intel.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261009151624.618967-8-mathias.nyman@linux.intel.com>
References: <20261009151624.618967-1-mathias.nyman@linux.intel.com>
 <20261009151624.618967-8-mathias.nyman@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 15:23:52 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> From: Michal Pecio <michal.pecio@gmail.com>
>=20
> These events are unique to isochronous endpoints, ignore them otherwise.
> Update debug messages to reflect new policies. We could also log invalid
> events as errors, but it seems nobody has ever had problems with that,
> so don't bother.
>=20
> This allows dropping the isoc check when skipping TDs.
>=20
> Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009151624.6189=
67-1-mathias.nyman@linux.intel.com?part=3D7

