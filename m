Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E16A41167C
	for <linux-usb@vger.kernel.org>; Thu,  3 Sep 2026 11:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788433604; cv=pass; b=jpX24DFvUKK1Ok/UypKaBryNYWRBisMtr85YyiJgOnIOXLGSyCfRjd0MkEV4OyLB0f98KAy1iZgHnRYe7VZX8MNF68By+LrWMSy9bFaGU4bAc4EGbP3HJNxAfPQrmA8Q62ImpvYKi3FDekJ7gTI2kAhV15VQpJf6wmsdqW+VGng=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788433604; c=relaxed/simple;
	bh=LbQmFdBaIdrD8XXbnryqlAiQcvTPd6915ddmHdSWPVg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oh0Y6UWBZGN9a85J8kidQeFm9cn4m9r2JEYvUNBD3xF8O0uUtUp4Xx9DnQTvUxuslQo4w4C+BySwn2/a2nY3XnILCU+Z8Iy/SDLQMxEHX/YpuIob789/QBdsABhN/YIUzJbBGKDEUXI59wH9uZuPDRwizdmOVBgb1h+es1Zp8Dk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b=hPS8Ju1e; arc=pass smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b="hPS8Ju1e"
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-66c744a00edso2066863d50.2
        for <linux-usb@vger.kernel.org>; Thu, 03 Sep 2026 04:06:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788433600; cv=none;
        d=google.com; s=arc-20260327;
        b=ULvfaWNli7K0xjDFCmNPzGuDXjeeWt5q37z6shZz4QRMylm2iFCbEz9HgNg9FU8Vax
         mJ4CVlD5wJKKXvANsCizmeHBVJ2+/+e9dawOj6PkI2mTY/YsvAz7UdgDzfF0k2EHRotm
         ft2kvUxKBcrYKD7CfonhzjK1Z869sIGm/XNxeLX8eYORLaHpA8nXh6NF0YowsZMJNZUk
         3HuqZ3ADN0uPTN5syO6J1+BQiNfKOKXqB3fmjO72A5RSsP7sQOO9uNGmwEU8n3Pm+prE
         QUc89W4GQR7H3zKQyBvBqG78tnBdJ5cwLyWMS7E9B5SN3Sv3/iYAsL646alvvUWuu/Bt
         7XRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=LbQmFdBaIdrD8XXbnryqlAiQcvTPd6915ddmHdSWPVg=;
        fh=wUbRB/aU7erWBD4OQ3gVYCmgPPF5vJekPY7QwTH8JUQ=;
        b=KhKCpAZrzoyQBhposEGCWTOGydfD6+yWmMDMfnllPkU3BU1dJt/1hzIT76bX9np73t
         ffURPW9sPh8q0PGeqeW3rjhpZ/jlsQvsfsozGA0D24gXjBGb40PUU2TU8cftz1j7vFz5
         JqxfA/eJWsqQrnSTLqtUw+UDKgYUZnxQ0/HHtXEjKwwqA8zNIOZdp/wo0FKSFL1Xv7Z5
         njyS6Q3LARJoEiqmEoPNmFqgNVoszxiYlwxRVmF0Jl5EaT7o6wYP45aq007sTD0tScj1
         G+AVh9lg7h9NqVoF0CS6kiTWSOfxiG4V91W06ajh+cPPOTj7VpzRBrze/rvpYNyFi1NR
         84fQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thingy.jp; s=google; t=1788433600; x=1789038400; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LbQmFdBaIdrD8XXbnryqlAiQcvTPd6915ddmHdSWPVg=;
        b=hPS8Ju1eU/tGskTFCTqvghEYD0jjeGkiyfrcBVrblxEp/7j7gTs8PNJqhVGyhDUrif
         gw1m/J+EwFfP3J/hUnoxEOhSIC+bZIuESU1BRZL+nqairu7jEryQcGHy8q/fAXDzwSvu
         MdxrNZW58uf25rtLng206/zvkEi3SPfQLjMe0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788433600; x=1789038400;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LbQmFdBaIdrD8XXbnryqlAiQcvTPd6915ddmHdSWPVg=;
        b=CPqygMDshoOklocNXH2FS68+LPWhP7rwTBXcCrSCT/awC4oZiPtWirP65YQ9rwQKst
         1jFiDC1VZmqeZ/UiWE1nU/c4ZIiJQ0IXQ0LGhgvDyGeZ0nFegxVEV2z89pNd8LCrkHG6
         L3CKIT/czEoOxF7u2oWbNOrzWhH4txJieXZb46aVJmZL3XwQCXvFhkZj1g0waS817Uph
         WItw1Ck5h1uIRFNf75vv42Q7eQ3yJLmyh2fBoLu+pGO//5P7INTwJUpugLKC1xvhyrFe
         vbxoNjxYHSU7aY53G2MNupmfIOC89kciVH7LolxeAWG8zxiYkefASKJxQBCu1wVun5Dq
         7N7A==
X-Forwarded-Encrypted: i=1; AKwUvByrT8wgD8E2zkvl+ccRaOldwj6Q9fls65JgyL2NI8eC6x+Q+IoLEkav+BzgM18DGH6mpyhUn000mCw=@vger.kernel.org
X-Gm-Message-State: AFuF++lHXnbJ6PY1S7TNU2XaDeZrfO3P59zazdMxgSJU4Y5W6dm4khhK
	JWlKrPE4aDyuC8RU02LoGtQfqXhfO5fZKpZmW/ayteCHB/9zTelho2dYm7DrWcrMLVFQnAcG78i
	Y3R39Q76JHjg+xKDvcGCWh/Esjit50u0eufHzN2olyA==
X-Gm-Gg: AYBFou2TSDMplvtRUNbWLSz+xkRrivmgkQCHc+nRTRCmmg264bkapZx3r0kfr/Du9Zh
	29lKzByOGXs8hpHHsOY83EYNfCL8NNKO72VKgjQN+TWf72GX0rQ+BEZQKrESzPdj9f581qw22S/
	EogyKMeGjV3XhW8LQYq+hT1aF/S2gbeX2Y9q3OCc3kiJrQYCJsX4kywX9uhGcmM+R707zP80OPr
	ciwN4YhTr8O7mW/XuV7IQ0mmyqAAEyXAC8H+iwlIBSiwwyBQyMYKpnteJak6ikDp0wL7WbyrMp3
	kqJycrueoN8QjQ+Z54FsjbkZAqvap4aygNTPjuLXJPQ=
X-Received: by 2002:a05:690e:11cb:b0:668:8e5c:ff98 with SMTP id
 956f58d0204a3-66f9bd39e85mr3948192d50.23.1788433600111; Thu, 03 Sep 2026
 04:06:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902-gemini-usb-fotg2-v2-0-0057408495d8@kernel.org>
In-Reply-To: <20260902-gemini-usb-fotg2-v2-0-0057408495d8@kernel.org>
From: Daniel Palmer <daniel@thingy.jp>
Date: Thu, 3 Sep 2026 20:06:26 +0900
X-Gm-Features: AcwNN1U8SZV7eNUxE5uF4XXn4JxE2sLONPUg9FNIFQqQB3thMTAqbRApQMaapZs
Message-ID: <CAFr9PXnAQJ73Lw3SDfFDC+2LFXks_FSTP3CwWK-vViyZ_==H2Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] Modernize the Faraday FOTG210 driver
To: Linus Walleij <linusw@kernel.org>
Cc: Alan Stern <stern@rowland.harvard.edu>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Linus,

On Wed, 2 Sept 2026 at 15:11, Linus Walleij <linusw@kernel.org> wrote:
>
> Replace the private FOTG210 EHCI fork with the common EHCI core and
> quirks for its shifted or missing registers, integrated transaction
> translator, speed reporting, and reset sequence.

Thanks for doing this! I didn't have the time to do this all in one go
so I sent an RFC patch for allowing overrides in the ehci driver as a
prerequisite a few weeks ago.
I will rebase my version of this on top of this series and test on my
hardware when I get some time.

Cheers,

Daniel
