Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BD973368AA
	for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2026 10:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783939359; cv=pass; b=QpbAGMGR7SlYQXx5mzJBhSCNoyNzrBCUoMzSKz/q+c+uX5v3aqi6AE7CEWGPKMQdAMLL6tQr89sX8AfGAaRRWKftyFYD2J7LHww4rkXqMYW+gagl8vEaW5uYFzHy8Z6DHUwyp8kc/G9tsCiEFFIuiF945W0D929D9zWyRr10MFY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783939359; c=relaxed/simple;
	bh=Q+CCqNFJAWM5zclazh2uA9ABf22MMeWrfoy3sMf1DJE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FZHHTB6gzf31EdGa4C5J0YN6V7R8QKJgHMObtCKIa8HcnIumViH94zZXcdFl4TuhUzko5M8O+bLLJ4eeKsKYoFufod2onSRg/BYYePqEZCkWCtQb2aaTvAC99yarWmcH/oGyupGHa3OPyoQiSQ00+bdxeoU+nf5Q9a9mncO/3EU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=kEunrNpA; arc=pass smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kEunrNpA"
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-664d22d7337so5588390d50.1
        for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2026 03:42:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783939356; cv=none;
        d=google.com; s=arc-20260327;
        b=YGZ3wloBsveT6ivl9mw8Cm3BjcwoieNAEc2A2chOuh490qnP07CoZPZtESb4NWbZfS
         D8KRVyVm0JJ2dT7eM2AWokjtP9sQ8vzd6b8D093K7i4FgjHMLbCpFBmuu4lOeHyiqXHu
         F/+KU2InTvBnzOOwx2YcYabItqPhgDooznwcTR0qa1+RjNQo9JHqVRCvICC/bhmcTQyd
         Kv+1axk6Ip1UMK0X/3HlqpeyIAWnV+VzByuLP/zvTJVhJbPDhyS0s+quu7J0VxRgh1JN
         t3X2HtoPVRvuPNolYICKZbHrUCUsC2lQ8x00eG2PUQ80zbLh8iUFiHCoEBW+/jJcFDdD
         zzqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eWFL44d2xUl7HIjwQPptHzV3ZpTWrkGx+gsq+YbLkl8=;
        fh=hr6pN7d8bhX2yM2jDbJJ8CmOA1kWlRbRCJ/ZfM5rncw=;
        b=SRggGBMynHv935KaUg+hmSoQL5rV3OWEh7krKzkfC5Ej1Jl61rvaFUpeaB3vsTccfM
         bdYKA+a/BNbnOLT/fezIHMOJKnyMJsnKNyFOGkXunIbek74GFsWC1Fza1M8kT1qkE11X
         9D0XyQizi1GaB1N3yuaKkRGG75nyCBc6qJo30iy3te03/xoaTqH2bR8IVIZgJLm+c9wd
         K0mZfpDlJLWBRfwiWC7/JKkm7QQhRdj0ibxjv2ha70GrZ/e/jLuSHMPBZ4YkLMHewTJM
         5yJKTEUAtdVBLCQKZG6oY7QmZn/DrZsHt4y8QOdFso8NWNmENXY/YtzKZCGadXX2cdFU
         vGrQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783939356; x=1784544156; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eWFL44d2xUl7HIjwQPptHzV3ZpTWrkGx+gsq+YbLkl8=;
        b=kEunrNpAtZo8mwbbu0+JKqM+tM+vEkGZPuEMau3eab195Q9GE7V3NDmQSqGgUU0mQp
         3cIX4XoRQYIjmrSpUnZqUXNounNhRE0APyKL/+Y+0xaPfnD4cX88kD+5LbF0dY3ydwbr
         qUJLomnzyREHtatI00tqTBZcL5V+3HaagcB5I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783939356; x=1784544156;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eWFL44d2xUl7HIjwQPptHzV3ZpTWrkGx+gsq+YbLkl8=;
        b=Ee/vkskkjFo5t9RoUW9Jc2V94YYmsABHSC2GXV3/E3XlTTSXgh0NpMbBj8pXFX3LtJ
         yp8F4DuDEWG7WxtJ/6KXM6ZKePaWciCGLINy2AUXKwT6ML8KGMe8Ck83u0CgHfuqpnag
         MefwqsVa/inHDP1GqmQ+qbhmOsiknaO6oBhYUaDeBtOgKxIWyuQjD3NKQQ+qwySADCEq
         aqa/nIRGZT/DQ1NS7tCHj4KEd/DEqPg4AxNaGjBGEkU1wYsnq6wnv4aMvM12Nnrj28Ud
         be4w+RSnRcL7unSQev3uuNxgR9V0qqyJGmgUm6xf4bz0YbvdsNqBkvMKPyCmkOTZRvqm
         tuQQ==
X-Forwarded-Encrypted: i=1; AHgh+RquLCuu6YG9woJgCoimICD+hNdpeYtVmLtDPgxOnftYKw2+n0Ikb+b3gqNpoA+F90uQAB1AeRucWBE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyN1I4JzTWvqhHmU7MUYQvLhplcVlAdJuKiRuWBN1zDnIXwiYMJ
	Eirmu7yehQL9ZgpogUOWjVNsSbKM4rQEvk3RzPhf7Dcc8lxWi/g7+CeA2gd2IZhQmkoF2QdSbuu
	qNpWdwmCaqVMYUeeKClEUKXip7NP+2mHJ6izs4mdZ
X-Gm-Gg: AfdE7cnqqPf69e4uMhY7DHmY7b/DrcqcnimG0hBsF1cEtbeJEiavrvOg4igWqGUqshc
	7ImMghbhMfQJuDjA8Kg26qtDcs1F3JOTmvT8zNCMH2gUTayWgVvdSFghQiovBgbiS3NaRWqTY0u
	m4uRBzv0ajxbY7QgoqoMfvGUeaz+HK8bxoWzkNSAJn2jhPhQtgdKb0Zf9zfyLgZulMPOYI5gIeJ
	3LB8/jgpIzVniUnrxpXbBfQWquA2QhBKixdeaftbMhuDT6munPhHtudsuSyjjLx8gL+XxlMQhjs
	x7XAx3un1Y8LhmJ2j8GOomvzRcQ=
X-Received: by 2002:a05:690e:12ca:b0:667:f107:388 with SMTP id
 956f58d0204a3-667f1070edcmr2274020d50.36.1783939356491; Mon, 13 Jul 2026
 03:42:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260709095726.704448-13-wenst@chromium.org> <20260713094329.4105208-1-wei.deng@oss.qualcomm.com>
 <CAGXv+5Ew-_y4Ui8LF6sbges-nVi7mgB0HjQtZAUTHzPh6Vwk=w@mail.gmail.com>
In-Reply-To: <CAGXv+5Ew-_y4Ui8LF6sbges-nVi7mgB0HjQtZAUTHzPh6Vwk=w@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 13 Jul 2026 18:42:24 +0800
X-Gm-Features: AUfX_myp_DLSLs6zxF1b0ZOGMaYgyXpFtWmzvguDpYK-nGyh8AfVloamNxBzSn0
Message-ID: <CAGXv+5E0Nz=uD26eXSdt3jGKEjsWyai_+PO2ZBTr8t45FQ+SKw@mail.gmail.com>
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

On Mon, Jul 13, 2026 at 5:57=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> On Mon, Jul 13, 2026 at 5:43=E2=80=AFPM Wei Deng <wei.deng@oss.qualcomm.c=
om> wrote:
> >
> > On Thu, 9 Jul 2026, Chen-Yu Tsai wrote:
> > > The M.2 E-key connector allows either PCIe or SDIO for WiFi and USB o=
r
> > > UART for BT. Currently the driver only supports PCIe and UART.
> > >
> > > Add power sequencing targets for SDIO and USB. To avoid adding a
> > > complicated dependency tree, rename the existing power sequencing uni=
ts
> > > "pcie" and "uart" to "wifi" and "bt". The existing target names are l=
eft
> > > untouched. The new "sdio" and "usb" targets just point to the renamed
> > > "wifi" and "bt" units.
> > >
> > > The "unit" names are internal to the power sequencing framework, and
> > > should be confined to a single provider. The names are only
> > > informational. Dependencies are tracked with pointers to other units.
> > >
> > > The "target" names are the strings that the consumer uses to acquire =
a
> > > descriptor with. As these remain the same, existing users will contin=
ue
> > > to work.
> > >
> > > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > > ---
> > > Changes since v2:
> > > - Expand commit message
> > > ---
> > >  drivers/power/sequencing/pwrseq-pcie-m2.c | 41 +++++++++++++++------=
--
> > >  1 file changed, 27 insertions(+), 14 deletions(-)
> > >
> >
> > Hi Chen-Yu,
> >
> > We tested this series on the Qualcomm Hamoa IoT EVK with both USB BT
> > and UART BT M.2 cards and found an issue with UART BT power cycling
> > when the USB hub is active.
> >
> > The "uart" and "usb" targets in this patch share the same bt_unit_data.
> > The USB hub acquires the "usb" target in hub_activate() and never relea=
ses
> > it, so the bt_unit enable_count never reaches zero when hci_qca calls
> > pwrseq_power_off("uart"). As a result bt_disable() is never called,
> > W_DISABLE2# stays deasserted, and the BT chip cannot be properly reset.
> >
> > Observed on Hamoa with a UART BT card (WCN6855, sub 0xe105):
> >
> >   With your patches:
> >     lsmod: pwrseq_pcie_m2 ... 3   (provider + uart + usb)
> >     btmgmt power off -> GPIO116 stays HIGH (bt_unit ref 2->1, no callba=
ck)
> >     btmgmt power on  -> "hci0: command 0xfc00 tx timeout" -> failed
> >
> >   Without your patches:
> >     lsmod: pwrseq_pcie_m2 ... 2   (provider + uart only)
> >     btmgmt power off -> GPIO116 goes LOW  =E2=9C=93
> >     btmgmt power on  -> hci0 UP RUNNING  =E2=9C=93
> >
> > USB BT card (WCN6855, sub 0x3374) tested separately works correctly wit=
h
> > your patches.
>
> Thanks for testing. I haven't gotten around to doing the UART based BT
> in our stuff yet. Though today I had been thinking about how to reconcile
> this with the MMC pwrseq stuff, if the SDIO stuff isn't moving over to
> this. Still no idea whether that would happen.
>
> > The testing was done with the following Hamoa-specific patches on top o=
f
> > this series:
> >   [PATCH 1/3] arm64: dts: qcom: hamoa-iot-evk: Describe the PCIe M.2 Ke=
y E connector
> >     https://lore.kernel.org/all/20260709-fix-hamoa-m2-w-disable2-v1-1-5=
e725091266a@oss.qualcomm.com/
> >   [PATCH 2/3] power: sequencing: pcie-m2: Match WCN6855 and WCN7851 UAR=
T BT variants by subdevice ID
> >     https://lore.kernel.org/all/20260709-fix-hamoa-m2-w-disable2-v1-2-5=
e725091266a@oss.qualcomm.com/
> >
> > The fix we verified is to give "usb" its own independent unit so its
> > enable_count is tracked separately from "uart":
> >
> >   static const struct pwrseq_unit_data pwrseq_pcie_m2_e_usb_bt_unit_dat=
a =3D {
> >         .name =3D "usb-bt-enable",
> >         .deps =3D pwrseq_pcie_m2_unit_deps,
> >         .enable =3D pwrseq_pci_m2_e_bt_enable,
> >         .disable =3D pwrseq_pci_m2_e_bt_disable,
> >   };
> >
> >   /* change usb target to point to the independent unit */
> >   static const struct pwrseq_target_data pwrseq_pcie_m2_e_usb_target_da=
ta =3D {
> >         .name =3D "usb",
> >         .unit =3D &pwrseq_pcie_m2_e_usb_bt_unit_data,
> >   };
> >
> > With this change, uart_bt_unit reaches ref=3D0 on UART BT power_off and
> > bt_disable() is called correctly. Since a M.2 slot can only carry one
> > card variant at a time, the two units do not interfere in practice.
> >
> > Would this be an acceptable fix, or do you have a better approach in mi=
nd?
>
> I think it's acceptable in that it works, but it needs to be properly
> documented, like "this only works because on the M.2 slot only one of
> the two interfaces is used; do not use this pattern in other drivers."

One small problem. On the USB side, userspace can disable any port,
which will cause the usb unit to be powered off, and therefore asserting
W_DISABLE2#. But on the UART side, the core still thinks the uart unit
is powered on, and the consumer would need to power off and then on to
recover. Maybe that fits into the normal reset / recovery procedure,
but it's still not intuitive.

Maybe something like

    pwrseq_power_cycle(struct pwrseq*, bool forced, unsigned int delay_us)

would be better suited?

> It's also up to Bartosz and Mani, since I believe this is a slight abuse
> of what looks like a shared resource. I'm sure the AI review bot is going
> to complain a bunch.
>
> If it's acceptable to the maintainers, I assume you want me to fold the
> fix into my series.
>
>
> Thanks
> ChenYu
