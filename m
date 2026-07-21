Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FF9639EF2E
	for <linux-usb@vger.kernel.org>; Tue, 21 Jul 2026 14:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784645599; cv=none; b=TSxfczbdzus5PAmX9y+9BpnskWwW1qCLs37iwiyj+OxQOhCyMqbwMVbJT5MYEUXgfeqbRcW02+qWxqhoFP30Vks7kI1rqZEQGxdsNqtcgS1N5EVAuCGtYsAU3zbJXSH7ac8UVhpcEgxGUHk/UzmEstBAF/m8aE21EFl1NSPH4FE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784645599; c=relaxed/simple;
	bh=HrN8QzFTxn/kc9XDBHlxJqA259dPvb+TLVCMgk3h8yc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QQpDM6XC8RSJ3Kci7aluPjIdPjHGHevGI+e+YvLU554YIXE52fhYGFCnHgC36Q6KrCfs6K3EnJxJ2HFiPTANFThUwcLiXo0EiQyNhzO/gOwwQVuvB4OD/Q+17bu8VBUTGZcvme4SeXRTWlkJAHP6sxdVyULc5LK1emqusQ2+kHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=HsipdN81; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="HsipdN81"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-5218927884fso5519011cf.3
        for <linux-usb@vger.kernel.org>; Tue, 21 Jul 2026 07:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1784645595; x=1785250395; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EFrX82+E4SUZ6RwB/henPb0TQRKayvdvEFB3jC1N7HE=;
        b=HsipdN81wvI5yoOuzbr6h5eO+PoAIcttrkUxOemZ5mjm4Uq8FSLDY7fw12Dwnrn+45
         R/c/L8h3kVC+pMfaKkytGvihX2NSMfEx1JypU3DboPGQEAI4x0InRwMf9bqQC6HDdj/+
         S9GX3qcekvSLjD6XFuwCgIfZEZfZcq9vfQ+AamtkcIV11OQ+6pVxmSBC93cmTv/vH5Oz
         KumAyrSfCRLtv9lROOeTWpqq+MTgeM2zZfS3JRyzZSPolhbmsSh11B8b7BDqlkvky/64
         R71P9nuZ5Hxs9KookamVJRvY1UD78zg34kbN7T92Z+tYBisKpvb4CKUE2i+Pe5RK2j/C
         l/vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784645595; x=1785250395;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EFrX82+E4SUZ6RwB/henPb0TQRKayvdvEFB3jC1N7HE=;
        b=cNKcVEHn5YqvOvVe0cKHtRECmCPRXswNSNcU1Hx/ymqeniPztn7hWojcMJzbjK2S/b
         0PPGL78yerz2fWvRRAkPcNX9nN/8QLvanls3wWbUFnu0edxM9BJZxszFlrUO8k8Z6GGY
         j1TjoVyDTWfUEkNleUe5YP/tC0/erzdiFUoMvOyNrjH7SaXNlpRNoE/wzliU/XF4/903
         d49fAZF7HLDu/RKLwnjKSvTr6NZhjHz/AEguYpLhaoBuapGNWTEfmr94HRp1ulp7JHh4
         lZfw5JLA3GaJMZtD5UIYWhdI2vq7mZWykjkQwh6W8RE5YaKfZuCyLgf5RWbL7NqIuZ/d
         T/LQ==
X-Forwarded-Encrypted: i=1; AHgh+RoARcdi9oh9gjn3XnVKEoBBWFqndG8XvhzxWcROPxEhmO/WQlBoEFpYgGeo/CAStb4nkABxECihTdQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6HD7q1Sax0W1pefMsq2f3ZQ1VNby4yh1/YLEDWGjIP+hB8xDF
	8BQpvzT4a3tvuEh6IEJoT3HuWe4oPLHFIyIiG4W1P8bV6inhdkjR7qy7MkeVjnUApA==
X-Gm-Gg: AfdE7clrDzkQk57/vOkXeu0BYb4QT2QsV0WbaultPfsGbuHoktToUzE9wl0m+/cbOzZ
	StgQPwobI/6LwUikLCcQfCTmXDz/qqoxHsSd4PhTRhfiyFsgVeTd+Wdio7PzluKgfO33J1WiuAw
	E4uvyWAjXBl2f+0BD72YcAy5qdyKGUW5jxJ3av20ymZTL+ounXbetgJFat4Mdrj1vP6vHlDLWJG
	oOlH/P+QcoSWBxB3j/DZfNxqOs2i0BedEdo58ofayQ6YpcT00zNpsOiKRZ/IBng9/fRhNWG432f
	xmqNzVQWvhYqpYHKHXm3wlc+QAjysG7DKOH0nPCGAGJNlFn08LUWRJZs8q2g1lwC+37GQKkFxkV
	bRwTEq+LLBAur8i2ecpTrUCLK+DK1e7TCH2d/6YQjhxHQ4MO5IOIVykGqyxAnWh7mvroQ9z+jXV
	FrS8+5ernLz6C+ZywpFnFqokkBf5NheNHbuw0xxeV9DP34mw==
X-Received: by 2002:a05:622a:251b:b0:51c:7b12:5fd8 with SMTP id d75a77b69052e-5213d3b8efbmr190535801cf.84.1784645595304;
        Tue, 21 Jul 2026 07:53:15 -0700 (PDT)
Received: from rowland.harvard.edu ([2607:fb60:1011:2006:2008:aeb7:73d7:d8ff])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5214c5cc928sm98695611cf.2.2026.07.21.07.53.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 07:53:14 -0700 (PDT)
Date: Tue, 21 Jul 2026 10:53:12 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Griffin Kroah-Hartman <griffin@kroah.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] USB core hub error handling.
Message-ID: <5fb8b60e-81e4-429c-a455-1f86746c8369@rowland.harvard.edu>
References: <20260721-usb_core_patches_2-v2-0-05069c892fbf@kroah.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721-usb_core_patches_2-v2-0-05069c892fbf@kroah.com>

On Tue, Jul 21, 2026 at 12:15:18PM +0200, Griffin Kroah-Hartman wrote:
> A small patch series dedicated to strengthening error handling and
> readability in drivers/usb/core/hub.c
> 
> Signed-off-by: Griffin Kroah-Hartman <griffin@kroah.com>
> ---

For both patches:

Acked-by: Alan Stern <stern@rowland.harvard.edu>

> Changes in v2:
> - Added a patch rearranging error handling logic.
> - Link to v1: https://patch.msgid.link/20260714-usb_core_patches_2-v1-1-4229a368a633@kroah.com
> 
> To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: linux-usb@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> 
> ---
> Griffin Kroah-Hartman (2):
>       usb: core: Strengthen error handling in hub_hub_status()
>       usb: core: reformat error handling and messages
> 
>  drivers/usb/core/hub.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
> ---
> base-commit: a13c140cc289c0b7b3770bce5b3ad42ab35074aa
> change-id: 20260714-usb_core_patches_2-a3eb9d1b7b9e
> 
> Best regards,
> --  
> Griffin Kroah-Hartman <griffin@kroah.com>
> 
