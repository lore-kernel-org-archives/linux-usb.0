Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B93ED41F35A
	for <linux-usb@vger.kernel.org>; Fri,  7 Aug 2026 22:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786141970; cv=pass; b=ArXA/pIEPCEmzyp3RsmNBanNpZMjeGRmu80yCPrJvwBahzbcVHEP4Z6Ho0kD4pkQ3rQ/bv7XQzeVwM5OYY93zM0h/C3HP4YEEVUX2bCrLEsP0o0jlxD48MhmFQsRF4gobjyPYYIWeKF4jNC6NrbtzTVLrbJ+T1a8Ug3FCiOfVzs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786141970; c=relaxed/simple;
	bh=JwddWGJZUPZTzv6QSlQzcPEBc+v0AeD0PB2XVffGRak=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i6ZthgW5VWteMpntAk/jyA2/SLkqMqmnOV/d2Q6JrKPTrOC52znUtXiUK9IP+7R2QHxgxNBOUNNh+//gulQIhxxzXyw1Suf/an4IM7Z2wS4Dkc3vXXs3lXW7FKEZJEIuvdI0zOiXn+e09I/XGGxKiNSRtnEReMssS80Y51M8kV8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GywWj4T2; arc=pass smtp.client-ip=209.85.222.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GywWj4T2"
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-966eabad303so18922241.1
        for <linux-usb@vger.kernel.org>; Fri, 07 Aug 2026 15:32:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786141964; cv=none;
        d=google.com; s=arc-20260327;
        b=EyBK4JtH7oj13rFkXDUCmltOmBR+MB+W887h0yPnbRo5urTIWtPedjG68f72y85+lG
         FT3b5+Gmuhc4MbwJVvVnARREoxlfMN8wZdZKV4DJli6zcE59smIawkKhpMoay9KdVqu+
         Vhe4P2gA4ps225YEktUR3yhkQM8YZIiQoz+kMFh8nAjg7M2sY9VuVsVoZHLrEoNGHXVk
         5XkD2dMVoig6q9227GLkNCKynKRN6UCufQ9R+U9+QZdXXuqSOkC23S173+WyGakLBgxF
         oHK28cxpsjXFQHLWW9ciJpLGGd6C1vV4wab1vE4T0/t3t2GCQvQM7/7+A9G/clZi0lwq
         ZgyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fS+xnTply4IXaJCkwQuW09XhcpXvBoF9FN6yjQ3qbqc=;
        fh=NH5gzwCzA3x8xLX2vR25viI2oa6kIZa6CCkF1qg6vak=;
        b=N20AOFPbTNAD4t1oIHxSN2fEGrwrHP13YE9qyfOzfnQzoVJWb5byJvMT1tn9iTOhON
         0qLUJZz4v+8cv/GGs5/H2REokInYGZN2HLfPbPTEdqdwg//AD0c9OwCuDbFPNkg3dNb7
         Lgf49wwaFli9VKKve3v9jCpWPgrFdrUQPNeE9jFU3kgER1vBKNdoKaNme1IaVj1KxLUu
         49kTs14J0SqysZw0uTWdeHQr+eT6qVNJP2eAoH1Fo0oZoPrirNZrCS0LXP3rAztZkXNG
         Ldw5prOLTIBzkwYKoCxik22IyYmF4BS4zuh3ke6GoFkgJAOh/0wpeyikdo2l6lXt5EFE
         fouw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786141964; x=1786746764; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fS+xnTply4IXaJCkwQuW09XhcpXvBoF9FN6yjQ3qbqc=;
        b=GywWj4T2knf15AfgTJDbwBtzDTM92LNdaEDsAKitc0j+V+AV9/s1lNumRYmw8JyXsV
         inHxrDkThPxGbu2lwTFe8Rg/yGX+cKCE8uS1LT/27grnY+YW9SuvNUskO9yJQ7c6oHO+
         BVWYZj0yK7obxq3WixDue7BwQg6s6d6oCRzhFXFuiKMKh/1rGXPAq63sFA4BFsi4JShS
         +Cu8fQF2G9hSV5mMXJts7ebH8DYzoxR7Ygf+MOEQ1uVSWUjtbXeuf5q+faL2HORjo1ER
         T1W/3PJ0QzYqThy+eUWFaAqz+7mLL6BW5gMq1U4eWbQsBiY6qanO4y0iJCNRgsYGSGut
         Etgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786141964; x=1786746764;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fS+xnTply4IXaJCkwQuW09XhcpXvBoF9FN6yjQ3qbqc=;
        b=ZLoMiF7Lguwvg7YHsUj0AMOwxbaWsIAul6deqyEbgKa/y516aGzOEmFwdkOE/1DHu7
         LE2xcbfxVVo+MbJmEXD0sMAe+0IlMqy0PzJpMp4MKiFO0HhCQJM2NmUJs7qLdxCMiXOX
         bOy+AoyRRVyzDMBiwWOnB9so8mvYzGvLhLshveSuK2APmTPBPXEGt0cSyNWJuuhzXTDU
         6U+MUjLCdNhLjVrJ7UBg76/PMdy4PC2KBZPYm46IP5ChJ0X82NytQ65kZ9QCMTrTmsGX
         tKYcoyLItWhYFpQC6lM5w1tNJTfTvnGLSBNehjS8UKH7z5cqvqGJnMpbYQawICQH4PU0
         zwqg==
X-Forwarded-Encrypted: i=1; AHgh+RroRie0utq1KyZiORR99XktXOtqppKPtc0SgeQoZZH75VbwVDuwBBlyUceP1F3CLNhf3IqrcYE+lQ4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyqrDFFGbrHl15LfFrizKC1XLNVEF1SXoK71V8g5r8+cVjIixNf
	ASF+WJRFxvFQUpf9uSP+4gjySwpAvt3rekA/OxUcfqJRrqBc+8izAehrHCxio9YKfeiOpPwqSuI
	gpRzDd8Uyrow6gaxXDmqiw3DVEZjmUpM=
X-Gm-Gg: AR+sD11heQEmpqdchoYJPOvCd7x0bQPtiXZncQO9ApJC5fAUrXzoIcrtPlnEIo7xam/
	XcNljZ6hyAR54WD0V3REjFOwUCKIbiKc/J8o0X0aHIPuYWTIu69W4MeEcDIRrL2y0Lq2u6LZHwb
	V/pzCURZN0hiCKfFJ++Qlp06a3TiVXjT1nYIwqrqM0GkHAaEK/CC1MUSy6ujHcvOVWx7qignG0p
	ZNRO7TX4WvR5nMoAnKlJQ/YFcxydIN4hnBf/zc1hz/4kfMw39dP/Rk9/mWmpAuODoHRH4q/nY0T
	XqEw9PlM4fhbDojjPSrQP+LmpJP5i2Hu6TQRoUKaSSvi92Y5untSYGGCVyZBai2UXT6zYUkwAOr
	h8rxdldnQBSx68olFfkcK2bpDUTTA9pAFcHO2hnLaMSmfV5n8ZvnlZ1dKAi2tQZJDZnc38yTSsP
	+7AE2vy1jR98zOfXPFO4Srk8XiVYfpdJuaqBOe
X-Received: by 2002:a05:6102:c10:b0:75f:e517:ec96 with SMTP id
 ada2fe7eead31-760e3194fc4mr6510269137.0.1786141963578; Fri, 07 Aug 2026
 15:32:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260806-submit-mdio-of-dynamic-v2-v4-0-4beb0c50d5ba@gmail.com>
 <b2e83ba0-2e9c-4105-b806-8a155e8b9aa5@lunn.ch> <CADvTj4rame1n8eQL2GUOaJHnOcR_cqNxzNYO+QeCLYDczEFeUA@mail.gmail.com>
 <ddce5cfa-8cf9-4f9e-ab0a-0b415706876a@lunn.ch> <CADvTj4qxGVw+PW2LeF-a3h1XfmirQZGfJA9-6Czt72XASbVLBQ@mail.gmail.com>
 <4aeebecb-81fe-4f09-9dfe-a3be2f778bb8@lunn.ch> <CADvTj4qrYYA-e+9iJ+q4UaZteUjpypRa6HBSmwp-ajwPbwYERg@mail.gmail.com>
 <3cd188e7-7dc4-4d67-82de-e2ef3edee232@lunn.ch> <CADvTj4pJG56UERve8BfbYzjCLO4KBDDuFviTcz1ivuwUFRMdxA@mail.gmail.com>
 <e0ed0a61-8878-46e8-805f-c0869b97da7d@lunn.ch>
In-Reply-To: <e0ed0a61-8878-46e8-805f-c0869b97da7d@lunn.ch>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 7 Aug 2026 16:32:32 -0600
X-Gm-Features: AUfX_mxyCMJ9oLuM4JTN6om3edbz324m6hnUZwCI6mNxVQPiU_32JZeN9SnoDtk
Message-ID: <CADvTj4rq2+scjiG8Uf771Q9ykhqDCFbAmNgNbHedyUteW-A0Jw@mail.gmail.com>
Subject: Re: [PATCH net-next v4 0/4] net: mdio: support dynamic OF device changes
To: Andrew Lunn <andrew@lunn.ch>
Cc: Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Florian Fainelli <f.fainelli@gmail.com>, Richard Cochran <richardcochran@gmail.com>, 
	Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Jonas Gorski <jonas.gorski@gmail.com>, 
	Vladimir Oltean <olteanv@gmail.com>, Ciprian Regus <ciprian.regus@analog.com>, 
	Andreas Larsson <andreas@gaisler.com>, Mark Einon <mark.einon@gmail.com>, 
	Iyappan Subramanian <iyappan@os.amperecomputing.com>, 
	Keyur Chudgar <keyur@os.amperecomputing.com>, Michael Chan <michael.chan@broadcom.com>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Doug Berger <opendmb@gmail.com>, 
	Pavan Chebbi <pavan.chebbi@broadcom.com>, =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Wei Fang <wei.fang@nxp.com>, 
	Frank Li <frank.li@nxp.com>, Shenwei Wang <shenwei.wang@nxp.com>, 
	Jijie Shao <shaojijie@huawei.com>, Jian Shen <shenjian15@huawei.com>, 
	Bryan Whitehead <bryan.whitehead@microchip.com>, UNGLinuxDriver@microchip.com, 
	Vladimir Zapolskiy <vz@mleia.com>, Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
	Parthiban Veerasooran <parthiban.veerasooran@microchip.com>, Timur Tabi <timur@kernel.org>, 
	nic_swsd@realtek.com, Byungho An <bh74.an@samsung.com>, 
	Steve Glendinning <steve.glendinning@shawell.net>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Siddharth Vadapalli <s-vadapalli@ti.com>, Roger Quadros <rogerq@kernel.org>, 
	Jiawen Wu <jiawenwu@trustnetic.com>, Mengyuan Lou <mengyuanlou@net-swift.com>, 
	Thangaraj Samynathan <Thangaraj.S@microchip.com>, Sebastian Reichel <sre@kernel.org>, 
	Simon Horman <horms@kernel.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-omap@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 7, 2026 at 2:26=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > So should I just drop the final "net: mdio: support dynamic OF device
> > changes" patch and keep the MDIO hardening patches?
>
> If you can provide suitable commit messages which indicate you are
> fixing real problems.

I guess I'm just trying to figure out if mdio map hotplug safety is somethi=
ng
that's considered to be a real issue or not when most existing drivers tend
to sidestep the safety issues.

If OF_DYNAMIC is something that will eventually be supported for mdio
then this is something that will be needed eventually anyways.

> We get way too many AI generated patches which
> fix theoretical issues which nobody ever encounters.

I did hit it in practice with my original series so I used that for validat=
ing
the fixes, however my later revisions use a different design that uses
phy_package instead of a separate ctrl driver which avoids the need
for OF_DYNAMIC support for mdio.

> That is wasting a
> lot of Reviewer time, preventing me and other reviewers from helping
> developers doing real work adding new hardware support, or fixing bugs
> which both them.

So to me it seems like hotplug safety for the mdio api is mostly an API
footgun at the moment if anything for existing drivers, so I figured since
I already had done a lot of the work refactoring it to be safer that I shou=
ld
then submit that upstream anyways.

Most of my embedded Linux designs heavily incorporate different
hardware autodetection/autoconfiguration techniques which is probably
one reason I like the idea of making more use of the OF_DYNAMIC
feature where feasible for the kernel.

> Those are the people which i prefer to help, not the
> newbies using AI and have never taken Operating Systems 101.

I'm certainly not a newbie[0] but I have been using AI workflows quite
extensively as AI greatly increases the speed at which I can iterate on
patches as well as significantly increasing code quality.

In general I run all my patches through many rounds of AI review before
submitting as well to try and reduce the amount of bugs and such in
addition to my own manual review.

Whether or not to preemptively refactor code like this mdio code is kind
of a personal preference however so it's not always clear to me whether
or not it's something I should be submitting fixes for upstream.

Maybe incorporating AI tools more in your own workflows can help with
keeping maintainer workload manageable? I certainly use AI a lot when
reviewing code from other developers.

[0] https://lore.kernel.org/all/?q=3Djames.hilliard1@gmail.com

>
>        Andrew
>
