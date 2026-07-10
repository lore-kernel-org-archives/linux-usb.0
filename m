Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F7C4195BE
	for <linux-usb@vger.kernel.org>; Fri, 10 Jul 2026 11:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783683351; cv=none; b=Sn3s9kTVujcR94I/bloKPzNjpcv16VAUdvnYnHbfZTu2v1J8SZWZoF6iCeYRL8PrnT5lYrcEk6/hnxjW0WFVLQKVUyPaG70LCWdpn3fVpjzS6R6CyJqcALlPX4LXyfHpOpvMmZYChsYicANlKhr/Mu6oaQTDPlZn8/rs7/eQfS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783683351; c=relaxed/simple;
	bh=4pksEl7hMLsBYG9ZkoLxK/BecZCy0PswewcYkqaTKsE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VIpsfFCUHIQPtVOBMez0Xoo8izp8VGjm5x4+IcGX036Z2UrSzh6DxqEp+d/EkEwQ7FOL7vVlVIw0rfIQ7jAMoZZrTJ7sQS5nGPG++PEBrpaz16tTsCrC3nDpxSUsSCspNkfWnH1K593dNwYKAQdt3nc27epviKqOYamSBi2EoK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5bfa99f8ef8so386982e0c.0
        for <linux-usb@vger.kernel.org>; Fri, 10 Jul 2026 04:35:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783683341; x=1784288141;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OJD6tiSjIPreQ8N2oNzf0qaDxzfObFILUs5bMv8F2lc=;
        b=hW/RMu0J65CQ21n21ZfZ+mPM2cbkPLdUtdFsWWJQMXdn806N2iVaiCOtp/MeiIk6Ou
         DXjP4xPjcbvF7kWxAVWEdHkyOq5uDhkiqOqsjnq+n4u460pi0P5sysv7b/novQKU9WUJ
         AQ7zuskX6bc34h4p9bSxxfWf1SnnEx37dYpD30rK11iiu0gUm3eQIT+z8boxtLLb/Nzl
         amzInscOz4rvSpbefsfvZoazUqQ8anZUSXMurn9RtMJDyNPtJaA+zjYP6kvsNZgwtT/z
         Zd00tK2EdZxlPPOW1UZnmmxYuvuSrde0kTRG1Sk0KzxnFYo0QWxGISJmScfH51+mel5l
         bjYg==
X-Forwarded-Encrypted: i=1; AHgh+RovF0ELoVep+DxO7Uh2Nqp8aN58CTlnklRcflHJ3bOcmxBGJ1V8DwbcU6hWCp4eE8r/Nu4GQfRFtGY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyk6i3p2vUEWvWn2t4AWinwcNOn8oHiVIp2Y2eQjarIcSRD86r2
	RK8TxDAfI9YX7ZnhiLC0ahVPBwNohw+dYkvhBjBzrZmGn8rCf+6TLPutSgbmG/Rd/Hw=
X-Gm-Gg: AfdE7cklvAaXpKCJIcbQ3jrtZGIWv9eMCXcQNmKxolpcc1q34wA2hwjazOyJEA7ddeT
	Rw+8G3ciHZmpcgVYijCdQFiIw0aOm1ypT535rboBzUE0dR9zJD/Eplb0taLB40bha/evZkpg06E
	vaygVWeyHDP2KFEKZPNzRoQd/3jBFXQxtIfjxYt9ZPWetJ2BMdoQzCJuiX0VSQ3u1/im/EBl8Un
	1LWPZAIYYnICcOUijHcpFRcBnqSkM2vHBoIALZbYajM4IWYoi1q5nrb4KRdqSZi3etTl6/JibaV
	KxCXEQDd4hymxNbD2e7VijiOOpPuSOybTUK39ZrINoR3rvI+RWmZZe9UZygAM2wOEtojQzuZyvq
	5sMvaI51upmlkhXW2BI4pw36hI5Jz4Ro8FpCRTidmVbFQlkFcrQynXn7+G7P/XhJHnehgOQSNcQ
	MW6iOPu3w5EiN6hwb/1xmejJRss8PP4+kWJIzUijq4Rk5ODC0Vvw==
X-Received: by 2002:a05:6122:218e:b0:5bd:8dd8:146e with SMTP id 71dfb90a1353d-5bfa5452ff8mr1519828e0c.4.1783683341328;
        Fri, 10 Jul 2026 04:35:41 -0700 (PDT)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bfba710bd9sm30167e0c.12.2026.07.10.04.35.40
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 04:35:40 -0700 (PDT)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-971de219a85so354498241.0
        for <linux-usb@vger.kernel.org>; Fri, 10 Jul 2026 04:35:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpIt65JxIdLnP6HycOlofEn01h+MVzmUPq2Ix0k34N7WUhNSCJVIyMbUUv7QHksxojdx1uJTkS5gNk=@vger.kernel.org
X-Received: by 2002:a05:6102:8195:10b0:737:edda:e7d7 with SMTP id
 ada2fe7eead31-7450c6bee37mr1282524137.1.1783683340215; Fri, 10 Jul 2026
 04:35:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260707145135.247565-1-biju.das.jz@bp.renesas.com> <20260707145135.247565-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260707145135.247565-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 10 Jul 2026 13:35:29 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXh4LZ8yFyca2EXSq34P0+OgxLyA2J7O6OhZD1PPVanhg@mail.gmail.com>
X-Gm-Features: AUfX_mx1HkmTEWvYMocI1aNW_zjBk9JHXgCAqkMrY6has8ck0rJ6O0h4yvq4kRE
Message-ID: <CAMuHMdXh4LZ8yFyca2EXSq34P0+OgxLyA2J7O6OhZD1PPVanhg@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: usb: renesas,usbhs: Document RZ/G3L SoC
To: Biju <biju.das.au@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 7 Jul 2026 at 16:51, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> The USBHS IP block on RZ/G3L SoC is identitcal to the one found on the
> RZ/G3S device. Document the RZ/G3L USBHS IP block.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
