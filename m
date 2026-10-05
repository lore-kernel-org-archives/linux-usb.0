Received: from mail-ed2-f35.google.com (mail-ed2-f35.google.com [74.125.228.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6863F48F858
	for <linux-usb@vger.kernel.org>; Mon,  5 Oct 2026 13:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791208681; cv=none; b=pSr067rUe7LT6/ZwQeIU/a+aKLXTQOBSsUTfGhm10V+hU9+KRy1JDFxSrKj9BqL+JfsA6cVoqCY4YEaMRUq3wwW1PMxWBd1+aJ48HnPczrONxn4ZfKBaS4sODGgki7ud3fDLcAlCRGoqtiNsAZ7xtp6BYqLHCZl+nAmRtjxCKSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791208681; c=relaxed/simple;
	bh=n+s9MtbJbIy61EhMnMIaXeqKdaN3Tu+2CnCfvkOu8JQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IgeMPjBbP9oGIdX6GtsEdG3tZY1kq247oMfiLzyO/7/r7e3zjADOuvjI0SAcCnxa6VM7NN9TGYfZNLd0BwLgCgnVK5KaBZ4I//cnUrRcQb9ZKoaRK9IHmrEHw7mek4B+6B4n2jVgbHFIp7oeKybg0912g5CNuEWKfeMJFOSqTeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.228.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed2-f35.google.com with SMTP id 4fb4d7f45d1cf-6aa1d00daaaso2536971a12.1
        for <linux-usb@vger.kernel.org>; Mon, 05 Oct 2026 06:57:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791208678; x=1791813478;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=h3WcaI+0O8lHZ4mIArK0RHYpnuN1stMSjlAmB+AjH/Q=;
        b=UwQ5pqVLiY7Pu7VR0khzEmkufoXnypfNkRigD0syHpBZfFPFs4tOnN7e1tp0EhMUUF
         KQWQ1VaNNZKLbIx/MsYpelZ7yamjL5bgBtCOInZFt5x0O5B6cfGP3onv7PlyqAIRTAOH
         CHIF9uzeyMph4WrxSoBP8EU2QVoDtB1rF3GmOE+SZlgrV2OsQgCbaQqEgEhlCpcxWjox
         jSHBIl9sdA2zdpeIly/PwZvqm9X1M1HV920o/bWwoM8EElNo7rTk2NcdrTquHAg4LoZS
         Xo0yUzs4SpfwwXPHcQMi5OqWSQDL42n5JN42dzPDrfEpKvkW4VVHY54cqNWhUqdxFv86
         xugQ==
X-Forwarded-Encrypted: i=1; AKwUvBxnxhcEp2wkytJ8VV8ziCpcuB9hZdSr7xRTX/63pfPf2uq2kvT9WenA5MLzFwKOpD9SIAicOtYLmXg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKNfAXNXlZAmkIDGiHC9KA+quwMnIm6Li2OeNyllDfIVQjHTXsl
	g71pW3ybRjU3NoFEuwaM3+1hSRk5wGvmoYPPRwcaEK7xlcEDQShyF9xHKWU02xO3K8o=
X-Gm-Gg: AYBFou2OmXwwfmexRBbWoLbr405BgR2vyst2WJrLe3NMUx2hBCCqQDCxULj4ID+IA2y
	omEdr4TsdJbAaVCXc6dvgrU4GNjJ8C6vG7RSQj0dUtvbv6s0KczkMYS9mZFFmTY1/1dea6rCThq
	D8tFcWmKqjttZWx6dnqWNvhQyIEp0R3Fg6yc72XiZnhonppIogQFuuQVEyijSZvYGPF7m9+RrnX
	NFqsuNtKUtts5ZtyQR4+R8diLM9xQ57g/E7nwXwqLm5HLB82HdbjAmvOGCKG2yiJEYuLoj1A8Sd
	3JB/xXGc/9FliDIgXkYsNaPkoZIRqiA6/kKO4VjnVUC544ahZmUAFsKa+U2fwAImPcPC2KxRqoF
	Ds2HGZeQepe7+cswY0DBPrVEsQqB5o8zOOKI9f9b+rvsE9H3gd+kqupK2j8rh+v8FScTZOrcLhw
	WTOcK4LofFk+G6Kyin3hOTbU6+aSka8Pc51vHlJt1hQut0GrwAUzNeYKOpa1WJrQFw7vgEEpz3v
	hM+OqwXIAESw26iE4R+DVf1T/yEeLTyppokbQ==
X-Received: by 2002:a05:6402:321b:b0:6ac:7059:52f0 with SMTP id 4fb4d7f45d1cf-6af9df8f439mr9066451a12.0.1791208677459;
        Mon, 05 Oct 2026 06:57:57 -0700 (PDT)
Received: from mail-ed2-f35.google.com (mail-ed2-f35.google.com. [74.125.228.99])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6afb021fc44sm3328266a12.32.2026.10.05.06.57.56
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 06:57:56 -0700 (PDT)
Received: by mail-ed2-f35.google.com with SMTP id 4fb4d7f45d1cf-6aa1d00daaaso2536938a12.1
        for <linux-usb@vger.kernel.org>; Mon, 05 Oct 2026 06:57:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxSCkxA80wnCXxS8BCH7H8WNWKGdNw0tN53/amRDDzlBmQwrnxD12DTNET4B7RhVPRyPlLc+Fe95Js=@vger.kernel.org
X-Received: by 2002:a05:6402:4028:b0:6ac:686f:91db with SMTP id
 4fb4d7f45d1cf-6af9e2eea4dmr10193022a12.11.1791208676370; Mon, 05 Oct 2026
 06:57:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261002213225.27834-1-kmehltretter@gmail.com>
 <CAMuHMdWEYkBra+3G_+-TfT23BAWPxG5o2KHqGRuHcdp8x0Vskg@mail.gmail.com> <asMl-yIKQoAbpwzA@gmail.com>
In-Reply-To: <asMl-yIKQoAbpwzA@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 5 Oct 2026 15:57:42 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUqcwZ_YPRB3BZW+=iBHAreDVquWahFn01Z9yoF=yzj4Q@mail.gmail.com>
X-Gm-Features: AclHuK_eb-aU_a3fauOPMQV8VM9j8pv8zjLDNlDNjrpr-8Ij6r8nOCNKtC-t2O0
Message-ID: <CAMuHMdUqcwZ_YPRB3BZW+=iBHAreDVquWahFn01Z9yoF=yzj4Q@mail.gmail.com>
Subject: Re: [PATCH] usb: r8a66597-hcd: fix buffer overflow on odd-length FIFO reads
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, linux-usb@vger.kernel.org, 
	linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Karl,

On Mon, 5 Oct 2026 at 06:25, Karl Mehltretter <kmehltretter@gmail.com> wrote:
> > Seriously: a *_rep() function for a single iteration?
>
> I'd like to keep this one. ioread16_rep() does not byte swap.
> ioread16() goes through readw(), which swaps on big endian on most
> architectures.
>
> The words before the last one are read with ioread16_rep(), so reading
> the last word the same way puts its first FIFO byte first in memory on
> every architecture.

Hmm, the version in drivers/usb/gadget/udc/r8a66597-udc.h does use
a single ioread16() or ioread32().

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
