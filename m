Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 628A93A874A
	for <linux-usb@vger.kernel.org>; Mon, 17 Aug 2026 07:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786950386; cv=none; b=nE/1enKSHOpzxapeeZlal0oN4DwF1q6SMbKRj9IKvNv3ZX3/Zuuqzb6dEihqNxEUzCdV5KCH83qjcTox1nxcVFwORv//KwSZ7nzDV+MxYaBbOJTesgeyGjZ6JVjXl/kTzbbiMoYNQHrFMfqogeVWSvncv7x6jdIcnl7NNrfM/kQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786950386; c=relaxed/simple;
	bh=fbgeOiEO9EGT2c+GeyD/KoGXlrNibomcWQO6vEICVc4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oBxdzc6sSbAevdtYTNPWIwLpgtBHsJOc6MNYlZhDELiNNSD9UewKN6MYDdITZWukkIImvLSggR9Cgghe5AfM6+olyFBXxGrcczX3IrUKQaoDqw2IF7cmXomNmVUx2TSqY6FFiqb1HtWBTR/VojIi/Kn8nkGYJAvfoUNrL3GOuZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-97bf8cd63e3so615008241.0
        for <linux-usb@vger.kernel.org>; Mon, 17 Aug 2026 00:06:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786950383; x=1787555183;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kzZAObXBTvlF5qEmNlbVBhJCzf1NZELy+LTZ2/1S03Y=;
        b=VIwRqozC4QE/uJssVZp6yWiroo1Szecr0t3FW2UxvtTqKMTizwLgZqocoW+GHHH6Sh
         gTg2kciZWQ0vYnKsk4JS8aXzv3pRi4qfEuCkQkSCv3Vtaz2sPhrcSQFld5F+vGAvrYaC
         ZQWpX0igp4t2VfvYTu2T7aUtlF9ZdTKdAXYYpzDVxW1+4HpP+zN1IemueLifcJypg03y
         BI2t2NziAHY73pHHli9ghvOfHQg9sRQ1onbEt257E4puMXG1xmTzJ44tUbi1/p4uQlF5
         8EKg2YcjIkMhmE5gyptu4vo4binSuTfv/vuJbBgzRDMtewSlVLpTmR9i8HJbiq2v1irB
         4rHQ==
X-Forwarded-Encrypted: i=1; AHgh+RrDi8fCPzwCXzqkKdpTq4kfEMtAUUE/QATeZM6BHlMYADZzk0laABpfz+W/dKByWQ4qrWXoJlXMXnM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9mgIB1MLAuaTMlIEEih0WllKBeXUZIp3rSWSduLlDoxyStu3X
	NXFQbVq/5sdaqmliHFinB8HDc9wLF/26J6OyEnIW68FHZUl16k9zduQ1xJ4+c9oR
X-Gm-Gg: AR+sD12EH8tfcIohKDA7h1qmJkTKSTnxAFriS+Uj/IuyuLvLNhKjjsfRJlKR0v1lM7O
	KOxiybI0p0Qnb27kL810W6sjEi5Ejc7gramACvhw0KvGvmjYXBG5m6mCi49PpBDn/enI3sEx33L
	yeN5Zj+g7BU3xGKJm3rZhyoJuUup1zcwapgfe9a20ghAxE4mxFxPjsKA29H6h7HfEB/rSZ4GLaL
	Qbxt5tlM9LbnGvSMe46XKMYqMcXcUSC6uOUedqmAQjiJ5wfKCAcadCVRexRLsp7T9nJZsRoLAVr
	Azaxj4H5Hb5/NgQ6B7TUGMhNtudgzACOAL1t9qpQYbIU2Ox1slT+7nNqU5u4/zlDmeQDcySvB2I
	l2GmVR9YOuZPl85ZlHODhDnpWedu0r2uMYzP8+2Hd1WF4H1pqZ7QWBDMsWe52PX6TCMCyYUC56X
	mJiR1WFQSWnxBPeXNkCk7IlXVflxMUjfhKrELz2WnwePmIn7la0Z0DKl3yFNn8XErd7kGO8yMHL
	h0tP9H2Xeh3aurtw0DoZdRWnTsyBw==
X-Received: by 2002:a05:6102:1496:b0:747:4d96:dbb5 with SMTP id ada2fe7eead31-76f2cf653a3mr3224812137.12.1786950382938;
        Mon, 17 Aug 2026 00:06:22 -0700 (PDT)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com. [209.85.221.174])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-773c55a3a42sm348901137.11.2026.08.17.00.06.22
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 00:06:22 -0700 (PDT)
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5bfb3347ce0so1035800e0c.2
        for <linux-usb@vger.kernel.org>; Mon, 17 Aug 2026 00:06:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrWUVSNo4s2VFTAR0Tk0plUZZ27R61hOY1Uty7Q5Qtase0FUUfS/xW73ciPWv42G3zSP5vMnaz0JqQ=@vger.kernel.org
X-Received: by 2002:a05:6122:3d4c:b0:5c0:fb8d:9993 with SMTP id
 71dfb90a1353d-5c591984b16mr3773578e0c.0.1786950382154; Mon, 17 Aug 2026
 00:06:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260811051016.1655887-1-marek.vasut+renesas@mailbox.org> <20260817-uakari-of-mysterious-nirvana-a1d0da@quoll>
In-Reply-To: <20260817-uakari-of-mysterious-nirvana-a1d0da@quoll>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 17 Aug 2026 09:06:10 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXU0Z_VP7H3=KX1g7wowG1ZDi__nDgWRmquYxhLHKvd7A@mail.gmail.com>
X-Gm-Features: AcwNN1VnMyJzYsnp7zPKVxOcOJLiN424gLCFqLRF4e6JW2UrjUiX7AMCPRyQHkI
Message-ID: <CAMuHMdXU0Z_VP7H3=KX1g7wowG1ZDi__nDgWRmquYxhLHKvd7A@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: usb: dwc3: Document Renesas R-Car
 Gen5 DWC3 xHCI USB controller
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>, linux-usb@vger.kernel.org, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Rob Herring <robh@kernel.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 17 Aug 2026 at 09:01, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On Tue, Aug 11, 2026 at 07:09:33AM +0200, Marek Vasut wrote:
> > The Renesas R-Car Gen5 SoC contains multiple instances of DWC3 USB
> > controller with glue logic wrapper around them. Document the glue
> > logic and DWC3 controller.
> >
> > Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/usb/renesas,rcar-gen5-dwc3.yaml

> > +  dr_mode:
>
> We don't accept properties with underscores, unless this is coming from
> existing schema but I do not see snps,dwc referenced in the binding.
>
> > +    enum: [ host, otg, peripheral ]

Probably this should just reference usb/usb-drd.yaml instead of
defining it itselves.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
