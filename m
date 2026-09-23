Received: from mail-vs2-f41.google.com (mail-vs2-f41.google.com [74.125.227.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D76FC37756F
	for <linux-usb@vger.kernel.org>; Wed, 23 Sep 2026 14:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790175384; cv=none; b=IlsXusvFpJn0rKDRgTgULtgs5KyOjDqthRWqSkb3EwYgjLmd3MVdjRpTtFHIv9LTI9s2Ks4eutL257oOr2DfXd7oRS+cU0YINMiDq97mDHqve34v6Qw5n74DJST9CzwlW+pBq+MsV0eVuW5aM1zYb5uhjF7/Sl9dGn9dZ66X+1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790175384; c=relaxed/simple;
	bh=R0Hl1uM+B2TCFyzAh2mRelpWA1TgmI+2NQ2VkDXBKN4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N5fQUz1YCMGiSmFFhm4BrKlO0z6SQSnrKAcyubgSRaP8bAV8rKr+llPBujblp6WI2kAGsVx8NDL0+wZrvv8c9hRYlB6Gyue8vppauipKmEpOfqGn+M/nbw1ZiQHme29zOZNP0X+4Sxoi5xjqRLFkTVb9fj7txWon40Oyt1eOTkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f41.google.com with SMTP id ada2fe7eead31-790b4aeb66bso554494137.0
        for <linux-usb@vger.kernel.org>; Wed, 23 Sep 2026 07:56:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790175382; x=1790780182;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=u4gaNTKxdC+sW3aviG7p02o1OWtFZhqrn2Ys43SAJgs=;
        b=QQR1Nn2rBrt1bgJ/NVd8AOpu9DHEiLhBBrrCYjuBThkBrfibbffQal5yoa8tO4eigN
         HZIAa9bsfYAQWr1Awh3Mf+D+1XeNNMuEvRrt6th3pqRDE6tM9ZsNuhYgDv/c2IptdBYY
         P2EteGfLdEIHLIW5dGpeI3ZG1bRB9AW/mcoY7GAADmohvFaKRmH9K94BEPbOcpbQoBZO
         4E3oFG6IXKlyJ1lWxIbNyC/J4nB7GKs8OO8sLr18EdTU9V1e0Jz6FrXZIHIll083ojA6
         dVpAhWSbDGR10dR5tFUah4lIFdTaPi7rDnqfwrqHcNKVSU4yD0XewbRvWk43i8Brf+Rh
         DuqQ==
X-Forwarded-Encrypted: i=1; AKwUvBwGuZavg51/XS6q6kQk851qqxb/FGcVl6UF+a4PJ4pSlejqVF/givFSX3RrlpqAp9u+aFP0xLdambM=@vger.kernel.org
X-Gm-Message-State: AFuF++lPkw5wGrT5aJkD7a6vNiD8qc0xofuw+8v9RCRKI0Ra8jql0RWK
	+I2goi4BBs8JSj2xI+3BLA/gkZsm7ZPMTSVejIG/+vlE/9HXziz/eR8Rt838rG7Rn2c=
X-Gm-Gg: AYBFou35CSC1cCBU8s69tr4JZbQZ/Ox/wt/tdkBVzKnCNu6Dv2rReOmfbFaxCIi6vAg
	WhvtXWUsdhH0kJTKZjJIvSKJFa4IgVm/66ZZpdMtyumXQulOj8iEZ91G8KHNbkZjeENuRzLkLc/
	obfhT8knBBMyB9Ol5Tie9tf3jK5dkGb/xiE34jCzcZ4ximzXJsTa57/AZSPcrERT7jdsvJifvEr
	SWscB9t1/4luF3xGyswzf+7MvvCM+vxes1iVqiab39tTVxxh3DuEbd4A3XRySKqL7AX3ktZT6+/
	hkgfFa8BNZA8Q58Fd5Se1NB1Vc8I1srIIxoiZNtKNVsrsJsbKUZSFWu5d5WxN8agynUFo8nahNa
	c42rjcO9x2z0wcivfnAqfQ+MI87vEPM5JYjGMUaNeu4Ei587L+5a4NlCuKL5hJE1bR1kHYWRYpe
	ooxqiTLqWCsJLs+Ufj5n2PomFba5ssz9KwmEybIQKOEj9l6a7Xd841CUgGlOUd8I0u35Q/YBDkF
	k96pEfX4zTS2nFrQJx/PqvkiqMvWKpi8SU4lNR2VXavkrES
X-Received: by 2002:a05:6102:580d:b0:7a2:6b90:3d7b with SMTP id ada2fe7eead31-7ac1b203f48mr2881713137.8.1790175381676;
        Wed, 23 Sep 2026 07:56:21 -0700 (PDT)
Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com. [74.125.226.204])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c9f04f02bfsm3286554e0c.7.2026.09.23.07.56.20
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 07:56:20 -0700 (PDT)
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-97e96a8ba8cso717524241.3
        for <linux-usb@vger.kernel.org>; Wed, 23 Sep 2026 07:56:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzQCbYyRr2aVX9D3BG4fTYDleDukvuRdjqquP7fDTgcFNm7sdukaryrHm41zYcGmimx2Hi4l5/J86k=@vger.kernel.org
X-Received: by 2002:a05:6102:5e93:b0:7a1:f7d2:e827 with SMTP id
 ada2fe7eead31-7ac1e25c9a0mr2449263137.32.1790175380384; Wed, 23 Sep 2026
 07:56:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904-rzg2-sr-boards-v8-0-94c4674927e8@solid-run.com> <20260904-rzg2-sr-boards-v8-7-94c4674927e8@solid-run.com>
In-Reply-To: <20260904-rzg2-sr-boards-v8-7-94c4674927e8@solid-run.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Sep 2026 16:56:09 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUYm-hG5RcQpa4GGF=r07Lrgc5t5=Nu9qPhJTyx5kebzA@mail.gmail.com>
X-Gm-Features: AclHuK_46aJgUmbOx6pmISWhWZ74QNKHCsrv6CnnvbaLCpF8u6RT7TH__uXbV0M
Message-ID: <CAMuHMdUYm-hG5RcQpa4GGF=r07Lrgc5t5=Nu9qPhJTyx5kebzA@mail.gmail.com>
Subject: Re: [PATCH v8 07/11] arm64: dts: renesas: rzg2l(c)/rzv2l hb-iiot: add
 dsi panel dt overlay
To: Josua Mayer <josua@solid-run.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Benjamin Bara <benjamin.bara@skidata.com>, 
	Linus Walleij <linusw@kernel.org>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Jon Nettleton <jon@solid-run.com>, Mikhail Anikin <mikhail.anikin@solid-run.com>, 
	Yazan Shhady <yazan.shhady@solid-run.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 4 Sept 2026 at 13:57, Josua Mayer <josua@solid-run.com> wrote:
> The SolidRun HummingBoard IIoT features a DSI connector supporting
> touch-screen displays and is usable with RZ/G2L, RZ/G2LC and RZ/V2L
> SoMs.
>
> Provide addon for the Winstar WJ70N3TYJHMNG0 1024x600 dsi panel.
>
> Add the addon in Makefile for all supported SoMs SoC targets.
>
> Signed-off-by: Josua Mayer <josua@solid-run.com>

LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
