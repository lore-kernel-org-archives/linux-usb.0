Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9290E3B1014
	for <linux-usb@vger.kernel.org>; Fri,  9 Oct 2026 05:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791523006; cv=none; b=tQEZz/wJmi3MAGTPNiq65Xm0ATT/dqgnYQTpjg/YccnwHS4b7EfmSJWKfCwBy0fuBKYYVLajDX1BcaLy5D6/JLSkKfSOny/604QpZ9JANtfacwQRlCLMnO6vNzmsEQTWIrojPgU1XoNJa47OAqvcJyGg8S+suOWX1zbf0Z1To64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791523006; c=relaxed/simple;
	bh=Gq+5A0YpSBWVn/tXf8p+xl1ARTC0/ZgBN594Hzic3fY=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=oKvmBKrf/IA0SqQk7KVQSplpGtCqPqC/GMdLw/aupbRW1NuxlblzcSFtmf1dTDjYUIlMmgSBgudlGFiFDEtlqhtHqFkGI95Cgwvjs0NxV9RtqQ5m3medv8YSjDJLqAhBnAuc2YplisZqytld7JrLspH0pvN7qQQT9v3st9lVv8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PfDQ0ZUS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PfDQ0ZUS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D24B1F000FF;
	Fri,  9 Oct 2026 05:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791523005;
	bh=x+DxqCwDM0woc1gQeTj6+hs6h701ZGBkdAnYW7aEezg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PfDQ0ZUSrOqkBw4B88crO5Zl9Iba9VPS36GTzYF2w95CMt0OsZPR1/euH/XZwSY46
	 YU8LBa7I2nvIR9ycD9lqWwxNRyhUePAR61aGqcbgJ4RH1D/Yuznd5rPachxZKeAYtu
	 RPM9udus+ZN4gmADYUsYPI1oMAVtICnPuCMBmBoe8qb0g0IJi8Z4vjT3hgK+UsDGnK
	 atRwjHeS7GxwaRHgeS51g+naG/7H80aVupFMS40FuJIHq8ZsaF/J/nXhdMJhn0yDWx
	 2Gr9oCFQ0v/OU6TKjmdHs/Iqle660DXJkC42u0JWJQHv5mWmPf11/US6uy0zQeaBuV
	 +GxxyuK/RhgrA==
Message-ID: <sashiko-outbox-164879@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] ihex: reject firmware images smaller than a single
 record
Reply-To: sashiko-reviews@lists.linux.dev
To: "Priyanka Mani" <priyankamani2100@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <10da8e7f7c7070fc9a9da1d274b78f1d3f379703.1791521373.git.priyankamani2100@gmail.com>
References: <10da8e7f7c7070fc9a9da1d274b78f1d3f379703.1791521373.git.priyankamani2100@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 05:16:44 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] ihex: out-of-bounds read in consumers on 6-byte empty firmware
--

commit 6837e2beeeacda6e5491e8d86cf4e9038b12d3d2
Author: Priyanka Mani <priyankamani2100@gmail.com>

ihex: reject firmware images smaller than a single record

The commit checks that an ihex firmware image is at least large enough to h=
old
the terminating record, avoiding an out-of-bounds read when processing smal=
ler
or empty images.

> diff --git a/include/linux/ihex.h b/include/linux/ihex.h
> index b824877e6d1b6..61f1df4f7819c 100644
> --- a/include/linux/ihex.h
> +++ b/include/linux/ihex.h
> @@ -48,6 +48,16 @@ static inline int ihex_validate_fw(const struct firmwa=
re *fw)
>  {
>  	const struct ihex_binrec *end, *rec;
> =20
> +	/*
> +	 * The firmware must be large enough to hold at least the mandatory
> +	 * zero-length terminating record. Without this check a short (e.g.
> +	 * empty) image makes the fw->size - sizeof(*end) subtraction below
> +	 * wrap around, yielding a bogus 'end' pointer and an out-of-bounds
> +	 * walk over the records.
> +	 */
> +	if (fw->size < sizeof(*end))
> +		return -EINVAL;
> +

[Severity: High]
Does this check still allow a 6-byte firmware (consisting entirely of the
zero-length EOF record) to pass validation?

Since sizeof(*end) is 6, a 6-byte firmware size would bypass this check. Wh=
en
drivers like io_edgeport process this firmware, they set rec =3D fw->data.
The io_edgeport driver then unconditionally reads up to 4 bytes from rec->d=
ata
in update_edgeport_E2PROM():

        BootMajorVersion =3D rec->data[0];
        BootMinorVersion =3D rec->data[1];
        BootBuildNumber =3D (rec->data[2] << 8) | rec->data[3];

Since rec->len is 0 in the EOF record, wouldn't this read out-of-bounds past
the 6-byte firmware allocation?

Additionally, if drivers iterate over records by calling ihex_next_binrec()
on the EOF record (as seen in ims_pcu_count_fw_records() for example):

        while (rec) {
                count++;
                rec =3D ihex_next_binrec(rec);
        }

Calling ihex_next_binrec() on the EOF record reads rec->len from rec + 12:

        return be16_to_cpu(rec->len) ? rec : NULL;

Could this trigger another out-of-bounds read on a 6-byte firmware image?

>  	rec =3D (const void *)fw->data;
>  	end =3D (const void *)&fw->data[fw->size - sizeof(*end)];
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/10da8e7f7c7070fc9a9=
da1d274b78f1d3f379703.1791521373.git.priyankamani2100@gmail.com?part=3D1
