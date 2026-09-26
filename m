Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E1B821A447
	for <linux-usb@vger.kernel.org>; Sat, 26 Sep 2026 08:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790411838; cv=none; b=A9V6jlI4HTCtiT9oUxKOxIHol008gMUwBmizpRvXhWsw5cJMnjspub2ujVRhCR0a69H7JTd+kVldVnBwExjSz3dgUCPUPSfV4HwGc+95DoOdwPMfaMOaRWVihfWi/gBWs0/Sw4WJkRrfR87KhTybmmle1/1jr0lersnQwIW1O3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790411838; c=relaxed/simple;
	bh=kjStB40TqhVIMYtiJnvfrBcR7V47PfTyysP2ProwVaM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UMs9d5Wg1Khu2sw9gL+iSROw2/20ey8EfLgDofJLMKaHdt4gQIQUUc1nUvlgnvOeZZEtealS55Ug8ynT6T1twsQ8ADVx0zQZUOYdtZOZILsKd4+X9JCZamU4JfNZ7Ej+tyUDM7LFX6fFDZdCg748fHN7So5Bz+an7JKanwxcXqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ogn/DmK2; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ogn/DmK2"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e71cdb22bso11440405e9.2
        for <linux-usb@vger.kernel.org>; Sat, 26 Sep 2026 01:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790411835; x=1791016635; darn=vger.kernel.org;
        h=content-type:mime-version:references:in-reply-to:message-id:subject
         :cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xNZNOUDOgurnPd7Z4F0Jp9l9rVDlpVvUb1+k9XbjBtQ=;
        b=Ogn/DmK2KPMGPAaEMYODEFaPfWvm81PvbTMRwQVF+D5kNXJ2Wh/RacGPZq/7hUOqDv
         GxvPjl7B/FVJjCIIvff5LJT9qp3L3lLRvKV6k2krEXNm3zNMusd3gXYsxp8bS9sN35Bp
         oAp2Egme2z9nHNcHgCy4VN/gZGMmDUR/cu4BD4zwhoLgAixDencgkLe7/KEX1SK+xTm9
         /8xlp52XK4N5qe1IO05X2Cdb14K0KGpPOrMKCNjZE5aNV4gKEB1GaO9QLfuOw6eYMmKI
         FrPrZY2GsZ7WNGPPCZ1kilTOH/meF+6ZWg+m9SvWnS9D0DQ2spHQPQSn+xm6Jbv371N5
         LQXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790411835; x=1791016635;
        h=content-type:mime-version:references:in-reply-to:message-id:subject
         :cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xNZNOUDOgurnPd7Z4F0Jp9l9rVDlpVvUb1+k9XbjBtQ=;
        b=Mv2SvC3I7idenPa6VlTpysWw+q2WKIsm1QYtgVkRyXj8bxSv7jaBgSf5fkvBAz+vUc
         EfCEL1R4P/XWGQqbfYAdj9R1AE3xNQE9SWXIGnqJMKpXShVyjr7fZdTnNakYF6OSniiZ
         ErareYjq0Mfu0HKvFR3jvSJeDrWiEKEffH5n9kOUIIMfjl5vyRC5+9Pq0LtupOPBB8XV
         NodmFKavtw21XeF0X87rGdmQ+Bv/7Ube48YxmwWi8wNcSyTjN8ZNP97UXIuahweCQewq
         azR7+CvWWEel5c2ME73gS476khKQR55NCZ7yaI90XsFQCrn6WQK4tpJVSoxnpl6MWJqg
         sOmQ==
X-Forwarded-Encrypted: i=1; AKwUvBx8fV+n1zYgCjKZLadJaID+RnJ7++SPSjiphNYpaZRTW2Z6bt2q4QMMGvpkZH7+Jaf4P9E9nmjNyws=@vger.kernel.org
X-Gm-Message-State: AFuF++kXQantxKkuEvKXyMwAfV/9W66BHLMwzLHgHUHgvzyEELPhKf+/
	PbLUBcbPuMfg0UFFPzxLPA/VAbxQrSn5m/BlXPDQdYnbx0yZodPt+NMs
X-Gm-Gg: AYBFou3TsPUZxEAAM0xNPLgnrJo4OqhccSs5ZDbQrfak5VQwAZtnGYmCl9PFkgVhYeQ
	bDVOucKE6a5jSTv3U/NiNYLlJkcCkXSldmg2ZUrWJbYFfQlPEAAzsvtnnWETIHKOllF/+f12BRY
	Uank4qQjorlNWm48ABcmzxA5A7mkbAIZUtQCiSt9bqdamtD9G1b4l5hxxGX5pJkQd3ZRX5ys1nB
	djz3XIYrCoeQhDPee5d6Yhgm6owPJrDcw0MjUkR0YsFD+jt+PFSKovKHlKkCo8ZFZLGqXZTYSqB
	yHkHLIMacvZqAB/QOoZ2HVQbY2fNz8ogtXTDH1Zk+OiEl0O3Usjx8BTgWw78Z/ddLriKAJxtrxT
	Jb0rUswZ8JztxoEr0YtTgrKs0FZhVAcWFdFX0FZAP+k+95uA73/onT0jwTnwAIE6Y1e6TfdJ7fQ
	R0bUUPqEuz88K9gY0btAcHkFtcsWpUS8olA1N1WLTStVbSln34kWBob7P/+8/z+gM2ypC/nou3H
	SKREyGxBg==
X-Received: by 2002:a05:600c:1546:b0:49c:fa20:cc00 with SMTP id 5b1f17b1804b1-49fe66f4f59mr138394915e9.23.1790411835054;
        Sat, 26 Sep 2026 01:37:15 -0700 (PDT)
Received: from foxbook (bez152.neoplus.adsl.tpnet.pl. [83.28.37.152])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fef5fc189sm86201405e9.3.2026.09.26.01.37.13
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sat, 26 Sep 2026 01:37:14 -0700 (PDT)
Date: Sat, 26 Sep 2026 10:37:08 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Ben <benstaples10@gmail.com>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>, Mika Westerberg
 <mika.westerberg@linux.intel.com>, linux-usb@vger.kernel.org,
 andreas.noever@gmail.com, westeri@kernel.org, YehezkelShB@gmail.com
Subject: Re: xhci_hcd 0000:0c:00.0 dies with "Abort failed to stop command
 ring: -110" exactly 24s post-init, tunneled USB4 xHCI behind Goshen Ridge
 (ASUS ThunderboltEX 4) + CalDigit TS4
Message-ID: <20260926103708.0025dad2.michal.pecio@gmail.com>
In-Reply-To: <CANcA1gCRveYso4ishW68P_2N3z0pRYevAwShS_VRNQLEMKJfQg@mail.gmail.com>
References: <20260915043845.GG106095@black.igk.intel.com>
	<20260915050515.GI106095@black.igk.intel.com>
	<CANcA1gDbddDkZAQr_O6njK4PvaDk6nnj+fPsrzigH132u0f0Ng@mail.gmail.com>
	<20260916075135.GN106095@black.igk.intel.com>
	<CANcA1gCjSCdXz_3+XA5ZOndm2pAL4ZUs93q_69dzZeq_cmq8Og@mail.gmail.com>
	<20260917043847.GV106095@black.igk.intel.com>
	<CANcA1gDFygEN68vnoocpLg10jMQctb3aG_QU55nZK3GuxSrD6w@mail.gmail.com>
	<20260921044453.GJ106095@black.igk.intel.com>
	<CANcA1gA_o_34UUZMzFp+cMuMFvk9S4uizYCdR8iG55pKaw+71A@mail.gmail.com>
	<20260922042608.GZ106095@black.igk.intel.com>
	<CANcA1gAijg6Ftmw9+aeuG+SjKKwKo-HyXb+kfBiGFGj=ZzNvaQ@mail.gmail.com>
	<2a4026e7-f5d3-4301-bc60-0570cbd7fa09@linux.intel.com>
	<CANcA1gAM7UsSxNyHET7HZndeWzAnf4yBDdhLC4pRFsMNuWOHgQ@mail.gmail.com>
	<20260925102746.25e87ef0.michal.pecio@gmail.com>
	<20260925104013.1c8e21cb.michal.pecio@gmail.com>
	<CANcA1gCRveYso4ishW68P_2N3z0pRYevAwShS_VRNQLEMKJfQg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="MP_/+QhLVpzWgHzxnhzO8nqFFmi"

--MP_/+QhLVpzWgHzxnhzO8nqFFmi
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Fri, 25 Sep 2026 20:28:14 -0400, Ben wrote:
> Kernel Information:
> > =EE=A9=B1 =EF=81=8B git remote -v
> > origin https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git=
 (fetch)
> > origin https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git=
 (push)
> > thunderbolt https://git.kernel.org/pub/scm/linux/kernel/git/westeri/thu=
nderbolt.git/ (fetch)
> > thunderbolt https://git.kernel.org/pub/scm/linux/kernel/git/westeri/thu=
nderbolt.git/ (push)
> > =EE=A9=B1 =EF=81=8B git status
> > HEAD detached at thunderbolt/master
> > Changes not staged for commit:
> >  (use "git add <file>..." to update what will be committed)
> >  (use "git restore <file>..." to discard changes in working directory)
> > modified:   drivers/usb/host/xhci-mem.c
> > modified:   drivers/usb/host/xhci.c =20
>=20
> I've provided more snapshots. One with the quirks from console
> options, one without.

This looks right, but the debugfs dumps don't seem to have been taken
from the patched kernel. Not sure what are those slot_2xx directories,
but neither of them has the bogus IR0_ERSTBA_LOW value.

Was USB functional at all? The patch would break it. Maybe it wasn't
ideal, please try this revised patch which only touches the suspect
host controller. And don't use xhci_hcd.quirks=3D0x800000 anymore.

Please confirm that the string "beef cafe" appears in dmesg, this shows
that the patch is applied and it recognized the suspect controller.
Then check if there are any "AMD-Vi" errors logged, particularly at
addresses 0xbeef0000 and 0xcafe0000, and check this:

# grep ERSTBA_LOW /sys/kernel/debug/usb/xhci/0000\:0c\:00.0/reg-runtime
IR0_ERSTBA_LOW =3D 0xbeef0000
 =20
> usbmon.txt is the result of:
>   sudo cat /sys/kernel/debug/usb/usbmon/0u | tee usbmon.log
>=20
> followed by:
>   echo 0000:0c:00.0 | sudo tee /sys/bus/pci/drivers/xhci_hcd/unbind
>   sleep 2
>   echo 0000:0c:00.0 | sudo tee /sys/bus/pci/drivers/xhci_hcd/bind

This confirms that USB core initializes the hub, detects connected
ports and tries to enable them without working Port Status Change
events. Hub interrupt endpoints only see submissions and unlinks.

I separately confirmed the same on my system. I completely patched
out the call to handle_port_status() and devices connected during
driver reload were still detected, only hotplug stopped working.

So it's not surprising that Enable Slot command is queued without
functional xHCI events.

Regards,
Michal

--MP_/+QhLVpzWgHzxnhzO8nqFFmi
Content-Type: text/x-patch
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=xhci-bogus-dma.patch

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 83ed26c4f9e4..a8f6d50eaf03 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -2349,7 +2349,7 @@ void xhci_add_interrupter(struct xhci_hcd *xhci, unsigned int intr_num)
 
 	erst_base = xhci_read_64(xhci, &ir->ir_set->erst_base);
 	erst_base &= ~ERST_BASE_ADDRESS_MASK;
-	erst_base |= ir->erst.erst_dma_addr & ERST_BASE_ADDRESS_MASK;
+	erst_base |= xhci->quirks == 0x9810 ? 0xbeef0000 : ir->erst.erst_dma_addr & ERST_BASE_ADDRESS_MASK;
 	if (xhci->quirks & XHCI_WRITE_64_HI_LO)
 		hi_lo_writeq(erst_base, &ir->ir_set->erst_base);
 	else
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index e5c8b3a945a6..62c0690d4b55 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -497,7 +497,7 @@ static void xhci_set_cmd_ring_deq(struct xhci_hcd *xhci)
 
 	crcr = xhci_read_64(xhci, &xhci->op_regs->cmd_ring);
 	crcr &= ~(CMD_RING_PTR_MASK | CMD_RING_CYCLE);
-	crcr |= deq_dma;
+	crcr |= xhci->quirks == 0x9810 ? 0xcafe0000 : deq_dma;
 	crcr |= xhci->cmd_ring->cycle_state;
 
 	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "Setting command ring address to 0x%llx", crcr);
@@ -533,6 +533,9 @@ static void xhci_init(struct usb_hcd *hcd)
 {
 	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
 
+	if (xhci->quirks == 0x9810)
+		xhci_info(xhci, "beef cafe\n");
+
 	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "Starting %s", __func__);
 
 	/* Set the Number of Device Slots Enabled to the maximum supported value */

--MP_/+QhLVpzWgHzxnhzO8nqFFmi--
