Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E214562BC
	for <linux-usb@vger.kernel.org>; Fri, 14 Aug 2026 08:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786696360; cv=none; b=FgSaPeqxtS3+5D+2LakO4Y5QS7YgAl7+fdpP+5mrMg2QWD6DcKs3pf/aZ9N5RND8t1zHH10KrWVahgj1A3fVrRjNF7MeAU011SabgnrhZL2ugvgMyu+Jyin/Xqnsvmcet+HP152X39UdZbQhr8TXnu6YahADL0iHLuYUAHW2dQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786696360; c=relaxed/simple;
	bh=nSy4YnXDZmEVPM6ByRNEJNzOjITIxUJLPWdIUDhrpyU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CnoOXTmcwyupv02p22S5pM1sG3Bkzo5TGtwdkm+HkAWCzqNEZnKithZIaLnurohpi8A+9L5yI2+5nFpLLpH09i2wUQcJR8IESK6gAQtd0Nr4OvQxnKrUcW7SJ6y31NSf8YxW7LwWeCFzLcb9QuVAZsQO1G1ir73D3YDHli8aLZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5bf9506704fso221640e0c.2
        for <linux-usb@vger.kernel.org>; Fri, 14 Aug 2026 01:32:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786696348; x=1787301148;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UhCRzI3TB4j97WDpdASWQlB7pngpUekrwjbWYGiYblQ=;
        b=DSrMTwc8D63jHLUP4sL8VT/lgAtQNGdyjMG2iPhBIGif/lrqKj5nwfcf04jrHl7l9n
         2GAaxuWIqswDMNQ/fFIh+IWQ1pnBNsM3GZC15PaDfhhTqlnIo5G5PmSbiHwHfSLV5Qg+
         JZ09nuoXtHxTKezC84Oa90fapgZ0O8zb6mH7JCr3WJHdecH71Jtyt1IdLf1pze6tcmCV
         m/iLTYUs9HwcIF5HUUUR1b0BZjaC8CPsZ36PuAiFkZgd04APUbVfzaKjvRKIWGf1p9jv
         w4/GRpGtzJwuDG8Y+yOIRC84CBjUZczW+I+PY7D9ACx5TcVcEh89OUftZCqahI/mY0yo
         IHoQ==
X-Forwarded-Encrypted: i=1; AHgh+RpHWQopJxXgWhn6HnLR/Y6c502XzcrnF14VNVvJkBfNimGldDcd2xmlPc99QIymDRgbtsyYy08NVtw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSll4dFOA8CVhkHO4dEe0jHBmK99iFZvd1dWEFnLMCZlfCn5YC
	KNZu8eMO3OgQ0v+OftGuJtuMgjoa5bSfbjp4gz04k5i9rknLmgnJxNSlfrfdUNPqEIY=
X-Gm-Gg: AR+sD11uCxlCPIuW5H7StQvxxUm3DHu/XcRHqkXXA5PXL0+JYnqniSaF6jBdqkHY76V
	tsugLi8vG2sUkO9xRj3TEnTZt5fzAZh38x1x8R0jclFVp6IVoTW/yE2ME5FbkLov5DSsQcspOiM
	GAOTHyb/8GYW5XlTUvZX02Isa/e+6T1Y3Sg0AzMo7Einc+sqtHJdrPLVhd363b3Pql07eGHTkgx
	eKmq+BeX9YKEAjid7LoFQ/LRLLtYRzNU+RUWqXJo68MH1l68fac1/rDDc1LPAKerRWjBl9YBRZu
	93v8e+vkw6IMCoW6be1eRPFbZP6zV2vhRrSr+JovD+e+N98ZeJFzAlD635CwbfhPfpDrNgE17Cw
	PPVoPb8We7kbEhhdW8Hxw5K0yIbqWaFVDC+IA+cxYMs+pombo6ctoE/DL3iJIdjZF/M+gFPEA44
	000ip3LINGqCO3deHf8KdWWeAPNeTPVcVtjkih9uqjUM+OZoTmi3hcwiJnXcbN79LWhOckNBvTy
	P26iLrAXzYp6n8ITRZ5jGqZoPn6qw==
X-Received: by 2002:a05:6122:46a6:b0:5bb:aae2:1754 with SMTP id 71dfb90a1353d-5c591f2f2a4mr694768e0c.13.1786696348069;
        Fri, 14 Aug 2026 01:32:28 -0700 (PDT)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com. [209.85.221.179])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c597b308e7sm427615e0c.12.2026.08.14.01.32.27
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Aug 2026 01:32:27 -0700 (PDT)
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5bf83925ddaso238457e0c.1
        for <linux-usb@vger.kernel.org>; Fri, 14 Aug 2026 01:32:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqxVhMUCwF2l5IfDLRuTM5JWhX4TJffBRW3pdAM2rDYNRd1TA32oFpd5yURHonhoZfZM6q0dHatXNo=@vger.kernel.org
X-Received: by 2002:a05:6122:1814:b0:5c4:1f03:a1fe with SMTP id
 71dfb90a1353d-5c591c3ed13mr714902e0c.1.1786696346767; Fri, 14 Aug 2026
 01:32:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260814075531.15446-1-pengpeng@iscas.ac.cn>
In-Reply-To: <20260814075531.15446-1-pengpeng@iscas.ac.cn>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 14 Aug 2026 10:32:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUZdv6FdhgSB_u5wU4YoqpKFqKmhs8x+bZeGFYyvZ5Puw@mail.gmail.com>
X-Gm-Features: AcwNN1WPLr30kFj8CbzyLORiLfA1whfORh6IrkvKJcdj7IXFdcU0Lq1p7DeCyxE
Message-ID: <CAMuHMdUZdv6FdhgSB_u5wU4YoqpKFqKmhs8x+bZeGFYyvZ5Puw@mail.gmail.com>
Subject: Re: [PATCH v2] sh: defconfig: enable the current M66592 UDC symbol
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-sh@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 14 Aug 2026 at 10:01, Pengpeng Hou <pengpeng@iscas.ac.cn> wrote:
> The M66592 UDC provider is built under CONFIG_USB_M66592. Several
> SuperH defconfigs still enable the removed CONFIG_USB_GADGET_M66592
> symbol.
>
> Replace the stale entries with the current provider symbol.
>
> Assisted-by: Codex:gpt-5
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>

Fixes: 193ab2a6070039e7 ("usb: gadget: allow multiple gadgets to be built")

> The Kconfig/provider mapping was reviewed statically; no SuperH kernel
> build was performed.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be> # build-tested

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
