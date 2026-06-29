Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAD2443E9C4
	for <linux-usb@vger.kernel.org>; Mon, 29 Jun 2026 17:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782752504; cv=none; b=Ay+j1FtXmesjs2fxNbhFH+XPdtWFueGsQMvkcn+j2PyI7APf9AZyLBc33u6ZuqsxbLmYmx1fqtW2kiIdEgG24uQMWEDWFrJy3UKzjiBr/baMGktma9eNUhTudJpFGtofM4gQl3M1Uj5QT8+CoKYYgO+JfMWn6hWOYK5vH/Xyqns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782752504; c=relaxed/simple;
	bh=0ZbNq3krgb6G8hdaDapKsW5xowxyl35n00VG63vlvsE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H2PZ/BvyLMjMpzOUhtnTuSBqW/QQgl+SnWc6yOx3oD9Ndy5iez6aGnMaOV1SBNpf5eBWQXdtk86Bneum5QQO+wLtMP8KZe2znbv35zN4AxkOJVSSO8DL+twQO0rIah8vM5xiNX4Cqq8673oPf7PvGFS/rUzj8YT/c7eLSUfjpNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=YsFHHwbp; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="YsFHHwbp"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-51a0188b92fso37894631cf.3
        for <linux-usb@vger.kernel.org>; Mon, 29 Jun 2026 10:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1782752502; x=1783357302; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YeHN7utODULOILBow3SQ4SKTKi+vOT1iFpqN2h/hBuo=;
        b=YsFHHwbpRsX5WjoNxm3vYRCqhksFNPQnB0Jc2ywinYZG01tXjjJH3fkHn/Div+1sMs
         ZhqEsZ3KP5/hCtwmCB0sggQycScKKihHnrWvN4HLpcOJuNZTlKnq+N2iGObngd0tVmR2
         sNCaSLYR9ResDcJSB9fXvvlTivQR+tJU0vmOPohlYuGpV8zozEEJARYh8Cc8bA0gcbt/
         mPAqGodfzl0Ws6ujYVGVqZHCS1Omy0pqmvxo2PmF2iMoXoZYTgsg4O1eIA98ZRCZYVFz
         SIZNs95vuTXa4A2PxaBZ2HnF6UIEM5kPpV4hO2xHaCIgQsKcJicrKhkSKSda3VKHsaRQ
         GEKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782752502; x=1783357302;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YeHN7utODULOILBow3SQ4SKTKi+vOT1iFpqN2h/hBuo=;
        b=LMbJLcF2TtuDggayVXKgwmshtMMaBNwPsbZyU+lIbm6olUL+LQFpWBp9o7iI9dK+dr
         dtWYh4BI+nQHLqlPlyy26oxsVytaZhmyBnp96fnNS6D9QVMRDER/rjeqGivpurXdVD+S
         xHG3wAZ0hFp731/x8ZHihm13osybcPHLP8fDJNsQYPFCrSbCf3p1qmJ4FxSddJJo7V8B
         6sVex6Gn6cQgSuAMkaPaOF3cRkXeDY/CcDzBFJV0i8MdU6y7q/11gyLJa8uPOZyffAYZ
         3BgdnCTbDf4806Q9syJwoMC7thFURuIlkveVFaJEjz7dRCE3qOy/hDS44V4L4QQOiTDX
         AV0A==
X-Forwarded-Encrypted: i=1; AFNElJ+IZ2KAqkWEIytEW3rFwkbfZnDH4oTZd3KhU+lQ33OIfOQpnMxlliPXjY57cgMSs4RqWsX1fuHKcVo=@vger.kernel.org
X-Gm-Message-State: AOJu0YztpckTgfj3GGp0kKzxiwcYpLMh6nZNPCzinmXIktbwqjAY6tcw
	1S9wIIMYCY3B2d5NzzDz4Aya3mfL5y/pSzAmgdjEYXmRVMcMp5QTViRJ48BjImmAyA==
X-Gm-Gg: AfdE7cltgQUC8L7oN+UbiCaNBcjiFDg017KzcqqXseQHCH4c56Ii9G99HkSS3exdLVi
	JoQ59TZ7hxvBT5DinIB17eAbQBkkqMY3IKa1gXFngjLVijUsA3nkUtER1lLl381M6LxUVm23kWj
	Xl11Sm48U4xEp0jqd2a1V5gHN8gkLbW/y1kmY66lndQNV6rCfYx2+moZ3wORyr0GwBshEIMoFoS
	RhriEjL/QFpx1pCvs4z5irDeGDkClUb8RpN78fyctfvAWqo2X72AbOmwtS+qM3vD5qGXs+ERctL
	24CAVdYJcEZQ2CHQ94x14IW83/AxUPtPPE4+oxoNnUgmV49cJNuENqbA/KasYA4zB2Ml3uxAjIa
	rxp3LlsfJ3xSBVq+mVaNsgeJ61HUgzdNz2dli3Nrov6wVBW77pd5e0frxJWMTvSnckODj5K9XJY
	E45HwXS0MSD9Y5+Z1qXQNpdhQ05Td7jD7U+KDMESWg6H6t4Rbe950rLmqi
X-Received: by 2002:a05:622a:551b:b0:517:8446:3afc with SMTP id d75a77b69052e-51c1074e85cmr2361671cf.14.1782752501737;
        Mon, 29 Jun 2026 10:01:41 -0700 (PDT)
Received: from rowland.harvard.edu ([2607:fb60:1011:2006:2008:aeb7:73d7:d8ff])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51c1080d4f4sm881251cf.4.2026.06.29.10.01.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 10:01:41 -0700 (PDT)
Date: Mon, 29 Jun 2026 13:01:38 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Nikhil Solanke <nikhilsolanke5@gmail.com>
Cc: Michal Pecio <michal.pecio@gmail.com>, linux-usb@vger.kernel.org,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, corbet@lwn.net, skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2] usbcore: Add quirk for 255-bytes initial config read
Message-ID: <e7d49127-0215-4b29-9a2a-e1dc0d889b70@rowland.harvard.edu>
References: <20260623161035.5792-1-nikhilsolanke5@gmail.com>
 <20260628231634.6752f74d.michal.pecio@gmail.com>
 <CAFgddh+AUNH9Ji-Qd=BKEDZWJrzPMWN20-g-htQDPSdSehZStQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFgddh+AUNH9Ji-Qd=BKEDZWJrzPMWN20-g-htQDPSdSehZStQ@mail.gmail.com>

On Mon, Jun 29, 2026 at 11:00:44AM +0530, Nikhil Solanke wrote:
> On that note, I discovered that usb_get_descriptor just blindly trusts
> the caller with the allocation of buf, it never checks if buf is null
> or not. There is only a check for the size. and then there is a
> memset(buf, 0, size). This results in a segfault if buf is NULL and
> size > 0. Perhaps it's time for a new patch to fix this?

There's nothing wrong with trusting the caller to do the right thing.  
Besides, if a segfault does occur then it will be pretty obvious that 
the caller needs to be fixed.

What would you do if buf is NULL?  Return an error code?  That won't 
help anyone locate the bug.  Put an error message in the log?  Segfaults 
are much more visible.

Not to mention that nobody has complained about this code failing, so it 
seems unlikely that buf ever is NULL.

Alan Stern
