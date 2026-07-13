Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D36D3D9DD2
	for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2026 09:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783936652; cv=pass; b=bvyPe6W5YFoVGXoC3tS2H2bpeq5Ouhc2tKbNhwChCbjMv7nwxyQ8NUH+sGgi7+NlmVWIrXy6gN5ZA+FbBXYrszf5sCp9GYYbKnWbWjkq/wRTlnsydHyz9pH03qDaPu1h6VlEK6oOVr/ksR836e0fQGtEg9CLQ3wMN/CttCFW9js=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783936652; c=relaxed/simple;
	bh=+iOLSTgUanaRtm9A0v0TMBC0fmd4CqVE5DXXexLAS18=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u8YfFp8cepq8esN1219Ueo8XEh4HnyXg4UQ+pwt9RAhuzCYF3x9vAasozYVJNrWVUmJowhK7wQAh+V+PAuBIzgsfXKnDzGCq7za46DbjUGQcjeGD8bUWGBa0DYlf6/nGbQYabVoyMHJqyhtoKPzMwXYShlUvKpqUqcb8SkSEwNY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=PqxXwVQK; arc=pass smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PqxXwVQK"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-667fc148a21so357131d50.1
        for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2026 02:57:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783936649; cv=none;
        d=google.com; s=arc-20260327;
        b=qwz8SkkYGclirXgvTWMxTbffxwWZvk7ZPg5jzRz90bxjoGQbQGWy64YGWZFvWcpDnv
         gyLzDCHblaQwejR5c+AExzSjUl1Wt1ufGH/IH85xrx1Qj22z+tV946s1PPYaaAG4kmM+
         iXl7y0Xrh2VWUbhnSjNMdV0UywkIfbyDiNVv2cEAsebEF5yuy8LqSRCiNCRUMHCXVdOz
         suqZYNB74eJ5yo2J5xIcGd5++lGd4QbvjYP4zO4sTQ1tpHK45zdZZpYOlVQqZNF3KflT
         /RwEnY19KqLfEFz7N8YOcRlfTh0xH6SouEOnDGPnifstFnpIWDBzb3HjsAlq2IwtM3xh
         rakg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4QXt7p8Vwl3VHBbUurRh8OkWPo7b1yKApjJfQ8E1MKc=;
        fh=5HiKsbwwJCPeX9/OHNAMx4lQ2xFu4o8A5a2tiCekKXQ=;
        b=TAmoCNHTN6ZMNGfuL/d64X8QDFIbYVzJL8QAKSGkFDh4z/ObkmguDEhoowK78iX7w8
         JeYIhXNIHmhLVziJ/QEPhS1+fjcl3nBsLIz29D511ezhPQIjSpiNAo84+6RlT6NTVHk1
         UAkNyGxP53e4ywZasgVbPKbDtL5ARBFdVawgsTQuTyymOzAJ6y04D4jFmeFpdVOfU6K+
         MOcJxhKw8cwYUUmWeEG9Taurmo1NLLkNETF+tJIlXyS6EPCfWeDi/lXNFleUVbdHzzp9
         UJQLw4WSSLd3e71PQxQTrCrxb493W2HzgMGEP7ip33vDLzzTsrVPr22319WSd9HU+8cZ
         W6gg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783936649; x=1784541449; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4QXt7p8Vwl3VHBbUurRh8OkWPo7b1yKApjJfQ8E1MKc=;
        b=PqxXwVQKgtRheNYg0aWlQYypQcATVDKQUMy+sTy96noJ+RogxJ/HwH/MbdaVXX65iH
         G0G4PDW1MxUNZwqpxnupk7GABlpx3hpN+ns/ae1BPh0zwZMNp7nh8mTENWF741BSela/
         Ny7Fzi0Rn/Gia+0LKRt5dxJC4QFcpVPRnSZTM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783936649; x=1784541449;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4QXt7p8Vwl3VHBbUurRh8OkWPo7b1yKApjJfQ8E1MKc=;
        b=hciJn4gWJCNohss2/bexbQS4EEnIX1qXqOiv9EQdgNzCK2YufNkFtd+dBNG9t2NUZ8
         M6+8bdtJF6PMwcKxwwoK6/h7b2ejvgeBwd2zPJVFKaDEPbTMqNe47hyoejU2odSeouLQ
         MFM7Q85Uh8gg9oHeAAciNxNt28vSJIqW4n864cYOBCw8aQOAacfdORMaND2TY0xdeczM
         P2jlyGFeq6jgAu0Ws+vF2SMQ8r1M4TLAh+w3Ivfbosg38P1rDsSHbPLCiP/yhl5NkYgJ
         KwPbzb56ALpIpVlM5kpnNW0XiYb3tcuYX3HlbJ8ryTYhZJKvU+bZZ8D/bli0+UCBesF9
         EbxA==
X-Forwarded-Encrypted: i=1; AHgh+RoT2mZV0CV5EnnDOVdtkp6ESyQ+vAg5e2RHqk246SeAHXyhuHpAnCfKJStDC6Tt7NmXb+5u70uOXks=@vger.kernel.org
X-Gm-Message-State: AOJu0YyRYz2mSesSyr7dYjVgwwzs9Z6g5x7YcYK741QmimfzJ7iADrKS
	TPQF++p6V/mxuLm8430gOqlLGfUbYj46DIkaBLIgmlkaTWU7lFh38K/J06n9SDhmyRkgmV5rCvM
	F/Ld9AOxFRe4cjYc1xz/niRBwZe6vAwXQ4URjYJ1z
X-Gm-Gg: AfdE7cl56Wn4V8VxFf7lym5VtsNYtSakWzanN8YDmyzBfhKQmgu3FgbkU3JMXcPqOzT
	glU2ISgcUUx2JzeQPv+anIkajNbP6YkjIOn9QPcF6B5+I1Og6VWIZXdmORPzUkERXLsWVcTSx/W
	T7yJwIxWrPHra7ulNv0B8z1inNLPkrZsI9KwlmW5mFIwH8yZ96bhJHlJWqCDzM1zGcU8Yf2xJpE
	R+ovX+ItZADxvP0ImyU7LLk4EuAr+odUHUtCr0aj1zklYFjnmZmu1RHpHgZGJjcxYJLvjW1PJgk
	nWGnEaq5jp9QRGr4R0DEWamz+eE=
X-Received: by 2002:a05:690e:c48:b0:667:f1d5:b364 with SMTP id
 956f58d0204a3-667f1d5b81bmr2295373d50.63.1783936649263; Mon, 13 Jul 2026
 02:57:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260709095726.704448-13-wenst@chromium.org> <20260713094329.4105208-1-wei.deng@oss.qualcomm.com>
In-Reply-To: <20260713094329.4105208-1-wei.deng@oss.qualcomm.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 13 Jul 2026 17:57:17 +0800
X-Gm-Features: AUfX_mwq5Qa8EaAFziCQqQmKzQg2wnKp5lbTV4kofMKUdyLtgA0yJkFs72KLWb8
Message-ID: <CAGXv+5Ew-_y4Ui8LF6sbges-nVi7mgB0HjQtZAUTHzPh6Vwk=w@mail.gmail.com>
Subject: Re: [PATCH v4 12/14] power: sequencing: pcie-m2: Add usb and sdio
 targets for E-key connector
To: Wei Deng <wei.deng@oss.qualcomm.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Alan Stern <stern@rowland.harvard.edu>, 
	linux-pm@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, mengshi.wu@oss.qualcomm.com, 
	quic_chezhou@quicinc.com, cheng.jiang@oss.qualcomm.com, 
	shuai.zhang@oss.qualcomm.com, jinwang.li@oss.qualcomm.com, 
	xiuzhuo.shang@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 13, 2026 at 5:43=E2=80=AFPM Wei Deng <wei.deng@oss.qualcomm.com=
> wrote:
>
> On Thu, 9 Jul 2026, Chen-Yu Tsai wrote:
> > The M.2 E-key connector allows either PCIe or SDIO for WiFi and USB or
> > UART for BT. Currently the driver only supports PCIe and UART.
> >
> > Add power sequencing targets for SDIO and USB. To avoid adding a
> > complicated dependency tree, rename the existing power sequencing units
> > "pcie" and "uart" to "wifi" and "bt". The existing target names are lef=
t
> > untouched. The new "sdio" and "usb" targets just point to the renamed
> > "wifi" and "bt" units.
> >
> > The "unit" names are internal to the power sequencing framework, and
> > should be confined to a single provider. The names are only
> > informational. Dependencies are tracked with pointers to other units.
> >
> > The "target" names are the strings that the consumer uses to acquire a
> > descriptor with. As these remain the same, existing users will continue
> > to work.
> >
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > ---
> > Changes since v2:
> > - Expand commit message
> > ---
> >  drivers/power/sequencing/pwrseq-pcie-m2.c | 41 +++++++++++++++--------
> >  1 file changed, 27 insertions(+), 14 deletions(-)
> >
>
> Hi Chen-Yu,
>
> We tested this series on the Qualcomm Hamoa IoT EVK with both USB BT
> and UART BT M.2 cards and found an issue with UART BT power cycling
> when the USB hub is active.
>
> The "uart" and "usb" targets in this patch share the same bt_unit_data.
> The USB hub acquires the "usb" target in hub_activate() and never release=
s
> it, so the bt_unit enable_count never reaches zero when hci_qca calls
> pwrseq_power_off("uart"). As a result bt_disable() is never called,
> W_DISABLE2# stays deasserted, and the BT chip cannot be properly reset.
>
> Observed on Hamoa with a UART BT card (WCN6855, sub 0xe105):
>
>   With your patches:
>     lsmod: pwrseq_pcie_m2 ... 3   (provider + uart + usb)
>     btmgmt power off -> GPIO116 stays HIGH (bt_unit ref 2->1, no callback=
)
>     btmgmt power on  -> "hci0: command 0xfc00 tx timeout" -> failed
>
>   Without your patches:
>     lsmod: pwrseq_pcie_m2 ... 2   (provider + uart only)
>     btmgmt power off -> GPIO116 goes LOW  =E2=9C=93
>     btmgmt power on  -> hci0 UP RUNNING  =E2=9C=93
>
> USB BT card (WCN6855, sub 0x3374) tested separately works correctly with
> your patches.

Thanks for testing. I haven't gotten around to doing the UART based BT
in our stuff yet. Though today I had been thinking about how to reconcile
this with the MMC pwrseq stuff, if the SDIO stuff isn't moving over to
this. Still no idea whether that would happen.

> The testing was done with the following Hamoa-specific patches on top of
> this series:
>   [PATCH 1/3] arm64: dts: qcom: hamoa-iot-evk: Describe the PCIe M.2 Key =
E connector
>     https://lore.kernel.org/all/20260709-fix-hamoa-m2-w-disable2-v1-1-5e7=
25091266a@oss.qualcomm.com/
>   [PATCH 2/3] power: sequencing: pcie-m2: Match WCN6855 and WCN7851 UART =
BT variants by subdevice ID
>     https://lore.kernel.org/all/20260709-fix-hamoa-m2-w-disable2-v1-2-5e7=
25091266a@oss.qualcomm.com/
>
> The fix we verified is to give "usb" its own independent unit so its
> enable_count is tracked separately from "uart":
>
>   static const struct pwrseq_unit_data pwrseq_pcie_m2_e_usb_bt_unit_data =
=3D {
>         .name =3D "usb-bt-enable",
>         .deps =3D pwrseq_pcie_m2_unit_deps,
>         .enable =3D pwrseq_pci_m2_e_bt_enable,
>         .disable =3D pwrseq_pci_m2_e_bt_disable,
>   };
>
>   /* change usb target to point to the independent unit */
>   static const struct pwrseq_target_data pwrseq_pcie_m2_e_usb_target_data=
 =3D {
>         .name =3D "usb",
>         .unit =3D &pwrseq_pcie_m2_e_usb_bt_unit_data,
>   };
>
> With this change, uart_bt_unit reaches ref=3D0 on UART BT power_off and
> bt_disable() is called correctly. Since a M.2 slot can only carry one
> card variant at a time, the two units do not interfere in practice.
>
> Would this be an acceptable fix, or do you have a better approach in mind=
?

I think it's acceptable in that it works, but it needs to be properly
documented, like "this only works because on the M.2 slot only one of
the two interfaces is used; do not use this pattern in other drivers."

It's also up to Bartosz and Mani, since I believe this is a slight abuse
of what looks like a shared resource. I'm sure the AI review bot is going
to complain a bunch.

If it's acceptable to the maintainers, I assume you want me to fold the
fix into my series.


Thanks
ChenYu
