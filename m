Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793019956;
	b=ibKFw8RA3YigUw7RWoFxNlyFYr8g9pLfet+oadZGz7rBH97Cy8F+OiWt8w0MEOLDLWNX
	 ya7B4QhLGEzRgRO1zsJJ2h94dXNE5iirl0rKZanyxwDRtKks34hjopAGZenjeoX43mY4o
	 8LCvJHnaqyG843ihELkxkOPQRqQ7LYzYzFwNh+uD3nQhWNS1oiOZymBtzBdFavA1GbJZF
	 AT9i0h5hNZG81nzBmFctfDlFG8XDTQHIAGfFi8UBTQLdE8Mr4hy3ysiGlEVn1epESR5s2
	 8gUu3WAn4b0UblNhsOc9Y9ZubYsVWL8g9ZljH3Bj4r9T8PAA+3I56qYAcHpNjwrx0bQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793019956;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=fRNKE5yeGMMeFNXGj9clOcKDejzr6pMW9hHBhDh9tv8=;
	b=hv73ikHjPrXM8SXB+UD6VrCm+wfg2mjCNuiYMI/YuUt8HO2WriWFmZd/5JNRmBtjEO2+
	 nZxBM2xIo3qnUIZr9ISektKcNgFw1UG4empsTpIvKI57XmG1AmO9tFtoyBwFvTYG1J2OT
	 WPI06EQG8WzDZ3kK0aOjg2+z0vI5KPQvqHbqA14wX2qfculxvcUI1ghT4CYN4EZLzTNAH
	 XFTV/mQ6GR4SqkZJB7vcpY/gKeLDq+ufVg2w1BjwjphWl0VOi9yfTKLK8T0FvDgc3rfDi
	 WARNlhbyAPpai9rBSpHWCfhnAGMpD8BDIME7NnQbztgs/80D3iCndEwhbAhguD3+Wzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L9jutDvf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8C43606A31E
	for <linux-usb@vger.kernel.org>; Mon, 26 Oct 2026 13:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L9jutDvf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F8E41F01829;
	Mon, 26 Oct 2026 13:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793019955;
	bh=fRNKE5yeGMMeFNXGj9clOcKDejzr6pMW9hHBhDh9tv8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=L9jutDvf4p5ZQGZBjrQx339pXC2j7CzW8819B0yrG4xeq/Ok8HssZSsNKmjhst7RV
	 xb8yzVKoux9iBAXYR9ktVcZACvP/AgUv8brBIdsORxhvdpODSiFMl2ScmrPabIcpKh
	 G+Hh40uOInHkj0JL5s7ioCH10l2k6pyCDaE438JomalCIRnLmKLolKS6pPN+0vRaB7
	 EHv6lnsBIH3L+jD0eCPdsS65nInA0jZXML/FJeKrXt0b9u9g4Vm3rtFae1IeWdzbiF
	 ZFZNqQizYCB3rShZwWcSrt4zDtqRfXJY8f05D6Y99dWHWE9JslUO8EdxAEaChhWDQb
	 WtLm+HvJH+ScA==
Message-ID: <sashiko-outbox-185266@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [RESEND PATCH] usb: typec: ucsi: acpi: fix use-after-free on
 driver removal
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?SXbDoW4gRXplcXVpZWwgUm9kcmlndWV6?= <ivanrwcm25@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261026125350.816530-1-ivanrwcm25@gmail.com>
References: <20261026125350.816530-1-ivanrwcm25@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 26 Oct 2026 13:05:54 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> ucsi_acpi_remove() destroys the UCSI instance before removing the ACPI
> notify handler:
>=20
> 	ucsi_unregister(ua->ucsi);
> 	ucsi_destroy(ua->ucsi);
>=20
> 	acpi_remove_notify_handler(...);
>=20
> ucsi_acpi_notify() dereferences ua->ucsi, so a notify arriving after
> ucsi_destroy() uses freed memory:
>=20
>   CPU0					CPU1
>   ----					----
>   ucsi_acpi_remove()
>     ucsi_unregister()
> [ ... ]
> Fixes: f56de278e8ec ("usb: typec: ucsi: acpi: Move to the new API")
> Cc: stable@vger.kernel.org
> Reported-by: Fan Wu <fanwu01@zju.edu.cn>
> Link: https://lore.kernel.org/all/20260718021142.3146566-1-fanwu01@zju.ed=
u.cn/
> Signed-off-by: Iv=C3=A1n Ezequiel Rodriguez <ivanrwcm25@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261026125350.8165=
30-1-ivanrwcm25@gmail.com?part=3D1

