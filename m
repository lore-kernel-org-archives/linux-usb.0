Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EA7943747E
	for <linux-usb@vger.kernel.org>; Tue, 18 Aug 2026 08:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787042779; cv=none; b=JPSM66laooFu/1eUZqJklcqe8KtSZThjoiQHcHlTkHRSrizQl+tqcf6qtGoayT6uuxl+vH6nqy890fvYqiF/NBLM0Zr4u2S10CaVOtqLtm3DxF2PSrAIMsFOgv4TxYrGfK3mCpgn7HoiWqfCfVaKvd6aNfRx+JkGlXNujoBGOuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787042779; c=relaxed/simple;
	bh=mQ6IYT6Pc55d8AkyGYMCEYLcvcsTHwm7OsHzOKIZiZY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pIInWM30pPxByCqAh0CSKmYJqbIoM39nPSvchzmN2DFA2c2rKCaSGjZkSJ4lubjq4Wujv6Ar3PDOjoje7/T5fgQnZrPAOrvw1jBO7E/ddIqVYR8rXrmyXaA6tfs6L/yXBxsEksiY4HCHRoo76pYHd8SYrbgAQubiD9hg1wQrn4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ohh95pvx; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ohh95pvx"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-495757ccbc1so39545515e9.2
        for <linux-usb@vger.kernel.org>; Tue, 18 Aug 2026 01:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787042776; x=1787647576; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=l9BCI5e5C95g4VqRTOSAujW2MTIYwnH14urMFZbQsrI=;
        b=Ohh95pvxVaHT9oVLEk7Cr9U30UUMugRiDzhrDHg+g9j4AzbxBfPnY1cW+XPBkTAhm8
         9yInFcAPMF4ID40wQGhvXSYHWiefCrrsGjuzwJ787ua0aQeD7ka8zGCLHk88xZWtpOF8
         yeTdV2a056dbPEqXOFVuuaKUohsGhvVT+zQh2TjT5eUhES64SpxuyGhtx5ER74ymWmLs
         Zhi8j8hwKvWYDckq4I4vfztnn+RifDpuEbIkOc40y4kSuONmBsTgTHWUZlULdsXuUSr1
         ojOLlETxn0jMVvrylehYqDaXdqKD0WFhxf9pnMAMZ9/RiuvGTnrQO5tWPIZV0X46zKJC
         iMqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787042776; x=1787647576;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l9BCI5e5C95g4VqRTOSAujW2MTIYwnH14urMFZbQsrI=;
        b=FJRc6PnBfLRQEsk1lukR5aKPLqvn6cMFGd8TM+22Dm+CXHHomLsX7zpBqLDoLuWNWl
         JfbkToC5l7Egi8FJh8Xsy84n4eN/xAkON8WY2hiW9dQiW/8vwfcN20y+zPE3R/Xl5UMc
         bTmHr4jSbwhw0ppduHg3Cg+NmYTXD4WRaMV2syAeLXDiufU0Yt3dN9rg+XBECxMZxNhE
         IQG4VfzWOmAkVbO4stHfNg0VgqozMID1D/n5Jxc2rZDCRnDqldFa/n63Clsw0V7mE/5k
         5F09SkDkH+68OSNjFCsn5Bnc1W/b5N0tStnArNpJkGzVhflM3DSOC6xRpEEGqWGnNTV2
         CYIw==
X-Forwarded-Encrypted: i=1; AHgh+Rqj434mhVkLeXydXasWB54YBpVuY/4oqoR0mzkPluQlfOqOGsM5dT2CE30vjAztkgmB9rKEWyTXd28=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBwpS9S+4K9l+k7ZQ1I01knIcpH+6+Bf1PapyqkgdEP0HwOD09
	GmbfkB52NDD+uAn/+OGRqstggcx/lHnWub9WDWyuGn1oVviF1xRBqlQN
X-Gm-Gg: AR+sD13OFCMbYyJmlsUYJTizbr3SR/UZBduVy5YR8U8MM+fD7JHRHeEF0FzdPXhNqJU
	DFLsWz+NQ0tOYqRQuuzkVyFs0GiZgS+zoPKl7057AYXN5QlVF6JF3On1gVsYzBvm3ZPZuhRKowA
	3MsNpSUNz72ta3bRqXOVIAfN/2u8nL5WOuN+7dnA2Ldm1pQWXkS9Q3cVVzQQzwPhN5Kvp7rAkZ4
	Ytns+47nQTtCIN6GcN6DXGoWFga7tFVK2CSGFo/XWkMQIFrlV65VTaXjqUwNop2v97Lr7FizhdQ
	J3vqxpkNmTxjbYgXbauc0RgBk5mW0NQj08BHW4u0YumAVTf+QYl/LTtOSzxEp1mobZkxN/gtX9C
	WiKAg2ipwD+FR2KgTz36aoBbj9JYyzBYDMPqleX40QzRTJ5t3W8Z+tcRXEeychjmD2wrgsNseyM
	zhhxR+LBhExpmYY0tTOBMaO3101JHgq8a7Eybs+BsgrczSlCH4iAOxCmUjZ4MI4eZPdLfIlwq9
X-Received: by 2002:a05:600c:5286:b0:499:621a:2ec2 with SMTP id 5b1f17b1804b1-4998933fd79mr535164725e9.3.1787042776252;
        Tue, 18 Aug 2026 01:46:16 -0700 (PDT)
Received: from foxbook (bfg7.neoplus.adsl.tpnet.pl. [83.28.44.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482a5b7834dsm10159483f8f.28.2026.08.18.01.46.15
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 18 Aug 2026 01:46:16 -0700 (PDT)
Date: Tue, 18 Aug 2026 10:47:08 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Arthur Gautier <baloo@superbaloo.net>, linux-usb@vger.kernel.org,
 Mathias Nyman <mathias.nyman@intel.com>
Subject: Re: [PATCH v2] xhci: fix lost bounce buffers on TDs spanning
 several ring segments
Message-ID: <20260818104708.42d40a2f.michal.pecio@gmail.com>
In-Reply-To: <f1671140-f1e3-4afe-a806-c3f82587eab6@linux.intel.com>
References: <20260812002554.1166712-1-baloo@superbaloo.net>
	<20260818004828.1d6e1c76.michal.pecio@gmail.com>
	<f1671140-f1e3-4afe-a806-c3f82587eab6@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 18 Aug 2026 10:29:41 +0300, Mathias Nyman wrote:
> On 8/18/26 01:48, Michal Pecio wrote: 
> > You have removed protection from infinite looping. I think nowadays
> > the driver has more loops without such protection and everytihng is
> > fine, but I'm not sure how it was in the past, and this patch goes
> > to stable.
> > 
> > Maybe let's see what Mathias thinks about it.  
> 
> Thanks for adding me back to the loop (cc)
> 
> The infinite loop risk could be prevented by using
> xhci_for_each_ring_seg():
> 
> xhci_for_each_ring_seg(td->start_seg, seg) {
> 	if (seg->bounce_len)
> 		xhci_unmap_one_bounce_buffer(xhci, ring, td, seg);
> 	if (seg == td->bounce_seg)
> 		break;
> }

That's tricky to backport; the macro doesn't exist in linux-6.6.y or
earlier and the commit which added it includes many other changes.

And it only prevents infinite loop if start_seg is reachable from
itself (so not if start_seg->next->next == start_seg->next). Similarly,
v2 is good enough as long as bounce_seg is reachable from start_seg.
It surely was reachable at the time of enqueue, so only a botched ring
expansion *later* could break this.

I actually think that chances of such bugs existing and being unnoticed
for years are practically zero, so maybe just don't worry about it.

I only mentioned it because:
- v1 included a safety counter checked against ring->num_segs
- it's something that people used to worry about a lot in the past
  for some reason; maybe just to aid debugging during development

Regards,
Michal
