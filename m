Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 088B64A4983
	for <linux-usb@vger.kernel.org>; Mon, 12 Oct 2026 16:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791822175; cv=none; b=C9boSwwvDOzMR/6EKg+RyER8TjDNlkUyK8tSUqJz0B/CGMvWoEBNUOiKO81emPfynUpvXSwAB0Kw6/iiYLaZspOa7ImWNX6STqLbQO+3SqKbsbSRWYtk7mxyrOTISVZWeD2kZz6+AzKUSqdFsH403h1XSZ3jvqmkIa+ELfKH694=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791822175; c=relaxed/simple;
	bh=na/SWdzUd8e3s7Zx9+08OULjEoTlvLyyETaBrZgmPlw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fFQdpWawqIkn1SPjkQFN9ykR6lujInEIveUYWK+jR8+uojVIinb6uoPDV5/HXw0uv/UJhiO3BEFqj8UZs0K54G7YNfcLQbyyykru/LQFqYyxh2z6qi/ecOPAJ6h399awZ2Cfxo8iWiuNw3iyDLCY6861R7QkbdTHJ3cHOBAbBx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-9851592ada1so441591241.0
        for <linux-usb@vger.kernel.org>; Mon, 12 Oct 2026 09:22:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791822173; x=1792426973;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=X5FLZdPf6RJVfwLd6QiWyg9HD5zORQA0u10QEMu3ZgY=;
        b=R6dkyxvdZKXeLP5FY0S96tuy/OzvrDbmMq6P4/ifg2VzLpakuprL1/jIaxqlBZvK6i
         L8PERZUWSdaMSM4CCMup7biYkPHtgR6DhoALlyh9KWCsJqUvDKbgEwX8NrNexTbmHnDC
         pRBndh1OzW5Pg/mAguSycwVoQm+1AWwwj5TlocD8Zi/bLXe+St2k4aS1PqABrI4eVxRW
         urPTjUrL1c5FZcUWeR5NmwoHvtcXo3ov9dGyoXQTW43BORZPnfy+7zSE7dhTgfpO9G+P
         XXIWmThw9a9Acvr/A0y9Fc+flH9OYe+o5zcXDm4PMdmjMRcean3F4viXO0Wv4q/9jFMa
         gMIQ==
X-Forwarded-Encrypted: i=1; AKwUvBxWESUfCK0rZ3hbHajVwv2nOplxTR5aIl9VB3kPPWaJdrCgBlDVAcaTJW/geYGY5p0YH340LIM0Yho=@vger.kernel.org
X-Gm-Message-State: AFq9FYLg5yT+NEvb0nrDXKNgPMHZdV/GikiK+OmA7ahSFrDvOS4xQsYk
	GuV7zUjPKmd7pa5CxgJeFHFy2T5u4rAFrhpCrEVoc9dlr9dC3y22iUBn0HpPXBGm
X-Gm-Gg: AYBFou0PZjZ7+NwTTVyXc8M9ZKa8Hpa/h/1lQ607o90Mi+rjVuVy6h6rBVAX8f6zgjT
	y1/3GUcnH+AGkD5hyE76jiJhCbBLMrXLWDcLzq/QUK+KLFHD5iaz7JpIVAxSwkfYAKpJfRQhzm1
	efiIWbbQ+9qsTmV6/TkwUD8PHtVYR3pB9cVO2MFRHFUtpjU5H6srHsbM4rZ6BoGUQbSNawJmXDC
	N40las6MLEwcyJ8OADpPV5QNytApTpuHgD8UYKLVwlHK2lVuOx25gmX6g94CSFIZeDOVhAZ+KHo
	in+DRbA67EV/5rPuaLPBmh5cGaIDAzx6PZrJOiR0w0wotarna40viu8NLXycbexX68y7uoR5XVu
	O3B2/8d9cpw8Tmktef/4SKBmRuP61bIjKEhY9jOyVhj0KJhMkKelXdWvk79wuEGXsVO2oQxBZ+/
	G3Fze9PqrMg+sM17/ymPfuSjz6JLzORsBa+Z5cBV2gybPPTg2BVEPHLAlVp3ljUOLYhw752/NSi
	FWPpJWUDbPRKLwrFzjLVkc8wWUBibyvl1Ywr3Y2
X-Received: by 2002:a05:6102:5114:b0:7c3:3890:6076 with SMTP id ada2fe7eead31-7cb37250532mr2534677137.6.1791822172825;
        Mon, 12 Oct 2026 09:22:52 -0700 (PDT)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com. [209.85.221.173])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7cb354016d6sm6986581137.8.2026.10.12.09.22.52
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 09:22:52 -0700 (PDT)
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5e91e422859so948927e0c.2
        for <linux-usb@vger.kernel.org>; Mon, 12 Oct 2026 09:22:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxXGxkusEeK3kplm7RxoL5cb5wZ06vVJ+zqhvwG4NZmLFxMuevwsB4BEzzVwv53AhN5q47GFbg8sXs=@vger.kernel.org
X-Received: by 2002:a67:e706:0:b0:79c:99ea:2c9a with SMTP id
 ada2fe7eead31-7cb37255716mr2460381137.11.1791822172375; Mon, 12 Oct 2026
 09:22:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261005212823.55737-1-kmehltretter@gmail.com>
In-Reply-To: <20261005212823.55737-1-kmehltretter@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 12 Oct 2026 18:22:41 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXr+2=wvRQyXMj6LoyevvZ1wSWGsgMzbajj0OGqJRnLsg@mail.gmail.com>
X-Gm-Features: AclHuK91kK71gtIrwgy9MEJ3x0a9HocKnRnE0a0NaQiVQriI1uAFOcMNBTCeXz0
Message-ID: <CAMuHMdXr+2=wvRQyXMj6LoyevvZ1wSWGsgMzbajj0OGqJRnLsg@mail.gmail.com>
Subject: Re: [PATCH v2] usb: r8a66597-hcd: fix buffer overflow on odd-length
 FIFO reads
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, linux-usb@vger.kernel.org, 
	linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 5 Oct 2026 at 23:28, Karl Mehltretter <kmehltretter@gmail.com> wrote:
> An external R8A66597 (pdata->on_chip is not set) is read through a 16-bit
> FIFO port. r8a66597_read_fifo() rounds the byte count up to whole words
> and passes that word count to ioread16_rep(), which stores two bytes for
> every word. For an odd byte count the last word puts one byte more into
> the buffer than packet_read() asked for. When the data ends at the end of
> the URB's transfer buffer, that byte is written behind the buffer.
>
> Enumerating a device is enough to trigger it. The USB core reads the
> configuration descriptor header into a 9-byte kmalloc() buffer and the
> driver stores 10 bytes. An SH7785LCR board booted with slub_debug=FZPU
> reports:
>
>   [kmalloc Redzone overwritten] 0x820c4229-0x820c4229 @offset=553. First byte 0x9 instead of 0xcc
>   BUG kmalloc-32 (Not tainted): Object corrupt
>   Allocated in usb_get_configuration+0x12c/0x11d8 age=51 cpu=0 pid=10
>   Object   820c4220: 09 02 20 00 01 01 00 80 fa 09 cc cc cc cc cc cc
>
> Odd-sized HID report descriptors are overrun in the same way. Without
> slab debugging the byte ends up in the unused tail of a kmalloc() object.
> A transfer buffer that is embedded in a larger object has the byte after
> it overwritten.
>
> Section 2.8.5 of the R8A66597 datasheet tells software to discard the
> excess byte of the last 16-bit FIFO read when DTLN is odd. Read only the
> whole words into the buffer. Read the last word into a temporary and
> store only its first byte. Use ioread16_rep() for that word as well, so
> that the byte is taken in the same byte order as the words before it.
>
> Fixes: 5d3043586db4 ("USB: r8a66597-hcd: host controller driver for R8A66597")
> Cc: stable@vger.kernel.org
> Reported-by: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
> Closes: https://lore.kernel.org/linux-sh/3bd32eaf159db61ed1d423e1d52a869b3689c682.camel@physik.fu-berlin.de/
> Tested-by: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> ---
>
> v2:
> - Simplify the handling of the last byte as suggested by Geert: no count
>   variable, len & 1, and a plain byte store instead of a 1-byte memcpy().
> - Reword the commit message and add the SLUB report from Adrian's board.
> - Add Adrian's Tested-by. It was given for v1. The FIFO accesses are the
>   same in v2, only the copy of the last byte changed.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
