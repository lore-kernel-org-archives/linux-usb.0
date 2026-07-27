Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ABCC424652
	for <linux-usb@vger.kernel.org>; Mon, 27 Jul 2026 20:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785183446; cv=pass; b=kaZVqI12F2AQuOs0uLznCHfbH204WC1up1jxtrWYRsM73InmU2AyETH9w9Ly3ROBUMvh/DZP8DfZ9ghNKwuxhHs8r9uBlXJ9GYezjE8R7sVMGYWbAYe93zQPgbZ1G+3oNRZvi2KN/la4MegrP/1O7T9gUb5FuNcHAWXcpbFkUfg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785183446; c=relaxed/simple;
	bh=mS9WHuPhI7obbCrALpXeXrOJCHLBLJzxXwXA4QId0Yw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mrtbUENVVzn0rZWCmPuM9xx1JwyPQm/uQ0sKJEnM4/d20xVAI0O3890iMOvOBs0BJsMLuw4IA9g4dv4tGRx/T9pqU8xXkizuC/I3/5htmZTjQLMcsptEoB6EZI20pSuTwabaH/o69CwVvWyiLudKJ4ZdpijQyUlFz/l6+7Dr9H4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qsSmbK+c; arc=pass smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qsSmbK+c"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c15b33f7b23so499196266b.3
        for <linux-usb@vger.kernel.org>; Mon, 27 Jul 2026 13:17:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785183443; cv=none;
        d=google.com; s=arc-20260327;
        b=VsVY3U52b449UiK0hs63wpMkG8sOqSCAKVRaPRire7JOQM4u20Rp8KZD5QqFr9prXX
         ZOSbARbBJuC/Brqd6X88zeWYlBTlqua43bQDbBV+C9QvrMx5GP7b/u9P0P29Jw372do+
         qWbY39EMxAxFB54q1E/P9NPq1aCWnpHrDFUM5NWKke+K4ARud/RAtpgOagw33+ES/myD
         a5XUm69z9nA+fzKAcwFCsEPWmF+2uMbwWDLlkTpJeBfv9YByABO41Dppz2wyGotkcEU/
         oKGRjx5ro06BGNYtCwIkL2kD4+QY8E3mWd+XOjrQVqKohkc4Zy4o8RGQqNv9djmYW3k0
         h8FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8KmrU/V0r4oNktWF4gEX3tm9UsyvxtXauugmMN8bwOg=;
        fh=YStWfGGM8+HE0SQjTBrL86LVTDpuQeYo5xXi90fiOsw=;
        b=RVUnQF4CCuM1KYDoDa1IBRfWBlgNFzI2HZVOOMsd9+GaaW2RMtQiyRWE9CORfXJuko
         ZevgzjbEZylmqB6s6dgXGHL8jWo20vHGUa7mzwrNYfOoA8OOwUK5uMEtj9nKdccpPOoU
         ut3PZwNWhDPeHDLL5NwZPVstK8TZHyoBI9oMsJrSyKloIltysK5aLY2Avs4pGGFmjzfq
         X8RrvVPwCcipwYMmckigtXrWDvT+bSf2w5C/q0klfXHT1orV3KqzktSyQFDwtkSCiIY3
         vZ3g/lP9jOxeh2836btTXGTr8AhIEJahw8rQvfHky1j8ROsN8rIJlubjHO1GhaB1XkEb
         xlmA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785183443; x=1785788243; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8KmrU/V0r4oNktWF4gEX3tm9UsyvxtXauugmMN8bwOg=;
        b=qsSmbK+c5Wf8xTGlCp08bmtY+eGu7PnGfZM7ZWbt2NJgx/WuF6JGFJFS8aWLN70jUT
         tKjDDPHl6iHJZbXZ2r6AsgmpZLN/WkP10FXJyyEvSAKm0GONzm/6PGNbImCZSndniS16
         /m2bVJcgGKdAWAB9QnsukzGW5gayQrG05bPMG+vZQBITCQhYBe0UQky0g45Yms+RsRD8
         N+jIK6G+oQgLTIAAV7uKOrL2qVd84ThiA1BULix4SgLFo6km50DxGc/mwO4s6RaCLU/5
         FCmngAwLQ24E4T90p2UtNomECLA8CbkGmTg3XSMCpgSKlI7pxdO7MTVgr0rodPbEVS7l
         0d1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785183443; x=1785788243;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8KmrU/V0r4oNktWF4gEX3tm9UsyvxtXauugmMN8bwOg=;
        b=eSpVQWP3oAoChsZj2uqB3mJhX5JKlcfaD13ptww7fixS0FsCDLUupB0bXOLBtUBvjX
         hjIFub/XWUtWttKOXssRw7fOWty4LXh5aJLNde62MCAp2cwiuXfAq+8Tf40FBKLs67gt
         hjoWPDe0/Nfb3J0v0KXC9So8mmDM2paYmZ2D3NVVHXnMo3q5ZDzh+e+tsHvxFtOeCtjL
         b/tp6dDjmCkPRgO9CmdHnIHxLcI/FtS2Gbt9wkDExxxWKETdFeS1/i1C293NrAJfFL9s
         Bp/T4E8MDLD/0cFVLjJkuez2OY8Cre71YLkdH0goeUXRIHuqnGqqYOEw0K0IOEpRGcr/
         /6TA==
X-Gm-Message-State: AOJu0Yx776ywAE5+IDzVHaq5AhH44GhExsvjce7jigMt2Nxn4HxUhih+
	R4nhQpd+0wbvjKOuufJHpCe6tcAD1BS/O79fPAMeYC15qfia1Lieb1DC74athsfL7Be1E8xQX5h
	7VmJfTcbmVfqwlk0dzOv4LjpSLXPmTjg=
X-Gm-Gg: AR+sD11ro7mvo3KNHWK/8Qt36Yb4OATIZsco15x8O/DlJAxR2PQRc1r6/fPS8ixjpxl
	ogU4ln+TYdzJrQCN0atv9SuGPEnuPoXfddH8YxifU8j4MsfFvmps+nk1dPraQ+nezIJp6W2lnxj
	kJpAi+prKMfLAUniTJXbPTLOvx5NCcgPGK9mTVQ/oKsV8GeeLyRE1LPwaqfev9Jr0cP+XBz+vwl
	c5RCAosnlN+nBS3ayNAxn/SCZly6Ga3IXK9I/v6Gia7kDpP+2l2Y8pQop0/5Ss=
X-Received: by 2002:a17:907:9806:b0:c12:7934:52fd with SMTP id
 a640c23a62f3a-c1f1f09f37bmr459424066b.32.1785183442675; Mon, 27 Jul 2026
 13:17:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260726171423.42850-1-ishaan.dandekar@gmail.com> <CAFgddhLD5xJYf4SjJ3Q34PBEq_k=g-W3=UR0RCSL85OSw6KPHg@mail.gmail.com>
In-Reply-To: <CAFgddhLD5xJYf4SjJ3Q34PBEq_k=g-W3=UR0RCSL85OSw6KPHg@mail.gmail.com>
From: Ishaan Dandekar <ishaan.dandekar@gmail.com>
Date: Tue, 28 Jul 2026 01:47:06 +0530
X-Gm-Features: AUfX_mxkDJn2UwcNYfrQMo-XXCgF2f0kl4Gx6-JQ5o3BSUTBgpfWz6Jsx9DS0wU
Message-ID: <CAG0uPa-AkAY-qPxGq=9OhUOuz2EqN0w8yfwdqNBcfyGniUo-AA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Fix initialization for Generic Clone X-Input Gamepads
To: Nikhil Solanke <nikhilsolanke5@gmail.com>
Cc: linux-usb@vger.kernel.org, gregkh@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Nikhil,

My sincere apologies for that! I am a new contributor to the kernel,
so I am still kinda unaware of most mailing list etiquette and
missed this protocol in the submitting-patches documentation.

I will drop your patch from my local tree immediately. When you send
out your updated patchset, could you please CC me? I will make sure
to strictly link to it as a dependency when I submit my v3.

Thanks for pointing this out and taking the patience to guide me :)

Thanks,
Ishaan

On Tue, Jul 28, 2026 at 12:59=E2=80=AFAM Nikhil Solanke
<nikhilsolanke5@gmail.com> wrote:
>
> On Sun, 26 Jul 2026 at 22:44, Ishaan Dandekar <ishaan.dandekar@gmail.com>=
 wrote:
> >
> > This patch series fixes a hardware panic preventing certain generic X-I=
nput
> > clone controllers (specifically 0283:0001) from functioning correctly
> > in Linux.
> >
> > When the controller is plugged in, the USB core requests its configurat=
ion
> > using a 9-byte request. The controller's firmware fails, disconnects, a=
nd
> > shape-shifts into a fallback Android mode, completely losing its X-Inpu=
t
> > capabilities and haptic feedback (rumble).
> >
> > Patch 1 (by Nikhil Solanke) builds the underlying core logic to allow
> > a 255-byte config request (mimicking Windows behavior).
> > Patch 2 adds this specific controller's hardware ID to the new quirk li=
st,
> > preventing the crash and locking it in X-Input mode.
> >
> > Note: While these USB patches keep the device stable in X-Input mode, a
> > companion patch is being submitted separately to the linux-input subsys=
tem
> > (drivers/input/joystick/xpad.c) to ensure the device is routed correctl=
y
> > and retains full haptic feedback and functionality.
> >
> > Changes in v2:
> > - Added missing Signed-off-by from transmitter to Patch 1.
> > - Wrapped commit message in Patch 2 to 72 columns.
> > - Removed trailing whitespace in Patch 2.
> > - Dropped the Input/xpad routing patch (sent separately to linux-input)
> >
> > Ishaan Dandekar (1):
> >   usb: quirks: Add ShanWan gamepad to quirk list
> >
> > Nikhil Solanke (1):
> >   usbcore: Add quirk for 255-bytes initial config read
> >
> >  .../admin-guide/kernel-parameters.txt         | 10 +++++
> >  drivers/usb/core/config.c                     | 39 +++++++++++++++----
> >  drivers/usb/core/quirks.c                     |  7 ++++
> >  include/linux/usb/quirks.h                    |  3 ++
> >  4 files changed, 52 insertions(+), 7 deletions(-)
> >
> > --
> > 2.34.1
>
> You should not include my patches in your series. My patch series will
> be applied first separately. Just send your own patch with a note that
> your patch depends on my patchseries. These guidelines are present are
> in Documentation/process/submitting-patches.rst. Make sure to go
> through them once.
>
> Also, I will be updating my patchseries with some minor changes, so
> this patchset kinda becomes invalid as my patch in here is outdated.
> You'll also need to use the updated link when mentioning this
> dependency.
>
> Thanks,
> Nikhil Solanke
