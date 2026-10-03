Received: from mail-vs2-f43.google.com (mail-vs2-f43.google.com [74.125.227.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C233642CB0D
	for <linux-usb@vger.kernel.org>; Sat,  3 Oct 2026 12:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791031386; cv=none; b=sQab3sIZX9zZ7oipCDvw3OFHamsu5NOBNr3/N2aNwAQf31Uad/SF0pjVxwST3LWTH0tKSShbjmdoTMGLgRZwkL/S3Ehr3DhfsjCN/ZPAl6OWRsajcWnOJUv4geMy1WYgN7zzj5eWGUtdvN5ceV9RoblRJQ083k5JJC40VK7pJQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791031386; c=relaxed/simple;
	bh=H4I5nvKjgXUix9M58KBb6gNKwEf1DF9zOhFhla9DTMY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EVMFI1mJs75/lLwGyhL3mKkdOuaEPmLP5X47y+pMzAXy+f73HObSZMfKm46VEvxx+s1yZ3hDTEKuCBeVnSsEzVPIeJvFGYYnUIk7XAlyLCxQGoVTHDueuvU4aJkxDGPOc2sDu7g/xywZRLv1kbdew0hJv1fJKM74rshhRYKkJKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f43.google.com with SMTP id ada2fe7eead31-7beb81b2834so71256137.2
        for <linux-usb@vger.kernel.org>; Sat, 03 Oct 2026 05:43:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791031380; x=1791636180;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rd3NWbdX+3ZLAQ53roUb71tmzpnlllnH0Ay1BTCnKio=;
        b=vKH9SWQuCjiS/zg536KDXn/q2TZ3ytHsOI3kJNFn8RFX18k8Icsvf+KKRNFQZNmne4
         FPF+lP1rm2dqpnnyx+b3ohg8cubKnU/4en9cgvXgPnADjumUEe+VZdIdiSctrbMMlY5E
         0qQ42wKGQCUXnpHnZUybBylOSUu2v6trQV5ravWAUc1KZNnnJW6vSz9+qpoTNQbXkRhs
         LwgZFInXQIDE+eIfxovUzZ3aiIoG0MCiV31+Jeg4Dk+ePZow7wSRXpSXq/SAQ/JIXd62
         IM3YyaCcW2cfSibHRs/PpWRm3nTr7Gm6/v4+/CFlhq/hoR59ZnVbm3af7siGKkTBf+74
         M9Lg==
X-Forwarded-Encrypted: i=1; AKwUvByYuTJdhYdJSJKV46iNEK/l4u449lbfldputiyUQ/yO+3pLCpS44TtLZaNESKY3CevzpEG9lQBn1FM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJbIwAndMJUL2eba2O/UqcnijBbFQjJrFubMPx0W88sZK4kvJ/l
	7WKZLpX1OXnJV4sVCLFn7EKWKlMGRImHLXkCSEgexAxDG1gl8kvziK58W9vsMPZjuZ0=
X-Gm-Gg: AYBFou20kYPBhdIUOPl3NYKm5jreMYC8JV/CXT1RWC3YyY3WucK4fDsbLJch8dkd2y+
	EcFrIhnVO2sFtpcNiCTZzrv0zpIhe5LSxggZW8/pgTvHMf3TP+Rqp4EwxsRCoITao1YB3z1L8iJ
	Z2LWfGUGnl5ObzNVXtlbxLVn2ZCj2ey5qTZ16Ba3tmso0MiEURnr1kN0T/87VMkP/hqTRoEbHN6
	GkKcmluzPOGB0tg+mtnFkD7WraHK9M+sSnIwngSawtF17EYJyhMZtSRJtlMeVWyIAmOTly0+lOn
	Ihj1sz1nu/J/ATX9crL2UquSImAsakA/CYlYWPAb12daMrC/azs9BXexweqUyfVJTxoBxp+Cwqm
	51DunSHZ5uxu8XZf1aJFxnei931D2Zbu7auciM8DEQgI4XyPo2SRWYBqhnsX6lBRABLMPhHJCVV
	y6kXiFSHTRpPukmnKuYYAq9RvlzKlqcav4nEzw+RsNxIxSmUsWX0w3UrrBhzbXZ3LLTYfadLnSF
	khAkxLBep+mUA/V3kakvHjYBx376o7QvV30FQ==
X-Received: by 2002:a05:6102:a48:b0:7c0:b433:b0a with SMTP id ada2fe7eead31-7c0f54a0e1emr1366704137.28.1791031379703;
        Sat, 03 Oct 2026 05:42:59 -0700 (PDT)
Received: from mail-ua2-f43.google.com (mail-ua2-f43.google.com. [74.125.226.235])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5da61112dfesm7050599e0c.4.2026.10.03.05.42.59
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Oct 2026 05:42:59 -0700 (PDT)
Received: by mail-ua2-f43.google.com with SMTP id a1e0cc1a2514c-988b74e3071so30780241.3
        for <linux-usb@vger.kernel.org>; Sat, 03 Oct 2026 05:42:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzfhBLrQu/pJKrebVLLImSwXE76lNT1SmckDQP8Fki1cwysnbFKGpMGSpJ12EfvgGKOKdUBKuK70+g=@vger.kernel.org
X-Received: by 2002:a05:6102:4189:b0:7c3:3c75:db89 with SMTP id
 ada2fe7eead31-7c33c76064dmr62144137.25.1791031379330; Sat, 03 Oct 2026
 05:42:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261002213225.27834-1-kmehltretter@gmail.com>
In-Reply-To: <20261002213225.27834-1-kmehltretter@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sat, 3 Oct 2026 14:42:48 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWEYkBra+3G_+-TfT23BAWPxG5o2KHqGRuHcdp8x0Vskg@mail.gmail.com>
X-Gm-Features: AclHuK9ncaDVCxBtGuESNZ4CSuuG_w1P2OqCJXmqUhxZJrmtDAEjoWxMFSEEOIw
Message-ID: <CAMuHMdWEYkBra+3G_+-TfT23BAWPxG5o2KHqGRuHcdp8x0Vskg@mail.gmail.com>
Subject: Re: [PATCH] usb: r8a66597-hcd: fix buffer overflow on odd-length FIFO reads
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, linux-usb@vger.kernel.org, 
	linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Karl,

On Fri, 2 Oct 2026 at 23:32, Karl Mehltretter <kmehltretter@gmail.com> wrote:
> For an external R8A66597 (pdata->on_chip is false), the driver accesses
> the FIFO 16 bits at a time. It rounds an odd byte count up to the next
> word and passes that word count to ioread16_rep(), which stores both bytes
> of every word in the caller's buffer. The final word therefore writes one
> byte beyond an odd-length read, past the end of the buffer when the read
> fills it.
>
> This is visible while enumerating a USB device on an SH7785LCR. The USB
> core allocates nine bytes for the configuration descriptor header, and
> the controller driver stores ten bytes in it. SLUB reports the first
> redzone byte changing from 0xcc to 0x09 in usb_get_configuration().
> Odd-sized HID report descriptors trigger the same overwrite.
>
> Section 2.8.5 of the R8A66597 datasheet requires software to discard the
> excess byte after a 16-bit FIFO read when DTLN is odd. Read the trailing
> byte through a temporary word and copy only that byte.
>
> Fixes: 5d3043586db4 ("USB: r8a66597-hcd: host controller driver for R8A66597")
> Cc: stable@vger.kernel.org
> Reported-by: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
> Link: https://lore.kernel.org/all/3bd32eaf159db61ed1d423e1d52a869b3689c682.camel@physik.fu-berlin.de/
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>

Thanks for your patch!

> --- a/drivers/usb/host/r8a66597.h
> +++ b/drivers/usb/host/r8a66597.h
> @@ -178,8 +178,15 @@ static inline void r8a66597_read_fifo(struct r8a66597 *r8a66597,
>                                len & 0x03);
>                 }
>         } else {
> -               len = (len + 1) / 2;
> -               ioread16_rep(fifoaddr, buf, len);
> +               count = len / 2;
> +               ioread16_rep(fifoaddr, buf, count);

Or just:

    ioread16_rep(fifoaddr, buf, len / 2);

> +
> +               if (len & 0x00000001) {

"len & 1"?

> +                       u16 tmp;
> +
> +                       ioread16_rep(fifoaddr, &tmp, 1);

Seriously: a *_rep() function for a single iteration?

> +                       memcpy((unsigned char *)buf + count * 2, &tmp, 1);

Likewise, this is a just a single byte.

> +               }

Oh, most of this was based on r8a66597_read_fifo() in
drivers/usb/host/r8a66597.h, which has to handle 1 to 3 extra bytes.

>         }
>  }

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
