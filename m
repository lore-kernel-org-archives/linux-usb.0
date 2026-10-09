Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DBE14908CC
	for <linux-usb@vger.kernel.org>; Fri,  9 Oct 2026 15:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791559413; cv=none; b=OhD7uxldQTRDihjbhy7/E74kJl4+MmX5k2NEVNqRyC5+6AdBUQ3pCy4ybOOR88m08x6j/J0XwOaIWLpqDAqXxzF0lE7acYIuE29/OrebDUkbqhe/qWSQDMp6VGbkYd1CsaLSstceFDCCw1oyl9o9BldfebaW9XmRwVYCCzQsJe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791559413; c=relaxed/simple;
	bh=IrbpdKwnfHw+hIkXOcyrHf52n9nEgjOaSFZRBK7kKFQ=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=CFLWfE8Vvle7IZ7Uumcu7XD+hcGHrD1anN4Ej803VV/Nm/iGmPJOxOltAtQynWmChAilPSt/lTIGhjf7RoBGjsRfchl8SLCi55LNMTc1O3VWFTfEc1vtJYeJBOFCUFGyiUZ0mlpV3JnxcCLUD0n8dgpBPdBXJG+BzUQhtbyodG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aCCNTnJg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aCCNTnJg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF0851F000FF;
	Fri,  9 Oct 2026 15:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791559412;
	bh=IrbpdKwnfHw+hIkXOcyrHf52n9nEgjOaSFZRBK7kKFQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aCCNTnJgQE7z1LN2bMGSQwInGkfpMaHmx1/+F8UBDOs/3e7/U5ZwnEjqgewMjaP7F
	 M+poEu5qpZT/22UMi0InFn2oJ8RvT6pIJL9hV8xwzyBliOWEPgwT1topnQneppbC2o
	 OMKPb+gPNETtfttPL3Z8OolCUCafu1ufgNajWDlAMmxeFnE66VG6njLmcNxsZ+9aIR
	 +ovXkAscnD4AQGP28/MKadQB48cCL+47kOTOLoLq3XzRvkzBE+9ugDk5GlkovO2fQN
	 wOhIS0xvV68JJB/UxgMNDSLGT3014UFd5kc6KAAr2F4lXFvh1Xkigalow7SwBCKEXF
	 8+U+v09+8ZQKw==
Message-ID: <sashiko-outbox-165762@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 04/11] xhci: check device notification type before
 forwarding wake event
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mathias Nyman" <mathias.nyman@linux.intel.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261009151624.618967-5-mathias.nyman@linux.intel.com>
References: <20261009151624.618967-1-mathias.nyman@linux.intel.com>
 <20261009151624.618967-5-mathias.nyman@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 15:23:31 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> From: Hongyu Xie <xiehongyu1@kylinos.cn>
>=20
> The xHCI driver programs the Device Notification Control register to
> only enable the Function Wake device notification (N1), so any Device
> Notification Event TRB received is expected to be a function wake
> notification. handle_device_notification() does however not check the
> Notification Type field of the event (xHCI 1.2 section 6.4.2.7, DW0
> bits 7:4), and forwards every device notification event as a function
> wake.
>=20
> A host controller that delivers an unexpected notification type (e.g.
> due to broken firmware or emulation) would trigger a spurious wake
> notification on the parent hub.
>=20
> Parse the notification type and drop events other than Function Wake
> with a warning, mirroring the slot ID validation in the same function.
>=20
> DEV_NOTE_FWAKE is the DNCTRL register bit for notification type 1
> (N1), while the event TRB carries the notification type value itself,
> so add a separate DEV_NOTE_TYPE_FWAKE constant for the comparison.
>=20
> [mn:] reduce warning to a debug message
>=20
> Signed-off-by: Hongyu Xie <xiehongyu1@kylinos.cn>
> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009151624.6189=
67-1-mathias.nyman@linux.intel.com?part=3D4

