Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFF5249AA3D
	for <linux-usb@vger.kernel.org>; Fri,  9 Oct 2026 10:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791540961; cv=none; b=OLwhaqRZw5TYH0OtQe1QW1byjDY0Fd0k/ruyl0tVg5PMvlbIbhIDNGWmggDxjQNAdO9P+TGHYqAOIqNPdm9LtOCxXdxdaghFy10rKVVXqwRk5GrWSpwg6qEIbOB+MDSh1DERY0syfutafh/oPTNsbd9TMoXiwNq+DVU462j0SLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791540961; c=relaxed/simple;
	bh=xMipYGFI+VB3/TY6PqXYs1ZaRm7eQO1+jC4d+kSJDSU=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=Ysm9VHnYJVjS17hQhDB8WknIAo8MQ0sVOptfoi3728ps40pcXFi0IFsixLHZPiDKPDhGOqmz6hvvs4iTkMPOQ0OJeOkMvu6CwNqRFBeFq3yJb37iEHwuXpVvDS5tcsFmuRChCT4biUcLbEKf8tgrMMJ63jhb7UWIw9kyoMNX0Io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=otT4LigO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="otT4LigO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EE631F000FF;
	Fri,  9 Oct 2026 10:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791540959;
	bh=g9r7uFgouV+7Z4QzcWvrJSOASL9VPat6/f2RYbn2XdA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=otT4LigO3bfBH1I0mCGAPPynjxaCbrfA1FjyMuFL5GxfOBczJu3hCT0gRebMrlTZv
	 dUAsJdYkmWq8kCNY2oE6dELnGc5JqZKwVe7Bj9ZpTN/9GjQakenb8YmBsMdzne5gVd
	 flZGXIM1OGZVVDAdFLQedyhKPJnO5QTmBziaonQvWIeS3jQFtIR2Xa9BPTVHkTh2L4
	 vFBjFG7eo76fhqPUvshPzxPYHW3T1O/hQH4E2wfPXKikEEJzbgp93EtMPW3ywQ2LEQ
	 wwX15Fpi0xASRS7+UQKfkhM4r/C5N8KiD+6orVWH966npi6x4BWSIkDmEGOb11afaq
	 bpfgmlInpYMOg==
Message-ID: <sashiko-outbox-165214@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 12/14] usb: xhci: Rework and improve the TD matching and
 skipping logic
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mathias Nyman" <mathias.nyman@linux.intel.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261009095834.561578-13-mathias.nyman@linux.intel.com>
References: <20261009095834.561578-1-mathias.nyman@linux.intel.com>
 <20261009095834.561578-13-mathias.nyman@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 10:15:58 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> From: Michal Pecio <michal.pecio@gmail.com>
>=20
> Matching events with TDs and giving back missed TDs is carried out
> by a complicated loop. Replace it with a simpler linear logic:
>=20
> 0. Having verified that 'td_list' isn't empty,
> 1. Scan it to find the matching TD and count missed TDs,
> 2. Perform necessary adjustments for corner cases,
> 3. Give back missed TDs, if applicable, using a short and tidy loop,
> 4. Check if the event refers to the expected TD and proceed as usual.
>=20
> Besides cleaning up the code, this provides a few improvements:
> - when the skip flag is set, no TD is given back unless we found a match
>   or otherwise know how many TDs should be given back
> - when the skip flag is clear, we know if the event refers to a "future"
>   TD so we can log this in the Scary Error Message to aid debugging.
>=20
> While altering the error message, drop a pointless goto.
>=20
> Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
> Signed-off-by: Mathias Nyman <mathias.nyman@intel.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009095834.5615=
78-1-mathias.nyman@linux.intel.com?part=3D12

