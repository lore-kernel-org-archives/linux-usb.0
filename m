Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795190126;
	b=SduIaC41G5D0KHOj9WpGlkVPi6ruA5r30nmWI0J/jEJoXqx+5TspQ3UmqTz9rQ5X2Ghg
	 Q5h+TgAUdKo17w7yIYKKmq5fZcov4e/SWZkbVEYCRWwWKVTOW2BB6GQNPwInl7Cno2BAb
	 E+ING1i7jRTynk8DotgRRIpob2Um8JK/cmL3M121AOjhXmtVDx5TyLIdTTuePuDaDnLtn
	 8e9AZVSzWkyU2gAC1WunQ+H506R5OdsP1xQai+fVgzecZVZqIHEsp/brD71y96FkLUFYS
	 ayGvCA/esbjh21F7XuqIU5AiXPBdHzuUaGHbFaxvOeHg7caAB6ZNWgE7lNDjX1IlN/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795190126;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=n+lKYVREiHPsMrsfnfwSJgKi4OusKPjuPTEQJtILGP0=;
	b=uDvLTHOq/rjWCrTCdYZEFFlbJeP+CHzRDdB1ZtjMw/cdveS24xvRzR1ycB+gchp9kE6J
	 wWU4H68bhxb1MX3WqMP24UzaC1AJJPdN6VUCL1dBSDuVENZSyT1S4oPK8OrONvJG1VIIF
	 YI/UbFOGIkqgunmuruQUfmWDjq72bwCjCfcX0nh7qqUnOsYNnAUJdLumc7cLq2ZvpXKSW
	 nxvOo2qQrn1WdS36M+UByC4Rz8lymAEsqoKFmiAkp/mVfI6KDlok0cTnav/vOTLmpnyOK
	 nHF842uwOlY1Twt125BLHqP30301i0nIvt2TzOc4DLzVIKCjJvy6vb0BkfaG/gx7Abw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=qSO6P+Y1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3233D606A335;
	Fri, 20 Nov 2026 15:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=qSO6P+Y1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 208EE1F000CA;
	Fri, 20 Nov 2026 15:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795190125;
	bh=n+lKYVREiHPsMrsfnfwSJgKi4OusKPjuPTEQJtILGP0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=qSO6P+Y1lXvxi1YEj/SzAwATGqd13+7CJmVR0n18FlRzsBKR5yZ1Ei7PsImVAsO6G
	 JwnuxhLb4lzKmjXxVTVkjY5yek4OG1dVygNNKxF0Dm4b55G83mhEjFOoqk55F3wpDB
	 x/1faVeHlNJtM/o7UBeYgLbgE2xNsQCfVGisnmYY=
Date: Fri, 20 Nov 2026 16:55:22 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: longlong yan <yanlonglong@kylinos.cn>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: ffs-test: add NULL check for malloc in
 descs_to_legacy
Message-ID: <2026112005-pushpin-economist-4f1b@gregkh>
References: <20260817064801.797-1-yanlonglong@kylinos.cn>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260817064801.797-1-yanlonglong@kylinos.cn>

On Mon, Aug 17, 2026 at 02:48:01PM +0800, longlong yan wrote:
> In descs_to_legacy(), the return value of malloc() is used without a
> NULL check. If malloc() fails, dereferencing the resulting pointer
> leads to a NULL pointer dereference. Add a NULL check and return 0 on
> failure, consistent with the existing error handling at the start of
> the function.
> 
> Signed-off-by: longlong yan <yanlonglong@kylinos.cn>
> ---
>  tools/usb/ffs-test.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/tools/usb/ffs-test.c b/tools/usb/ffs-test.c
> index 22b938fbdfb7..5c9281cbbff1 100644
> --- a/tools/usb/ffs-test.c
> +++ b/tools/usb/ffs-test.c
> @@ -293,6 +293,8 @@ static size_t descs_to_legacy(void **legacy, const void *descriptors_v2)
>  
>  		length = sizeof out->header + (descs_end - descs_start);
>  		out = malloc(length);
> +		if (!out)
> +			return 0;
>  		out->header.magic = cpu_to_le32(FUNCTIONFS_DESCRIPTORS_MAGIC);
>  		out->header.length = cpu_to_le32(length);
>  		out->header.fs_count = cpu_to_le32(fs_count);
> -- 
> 2.43.0
> 
> 

How did you trigger and test this?  It's userspace code, how can malloc
fail here?

thanks,

greg k-h
