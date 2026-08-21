Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B020739DBDB
	for <linux-usb@vger.kernel.org>; Fri, 21 Aug 2026 15:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787326073; cv=none; b=rhbbmcDO8I0L3C5KpCSc9t+OU2Fdv8aUYocTHdtqPBJPgZunTFUELXOSv7amc51QQs4gaWUoxMeReymiES8KYlwoaZdtp3QYg+EEfSDvUsESIFmaF4rstMvhOMOrCfPYqE1p9zNh3J+B5+7qLoiJF5EdZbr/8dYrhVmj2xWD74w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787326073; c=relaxed/simple;
	bh=3nvsaf/4LhfP1j5TWBx/riXB+vZfOnCm/q2gXjeBvrE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EWk7LuIVqbKv72JUDcOFHl/NbOdqH/m/2O+5vuocSvz+ENsjvoP2DELzFIgA5+Lb/zsWVki32kCcj4pten+eyN+hHzxcRdo8O246BIzijDxBkD8yJuFoFq//PNcQSGh3vV1aoMp0aqb2Yom5F2NDyHPSPHeknmh2la13sjB8z4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=wvgnYOb3; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="wvgnYOb3"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-51c0c45c580so7111451cf.0
        for <linux-usb@vger.kernel.org>; Fri, 21 Aug 2026 08:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1787326070; x=1787930870; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=93tyq2+U0N8rsFb5PG0AkB2mCngSbfH9bVdhqbCmpfI=;
        b=wvgnYOb3ikGzxO82Y228H5GVpFfltdRQFZ554ZnNYCIrLHnNqfk3/vvjg6HKj5/HJU
         JKLgQdW3QhgZssAkdW1kxOoSNsseM76LlFC30QLfahCX/MXkXBu3JSOhAK4JOYzHHFDR
         nfdUzXLPwTVXHvq/imEloGem+bTaCrh0m2TZrVBp5c+Y4vczTLyCG1p4jHoC1xkmMqC9
         qI1liSimH38UeqLAySdU/S/d3wWX4Zu/8JQtN+zS6bZt70DsYEewM8AEUjbwzEjc0yTs
         ktwKoEySHpr+4w3dYTD3gvS8G+2x4jFs00PECNX5IZlnNqpqRKuaU0pmLjp3JhoutbpQ
         5iXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787326070; x=1787930870;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=93tyq2+U0N8rsFb5PG0AkB2mCngSbfH9bVdhqbCmpfI=;
        b=jdIHLKayZ7fYh+NUeHSnBHp9U7GUIC9nyukEns8/akptFCNrG7Nn3Q2+SvRYUKevkR
         SwL/aCzq3p/QfrblvqECvdQU/dQY5qu8raenPBfUjeTBgtSIGtLg6D7T6C4oiMt/fFOd
         dJRpuF/pxKpiEiovXVguuN8hGRvebhWk0IEw9zOKMBgVL6WWcwrkOsb19YmJPqwNKmaF
         QaLLQZ8pblITqhb7coxXIOCMTeyaRWfDZtsNjypFEapCiEHBUY/n7/o3CYzHajdfhdCt
         hTf2VpatMjQuqKbEDo1C/PLzPN6S6Wrbl+EQ/Y5NhkPdMdpUPDQ+KLUrjpPKUwqYjKlm
         V1WA==
X-Gm-Message-State: AOJu0YyWr5arkJbaYuql1efK1grpNvLEaF89DE6x4t+1hxUQqEABk+1L
	y8aiRDWOwi/wDeIpsVHov/X0R0WQWv5c0S+qQ9dGxDzLc5kMuPPgbv7ZTIOA4Y9qg41D0oj3o4b
	6BitXFA==
X-Gm-Gg: AR+sD10VsPsJfUvpAKJ+rQ/KkBEf7b0gPs7LVtN35Vn9IaBsJ2DMbgScAqyX44LNXOM
	YFNcTzCaEuqYhGwaLtvQMqEwF+lTspBVKV9a0Pusw0W4kjimLbtB1iGb3ndi1CkvheGfI9Ag6F9
	pBPsVnObQI11US6vJ0oU5luzgIOJHPDZIgdlSyclZR9CnEnWe+SCglxH+hWedWf3GJVtLCEUz5Q
	I/BMMOWD+c77rzBoLoeMjBCyvt8BiLg9UGvBAos5SWzphuKyYQ9Ne8ROL2/lkcaBEqYpTXWiGkl
	BYrRArVVi2NkCYUZZWu2x1r0cbLXY4YnLzonkNOO1EAuWIPUAMBiRNR9P0O0e0fjXP185vzgDpQ
	J83s9vG03z8535ejAIl6f5T60vE/nzmVg6kIFSh/KocR2VjMlLyorVLjz30fw/a82vQ1dLE7qzo
	Om8jWwcxNWufacOnOGOnreuO57ufMEZymPWvz47G6vepZcWKcIPP+zRGWozU9M2g==
X-Received: by 2002:a05:622a:1309:b0:52d:7b2a:938 with SMTP id d75a77b69052e-52df56d9f5fmr59490031cf.6.1787326070168;
        Fri, 21 Aug 2026 08:27:50 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::dfd8])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90c5edb5196sm65545556d6.8.2026.08.21.08.27.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 08:27:49 -0700 (PDT)
Date: Fri, 21 Aug 2026 11:27:47 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Arka Mondal <arkamondalofficial@gmail.com>
Cc: linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net
Subject: Re: alauda: stack buffers and unchecked alauda_read_map()
Message-ID: <daed7041-1776-4e2c-a90f-3ee3e965c688@rowland.harvard.edu>
References: <20260821080951.39905-1-arkamondalofficial@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821080951.39905-1-arkamondalofficial@gmail.com>

On Fri, Aug 21, 2026 at 05:09:51PM +0900, Arka Mondal wrote:
> Hi Alan,
> 
> alauda passes stack buffers to usb_stor_bulk_transfer_buf(): five
> commands and two replies.
> 
> You attached a fix for this to bug 217862 in 2023 (attachment 305027),
> and pawlick3r confirmed it clears the WARN. I can't find it on the
> list, and the buffers are still there in v7.2-rc7. Would you like to
> post it, or should I?

You can post it if you like.  Probably the reason I never did anything 
with it was because the driver never did end up working properly.

> I can also fix alauda_ensure_map_for_zone() ignoring alauda_read_map(),
> the oops you identified in comment 11.

I have an old patch lying around that moves the call to 
alauda_ensure_map_for_zone() in alauda_read_data() down about 10 lines.  
I don't know if it's related to that error or even if it fixes anything 
at all.

Still, you should feel free to fix any outstanding errors you find.

> Neither fix makes the reader work. The endpoint question from comments
> 13 and 19 is untouched.

If the driver doesn't work at all, and nobody knows how to fix it, maybe 
the best thing to do is mark it BROKEN and leave it at that.

Alan Stern
