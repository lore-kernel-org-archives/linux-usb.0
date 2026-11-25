Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.208.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795642870;
	b=qo0q8rRltyxYKI88nyI0X6WqzYMVfpUcsPEQr1zkNFSt+CNp55/NNKsaivTp9t2XoSaF
	 RxR9rniMMc474MUn1OaAjWYOQ7X7FNgDVW1ULgRIxFjxDijWvkIBHsFL9efb3QQND9f06
	 o+/4EBWxsTZP515OXT0B26+w+gA9mDBaNTdKoNv5WCoXZbjfBx4g4mZ/I5O4QiIQfvPPa
	 xmzXAITBpdBbsyiFTadMpdRlahbHAzhGD3N90dyNXGDXRqmgiiPyxj9wiBTtvMtfiVJjS
	 T2LrRvib+Q74OuELNvEB7YZFoFBvZJWcCF6lURakDJ0JgZCcmfahpGIqhYpDn0jBhEw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795642870;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=Hs7Z4dSlPzZIU83bg2ZGfkYDjyGJ7+bM1OgNG/+I3Js=;
	b=JgAJ8jYALb1Myyp9VRlX/8sBEjR07hzP9gPOfGeZ+0/UnkM7x7gNEP5NERynGCvULvrW
	 4ZSNNXBs6Fo0B+ErVJyPLOoCmQEeJKkdaEu83yLWQg4v2+cAHOKNsbsoBmZROLYeh8iur
	 oe8nhFJd5FLqGlVn//6hkgktotkQZJ3LLs7lTKx18Dz9/HqYMPn+Zd47jaXskstdwfv6f
	 CISrmr9ptCBOp5RC1FkwgU5ogxtvwgcygYP1+3hx2IXzSVyMr0MVNP9PjdzPdWikMglLj
	 RLwTgqXoC41AU66G1sVSceIACqPbHoupcANc4dnohQv/CMgzKMwlbyzUBQ778i/6xlA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aC3740uV;
	arc=fail smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 445F3606A326
	for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 21:41:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 445F3606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aC3740uV
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b596afb4c5so7437023a12.1
        for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 13:41:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795642869; cv=none;
        d=google.com; s=arc-20260327;
        b=GM6HambJO7azxN42ZuszdEa9VjJ8tnIg7F/hl/A1sIu+k6C8TbOJHhJlddDTJBo0lC
         YUBD4rgU107b9eLY4wUebMNDm/raJgHjHKkCG5TPcye8NvL2H2ctaWiWSliXFqIm/svo
         NjlkKAy0/5KMKb9bnX7O3n6T4mdihIAG1uGaOBw6z9qyo+rpwpUD5xHjSk2Q7b9OJBxu
         NE+qyJuBNE0gndYaLb64BUy//ED6rp/rNW8HPy6/WfbefrKxWTZ4u62x8fvakWyczqGI
         5+9lpRd32zqg6nK3tu9qiNRMSqLJALAtuUizmT6RjW/BGZs+GwQ84rpdXOYPWAceyNdq
         B1cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=Hs7Z4dSlPzZIU83bg2ZGfkYDjyGJ7+bM1OgNG/+I3Js=;
        fh=YOWOPG67gujzW7uzl1EAtn7yH9KqfJLyFtZQ+baVzqw=;
        b=RjE+mdfSoxSQt4hc8m6oYsZVItBPeU5icGDUccMHhmdx4HWGg/DaWYsyDjnJQy+zak
         AMjgBL88I9miuoFRzdupfQBs05HW1cXcSawGxce37rD+B1t9o5b2gLR4YyCRhOAdeQrT
         jXqeGgw0WBxvi+PYbnfm1ww8Jl6KTSPrtFD7ElOLNnSNfJ1EWP0/+OUMSncchO8i/ceK
         gvYxUyp5rgf/FReprDZ2xeiG19lP0vslnmB8Ni3mBjRiKkIeKlZSa8BegdW1vv1bnLR5
         5V9P6Z/LWXfKRoMql79sD3Sn+eq/aw48ox1yHQG+Lm8qT2blBydH6UrVSum8JcNQHeII
         egFQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795642869; x=1796247669; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Hs7Z4dSlPzZIU83bg2ZGfkYDjyGJ7+bM1OgNG/+I3Js=;
        b=aC3740uVgVcyHCk3CmmlKf829ag95gDggE1ypjdPOMt1t6KoSJzC9w+nj2Y7G/65yW
         VP8q9jwLQFzGYlwqygAFGiaNbGigY7UvHmBVFXiSTeOe3Yf0Wz0Q4m0eYWc5abftDy7+
         qOmck9n391Bqr968mTrDMAQy+FYjLFqXA9P7bcK1iIJvX73AQpI6CgMqRjo17Oc3fCH7
         dsXYnUyo62OZ4A/csv3h5hIU1vZoY4n6SCOs63e0XhDnJ6MXdIa9Q7QFo3seUIL3Q9iP
         cINpwH8wNJTAIy//DGMq4/s2l9GgDxzIbi8hdElRxqlnhPK1Dtyln6NCJTMm5BurWXyw
         SEJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795642869; x=1796247669;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Hs7Z4dSlPzZIU83bg2ZGfkYDjyGJ7+bM1OgNG/+I3Js=;
        b=cvTD+IF/pu5bDBsR6nthOhqygk0mPNLA31GOsQxgzmvrUqlDVO26XDquCQQMNcVry/
         m5u/46RvAN3NTqSjAp0Xjo0PWk03aZ+44cWkkJDo1o3c0g046H5Drswpi82DskUtNubp
         SYrkM/e25tVl4Ab85DFjzGENTJQbs2Er1+0UBy13SurWVZvaQxj81eYDGeV+X9u6tFWk
         yxXgnpz8eVwk7wOSvOejalPRIskcZ1WTKFW7bpcmzpPxE/tBQ8qIO0QXgZP+IHGYqj6L
         uveZc971Sa45n3wtfeRA9EVl2/rK60b/82LANgAL9pU7Dzg5wx0oN3SQPvxiyM/KIix2
         Lbkg==
X-Gm-Message-State: APuU4Z+JEEKl8OKMnyKkmVnOTKUoV6CVzBYy4MTstP7FDq7XIzirXAMs
	KmPmR403XQiJD+ILHXUZFae/3E3yxeuSoRRf0cf5HPEeMWRX6cYBcJ7wuUf3qs32RkRmDj9s2pY
	+jPYedLF3+OWLKrOv6gyKoGU0XeB1kOB0/vJo5ZU=
X-Gm-Gg: AZFdTZcL3G9PU0KsCUAQE3tNpOTYMUUHvivIeit4a3dLlx65qKXoZ9bdIoEcf2i3L0B
	YorvH/zPgKw1/V1acrPc4unbOpdIU+PxPnz80TLZOkgPlDjWMEDg79jWtjdLg2OOfknKukdjsjd
	nHOY7oBky5htCdbBnV+KleoQpakTs0C20r0xnA+329+HleIAyhZwBdb6v6qOQDJkab4ajZcqpCx
	uakXtQMbKvmM66P4yBWeL8reithuDWgIMHaSYfxKw2dGgs44FmZW/GEAqZHr5/dhfhNFTTnlASn
	Fd31JQLcCov9y8zmRjd0PVcxW+brP1ssRXON0Tp0NqIaXmrMIsTucgJiaibRSwwMMN6lD/RLs7P
	fcc8+YzVXnIjmYq+4TSjm/tuN/4VzXrCjmaEoFsl61rATVy3khLbx5MhOImoj6dZzCLS1YmA=
X-Received: by 2002:a05:6402:13d6:b0:6ba:857e:ae83 with SMTP id
 4fb4d7f45d1cf-6ba857eb664mr9860990a12.13.1795642868334; Wed, 25 Nov 2026
 13:41:08 -0800 (PST)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Marco Sousa <marcomsousa@gmail.com>
Date: Wed, 25 Nov 2026 22:40:56 +0100
X-Gm-Features: Aa3M54qfJGFxhgD70-BdRQ7MJG0bE-l0ZUccxFIG7pX-78XZybuqjHc_9rgjpGU
Message-ID: <CAHRsBfbYF3wocif+a0FRyBBkhcL+FtKF2qm=ne0jgLCzL8cH9w@mail.gmail.com>
Subject: [BUG] AMD Strix Point USB4 (1022:150a): mid-s2idle pciehp hot-add
 causes D3cold->D0 failure and hard hang
To: linux-usb@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-pm@vger.kernel.org
Cc: westeri@kernel.org, bhelgaas@google.com, lukas@wunner.de, 
	rafael@kernel.org, superm1@kernel.org, Shyam-sundar.S-k@amd.com
Content-Type: text/plain; charset="UTF-8"

Hi all,
I filed a bug report with full sanitized dmesg logs, lspci topology,
controlled A/B test results, and a thunderbolt.dyndbg=+p boot log here:

  https://bugzilla.kernel.org/show_bug.cgi?id=222327

Short summary:
On an ASUS Zenbook S 16 UM5606WA (AMD Ryzen AI 9 HX 370 / Strix Point,
BIOS UM5606WA.321, s2idle-only) docked to an HP Thunderbolt Dock G4
(Intel Goshen Ridge 8086:0b26 + igc 8086:5502), reproduced on vanilla
6.18.65-lts and 7.2.4..7.3.6-arch1-1:

1. At boot, tb_acpi_add_link() creates the device link from 0000:00:01.1
   [1022:150a] (consumer) to 0000:c6:00.5 [1022:151c] (supplier):
     [ 5.005536] thunderbolt 0000:c6:00.5: created link from 0000:00:01.1
2. Host router reset tears down the firmware PCIe tunnel:
     [ 5.008763] thunderbolt 0000:c6:00.5: 0: resetting
     [ 5.008813] pcieport 0000:00:01.1: pciehp: Slot(0): Link Down
     [ 5.008895] pcieport 0000:00:01.1: pciehp: Slot(0): Card not present
   0000:00:01.1 then runtime-suspends into D3cold (power resource
   \_SB_.PCI0.GPP0.PWRS).
3. After dock authorization, tb_tunnel_pci() activates the PCIe tunnel
   cleanly:
     [ 9.429077] thunderbolt 0000:c6:00.5: 0:5 <-> 2:9 (PCI): activating
     [ 9.430721] thunderbolt 0000:c6:00.5: PCIe Down path activation complete
     [ 9.432080] thunderbolt 0000:c6:00.5: PCIe Up path activation complete
   Yet 0000:00:01.1 remains asleep in D3cold and never wakes to enumerate
   0000:01:00.0 / 0000:60:00.0 (igc).
4. On the first s2idle entry, pci_pm_suspend() runtime-resumes
   0000:00:01.1 mid-suspend, invoking pciehp_runtime_resume() ->
   pciehp_check_presence() concurrently with device_suspend:
     pci 0000:01:00.0: PM: parent 0000:00:01.1 should not be sleeping
     pcieport 0000:02:0x.0: Unable to change power state from D3cold
to D0, device inaccessible
     pcieport 0000:02:0x.0: pciehp: Slot #8191 ... /
pcie_do_write_cmd: no response from device
     igc 0000:60:00.0: PCIe link lost, device now detached
   Entering s2idle in this unenumerated/wedged state causes a complete
   hard hang requiring a ~30 s power-button EC reset.
5. Controlled A/B proof on 7.3.6: waking 0000:00:01.1 from D3cold once
   before suspend (power/control=on + lspci, then restoring auto) makes
   pciehp immediately see Slot(0): Card present / Link Up, enumerates
   0000:01:00.0 + igc, and makes s2idle 100% reliable with full hardware
   S0i3 residency (11-27 s, Last S0i3 Status: Success).

Also attached on Bug 222327 is a secondary drivers/thunderbolt/nhi.c:143
(ring_interrupt_active) WARNING + Call Trace seen on dock hot-unplug.

I have the hardware on my desk and am happy to write and test a patch.
Could you advise where the proper fix belongs?
- Should tb_tunnel_pci() runtime-resume the linked host PCIe root port
  when activating a PCIe tunnel?
- Should pciehp_runtime_resume() avoid hot-adding devices while system
  suspend is in progress?
- Or is 1022:150a expected to receive a hardware/ACPI wake from D3cold
  on tunnel activation?

Happy to collect any extra dumps (sudo lspci -vvnn, acpidump, amd-s2idle)
or test debug patches.

Thanks,
Marco
