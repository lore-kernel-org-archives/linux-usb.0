Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A0DD4A35
	for <linux-usb@vger.kernel.org>; Wed, 14 Oct 2026 17:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791997456; cv=none; b=XpX2Vyf743z8Ovs19zHPDdBy53oOvLBcORj7CjpjIcdQWzMAl2Z4mPCui23WifVxVJdBxD6HSeBT3gMQgrWuJzp/khiQrF0PkOQb5nrBOZPE0XTQyg3ek7kVyVGgveyBKOl5AfpIFaWai7zID/0NF4J333j5xffHHNUFfpiN8pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791997456; c=relaxed/simple;
	bh=WwYO7/J7Cb/LHivwtujXdS2Y6UpQ9G71f0bPRXCwd4I=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date; b=Jbco7rxlHyQkTxsjFn9SbRMXbzzAfHOMtAlSHx2w16NSeeDZHrIQptenWTXkcpePSVNrk0x3I1GMXYIgCsfqxOVicquEa+cY/rThUAtsdr0Nysw7S1SsIdvisqC1BJt/QsUYvPTFOWPDD/eXDu1AoiUDtcarXPqbFnfr55SqKfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y41vEGi9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y41vEGi9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F1E81F000C4;
	Wed, 14 Oct 2026 17:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791997454;
	bh=ib+ScfMTX7taO3a3rvUrCx0MJr4knhiHonVbPCTFK+s=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=Y41vEGi9UEWEFfEwAg82fGBSTZeVRzac7g1zwVD8UWFWtTolTZloFtGezlRIH1GG4
	 bQZGCozKAT88pacoO/UA1vH1ShkrK60U69ni7PCtPmDsHOPzFyJ0rJifUHfRTvdh0h
	 OJwEAH5heYc1TW2k0dDS0G1zfbMfxySg0byY4NDhvBXLEZR9OfjRDP9fCc2xfT174L
	 wypgX+l/7mc9jZoyA8RYO3HRaIzG3h4AUR70fiaagmXJIVnjZkZux5x7NveO1WdMMi
	 ZL+sTw6i96IoDbAm/r1ywENq7ef6zBomPJCkgyPm2N9JPBxF8NhQDnr9ynfThV4QAI
	 o75Kk28mIJokw==
Message-ID: <sashiko-outbox-171561@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] usb: uas: validate status URB length before parsing
 the IU
Reply-To: sashiko-reviews@lists.linux.dev
To: "Olivier Kaloudoff" <olivier.kaloudoff@gmail.com>, linux-usb@vger.kernel.org
In-Reply-To: <20261014165618.33800-1-olivier.kaloudoff@gmail.com>
References: <20261013221937.41490-1-olivier.kaloudoff@gmail.com>
 <20261014165618.33800-1-olivier.kaloudoff@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 17:04:14 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> uas_stat_cmplt() dereferences iu->tag without verifying that the
> status URB actually carried a full IU header.  The transfer buffer
> is a freshly-zeroed sense_iu, so a status URB that completes
> successfully but with a short or empty actual_length =E2=80=94 observed in
> the wild during link-level upsets (Thunderbolt-chain xhci blips) and
> on a wedging bridge =E2=80=94 reads back as iu_id=3D0/tag=3D0 and produce=
s the
> misleading
>=20
>   stat urb: no pending cmd for uas-tag 0
>=20
> log spam seen e.g. on an ASMT135x enclosure and a Samsung T7, right
> before the affected commands time out into the error handler.
>=20
> Worse, this is not just log noise: a short packet that happens to
> carry a plausible header is matched to an inflight command, and the
> untouched bytes of the zeroed buffer then stand in for fields that
> were never transferred =E2=80=94 sense_iu.status reads as SAM_STAT_GOOD,
> falsely completing the command, and response_iu.response_code reads
> as RC_TMF_COMPLETE.
>=20
> Enforce the IU header minimum before parsing the tag, then enforce
> per-IU minimums before dereferencing: STATUS IUs need at least the
> status byte, RESPONSE IUs need response_code; READ_READY and
> WRITE_READY IUs legitimately carry only the 4-byte header.
>=20
> Signed-off-by: Olivier Kaloudoff <olivier.kaloudoff@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014165618.3380=
0-1-olivier.kaloudoff@gmail.com?part=3D1

