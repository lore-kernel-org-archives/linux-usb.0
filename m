Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E312DE6E6
	for <linux-usb@vger.kernel.org>; Thu,  8 Oct 2026 13:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791467150; cv=none; b=B/kc9oSyLNhITaJ/7GODlUY9xh/s90K8rec/Usm0X1Gq+8KUr61r9qFQyvnCr5Fz3RXXer72CGUig6lv0UBVFQY6wu++1jgK1bAr4Xt3PYE0bGfjPOxqsZUAQGqKaRIBq/nzm+p/pK5V4pI+dkOLXSzPyBPSp42okwiq8MN2H0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791467150; c=relaxed/simple;
	bh=LokHk5VE29ufv/928gwyhqjGA8pAStPaFAUfsUrRORA=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=n6eJ9TNdsKHFk4N8jhIgNdd6T7DFmrIUyvgtnbO+f/y+CmetE2RgQMDF6ufVHiTxLOn0Kp4meElpjVO2JiRaUXvLg7lb3PTJGRhYRhrLR64XyGPwahOEGmGEm5aEFdSw7JPu/a4rHVrcWeLNueH02vY2iZgyBszK7UdKguNYf9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ayt5BqQV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ayt5BqQV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 317E31F000FF;
	Thu,  8 Oct 2026 13:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791467149;
	bh=LokHk5VE29ufv/928gwyhqjGA8pAStPaFAUfsUrRORA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ayt5BqQVgyT7mZtslwLq2gy37stsILthVBviip6IMpSCdW3dVCA+9DMJxuR5Jmc1W
	 51OOTSqpnwGLiFHAs9gtOCrihhP881QHfrW0BN7e2ODyUshWpHJBCvNPXoj3o2M6Ho
	 4wzUUWMqgVU/m2MX/weMhHaIhZ6NYMQ20YnleYNQeUpvbMHT4XIzCgsd7rfI2T2r2E
	 87kDDoVgwiMdU1tPlk5rW3kjnkuXpo1FFaRfutdorRdZ7ClKCydarE1XDYRKoUn8eL
	 wsL686HfjDpwGaorDsWSTdHXQ1OP31iP7mS9hCuNfIWRnD56adkOnK9xSnEbl+cFxe
	 171hQ4WrN2neg==
Message-ID: <sashiko-outbox-164241@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: uas: do not leak error codes from
 usb_alloc_streams()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Oliver Neukum" <oneukum@suse.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261008132711.211908-1-oneukum@suse.com>
References: <20261008132711.211908-1-oneukum@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 08 Oct 2026 13:45:48 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> While a UAS device is undergoing a reset not triggered by
> the SCSI layer there is a short window in the error case
> of reallocating streams during which internal error codes
> of the USB layer are exported as nonsensical queue depths.
>=20
> The error has been noticed by Sashiko in a different
> context, but it is a general issue.
>=20
> Fixes: 4de7a3735bdc4 ("uas: Fix reset handling for externally triggered r=
eset")
> Signed-off-by: Oliver Neukum <oneukum@suse.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261008132711.2119=
08-1-oneukum@suse.com?part=3D1

