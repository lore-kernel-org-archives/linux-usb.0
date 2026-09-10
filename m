Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D91A46D0AD
	for <linux-usb@vger.kernel.org>; Thu, 10 Sep 2026 11:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789039934; cv=none; b=JUE5VwvwX89UfeihtuFUQyxK3xI97XyfONl0lmR+PdvSKhWmSr8QkMbReYKTGAdwPwO8q/blpV1ws0fXEk/xGkZGxbhV+St4pXmFr4KiO1wx35pXhvYds5nnXpnRdCdLULt0XNM/0p3AOZK3l3KFC/RmYfs66zPuCISOLjepRLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789039934; c=relaxed/simple;
	bh=QaDfakLF/C+8UOQw6kmdYGXyr5sYrDYyu8B/cfnvfoc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=idB2ZjzQbk8xbFGCSQOCnMma4G6NAYsGArJlXJ6PGdb7Cui2XvTcrHjz//NeLi+Wa5uNeYlOZS2grHAPC4PbcT/Wy2VS6u2nWhEF+oawinCqerDbts3n+xHhJRDUD6TgJW/5sU+1PkyhL2oJ1D5W7Wjy5t5f7k2ca4Ckc/nSEKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rOyfV49h; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rOyfV49h"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4957eefd361so54808315e9.1
        for <linux-usb@vger.kernel.org>; Thu, 10 Sep 2026 04:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789039928; x=1789644728; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DbwbCIITaSA2wB9eFhGr0hV01imq+eR/GVX5321KvSU=;
        b=rOyfV49hxWDlSiVzqrEDGWPewXdF4+44hsbDbS1PcniLqCGm05lunU7N982V6OkNFr
         3D2NBzwOQdf9S2bWJDXy3SJwFXS3ifSGUJevdK3PM8RmGvbn17jZCf/JoAafkk2LSTQw
         G47a33h5Vua7CfTC6kTa11KL24F5nRn5GFvD1YBJ1USe2dOrSIEBtDWsIyDFBxcO2iiR
         IXgImxAtaDAM/dP6RMUmOy0pyqxmS5OMz5rbnJmlWCxnkenEM9E/bmfYYiapeZEI26yd
         v+OgFHNN58TF4ZuLtBUKS9XCmz1D50fLAMSDAQzR33FQXZiQBdeJu1ON89bPBumiEE/x
         F1Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789039928; x=1789644728;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DbwbCIITaSA2wB9eFhGr0hV01imq+eR/GVX5321KvSU=;
        b=p1b8MmpATfzOht6EzWAMcAqVF+2U0o39nhMymwrx8lchQ1zG6TXyl4m/VWXEFSbepA
         2qVihiZlrxjLBEk4trcCUPsVV+u3oFe7IOsvAycAqM40W3YsulujN0RjaDh/4miMVEK/
         vLEN3pYYF1AQcNs39XVThFIoNH700UV+oPtUYxm8GDt+4k33zKplkmdETELC4EJ8RVc/
         VUE2CcakzDRWZjPNHwGjsnUV2xUvzoS+uqTcZly8fK8M3HIXeBjOqb0ofF69GUNR9oVS
         bhDHRUMvklNjcHcaSdreKJtE9juvtMpsJn7TfiaXm+wEdAeaIDNAirIyHB3R9mC5U7OF
         H1sw==
X-Forwarded-Encrypted: i=1; AKwUvBxDCfQfpEzOcbad3e0puodfyM0NeCOUdxNt2E9YnD47yuybe8SsvjWzx+1Ra+PXJQBqogrjG3RdJCI=@vger.kernel.org
X-Gm-Message-State: AFuF++naKSgK7KE/aPfqRhTJItqQ9XSoLLz+oeMqhBmgY61IT5K+OpNM
	q10rIQYnQ03f5OoQjjES8Ne0b1C+lDxYfhcaUNLcGxeNmNAl2FxIjGXE
X-Gm-Gg: AYBFou0MHecPc7GRia/2k5ykY1dFGcArRrIbZIPNGG52h2SeT6Utk6c9kIxV0xhPfXE
	+9o8PUypI55hNX0U4rtFjp9MhiIxrHg+DSfaMU1p5//W5JIFqrK2JoJzijz+NmMew1GhL7TBJTe
	BiCeR0XCy1aneILNm9LTvOTZUug7DcMf9W13VqziOl+KsSqyKN6IgADMGcdmYJnj3Gk0Kx2wfdt
	E1Jh4dXgrOhiZ50WL7GHw/YXB+6C+uNv+9ikMC/VJ53dxRFxI1vBz0uPkwwYLqgHa26eUDIKGrr
	Q/+TQlQUT8muEodgg4wxhNg4ZkJv1KwrNOEXrlnk0dvIhC53kbAat6arHbaERqTWa8gJukwhf+e
	HbwmfJEGGacb6lNPpPrLS3oEAzRiKBjhYYu937WXy5MOdCDZINlhJCz/JEM9FkSI6GKX9I1ko7B
	e8x1BYY6sRasK7cPVZhdyfkewinnxCOH8tw9H+UkBoV2189Au05cHhfLYdlO1tpnKn1c+Macdwe
	DDoVAfX
X-Received: by 2002:a05:600c:8b88:b0:49c:fc6e:a3d8 with SMTP id 5b1f17b1804b1-49cffde8d95mr374721535e9.23.1789039927399;
        Thu, 10 Sep 2026 04:32:07 -0700 (PDT)
Received: from foxbook (bfg95.neoplus.adsl.tpnet.pl. [83.28.44.95])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e2212193esm29745215e9.1.2026.09.10.04.32.06
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 10 Sep 2026 04:32:07 -0700 (PDT)
Date: Thu, 10 Sep 2026 13:32:04 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: wakasio <scarabeeta@gmail.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: xhci_hcd / ASMedia ASM4242: Bulk-OUT -EPROTO with Logitec
 0789:0308 during DVD+RW recording
Message-ID: <20260910133204.3157f83b.michal.pecio@gmail.com>
In-Reply-To: <20260910110453.1528072-1-scarabeeta@gmail.com>
References: <20260908131046.1fa7034f.michal.pecio@gmail.com>
	<20260910110453.1528072-1-scarabeeta@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 10 Sep 2026 20:04:53 +0900, wakasio wrote:
> I looked for the offending TRB in the dump, attached is the full log
> (dyndbg_capture4_trb_dump.log, 1061 lines).

The attachment seems to be missing.
 
> The 11 xhci_dbg lines all say "Transfer error for slot 1 ep 3", same
> address ffffd140425178e0, resid 23552, each followed by "Soft-reset ep
> 3". After the 11th one the driver printed "event ring:" and dumped it,
> then "endpoint ring:" and dumped that too.
> 
> I searched the endpoint ring dump for the DMA address that the event
> ring entries point to. I could not find it. The endpoint ring dump
> covers two segments, 0xfffc00000 to 0xfffc00ff0 and 0xfffbf0000 to
> 0xfffbf0ff0, linked back to each other with a Link TRB. The address in
> question, 0xfffbf8e0, falls between these two ranges, not inside
> either one.

Not sure what happened, I'd like to see the full dump. It's possible
that my patch is wrong and logged some addresses incorrectly, but
I think it should have logged the correct ring and the events must
have matched the ring, or otherwise other errors would be logged.

> I also noticed the event ring entries pointing to that address are all
> labeled "ep 4", not "ep 3".

Yes, 4 is the number used by xHCI, 3 is a driver-internal equivalent.

Regards,
Michal
