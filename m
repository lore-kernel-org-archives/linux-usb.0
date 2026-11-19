Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795077950;
	b=i+0iTJKkRbOmRtz9hHg6tr6CpNaQS9F45IajjcfHAF1K/Q9TOKbDWQ2wKncq24Ua4oYE
	 6uFsXX6S2g5LlpTPvmaeRrWU1XNn5DzbdWcSaGnUKG2jlPkKNedUVDBOJQ8TjZEoEJPn3
	 8YZElC9fMqTGtX9DA1NuK037YyxcPREEEdmsFgBJ3d+ZEPEhOFC4Az1DVIIBDtAZLo6EG
	 bydy1AFL1tg6BAwLUPqrLT74qYiPgzZkXC45+Xn1Ks0qRPNUZd/x2LitONq1GVjiciTD4
	 nHH3XCbZXCiumRdnw5NC6LQzl/CpyMvI94zzRCAjyAr6CfdeixoP1d7oaYb1NbSgJhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795077950;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=n+dZFJ14z1dOTsOstE5lDkcir5mypOeXDA6aOvzkpAw=;
	b=igUQHCzcQGkzPxopcyiymfVNQ/bZBhAhol8TFGduPclO1TGh8CCsOBtqk7JCQGzpfxUT
	 zxO9VBLFjx1elhuKfITdldBZ88aN8SGHF4jHzhvSbYtgg/sMK/lOUTUQ0eRQq3ajnu7IA
	 U5rlErI4d9L0tZdQiWZQOXiVqPITyyrE+W0h5gwMFGkVeahdt9cOJoacTzqEkQ6r7ih8B
	 E11fMk07v961ZqMIJYMGdG1ct6iz+C8u2wQEnn7wIRjtB7p4sfGGWXmLMd4Z2fDD1Dvit
	 ugIirazLIFLhhrKzcr3fr0jCFBIwmfm+qXpSEAPjJmwqJUarXru5JEPLGrFM+hVVAdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KevIXcr5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07324606A320
	for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 08:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KevIXcr5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6197F1F000C4;
	Thu, 19 Nov 2026 08:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795077949;
	bh=n+dZFJ14z1dOTsOstE5lDkcir5mypOeXDA6aOvzkpAw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KevIXcr5shDKNvLrNtmX867P1Kn9lPjUiQDiXj7wHqtQ1vI0Um17KW6TXz3LscR8H
	 VKZ/buCRwe/VyEvsVtYKuTuZUba5kkAzd8k858cAkHQf3A3RpHtpxz3DiPCNRk3S1O
	 IrBT7yEcmHjlrtmNko73r8qIjIkD7Wc9SuugXcBbCTSHqYq1mTaYrTxt9etBirgtzW
	 lwSgnSrJ2XdjNn2dwsDpqt2uerYLxmA3wKhz5Ms39OE5MH9bAV7J0b1AYyYK1kncXc
	 PiObX0T5jeNtBfw7NNiiRqzTiqssoauBzr3o38MRsoa9UgGHhjvIpqet2LfqVfJImt
	 gsKhTtqDiYaYw==
Message-ID: <sashiko-outbox-222705@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: usbtmc: reject a short READ_STATUS_BYTE control
 transfer
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hyunjung Ko" <hj351016@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261119083959.1599898-1-hj351016@gmail.com>
References: <20261119083959.1599898-1-hj351016@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 08:45:48 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] usb: usbtmc: missing Fixes trailer and wrong ioctl name in
  commit message
--

commit 65820c8baf3e3185b7eb9f2281ee331492c9b001
Author: Hyunjung Ko <hj351016@gmail.com>

> usb: usbtmc: reject a short READ_STATUS_BYTE control transfer
>
> usbtmc_get_stb() asks the device for three bytes of the READ_STATUS_BYTE
> response into a kmalloc()'d buffer and only checks that usb_control_msg()
> did not fail:
>
>         buffer =3D kmalloc(8, GFP_KERNEL);
>         ...
>         rv =3D usb_control_msg(..., buffer, 0x03, USB_CTRL_GET_TIMEOUT);
>         if (rv < 0)
>                 goto exit;
>
> usb_control_msg() returns the number of bytes actually transferred,
> which a device is free to make shorter than the three that were
> requested.  When the interface has no interrupt-in endpoint the status
> byte is then taken straight from the third byte:
>
>         *stb =3D buffer[2];
>
> and the caller hands it to user space with put_user() from
> USBTMC488_IOCTL_READ_STB and USBTMC_IOCTL_GET_SRQ_STB.  A device that
> answers with one or two bytes - with the first byte set to
> USBTMC_STATUS_SUCCESS so the status check passes - therefore leaks one
> byte of uninitialised kmalloc memory to user space.  Both conditions are
> under the device's control, since it also decides whether to expose an
> interrupt-in endpoint.
>
> The same leak was fixed once before in this driver: usbtmc_ioctl_request()
> bounds its copy_to_user() to the number of bytes usb_control_msg() report=
ed
> instead of the number requested.  usbtmc_get_stb() cannot be fixed that w=
ay
> because it reads a fixed offset, so reject the transfer unless all three
> bytes arrived, matching what usbtmc488_ioctl_simple() already does for its
> own one-byte request.
>
> The check is not limited to the branch that reads buffer[2]: buffer[0] is
> consumed on both paths, so a short response leaves the status check itself
> reading uninitialised memory.  USBTMC-USB488 4.3.1 requires the three-byte
> response, so a device that sends fewer is not conforming either way.
>
> Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
> Cc: stable@vger.kernel.org

[Severity: Low]
Should this bug fix include a Fixes tag for the commit that introduced the
unchecked three-byte READ_STATUS_BYTE control transfer:

  Fixes: dbf3e7f654c0 ("Implement an ioctl to support the USMTMC-USB488 REA=
D_STATUS_BYTE operation.")

Also, the commit message mentions USBTMC_IOCTL_GET_SRQ_STB as the second
caller of usbtmc_get_stb(), but in usbtmc_ioctl() the second caller is
USBTMC_IOCTL_GET_STB (USBTMC_IOCTL_GET_SRQ_STB calls
usbtmc_ioctl_get_srq_stb() instead).

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119083959.1599=
898-1-hj351016@gmail.com?part=3D1
