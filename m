Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F027D33938C
	for <linux-usb@vger.kernel.org>; Sun, 16 Aug 2026 20:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786910475; cv=none; b=Cz2XpH+z+l93TWjRPMoaRA3ThZRM2wOvQMmnf9EvAHzu8vhnBdsfUmRs/kohY6pVhTYko1mHfBCKimIkG1klFyxE0govpZE5SY/u6HO+ISCRf2AYbFfKl0BC3J9tdW3/R/aDgGx6cdE2jur/Zf8S4EmLz+VUwhGQkM5/nH+PxyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786910475; c=relaxed/simple;
	bh=78/nuNzPt4uU4JcK086ubaceGsR5Qkebr1ixbFJAhXw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HTIQKqDsv/uRmHL7gE4jQ5LhnUD/FXoE3Gpg4HfXyQVgvxdBR/iba6jjfjfMZxpeTZJjPTHEG5CuAraEQ6/nQmySVkMWdVPuujYH3fS/wZXasjoH07AEe+i75OJG2ioiAB+V6j8hkS1m7GVjfi/0Qd5ysbEG2gvpPowMuMhttrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=phFwyrPN; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="phFwyrPN"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c2055f5a993so313297666b.2
        for <linux-usb@vger.kernel.org>; Sun, 16 Aug 2026 13:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786910471; x=1787515271; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HVK0VUvQpxU/PuZtFJZXm6xx2UqmZ44Az9dSUfrFhas=;
        b=phFwyrPN5i95leUanjsrNN1VFamOh4v/HecdLTFDblDYcBHP4cU1vt1ad/2MZqBb4v
         uc1Huw4ZdMvAu16XM74a2Lmz50E5oRbQQTvgsfc4dktEzRYISl0WTK1ixMJ0zYjKiX4o
         cdwX12hWN9YkXuHnDSrFMuYbP+YutZ2xcnoXC++fhZxW6VxqsPsbTVvXY257bmZhbeRP
         S6D4egKe6DpbwrwtNN1Fueqfo/jk0ED68Jo4l3T5ZWzyHQvXks3WdAwpbZ+ClpijdtSd
         j3sbVQ+BgTJR6H3LTGBPZVLYgCvPo6bQerjId0ymVSOSfUQ+rmeGYPvsZxiD309Gf1Hq
         sFcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786910471; x=1787515271;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HVK0VUvQpxU/PuZtFJZXm6xx2UqmZ44Az9dSUfrFhas=;
        b=O8wg7RLykTIBt2rvsGX12Pm+FCDylrHLF3/l2Tv988LvKxU8p5kyBhthsHEm1go92q
         eWZflb7tT7k6YpP5OWF7FcGRPXcBkcmheK/oooK7TnVVvmRR0etR7vFqK+AJqOXp1Q0Z
         X3UdCMx/A6AhfhYd1YS5XS1nsRJI4JrzcM+FwKQHJm7JekUSu9GE3HWaXfBL/TqGFo9j
         iUE41Q6cUbfEM12dJHQv5LWHxwPt7wnGqjKyzkO0cArSDkb4ksGX4oQOR4mBBVQKvNQO
         GW3yt+anE8Q9EPimf0TRbJj1WyRwgI7ApLqqij3VIt5e4rCkt6MD1tIGojt/BclcnGGL
         KoeA==
X-Forwarded-Encrypted: i=1; AHgh+Rqg1sATWB8UjVtsUEyWT6w1VmEc/E3Gx7rSGhx0DRQDPvJ5eDW1w8OJW0Q3G9IAWnVTfpL1GGNNsF4=@vger.kernel.org
X-Gm-Message-State: AOJu0YywhaXo4IVUryJbO4m18vG5HwDadHMzQ4G0fA8lhEslsf5FAScR
	onI+If6NiJNjeOlWGBgrLpPCC0TzB5B6zqtRzD5alh9H5WXMDqCTUErb
X-Gm-Gg: AR+sD10N9yDUkaYcFJzXvvtiZZO5LAqoni7ygy3lIAdA7oAIIvtau9siWiOF9STkIIl
	p2323MikpOuGyPnh7Gf2tQv2PAKGq9OleLkxtPcDkRfFiHWjXndWni1VH/PdIde/gXwQEbJR7gg
	oA+YITJOF7xgV4lUR1l+vgAg/LS6+lSfnLbQFYY7J3yPOtaSD8brznuHc/Xfg2VsMJaOtBcqrvA
	DxNv+tP9juKgm0rB7MAy+Bsh0qFF3LVLvfsCPqgfpdBA+8icLZFUq2QYTGMkm16Jq/4uJpQvyQ7
	maPeMBPQDD62ose08tpLX008wCYEGt7Me/AhcM5oto3SxkJ3W7X5ZP4lpuVIwBjeczlj24gfcdH
	174PA6zej8vxK08SWwg8jIEvcZCL8rASRY9DTM3i09i1hYN6mfOtzQam0iqjacrEwJRj+uPmSQm
	ha0vBfrQgBPp2NUWLYorEGqbyNuMALpAoj6vCUozkkDcJBHCtKUVf/b3hmGmWw7tFdl0U=
X-Received: by 2002:a17:906:fe43:b0:c20:88a6:8210 with SMTP id a640c23a62f3a-c2129be1502mr1020404866b.9.1786910470813;
        Sun, 16 Aug 2026 13:01:10 -0700 (PDT)
Received: from foxbook (bfg7.neoplus.adsl.tpnet.pl. [83.28.44.7])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a38d79e437sm3098303a12.31.2026.08.16.13.01.08
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sun, 16 Aug 2026 13:01:09 -0700 (PDT)
Date: Sun, 16 Aug 2026 22:03:06 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Mario Limonciello <superm1@kernel.org>
Cc: Rishabh Jain <rishabh.jain1198@gmail.com>, Mathias Nyman
 <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH] usb: pci-quirks: always assert xHCI OS ownership
Message-ID: <20260816220306.64c615f2.michal.pecio@gmail.com>
In-Reply-To: <69fdc442-a4f2-42e0-80f6-6b35cbc207bf@kernel.org>
References: <20260815014534.77850-1-rishabh.jain1198@gmail.com>
	<69fdc442-a4f2-42e0-80f6-6b35cbc207bf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 16 Aug 2026 11:33:56 -0500, Mario Limonciello wrote:
> On 8/14/26 20:45, Rishabh Jain wrote:
> > The xHCI ownership protocol requires the OS driver to assert the HC
> > OS Owned semaphore before using the host controller, then wait for
> > HC BIOS Owned to clear if firmware owns it.
> > 
> > quirk_usb_handoff_xhci() currently asserts OS Owned only when BIOS
> > Owned is already set. If firmware leaves BIOS Owned clear, Linux
> > uses the xHC while both ownership semaphores remain clear.
> > 
> > On an AMD PROM21 xHCI controller (1022:43fc), this caused every S3
> > resume to terminate Controller Restore State with USBSTS 0x401.
> > Linux then reset the host controller, both root hubs and the USB
> > Bluetooth adapter.

Not sure if this has anything to do with PROM21, or if some BIOS
is just trying to use the xHC at resume because it's permitted to.
Then it makes too many changes for Restore State to still work.

Potentially, such bugs may have happened and been left unsolved or
"solved" with RESET_ON_RESUME quirks and other hacks.

> > The controller entered resume ready and halted with USBSTS 0x1.
> > Endpoint state, 100 ms save/restore delays, scratchpads, the DCBAA,
> > device contexts and command, event and transfer rings were verified not
> > to cause the restore error.
> > 
> > Asserting only HC OS Owned changed USBLEGSUP from 0x00000801 to
> > 0x01000801 and eliminated the restore failure across four S3 cycles,
> > including a stock-kernel test. Clearing USBLEGCTLSTS was independently
> > verified to be unnecessary.
> > 
> > Always assert OS Owned when the xHCI Legacy Support capability is
> > present. Use the independently accessible ownership byte so firmware
> > can update BIOS Owned without racing a 32-bit read-modify-write. Keep
> > the existing BIOS handoff wait and legacy SMI cleanup unchanged.
> > 
> > Fixes: 66d4eadd8d06 ("USB: xhci: BIOS handoff and HW initialization.")
> > Tested-by: Rishabh Jain <rishabh.jain1198@gmail.com>
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Rishabh Jain <rishabh.jain1198@gmail.com>
> > ---
> > Additional context:
> > 
> > * Kernel Bugzilla #216470 documents the same USBSTS 0x401/reinitialize
> >    behavior and its impact on attached USB devices:
> >    https://bugzilla.kernel.org/show_bug.cgi?id=216470
> > 
> > * Commit a7d57abcc8a5 ("xhci: workaround CSS timeout on AMD SNPS 3.0
> >    xHC") is related workaround history: it tolerates a distinct AMD CSS
> >    timeout and resets the controller on resume:
> >    https://github.com/torvalds/linux/commit/a7d57abcc8a5bdeb53bbf8e87558e8e0a2c2a29d
> > 
> > The external reports do not record their ownership semaphore values but
> > are included as corroborating failure signatures that this might fix.
> > 
> > drivers/usb/host/pci-quirks.c | 12 +++++++++---
> >   1 file changed, 9 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/usb/host/pci-quirks.c b/drivers/usb/host/pci-quirks.c
> > index 0404489c2f6a..d76a4791b8f5 100644
> > --- a/drivers/usb/host/pci-quirks.c
> > +++ b/drivers/usb/host/pci-quirks.c
> > @@ -1185,6 +1185,14 @@ static void quirk_usb_handoff_xhci(struct pci_dev *pdev)
> >   		dev_warn(&pdev->dev, "xHCI controller failing to respond");
> >   		goto iounmap;
> >   	}
> > +
> > +	/*
> > +	 * The OS ownership semaphore must be asserted while the OS owns the
> > +	 * xHC, even if firmware did not assert the BIOS ownership semaphore.
> > +	 * Update only the OS ownership byte to avoid racing with firmware.
> > +	 */
> > +	writeb(readb(base + ext_cap_offset + 3) | BIT(0),
> > +	       base + ext_cap_offset + 3);  
> 
> I'm assuming you are actually meaning XHCI_EXT_CAPS_PM for the 3 here. 
> Why are you doing all this math?
> 
> We already have the defines XHCI_HC_OS_OWNED, can't you just use that?
> 
> And for that matter it sounds like you are really proposing to just 
> remove this check but adding more complexity in the process.
> 
> 	if (val & XHCI_HC_BIOS_OWNED)

All explained by the comment above and xHCI 4.22.1.

Though curiously, while HW is required to enable doing the sensible
thing, the spec doesn't clearly state that SW must actually do it...

And BTW, I checked if any of my HCs refuses to honor DWORD writes to
this register to protect SW from itself, but none does.

> I guess the way I would do this is at least leave a debug breadcrumb

Is anyone ever going to look at that pci_debug()?

If it works, who cares if it was claimed by the BIOS or not.
If it doesn't, you know that it was. And the full register is dumped.

> since you're reading the register something like this:
> 
> val = readl(base + ext_cap_offset);
> if (val & XHCI_HC_BIOS_OWNED)
> 	pci_debug(pdev, "BIOS owns XHCI HC\n"0;
> writel(val | XHCI_HC_OS_OWNED, base + ext_cap_offset);
> timeout = handshake(...)
> if (timeout && (val & XHCI_HC_BIOS_OWNED)) {
> 	dev_warn(...)
> 	writel(val & ~XHCI_HC_BIOS_OWNED, base + ext_cap_offset);
> }
> 
> Then you have a single read, no extra writes.
> 
> >   	val = readl(base + ext_cap_offset);
> >   
> >   	/* Auto handoff never worked for these devices. Force it and continue */
> > @@ -1195,10 +1203,8 @@ static void quirk_usb_handoff_xhci(struct pci_dev *pdev)
> >   		writel(val, base + ext_cap_offset);
> >   	}
> >   
> > -	/* If the BIOS owns the HC, signal that the OS wants it, and wait */
> > +	/* If the BIOS owns the HC, wait for it to hand over control */
> >   	if (val & XHCI_HC_BIOS_OWNED) {
> > -		writel(val | XHCI_HC_OS_OWNED, base + ext_cap_offset);
> > -
> >   		/* Wait for 1 second with 10 microsecond polling interval */
> >   		timeout = handshake(base + ext_cap_offset, XHCI_HC_BIOS_OWNED,
> >   				0, 1000000, 10);  
> 
