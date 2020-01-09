Return-Path: <SRS0=xjLD=26=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8A47C32771
	for <linux-usb@archiver.kernel.org>; Thu,  9 Jan 2020 11:30:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B4F962067D
	for <linux-usb@archiver.kernel.org>; Thu,  9 Jan 2020 11:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578569401;
	bh=JgMl8TQ7W5ftVxUEPc1XPNvlELXi5G4OxgpMmL6Mzs4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-ID:From;
	b=eM0x1AY3dbrmeg3pv33NBpE5bpmTqkG1BVtVJXlsh00SWHUWKG495ejYaM7bkxTZv
	 N44Kt7my8tSjY/gehtDSAEGjZwt1fcABihsd1G35YK0W5U5Y6ZE2kotOkt7Eh/JOFD
	 qvQ1Ln3PHt1QARJc2l2w8woUxGScV3QnxXqnrVkg=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730012AbgAILaB (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 9 Jan 2020 06:30:01 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:35632 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728588AbgAILaA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 9 Jan 2020 06:30:00 -0500
Received: by mail-lf1-f67.google.com with SMTP id 15so4953386lfr.2
        for <linux-usb@vger.kernel.org>; Thu, 09 Jan 2020 03:29:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=ywstR4Xt8g9pJeREx/RruhsNHC4SCwQyAhXsCrBp/J0=;
        b=I4TTApcAyo+cQVvQ4cgLP6OXN14Gpq2vuk6Pf9j2gd5Ypz3xMQuJNq3qn2m8LRd7bs
         rdkMFUvnTTe2pJ0Yj7GYzG7sjzATzQW9NtrEkldKdDCAdh0A6NtvzsdNnHSUdpl2T/AQ
         tmhE2dZ3e33zSzxuBvAPseWdednhKCr3adI7XemYOuNMkeEmJh5A+oFHC6nIMM7YfnTZ
         NbY+0jxQXBkDI6sZcJCD/dDAwxdDyjeb2FD/5XMoOMKbokPl0PWTSGT6wJ6xcvBh01jJ
         uhBETssGDBFH9l3OWNVAWBGoydpu/iYXPZB76qRptxnpgNWoaqNoKdrc8s/A2YinutF5
         Ph/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=ywstR4Xt8g9pJeREx/RruhsNHC4SCwQyAhXsCrBp/J0=;
        b=sk1oISoS2fL84Y9TvU9PaihvEavXnTj6gCe5ArIxlnvYqOz4BliQ7TxBo1ESTYyfhv
         0/Sh/c7KiYbVG5xLK8N0bmMoGlyLs+PzQClMvDid9J+vKUCGaA+pJsVvS9kzwzpV8y0t
         jI0WtLGaKXMVcT1GnCCCUFRwFjiUMj5VXjeQfMqjHE00KsI0+dh13iyvWXDfUMEXEyir
         EeMkzz2DBGesa039KkZ6KsDzMaZ6zcSMbzEPIZsv0Zr7OlI6TinbGgtHFwpsUI867tJ1
         cvCSGCi+75wjKt8RqcU/c5B6m+6B7WQwzOotS3uFyUdeGYFdnigR0vFGg0ZZpubsOuT/
         M3Ew==
X-Gm-Message-State: APjAAAVYySD7BzZ4EG3NYMiPf801aVZtqdW7j+fyH4A4ntmEzor7V/KY
        t00j6t7io/q9Ts36ejiJk8zycIthmRs=
X-Google-Smtp-Source: APXvYqwUHd2czybiHeC/F3r1b7bWlXHb0tKpRo2bZzbSYDQLkH9aCQ/gnSaOQIVBVJ+30vSmPg3BEQ==
X-Received: by 2002:a19:784:: with SMTP id 126mr5767521lfh.191.1578569398621;
        Thu, 09 Jan 2020 03:29:58 -0800 (PST)
Received: from saruman (88-113-215-33.elisa-laajakaista.fi. [88.113.215.33])
        by smtp.gmail.com with ESMTPSA id z13sm2957938lfi.69.2020.01.09.03.29.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2020 03:29:57 -0800 (PST)
From:   Felipe Balbi <balbi@kernel.org>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH v2 0/3] usb: dwc3: gadget: Improve END_TRANSFER handling
In-Reply-To: <cover.1576715470.git.thinhn@synopsys.com>
References: <cover.1576715470.git.thinhn@synopsys.com>
Date:   Thu, 09 Jan 2020 13:30:51 +0200
Message-ID: <87r208sw7o.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Thinh Nguyen <Thinh.Nguyen@synopsys.com> writes:
> This patch series improves the handling of the END_TRANSFER command:
>
> 1) Don't issue multiple END_TRANSFER commands while the previous hasn't
>    completed
> 2) Don't issue START_TRANSFER command while END_TRANSFER hasn't completed
> 3) Remove arbitrary 100us delay
>
> Changes in v2:
>  - Remove unused variable

Tried applying these, but it failed on patch 1.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl4XDusACgkQzL64meEa
mQaHuxAAlCBqgEleR01XOtPAEuH6tTnyhoGUSxkh2AvklmhDha0bRe+OCffLBELY
rHwClRTwigx3JuuBfa6zrhQZZ8Z7mQhdNDzN0WvMatuwEf06fBVuSqUVp2fgP2+p
8uIM4AP4zs9OodRjX+DC/mhf3GX1Ih1tgDzHkZ5NZ6+WgYKBvG0jBVjZFKoVl7rM
/gDzbuAjzJztpf2B/3OPW6Wl/s6+jtz3iC8V10JprT8imvsprgWsS3qbBoQIGx5Z
h7RL3qO0bkFR+G1JZfuy8Qx8mi9YP+7k7QHPgoKFVTNm8SgdWbZre891oE9kJo5X
3iU2FqHJiURMGoMjZvbWI4p7tNYaA2O2e73eDglKObJpNLGp8B8vlUx+N8Tv/Igk
hIT96eKv2ud3/JYBy7pus/dqrJvxpPbh4ytlLwcqUsDtAGt/FfNSzL6KYE5Gkdsd
MHhiXBu2ckiDSoKGBigm+WgeAunbhpJq8aUl03JbiYDeGirLHRHELr4N07AUdmf6
UFA0BVej6AwJqtxvaSy0KcydtbHxBZ7bUHnKoVFSB0EfJqn9wGYRVR+1fsZzj0oO
NMRrR+rRvhpaIV16py5mAHvdICa1eXio/ntv+mOkeQWHY1D9QPSNnysyOoadevGR
vCsAzY6cj/GI+4HGQF9xJNSfM3S4GAIVXRRUfBT8Nx+7NYjlEWY=
=7O2Y
-----END PGP SIGNATURE-----
--=-=-=--
