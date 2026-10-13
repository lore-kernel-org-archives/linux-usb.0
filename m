Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 829D6501F55
	for <linux-usb@vger.kernel.org>; Tue, 13 Oct 2026 13:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791898035; cv=none; b=Zh3hjzbgSbO0oCmHSr5tx8unJ2l1G/twDYcwZW71Ccf7F9AeDaECMikvFSBbbj0oeqlRObeB0Nm2MBH02+uo50plzWjnaXtbihIBCWIYRNnVlgmI6nUU8gEs++L6hJC3q2fM0CI7ZJCYWNtP6ZSeqWw0kAdmL7Kis3X74PIL7Ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791898035; c=relaxed/simple;
	bh=v8wO0SGrAK6UjohaFggDJaEhkJajy+N5rUn6n2HBnNg=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=d5ic8kG0Lo30VSuEqYX49R8NB5/NgISI+0hlwRXOJapFJPndpbQHsGhu9gVo74fc1M70Gq8jBM5jv6Q7yDcReG72n2MqOTei7sxOPZAoSQkXylfo2dE1w9tnLacvA98wMJR7Pr6jpdHhzabp6Ka5CCLt79dIZE+MEXYhKL8eS14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mp8kwIGb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mp8kwIGb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48A7A1F000FF;
	Tue, 13 Oct 2026 13:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791898034;
	bh=G+F9or7fa5XclwvoM3dYQVMRnf9POr4gcofffluIcEA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Mp8kwIGb/PeG62RP6YPCXopgStH3N3BoC/8Tf27b/7iKVxpJlmQZMdD01sw8a+aQO
	 iloUmWotNuN/KziAIY8wg5O/vFLh+R2zJ6LjBIDUJ81W1vbVV3uenYhKeGfCo56NeC
	 1ID+GMBGqdn4z0hOfc2TfweBBxGOvKwPSjx+tNOM4rIEL/ViHMBhKEEnERSLKeXfqv
	 48y98Pg73bcL7hHMe+mRbdktvh3orYLHLp4lzpE79VLoraF1xZYH4pewEVEiNHTRTU
	 gK1YactPWQX/aUtdWE5pNh83BDJ5h2kdfJd/7Z3mF8jHqk85U6Dkcv6cDadLpl2UAD
	 iHZYtdtCmFrxA==
Message-ID: <sashiko-outbox-169811@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb-storage: option_ms: bound probe-time bulk transfers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lee Yongjun" <jun85566@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261013132033.4352-1-jun85566@gmail.com>
References: <20261013132033.4352-1-jun85566@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 13:27:13 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] usb-storage: build failure due to missing usb_stor_bulk_transfer_b=
uf_timeout() dependency
--

commit 3551a3904408bdea1ed0fe7ef3aadc1aebde4e98
Author: Lee Yongjun <jun85566@gmail.com>

usb-storage: option_ms: bound probe-time bulk transfers

This commit replaces bulk transfers in the option_ms initialization path wi=
th
timeout-aware equivalents to prevent the USB hub worker from hanging
indefinitely if a device stops responding. A 30-second timeout is introduced
for transfers in option_inquiry() and option_rezero().

Link: https://lore.kernel.org/r/20261001123135.38831-1-xy521521@gmail.com/
Link: https://syzkaller.appspot.com/bug?extid=3D7317196294d50d6e55c3

> diff --git a/drivers/usb/storage/option_ms.c b/drivers/usb/storage/option=
_ms.c
> index 7c0b05a365543..1f3d984d69326 100644
> --- a/drivers/usb/storage/option_ms.c
> +++ b/drivers/usb/storage/option_ms.c

[ ... ]

> @@ -44,9 +46,9 @@ static int option_rezero(struct us_data *us)
>  		return USB_STOR_TRANSPORT_ERROR;
> =20
>  	memcpy(buffer, rezero_msg, sizeof(rezero_msg));
> -	result =3D usb_stor_bulk_transfer_buf(us,
> -			us->send_bulk_pipe,
> -			buffer, sizeof(rezero_msg), NULL);
> +	result =3D usb_stor_bulk_transfer_buf_timeout(us, us->send_bulk_pipe,
> +						    buffer, sizeof(rezero_msg), NULL,
> +						    OPTION_MS_PROBE_TIMEOUT);

[Severity: High]
Does this cause a build failure? The new helper function
usb_stor_bulk_transfer_buf_timeout() does not appear to be defined or
declared anywhere in the current tree.

The commit message notes a dependency on a pending v3 series, but without
that series applied, compiling drivers/usb/storage/option_ms.c results in
an implicit function declaration and subsequent linker failure when the
usb-storage driver is enabled.=20

Should this patch be held back from the tree until its dependencies are=20
merged?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013132033.4352=
-1-jun85566@gmail.com?part=3D1
