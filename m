Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9077F451981
	for <linux-usb@vger.kernel.org>; Fri,  9 Oct 2026 15:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791559510; cv=none; b=RI8n8KNHAoo4yBWyF4LNtY7AmyaY+dWrLrtSy0aUsO9z8SX8mhgmnlKoRGY3ZwypL4WIMGB312SHMLGKFH/boO2GkivUbgsp3514bO9ftjfNWmtOu7RN+fAlDE9eU2sF1LwDlHfqSOQTCpoJ5rhAGojaaOKJuC2IL2ByKSNxttM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791559510; c=relaxed/simple;
	bh=PV9nDOBf6JEaWfHwunbdxH/MOWd7f5rKQiNy2+52h7M=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=ezJ7GdWn3/+JOB+h3mTm0iTPxYaMqbnrH8FAkJArB4Nvr6KTOSJNOkAxiJ0IgkvRWQovDxLVsJlr1mZkCMkuWkeScv7tnYxU+l7A6w4ILDq+Tn99dSI8NSJmXvTMvcFc50XRbEJ02cnmJId4MrSiqbBpEGSb40wrW0Y0oVN6EqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RrI/aKSV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RrI/aKSV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E5911F000FF;
	Fri,  9 Oct 2026 15:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791559509;
	bh=PV9nDOBf6JEaWfHwunbdxH/MOWd7f5rKQiNy2+52h7M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RrI/aKSVX6zGWt9iHsYIHemjtFIdi4hHPOP/ZAHkK1MquF9/DTE19mRGS2t1wsr6G
	 7TpgA0xY9+FwKT4Rah+zpYtjatqj0RgH7hDi4j/M+6OA/2lV84Ka3mNFe4cuStIuaj
	 CrQdmBAPjj1MD3inklC+ISgzZAoAskp7oCgcvKovNkMxYYdKy58n9AGh9yuGycIZUb
	 EL2waNqddVq2VSCI2l54OtSMU+PrAbIrYzKLnYam8NgakMnEnLhXcowj6trkWRNAmA
	 ETczZchB4QF7RqpJ2o9zBAGm83LjAkkblo/HXuGJ2JUEVDWoQsckY4X8TEu7SO4eeA
	 yeY1ajdN+xz1g==
Message-ID: <sashiko-outbox-165769@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 05/11] xhci: dbc: lock the minor IDR on registration
 failure
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mathias Nyman" <mathias.nyman@linux.intel.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261009151624.618967-6-mathias.nyman@linux.intel.com>
References: <20261009151624.618967-1-mathias.nyman@linux.intel.com>
 <20261009151624.618967-6-mathias.nyman@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 15:25:08 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> From: Sang-Hoon Choi <csh0052@gmail.com>
>=20
> dbc_tty_minors is protected by dbc_tty_minors_lock when entries are
> allocated and during normal device removal. The registration error path
> removes an entry without taking that lock. Different DbC instances have
> separate event work items, so this removal can race with an IDR update
> for another instance.
>=20
> Take the same mutex around the error-path removal.
>=20
> Fixes: e1ec140f273e ("xhci: dbgtty: use IDR to support several dbc instan=
ces.")
> Reported-by: Changyul Lee <lcy8047@gmail.com>
> Assisted-by: LLM
> Signed-off-by: Sang-Hoon Choi <csh0052@gmail.com>
> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009151624.6189=
67-1-mathias.nyman@linux.intel.com?part=3D5

