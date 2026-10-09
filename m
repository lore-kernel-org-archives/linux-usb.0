Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBB7E3191CA
	for <linux-usb@vger.kernel.org>; Fri,  9 Oct 2026 15:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791559469; cv=none; b=htwNdLVjqPMwDI1B2PBfuojJGO1vv0gymGU0xHas53wZPNsrJoVYvrO1RtO435T9iJ0Nk3KDMEOLQT16Wt9teMsvO3ZKgxMd9FiIqYV1JIyXNIeH0+oaVqYO4PPowWvncgBB0dj21amREBZwD+LYx2bqDI8y6LBJSyswtU3hjak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791559469; c=relaxed/simple;
	bh=3obF63X6KErmWVju9Szw/hsu8sqNgXca8G89q6pT0E8=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=Xng3kAnxXtjgXaYZHx1owmtH0wPC3wUa09I/iMNcV7uc3V3plNfG1gyYw7BOwvOCb8CwhCpxG++o6msCKTU2RIqfsy9PbeC00NQxOxylCaiqQRBPaNtMvmWLNdbmNYrddZAiSjjSMN0nh8gCSIiDLilpMcbjTLrtXUHvTAa/M10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KmG31EeF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KmG31EeF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 439591F000FF;
	Fri,  9 Oct 2026 15:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791559468;
	bh=3obF63X6KErmWVju9Szw/hsu8sqNgXca8G89q6pT0E8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KmG31EeFWsR+c4AWoxpJiIp2jGD21I3C5Rc69QiKaADSImXPeKiqW/QSjl1XfuvsF
	 ImMJhzR5+RvQlqDgVoObavijjPXi1jok1st8iYbAebvY7jhLUKx6G77C5GmDj8DmmZ
	 hIezs2p3Jnm8+0ycl9O1rXEdLwAdMmOl1i5FW0ecFV6OqU+1StQMhUdgDL8TMIq1ON
	 jxELsahvpIJi64V+4Th+re0gg9dHY/RmzxVoGMDiRnESQUkwoclypZ/ZGY/x6XrPfc
	 ARXfd8g7ppRB+XWKrVDcD2rNIg7wpjdcTVy3tG+/q8vvoiNf8bcTczxcQwyUxhh6Hh
	 /pDYa5xnLTpNQ==
Message-ID: <sashiko-outbox-165768@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 01/11] usb: xhci: return an error if the host is not
 halted
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mathias Nyman" <mathias.nyman@linux.intel.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261009151624.618967-2-mathias.nyman@linux.intel.com>
References: <20261009151624.618967-1-mathias.nyman@linux.intel.com>
 <20261009151624.618967-2-mathias.nyman@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 15:24:27 +0000
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009151624.6189=
67-1-mathias.nyman@linux.intel.com?part=3D1

