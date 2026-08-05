Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7680C28314C
	for <linux-usb@vger.kernel.org>; Wed,  5 Aug 2026 00:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785888090; cv=pass; b=ueX9GlxTRQE7p0t8S//9amL77R27NHDG9dMMoRBEIhsUNkb4TbT5yOD+N3c8AP6UEdASz72O6S/BL3B0PcWOz6/1HsjUituOHhiNKrUxW8YQ4g3ybjvWlhccuU/tI/2oMLo0LD54s48lvG9iMYS0SON01l3QJUcKhhhUlxOjIkE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785888090; c=relaxed/simple;
	bh=86K8uKiLATgTxa9IrfTr8hurJOunk82qbscdkmiHoXA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GOOMLV5gUMpW3H4CD/d0FBTSJLaeAQTkTlRe878KhYBmRq0KO8KLuln/UNA4hrLx59HwiL2u4gMK7Fv3ay457fe41zrOMLPiUkB3dRYcUW1hKn8Hu+0iABpGs5MdaO5lAulXydwHaT4omh2MyKu79infd1Ydfw1Mzg/VLABXsW4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ovmpHnPm; arc=pass smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ovmpHnPm"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2cad8076b01so5012525ad.2
        for <linux-usb@vger.kernel.org>; Tue, 04 Aug 2026 17:01:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785888089; cv=none;
        d=google.com; s=arc-20260327;
        b=JBNDSkGiVB6YfnSK0/4Q7zOu6l4sqcHrZc6Xj7d27EEE0JMszM03ZhdHQ29VqaFfso
         W0RffPr2lR6HjYwCfJku7BQ7rpHB0Ptou5U3HelS5071xOYGxvQI3CB9I1HwFP6N4hMh
         2Ro7xtDGVhlg6HwkYL//Bc3FcixRndGvYKkP+HFiVkKZW4nlsmEwTthlgaHyd3WCUBmC
         AO855jADVf1XWKZkCVE2tNZ8Qk9DjEih4HOnIwFpSL6TY3B79hs8mK3VMwjHsdCX3GGw
         Ofv1sW1VRfJvGuHgsQm7VO3fkDjGB/tvZOj5nBIEBEUH0jUMqwXLUpZ1p4rh/DofckH5
         fH4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NsdZbLvlXG2ntN+KudJSI+VASQm9D9JFdAQ63Uw/9rg=;
        fh=Swt9qXY5x+tZQQacM4jFwFqXW8Bz3ZN3nkgp8jN1Dag=;
        b=KHjC69tZG+jFQ10bhmohCTZqZ0wSP8g4LqweEV7aRsL8QmLdKqGQspRLtmFejsQeKU
         UNmpNGF8pN4WGvjm+V9i5ubIxi/uL7DsgnPfma6P0tRzCFaKFYILeVVsw/LiWCmS2w1c
         Eh43iT+1XgrqzsHFibXU4j5NPxywktoRiGBYUVLHR/jUmx3Nw3m8Z/CvR4rlVI8JcUDI
         GCRWxPwbMbf09NSRADW3ZMBLaNg+iq/9yKGUhs1z/Qdfjhomq5IxXnrl9HwiKupLQSax
         daymWEOnr53LdP6KX+GNn2uqUmEu48c3ATwrDHIloot2GhJ9kii69mqU0A6QT8f7m1Nd
         Fq/A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785888089; x=1786492889; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NsdZbLvlXG2ntN+KudJSI+VASQm9D9JFdAQ63Uw/9rg=;
        b=ovmpHnPmbvy/gEco8hNQig69eqxrNHocASB9se2gc6sq6vn2uAerEg0tsDpACb32Tu
         fPblp0b5WFwmfEatCb2eMUvBYl8fPvL36ePwxuuVsutzq2hcTq74F0dL8qQyzwTwX9vO
         HOTdWEMlbAI+95GkZ8wG/WKRYu5I8yAUXChaDf6G0BU3lnf0Jh0CBUcjQZdQpRlIb2J9
         9cpTBQ+gN1gjil1+nJC11KDLcB96D1ek4x4CrBHOc1rga6r82kvB/tS9fKBBMCIZnDoG
         h8gDB9t93uHwHFnILxQf/kG4aIz32andXvA1nXyBbxvQWdNJvRL62JP5ZEFbPTQK0w/P
         KJaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785888089; x=1786492889;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NsdZbLvlXG2ntN+KudJSI+VASQm9D9JFdAQ63Uw/9rg=;
        b=R5RKUXu2L3YkzSMkkOFORFxxG1kjv/6lkm7L9wQLGgkQk3c4QGtd+OSceD33qfJ565
         fqTpxhXg/Cs1gtqE20IHjKqzfHKcCva56soDr7kXodccatXgVhly/sRuDR3lweg5zLdr
         KVMqH+8A2/7zbyo6bRuWyhvtYoHCgRMhr571kiJd2Falpc36cMx1H1+AvQ+sqQ3/NYTZ
         lPmRuDwTt2ZNPvYHbxZmz0Qia5iOcfK70v6Hdm4AQxn8JEqr3Vxhh8D7JZ8gt0ebcqx9
         FaTqeKsqwi6/W8IMwLg1jYpbCzNoc0ddZysBcArYpdOvNP0pzPz94cAuhj7MXvJFQOZt
         pnLA==
X-Forwarded-Encrypted: i=1; AHgh+Rpp178+lbAP6OXj7Xs/AbRHMBJ/SoAhUAz/6c24x27bRzE1BKEW9Q7YK9uGuZ8WuYZ2Gr7iPqEpWpc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6Vgie1lztIGyHCM+M8ZTop9I1sbtADKbf6IGWwqvH8cmb2Lyv
	X+7EFpZnzG2SK6BT3DJVH2l0XvMXhuwauHy+Zk6Zc4U7Tx1pd08VYjap6XorNbPXT13CyZtlhyd
	mpuBVLldLSdF4Eqbejf2j0hcQMeOhOxw=
X-Gm-Gg: AR+sD10rldKa7rLVxd+7e5tWSXfx/FzOEY6bDFhg9DRzjWSrBZhygIpc9Ms7aljUg3V
	YxKlvlkizLgvmmmie+VVWOJAD8RmO9EsFKtuHkA3FYKObP1wDmb3dQa2sLtx0HcGys77ku424HZ
	dpGvspVxUiqMt1WjL+aZYddoGbJVsqOTa4hKuUeBW2d2REfviDvHuf+GXohK+v81eC1H9FKyg1G
	Z/jPuPrddUraW/ZpOVj8SPUGs0v5OHfEaYHVYxPiLMLaIIHiDohW6lD//X1kLiMFV1z5bxbSu2p
	1hyG4y7hJahmC7LmPPXnwMO1SngxuJfYRxBC8dMivCgaX0ExUGITSU/kiPW9ccCGLO5yNhK7DEn
	Kb/1tpExa+aGC83qUwlJPWXkoZRRIetvXtVJsqLZhPLIcUCtcwvEs9SQruCuC
X-Received: by 2002:a17:902:e84b:b0:2ca:e5c:7fcf with SMTP id
 d9443c01a7336-2d0ca7b5490mr23513245ad.3.1785888088568; Tue, 04 Aug 2026
 17:01:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CABWMpWQiSEKMkROgKZJ6nV8GXYgr7E=-SmsatQie4eK8b3F9Xw@mail.gmail.com>
 <CABWMpWR7Law_vHdeAMsOcY28VBcvX2jYSqq2SpksJSiLFcXhuw@mail.gmail.com> <anIhyHL4Kl-DX2G_@eggarch>
In-Reply-To: <anIhyHL4Kl-DX2G_@eggarch>
From: Jamie Stephens <jamie.stephens@gmail.com>
Date: Tue, 4 Aug 2026 20:01:16 -0400
X-Gm-Features: AUfX_mxwyh_MML33tokD_7o_JuJogH0BhSC8wEjmWkVQTWtJhzWv662Egc00qSY
Message-ID: <CABWMpWQEfycicrctrW3RD1yNf0rv1ZrioY9FcjoZZGEz4GAm_Q@mail.gmail.com>
Subject: Re: [REGRESSION] CyberPower LE1000DG (0764:0501) USB HID regression
 on x86
To: Lovekesh Solanki <lovekeshsolanki00@gmail.com>
Cc: jikos@kernel.org, bentiss@kernel.org, regressions@lists.linux.dev, 
	gregkh@linuxfoundation.org, stern@rowland.harvard.edu, 
	linux-usb@vger.kernel.org, linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Lovekesh,

I have now tested 02-resume-reset.patch separately on Linux 7.1.5 with
the CyberPower device 0764:0501.

The patched kernel was active:

  7.1.5-ups-reset-resume

The device was detected by lsusb, but USB initialization still failed:

  usb 1-3: new full-speed USB device number 4 using xhci_hcd
  usb 1-3: New USB device found, idVendor=3D0764, idProduct=3D0501
  usb 1-3: New USB device strings: Mfr=3D3, Product=3D1, SerialNumber=3D2
  usb 1-3: can't set config #1, error -71

The UPS therefore never attached to hid-generic and NUT could not use it.

I then returned the same USB cable and UPS to the PiAware NUT server,
where it immediately resumed working normally:

  ups.status: OL
  battery.charge: 100
  input.voltage: 122.0
  output.voltage: 122.0
  ups.load: 23
  driver.version.data: CyberPower HID 0.8

Results so far:

  01-no-lpm.patch: did not resolve the regression
  02-resume-reset.patch: did not resolve the regression

I will proceed with the requested git bisection unless you would like
any additional targeted logs or tests first.

Regards,
Jamie Stephens

On Tue, Aug 4, 2026 at 2:56=E2=80=AFPM Lovekesh Solanki
<lovekeshsolanki00@gmail.com> wrote:
>
> Thanks for the report,
>
> On Thu, Jul 30, 2026 at 03:28:02PM -0400, Jamie Stephens wrote:
> > sudo lsusb -v -d 0764:0501
> >
> > reports:
> >
> > wDescriptorLength     504
> >
> > Warning: can't get report descriptor, LIBUSB_ERROR_PIPE
> >
> > cannot read device status, Resource temporarily unavailable (11)
> >
> > As a result, usbhid-ups is unable to reliably communicate with the
> > device and NUT cannot reliably monitor UPS status.
> The lsusb failure and NUT seem to be seperate, lsusb failure could
> simply be device property.
>
> Few possibilities I can think of worth testing:
> 1) It may be related to LPM, the device may be advertising this but may
> not be handling it properly.
> 2) Commit 8020c41b39f5 (usb: core: allow ACPI-managed hard-wired ports to=
 power off)
> lets acpi managed ports be powered off even if hub does not advertise
> power switching. The UPS may be sitting on such port and its power could
> be cycled out and leave it in a stale state.
>
> I'm attaching two patches to see if they have any effect, please apply
> and test them seperatly and let us know the results.
> And, as per Thorsten's advice above, run git bisection regardless.
>
> Regards,
> Lovekesh
