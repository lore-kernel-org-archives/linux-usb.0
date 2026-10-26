Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793017326;
	b=wKBkquLfxVMlNLAUTcSzTMrl7kQknqtFdr48GAW7bBUZdvuaF61i3Fa+MrIGHrV4Q6Pw
	 9tK2ghsdzDgiX+At/8VcwG4XVuEKfTJT/e5xQqi43jPmQZIDlxflZgfqTFN4cL0z/C1rR
	 fJLzk01x2I38o+JYZXl5djPDVSjTjXicc9SLGEymZ3ermXkT2vgVwpspHmSjV/+0Fwadi
	 QU1/pegjKsHhlFnoWrinH+JoVLT5bjefEx5ZylVm6JO8JHpr7vCZe4PtjHI3jPQMxg3Pa
	 sLLUheHmhRO2sIrzO2NAxwcrSSIzzhTsPAt89AN77kmoZQfO41kNhv2pZnXuC8JYmwA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793017326;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=IqIHRkGXzASUn0iUnrQHUXg9R1zPJx/8MaHGjQ7oJ48=;
	b=X/fKeP/JpZ6XN8LcrxaIDznfgona/litDktFnhYXNLUOsW2LoXEcHv2KcDLh3VyYeD40
	 nUZJrb0KX33gV5dyA5/61DrfOn+o/Ew+LIDLQRXzaUldFGeApnUqiWJ81Y5K6vpaKh4o2
	 sAQAaJ6ggEClpoX9dLYC79pqVV9Gpg2T4KPoonXcP9Tq6Ad/8lthF/qimwdLl55vXyqIa
	 yubJS/55yxILT6KxenWY3kgRzUgLr188gI6wky0fX8nZRTqt3LVBalVmTJDVTZwbUBpJM
	 lrksOeFTB2EI5TrfPimc95rlOpQP4GEs/x5fuByPncG4nVK/b3+QmmrEMW6A/mEK17A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WV2yVvnM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.44
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09CC2606A31A
	for <linux-usb@vger.kernel.org>; Mon, 26 Oct 2026 12:22:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09CC2606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WV2yVvnM
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-8470d7d430fso1104312a34.3
        for <linux-usb@vger.kernel.org>; Mon, 26 Oct 2026 05:22:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793017325; cv=none;
        d=google.com; s=arc-20260327;
        b=S1LdAVZAVRTLEMgKDQSHjy/gKl5qC1/Yai/tDvh6i1nSM1c5hy0hQZJO0Cljd9V5iy
         TXMxXc7ANHP4nOIOqvsrfhmHZggtfyvfurM5ll36EHcIdF9OwPuEeDBS0XUzDq60NzUz
         cv4jbWOGpJu7O1QsFXlTy1nNk/IZ7LG9v2cqRuxYhZpdviySGsxX8n8pOwNSoPaoK7ul
         ryA4EIuOLEKE0/0uLisFGdeyBsFfGUD8BpAAvQ1uSGNZi9MAH7CRNmegvMb/6jzuI0co
         QysCnD7KrgIlWJ0Nv76UEuhqtWgcw3Cs/msy2sqGaXKqdCeV1Dqp72PYrBwTlpDA/Isw
         pwSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IqIHRkGXzASUn0iUnrQHUXg9R1zPJx/8MaHGjQ7oJ48=;
        fh=6OdGDJC5NXZXWgkrE1hG0dALvXSnbojqig3dciAApAI=;
        b=OaZO2yERkTY3d/vyz8OWvWzf2ib6ijoivKin2jYR6/UeaO37hnPTFc5IWQNx+7OhDo
         MusHmV45OckKkA+HwtaoGKdZbfcmiMtP91qpqIfbl7OXgE3FFQK8GRSsIn6jwXBpDBpB
         zktkZofknS3SxYxPdA48VUlwfr79Q/fpaurXvtAFgtTeiTUWOyLRYiuzPqz1vHwjiFlc
         j0T6XITncTJNJZ8np6mqVgEFC+27Qdg+uK4wzKGDObbnb0uCtdUHnBppj3p4+Z8lU17u
         xooBiYUr2Jlw+41DpLfhubXxseeFiw8VBsMpyieVvovunJTCx8FjKA7CEPQAw7AymMz/
         6xKA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793017325; x=1793622125; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IqIHRkGXzASUn0iUnrQHUXg9R1zPJx/8MaHGjQ7oJ48=;
        b=WV2yVvnMTiylXLRGPwszSjEoCKhVep1+oOtkyEqCXm2SS0JgmlhqICxRMb0XwCkO4n
         IdbEmKJsojODIKUnv29TZhTWRBQk4+yTAk5Ftwmpds5xg8AluGvJ59GmK6RTwPDkCwFX
         g52qUtevu2mkRv2w49z/ATW/BGdUYbFrAuNIXN4VkHkFeoVDov65isYLG45zNuYrqpHP
         H5Ud91kCzfU5slaCcSbXSkdEShiDIqp84mbVwZK8auJI5GKuO+X9kmrQkkYampQYpDjv
         P38sWbw/JzF+wO0ncKFgJnvBtilFf0SW1tDLIPI5w44Z6oAI2G6/9dc/AkhoSI8SRsxT
         nD7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793017325; x=1793622125;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IqIHRkGXzASUn0iUnrQHUXg9R1zPJx/8MaHGjQ7oJ48=;
        b=FP4XkKDXbEB5PKLkrVrF6bbaK0QET6Q/vuuJJMvdseMYE33kYATDCnL6DmNz2iRwrK
         x3V/BD9OFZswH88+pgWQJ3G/A+HSO2FXCtL6FKbrkYC3F5/v9obnXQ/qYdNw+E3Q9MCc
         JxnBXbyvWejJSWf+JYwNeGXGHSoAa9jlu1fcrMPJrwW9hv77i0MdHvVbu7ZN58EZ7BK5
         UhqTZGY6+4+EHII/2h0U8f1B7HB/k1tPebewjx3YortqNWgph1xOTz5ob19OxI3I7A7S
         LJuACWrDx6/zPLaz0ur4Y3OAWaDsK93BaUEU9sr+zo71cTW7FDoxx9HskyhmaXiV+Dio
         OBjA==
X-Forwarded-Encrypted: i=1; AKwUvBzdTjpq1CdkCsES8BhmAIbdowHu78voMzSqOiC4ZfabsOBqn2pIQ7EmQ/3OYF8kH2wisjz9ekLcFok=@vger.kernel.org
X-Gm-Message-State: AFq9FYLRzuLz815uBkTVa7eCOLlJWT8aPoIjXKHcTf28fO85eUY4fuH9
	CwEL11TfPSM3o4o++dQ6XZYl51rZ5/lscJPUSYuyer3YP8axBHsd/rb5Mbz0iBDvCe2+U0TsEIV
	FJOOT4WFbV/DWZII546UCvTt4Kg9ND5U=
X-Gm-Gg: AYBFou2N8rJTQZOlQnzGrV/HLinTxaCi9vMqDQ6F+/ZqsSReMWCtvlkcTAmpNJg16nb
	+X5FHSepq/6jS6+ckvSYeULxPV1GEWVUdZ3tM1L7RxQW/oFDLPhN6VmcKSKAaJyFRJtYcw6lwZo
	WDIpD4FcqRvmn+tlWDmCLItxohRYKpyLSzhe0lgt1Vs1I9ZFEiFxQV/eY1BTJ8jbB7ZDgAsLv/t
	c8xrDW3wuesX6mD0GGFmfCxz2HS6kbhEUFN1bTgHqkOh7B+h03AxGPTj0gXkAH22TM8Q5A1rIUt
	Xy1riT2RpA6ZNN4EXHDqYIfsY87hU1bFGMXf/Gk+Ttt20TjhKR9OTPxdOU9M4D5mdcMrE1RIAcq
	9HS2coT3N2IsGYRA8oh1qGPaTXeBcDdkjU2Nzf5LpahB5aCMGGS/te6uX/ta/7LpnXYh2YUi0cl
	KhVJpeue7lg0XSKDNLbVE=
X-Received: by 2002:a05:6830:270a:b0:843:ed9d:1535 with SMTP id
 46e09a7af769-850fde2addcmr4756076a34.19.1793017324827; Mon, 26 Oct 2026
 05:22:04 -0700 (PDT)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <PR3PR10MB3898251C0136EEFE9DEC84FAA5902@PR3PR10MB3898.EURPRD10.PROD.OUTLOOK.COM>
 <at87sDXF-KHTJAxb@black.igk.intel.com>
In-Reply-To: <at87sDXF-KHTJAxb@black.igk.intel.com>
From: =?UTF-8?Q?Ville_Kivel=C3=A4?= <ville.d.kivela@gmail.com>
Date: Mon, 26 Oct 2026 14:21:54 +0200
X-Gm-Features: AclHuK9UWIn1mD9CiQMMgVGNy41i68OxrUF6ZdcM1ieRC9mCsQAOX_X3L3VUKRU
Message-ID: <CAF6bQury453zDP8aA8v9X=tNT=y=p-bxq6sxh8JucWPiLj-C5Q@mail.gmail.com>
Subject: Re: usb: typec: ucsi: duplicate-altmode filter keeps invalid DP
 partner VDO on Dell XPS 14 DA14260
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: =?UTF-8?Q?Ville_Kivel=C3=A4?= <vkivela@outlook.com>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, 
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, 
	"acelan.kao@canonical.com" <acelan.kao@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Heikki,

Thanks for the quick reply, and for resending the patch. Understood that
this needs to be fixed by Dell.

For the DMI match: this machine reports sys_vendor Dell Inc. and
product_name XPS 14 DA14260, so it is covered by the quirk.

Thanks,
Ville


On Mon, Oct 26, 2026 at 1:38=E2=80=AFPM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> Hi Ville,
>
> On Sun, Oct 11, 2026 at 07:34:59PM +0000, Ville Kivel=C3=A4 wrote:
> > Hi,
> >
> > The duplicate partner altmode filter added in 67c92c6419ea ("usb: typec=
:
> > ucsi: Detect and skip duplicate altmodes from buggy firmware") keeps th=
e
> > invalid copy of the DisplayPort partner altmode on this machine and dro=
ps
> > the valid one. The DP altmode driver then cannot bind, and the monitor'=
s
> > USB hub never works.
>
> This is why from now on all quirks for this driver are going to be
> isolated with either DMI match or something similar.
>
> > Hardware:
> >   Dell XPS 14 DA14260 (Intel Panther Lake), BIOS 1.8.2 (2026-05-22)
> >   UCSI over ACPI: \_SB_.UBTC (USBC000:00)
> >   Partner: Dell U2720Q monitor (DP alt mode + USB hub + PD source)
> > Kernel: 7.2.5 (Arch-based distro kernel "7.2.5-3-omarchy")
> >
> > The firmware returns the partner's DP altmode (SVID 0xff01) twice on ev=
ery
> > attach:
> >
> >   ucsi_acpi USBC000:00: con3: Firmware bug: duplicate partner altmode S=
VID 0xff01 at offset 1, ignoring but please contact the BIOS vendor to fix =
this issue.
> >   ucsi_acpi USBC000:00: con3: VDO mismatch: 0xff01a043 vs 0x00140045
> >
> > The entry at offset 0 is invalid (0xff01a043: SVID in the upper half,
> > identical whatever the monitor is configured to). The entry at offset 1
> > is the real DP capabilities VDO, and it changes with the monitor's
> > "USB-C Prioritization" setting, as expected:
> >
> >   High Resolution: 0x00140045 (UFP_D, receptacle, pin assignments C/E)
> >   High Data Speed: 0x001c0045 (UFP_D, receptacle, pin assignments C/D/E=
)
> >
> > The port exposes a single DP altmode (port2.1, svid ff01, vdo 0x001c1c4=
6),
> > so the per-SVID cap is 1. The filter keeps the first partner entry and
> > registers port2-partner.0 with vdo 0xff01a043:
> >
> >   $ cat /sys/class/typec/port2-partner/port2-partner.0/{svid,vdo,active=
}
> >   ff01
> >   0xff01a043
> >   yes
> >
> > typec_displayport does not bind to it (no displayport/ directory under =
the
> > partner altmode), so the OS cannot choose a pin assignment.
> >
> > Observed result:
> >   - High Resolution: video works, but the monitor's hub never enumerate=
s,
> >     not even at USB 2.0.
> >   - High Data Speed: the hub (0451:8440) enumerates at SuperSpeed on th=
e
> >     TCSS xHCI and disconnects within ~1 s, as DP mode is entered. USB 2=
.0
> >     enumeration starts and never completes. There is no video.
> >
> >   usb 2-3: new SuperSpeed USB device number 2 using xhci_hcd
> >   usb 2-3: New USB device found, idVendor=3D0451, idProduct=3D8440, bcd=
Device=3D 1.10
> >   hub 2-3:1.0: USB hub found
> >   hub 2-3:1.0: 4 ports detected
> >   usb 3-4: new high-speed USB device number 6 using xhci_hcd
> >   usb 2-3: USB disconnect, device number 2
> >   ucsi_acpi USBC000:00: con3: Firmware bug: duplicate partner altmode S=
VID 0xff01 at offset 1, ignoring ...
> >   ucsi_acpi USBC000:00: con3: VDO mismatch: 0xff01a043 vs 0x001c0045
> >
> > The same monitor and cable work fully (video and hub) on a MacBook.
> > Reproduced on two different USB-C ports, after a full power drain, and
> > with Dell's "Video/Power only on Type-C ports" BIOS option disabled.
> >
> > The root cause is the firmware, and it has been reported to Dell. Howev=
er,
> > when duplicates disagree, keeping the first entry is arbitrary. Would i=
t
> > make sense to prefer an entry that passes basic validation? For SVID 0x=
ff01
> > that could mean a non-zero pin assignment field, no reserved bits set, =
and
> > the upper 16 bits not equal to the SVID. Alternatively, the driver coul=
d
> > prefer the last entry. I'm happy to test patches.
>
> I already send a patch where I disable support for the alternate mode
> reporting for all Dell XPS systems, but it looks like Greg missed that
> patch - I'll resend it:
> https://lore.kernel.org/linux-usb/20260911132850.1580669-1-heikki.krogeru=
s@linux.intel.com/
>
> It does not make sense to attempt to add more and more quirks to this
> driver that fix firmware problems on these systems. Dell really has to
> fix the PPM.
>
> > Also seen once at boot on the same machine (cleared by reloading ucsi_a=
cpi):
> >
> >   ucsi_acpi USBC000:00: con1: failed to register alt modes
> >   ucsi_acpi USBC000:00: error -ETIMEDOUT: PPM init failed
>
> That should get fixed with the above patch as well.
>
> Thanks,
>
> --
> heikki
