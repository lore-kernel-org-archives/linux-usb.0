Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794947659;
	b=5rXTehg2zuSkuoEykFStdMKgzJS0bpNW0F6NpyVsRaDSZXIqiKarcIVkSqMBOcvXE9I1
	 9ZG0kKDBP+A6nkU8/+uw7wQZTd8Y4G6p0aAMXE0BV7pQO/N+TdzBHdtfWl0R0gaVveQ7m
	 e9glQx5q2BdbseHH5/8Ya7unw3lorCscyERQqZF+uIkS6Q312qzR12xFxQMjCCVpd+sl9
	 hoHR39iZppCIcNQKK/dMLdEtBjgDdZfbM8zGVcfUZot8EbNmjxEkq2WHKdJDYFMZrek9V
	 3vnYMRvQIoxzgRNVVxBiE1B4jNX9cM15u4mP+x1J/9fKX/8ScQHbD4cvoqG4xPR9bFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794947659;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=/ZMhcm/JCcD+M3t4azWcucL31huBZZJYoXQAph0Cu/Q=;
	b=n9SSLSAwjlmmA7/GWRUmmJ5n0yeze5wx1DIgu7QucVspuIuOTvfKQX/pPhcSsLhLcoPy
	 rEbxPTZPL7RJ6Y0H60R24X46V4KBS8EjxXQv6qVLu84+d9Qrsw+rFZ/PBYTt1YTIIm48j
	 wX5uzQaJ6t3VHoYzI96kduiLUlipSRvttc2oBivZdXuT0C51hroTEAbheCnMeO1sRd+MF
	 FDj+joxnW8uk2EXhQjBZoWIAM0eb0XfZWtSMnZ1MxXjen9PXILnw9a1TpqEP53iQerJeG
	 C2EeS619jZ7GV3Dtk36NU8ttW0KUMOS9c6L25M7iPZH3+Dg1H5t7SlJsoEZv3JZ2cbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=GS8p0iFE;
	arc=none smtp.remote-ip=209.85.160.178
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84AF9606A884
	for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 20:34:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84AF9606A884
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=GS8p0iFE
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-5363c8de563so2741641cf.0
        for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 12:34:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1794947658; x=1795552458; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/ZMhcm/JCcD+M3t4azWcucL31huBZZJYoXQAph0Cu/Q=;
        b=GS8p0iFEUF/En0yzlT+JcuCpLdO2j8huJwWM9K1FLGiMQrTQ4OKuEnYY7jh34BNQHz
         Y4JUGy80u1H7sIxiUEgWPoUrNvkqgm2wtp5Tz1Slc5r11ygXc27JiVS3gBazpRwbam7g
         5LoK9Z1PU88QvaMAyD4AkS/9tbw8YYH27s/RWFW6pGc3jxIzOQjkvgXElvfHBrWkXBok
         yHZ53avyhHLSXtdZYUi9T4YYYgMrPW/YXKkxI8Lg8BT4foCHmPFLw4SMXPY3jMSxKsVS
         WxnZD7Gr0kItymyPk9aX7ZDMXsNg94Q3+reBGHl3F165VA+74YLCFsizb4mHQfGD6+tG
         gA0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794947658; x=1795552458;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/ZMhcm/JCcD+M3t4azWcucL31huBZZJYoXQAph0Cu/Q=;
        b=HLjeSf+UK+39lFvJiBhd2UeNzt9kpxfZNcq1mx1p8ERFWCrgX13gzKgXcuCmsnbJdH
         pzEK+P2Sc4qvmqu0kmpn9lTrBDfFf7MPK9+BCQtBbRAWtUXdpXrM5kTRKfUzOPJySd+7
         koNQDgucd0NvR9HMp+ReByIhSiAKRTAlTZqy2w/o6ZKbkHYt7elFuZ8WyhNGBM0TJugy
         Fh1p4JeL0kulxZRBiEYEMNWPuzBJmNPByjcUmF70gVrLFv9npfyuydlERFiUCRL43xI+
         owcvrLNjbbr6meSOdCNY4tV1V5p6iq/Oj8jrhczsP3GH4LrhsLL0wDjIjLK4MZTPNGgp
         Dn1A==
X-Forwarded-Encrypted: i=1; AL+hErFtBb+OB7sRgTP5Df3xgVnBuHAUauFEDRPS6f6VUS6v9X6lPAo4XNLpSZer+LITWoazEq/lVuGyKlQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9SwQCfTwO0WX+52uc4F7E+IhJgfrmPvz/WgVn3biMOD1+W4Bb0
	mizSPGQn/mMhgZwwfOR4GZzKGQYtmuFeTNOJeNlsdqy5Ox20swIWj3/XorL+x+tGgA==
X-Gm-Gg: AYBFou0YWLgJZETsBec8IqQXBQNE7wqusmUzbg6oyrHN5X5z6z2hBie2W+SioNQ6IJt
	FgfJ8tZ5zxSGUDEvAsNetgJ4d9FIIDacHER8XTJ+9ThFUKHrEY/eJzCry049skx4szHXBGpXzLa
	rI9zG1LkMrTTrEIWyyOLO+f4wkBV4fH8fKXFObG7xRa/qShCWFqj5QWOAuVQpdMUoKqGpgVjKxU
	lRbrqdHruzDOvjV2Lt9/a6zouU5ST/obuF83zxpUDSu+tisp1i6suMTi8/929eguFzeOjexas8/
	x3eq4QXI2k12++AfOi7omI/FjnRTQzd8XR7yqBJBOhHANxQ0yuLMCzBykZod48MvyS9iROckj9t
	cuPunJ5qIxfQX6Xcsx6YV3Jnf4slZKmdIctYW6MP2TfzFH4H38xcYL3jqkzqM9GbuByNfz9odj+
	2rvoKOeYySks7MNNBD9y09TM5mwNqiSXgbpTGNBXSZr1/7ZRgokTYFF9BQ+oHkgAoeTfPxlmEco
	kCSWXl/s0zpQ+379dO6iWUA3p54PQBeLibfrIDeZddinBSlxYY4FpYfsU/f6LJ65+TFtPAlmcuH
	JpKiWJZl47y4SXDk+Psd9X1mNZb/Dg==
X-Received: by 2002:a05:622a:230b:b0:535:8509:3138 with SMTP id d75a77b69052e-55d5a308334mr8458151cf.11.1794947658309;
        Tue, 17 Nov 2026 12:34:18 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d00:161a::d398])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d5909ec98sm5319881cf.22.2026.11.17.12.34.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 12:34:17 -0800 (PST)
Date: Tue, 17 Nov 2026 15:34:14 -0500
From: 'Alan Stern' <stern@rowland.harvard.edu>
To: gichoon.han@samsung.com
Cc: 'Greg Kroah-Hartman' <gregkh@linuxfoundation.org>,
	'Takashi Iwai' <tiwai@suse.de>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] usb: host: ehci-sched: Don't let a bogus siTD remaining
 length underflow
Message-ID: <852edee1-229c-4685-a124-497ed2ed85a1@rowland.harvard.edu>
References: <CGME20261116052855epcas1p403c518b90d70d98752ad0ca2d9ac05e9@epcas1p4.samsung.com>
 <20261116052851.2272125-1-gichoon.han@samsung.com>
 <5ed0f4b7-beb3-4059-9e12-b9738af65d91@rowland.harvard.edu>
 <000001dd762a$1b15f230$5141d690$@samsung.com>
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
In-Reply-To: <000001dd762a$1b15f230$5141d690$@samsung.com>

On Tue, Nov 17, 2026 at 09:25:10AM +0900, gichoon.han@samsung.com wrote:
> On Mon, Nov 16, 2026 at ..., Alan Stern wrote:
> > The type of CPU doesn't matter as much as the type of EHCI controller,
> > since you're talking about a controller hardware bug.
> 
> Fair point.  It is the on-chip EHCI controller of a Novatek TV SoC
> (DT compatible "nvt,NT72668-ehci"), driven by ehci-hcd through a
> vendor platform glue that is not in mainline.
> 
> > Actually the bug lies in the host controller hardware.  Not the driver.
> 
> Agreed, I'll fix the wording.
> 
> > So you have no way of knowing whether this patch really fixes the
> > problem?
> 
> Not directly, no.  I don't have the siTD contents from the failing
> device,

Why not?

>  so the claim that the controller wrote a remaining count
> larger than the programmed length is an inference: the faulting
> memcpy() still had about 122 KB left to copy out of a full-speed
> packet, which can be at most 1023 bytes, and this subtraction is the
> only place in the path that can produce a value that large.

You make a good case, but I'd still like to see more definitive proof if 
at all possible.

> What the patch does guarantee is narrower: whatever the controller
> writes into the siTD, ehci-hcd never hands a class driver an
> actual_length larger than the requested length.  The crash itself is
> already prevented on the ALSA side.
> 
> If you think that is not enough to justify the change without
> hardware confirmation, I'm fine with dropping it.  Otherwise I'll
> send a v2 with the controller identified and the wording fixed.

Go ahead and send v2; I'll probably okay it.  And do try to get a real 
smoking gun on the failing device.

Alan Stern
