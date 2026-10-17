Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 253A4470EB0
	for <linux-usb@vger.kernel.org>; Sat, 17 Oct 2026 12:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792240701; cv=none; b=fJOrIameCsXcc2LB6zPW/HHa/fOK8z/3TIjIIjkUli9aSdgqudd6Fd2G4OIKtj+Hf4u0L449UoLwQVXa1UoZSci2n2m6NdWn/e3GU4e40el3fpRjSr3HyC4bUjFR1l7Hw/bLOaBLlUgisCLLRN9iPH6iS4ckilKi0vhcQKIklfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792240701; c=relaxed/simple;
	bh=7Q7HxT8NTzlITT4tPEezeB/Ycw6C0Eb6hhXP1KSfzVg=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=MObQQRCXnOQpTTT7R8WvNlA/4r4WfZQFkr+qo+amcWxMeVomR2rjpp5zVykuE04B0XUe4G7gKYjk02VZnVDmqr39V03xX3sUmCNVda73uBnT9fjTqeue/GiphR/K5/UdlKj+9EBLaeacny2k5EH+1z1umOendhURQ6/1t1elNoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dt+wbjOn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dt+wbjOn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F4161F000C4;
	Sat, 17 Oct 2026 12:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792240699;
	bh=7Q7HxT8NTzlITT4tPEezeB/Ycw6C0Eb6hhXP1KSfzVg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Dt+wbjOnZ74l7PfRRr4rNNfnIt9ax6Z8enXSjemObJW6ddc3l/ACD315F/efyzywH
	 auOqvMqVn6zby9iHdRf7zaRXEoLj80jTvhx+DDyMplq1Vatcv//kP3obq/9QL82lQb
	 F4Kc00GGtneCWfPuquYDdJgpt0L5KRVUG9wlrnJWfqu6iAVYaknS7joN48Euc7iLOB
	 pCTwAYGtrR0qsmUzvelgQMGz2Ro/JwLdzAC5ZR3rBasXO94b8saCpg/UQ/PXjDNgmL
	 91Rdjem3CHLWhRVKCyGHa/u/gWRUi61mFLtQ/KDmvrJtBmm4CD7lW9Y0SN9g0UXOIT
	 I/FbU24P1QO1A==
Message-ID: <sashiko-outbox-175506@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] USB: serial: usb_wwan: handle urb allocation failure
Reply-To: sashiko-reviews@lists.linux.dev
To: "Johan Hovold" <johan@kernel.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261017123515.1788872-1-johan@kernel.org>
References: <20261017123515.1788872-1-johan@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 17 Oct 2026 12:38:18 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> Make sure to bail out from probe if URB allocation fails to avoid ever
> dereferencing a NULL-pointer in usb_wwan_write() or on resume of an open
> port.
>=20
> Note that URB allocation is not expected to fail unless doing fault
> injection.
>=20
> The usb_wwan_write() issue was flagged by Sashiko.
>=20
> Fixes: 58cfe9113e48 ("[PATCH] USB: add Option Card driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Johan Hovold <johan@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261017123515.1788=
872-1-johan@kernel.org?part=3D1

