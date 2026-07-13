Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B2833A9CF
	for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2026 16:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783959262; cv=none; b=avAX11ecErVm5L3kZt0ETeM2d4liwKkrAXeYpDKZSprRrKgteh2QIa4rjLtDGmvwuqyoGnse5OkwpgS2KilgSHpTdcujtVyIMiKfkLBmYLXQwbVja9X/OEJpNxEVDSihByQFqRtAxUkNBQxEhJO6nEsMEU7AmumhImCuulU9Nmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783959262; c=relaxed/simple;
	bh=nwuGqCHgMsCGDUJPIXmY0MQaWK6jRBkrd+rdVRXyMnw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U1xbwRrsU/DM80jT2UbRwDoumv93Bsh7s8t4f7MHyj9DCabCZtLsY5WHJj3Ewqp1d55I+tPYzicu18FWChmyC4q1weTbnnlXhDOo8NsHtubmETda2tmSJOPlbggABrg4hqZh6F7pV8aZft72se//mc7demCaG6anVA6yxdzlPc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=fSioZGFk; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="fSioZGFk"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-8eefd0c5f59so337036d6.3
        for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2026 09:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1783959258; x=1784564058; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/d2Idp6BTNkSX+qivMXTGkH1W2PCTAvfUz9lK6HNcko=;
        b=fSioZGFkcWTOMbtwD+Iwmqpk8FqOIrQkjkSJx7QvGnoNBFNBFf5qzx2OEX/eKCP7gN
         dVbyCiOT1bY9+7UKX0SFaxOTGv8JvS9tFZOnRG3K/eg2EonNs9U34+JtrQyfJIYob9/S
         6cTwJImDlox+SgEH/VvOjCQO4FUiGZSBhbsGGEbjZ7G4jpyj1Ad8e6zswSLjDAnIm9wR
         Qs/lL73HbWNooBdJ4MFCRWcM5UdGHNRysgPIpRd9ORkQq5AU5qPurt2rnlSRhr5pqesr
         fJySNTmI85bGaO8mzXAimZog48FVXd6KoHHkvwEhXrnhsOwi/fZIxQ8C39IOiv0SuVGs
         VWGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783959258; x=1784564058;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/d2Idp6BTNkSX+qivMXTGkH1W2PCTAvfUz9lK6HNcko=;
        b=bs8XB13rr0TKnEv0/jUQRAjC3t5zF4+cEzmTIQS7nVPl6ncyfT/lk+oiAoFonE/Lcz
         dSDajJ6U4zIRJqdJ3KFt6Suh0QyeesqmZ4ScYU0pCgMij6ED8PF9Gw/92jI2jevbAvxm
         lRQcGAYcmCilcCmjsYxtjww1aeiWbS7eqtm0O5+dOUz+F7XCO+8YgnU8HaceG3wIJK9o
         99XEjkTsSnTRFvkG6dfyU6XjbPxZGcMHRaMgJy2ECBoqRW8t3AuKEdUIo0zoTghgVMzE
         iMK826cykKkcipAB3nbUPIyfewA01gng4zRR3kWjEjlqVLEr8A2l2B9OJH/Fa83SU3as
         TO7w==
X-Forwarded-Encrypted: i=1; AHgh+Rpa9Zi6W+MbmQbWf3iyd1CCabGAQHmUpXKaYEoqp4siZfBKb1ymK7r8By0czVFqR+CfnHU5x3+eLqE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9QFpZYaiI7RdJkWyGb67oQ0ATsrTobO/nDOf+AvTlwzWmKRQG
	/zMc9s0UaRGBYAjYWTm+TvrRIXCFefACpBSWRl6RbYo9DPDof4wPKiG+jSGPQucQdw==
X-Gm-Gg: AfdE7cnto6uUwRfHl3mAC7a/DXtrX4SbFJjO5/e9xA7RV4Y+KSHancC79XMn0dFsWow
	QggCeaB5OaZ6ELkXB0iexu/4tRqCCFuSDubaTNMUzdi8sXpi0/UlAQfv6P1Gwk1lj1ayK5HsJSL
	krNqF567kiyET1KBkiSA6BtwW0EULcFDaRTAwd8gq3h7jRNqwmbK0cE6SC8pWJkMRgj4ewRwifj
	3x0KEZfGE+WAYDIwTNxEMG9OS+qYubieFTZF7lDLgj3FVU0PDBjTcnjiVaYnyLAr0InIPplSCng
	q5NmWHrfixxe1Q8fXjyLhTRGCdFfv+8W69PcFIOd6gM9CBeUTGQm6B2HLn18KhO2EDM0iVaBcO1
	A90GJY+863AZMSQF+h/9GgJ6gfBD7BwKF3Z1sLnGeruKPKF6h69oRsxUt6X66sdYi/NXQPMkXmo
	9L+N0tIDGFHESrxRDjTt+Sm1QwIODBNvMj5QpCS8S08USYCA1PtWDdGE5o
X-Received: by 2002:a05:6214:448c:b0:8ef:60f2:5b52 with SMTP id 6a1803df08f44-90401584a34mr113402366d6.37.1783959257852;
        Mon, 13 Jul 2026 09:14:17 -0700 (PDT)
Received: from rowland.harvard.edu ([2607:fb60:1011:2006:2008:aeb7:73d7:d8ff])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ffd50e10f4sm131941746d6.1.2026.07.13.09.14.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 09:14:17 -0700 (PDT)
Date: Mon, 13 Jul 2026 12:14:15 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Griffin Kroah-Hartman <griffin@kroah.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] usb: core: Add size check to find_next_descriptor()
Message-ID: <7965c2fb-5615-4978-aeca-c31da3302368@rowland.harvard.edu>
References: <20260713-usb_core_patches_1-v1-0-7721c2b33f53@kroah.com>
 <20260713-usb_core_patches_1-v1-1-7721c2b33f53@kroah.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260713-usb_core_patches_1-v1-1-7721c2b33f53@kroah.com>

On Mon, Jul 13, 2026 at 05:43:51PM +0200, Griffin Kroah-Hartman wrote:
> Add a size check for the descriptor header in find_next_descriptor().
> This prevents a scenario where h->blength = 0, causing the while loop to
> spin forever.

Just as before, this check has already been performed by 
usb_parse_configuration().  It doesn't need to be performed again.

Alan Stern

> Assisted-by: gkh_clanker_t1000
> Signed-off-by: Griffin Kroah-Hartman <griffin@kroah.com>
> ---
>  drivers/usb/core/config.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/usb/core/config.c b/drivers/usb/core/config.c
> index 45e20c6d76c0..17c93e95945f 100644
> --- a/drivers/usb/core/config.c
> +++ b/drivers/usb/core/config.c
> @@ -29,6 +29,8 @@ static int find_next_descriptor(unsigned char *buffer, int size,
>  	/* Find the next descriptor of type dt1 or dt2 */
>  	while (size > 0) {
>  		h = (struct usb_descriptor_header *) buffer;
> +		if (h->bLength < sizeof(struct usb_descriptor_header))
> +			break;
>  		if (h->bDescriptorType == dt1 || h->bDescriptorType == dt2)
>  			break;
>  		buffer += h->bLength;
> 
> -- 
> 2.55.0
> 
> 
