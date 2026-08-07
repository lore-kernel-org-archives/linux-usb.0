Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26D313F410A
	for <linux-usb@vger.kernel.org>; Fri,  7 Aug 2026 21:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786138205; cv=none; b=TdKPDgQLev2i19IO2dfCTVoz+sD92LWvCIlFNMspf1WQmxrGmnDRNR9NjUyxP+5PtyaEYn1N/vI8BLaebb2duMS/M/4cUBXpBYdne5barr7lVSQJg8qBRg5owdD+QA5yKAFX849Gbv2qZt53AsxhM28Vj+ms0DkydtwahrpcfKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786138205; c=relaxed/simple;
	bh=1cY+WDZATvcWHh2qs6G153TBqAYbmGCSeMz0TM0gjiI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WhghASuMMebJV8hdEcvApB3IXkJR8/3rVBvOokeAovah9+KOm/6chsMHtZnockMZhufThuxJngd9i8bnUnJJT1tavboS5IcVhvNxwPvCy7qSsr4Y+1vedBz2OSSpuT622LtgyiCJ18T/p8ry1SE//lOs1aZJTYB0lJLhDgLPrss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q7g3Pqe4; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q7g3Pqe4"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4956242332dso119715e9.2
        for <linux-usb@vger.kernel.org>; Fri, 07 Aug 2026 14:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786138202; x=1786743002; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mkB13fytaAJDflMhe2+vDI9A0diQOsJ5OPPJRd+Rmi4=;
        b=q7g3Pqe4/rW5+GIdZQzvfLgz2MLdrEZrH4HCtUo4+M7epefhqRENCRFPkGWgIChjmC
         Y6CaIuZ3T/tIpyVIP92V2cLBTSn5IxxBlmOClFOerI0HRjWN2i/wOGH4MlpWUiyEJOgr
         xR4HrJudEDDficp7ryj5azd9hSgPPCkO2rp5QKFZxyeSVbZBjt12VLwuEmn7DiSSS1aF
         CRFOMCkyecfY4EEC/A3KK8ky6ghj1dymlf1oNlv/3+ZaySbDWDpFBcTORJ86ONIavvSb
         2fSIwNoAQgZlNvvOSqVWyCgaDy6qls0DJAcWxMVOygRH91oSxt20Uha9zctn5dm8pThV
         VI9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786138202; x=1786743002;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mkB13fytaAJDflMhe2+vDI9A0diQOsJ5OPPJRd+Rmi4=;
        b=P1EGwc28PDuzZaSaXHY/BmvfGH1hT+YJBrgeb5tgYpAD78fBsJzKwC7MIE5ZJ1xo0h
         wDaazxqKlYJrUgheM/oSNXLQXqKuAwPfXblN8ZOfS2xFz3p74azvR05ZVwq6AVndrOnF
         T3+vYZUR8Yk5xN2jNsjeljMbncidm+Nulpdy4TVH3V+wgK0WQA1o7a2SsL8XvEVaHpzt
         iak5z3eTnw7UpLuNRXFGIM6slvHc1nkFFAOXB171J3ZLuMpnDHiPZ4XbvroEbH/oNmi7
         WKzypzm1cybuXxxDYgJgAmGOA0BMHg9IqiMJKcF81kxCSRoW7kAaZN3BMMOrsX3yF0xV
         QtfQ==
X-Forwarded-Encrypted: i=1; AHgh+RrCBw+BMks5uPdETh4eQ0/2A7YkVIwXjA7z3XMjuGFPaqkO57e3ZOC+NzgfgyLYNqwVmyVMg8+VmbM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwrSibQhKHY26VojIS/kkx0brE9jElWgThCgIm4a4lxyxJmmKor
	mAlr7berKcWjShi758ivTCOjaqUgNaPk3Wj/zcjELRFAap2hCoRUHvUw
X-Gm-Gg: AR+sD11/cRsJChzYy4pJwBiCae2j+MyvHuq775vqrvqDZ3fwZYIWhKvtvP9HGx34zPR
	GX7Efg9Hj49UYaox++oDXtZOKns8s6ns8CmWFVcQJ029sCed7AWbkKvkYZGZ2eRNi36vUlGvcvO
	dqmekQ3hHPPKHoiM+er73UOLNlmIZLBBTjG4UeKb/E1Adb190rXGW44qBYVjpQ51klk6vqAHI8P
	mGXyF0VcpdkSV9FkaKz0nfhenFBCfr7+o9tZtdhocDGXhCSBo4j0LKcl/6fLhZ+6OL534AYQ3Nw
	uWLaq5oxkLy/IBFxuMH6qVs0UK1o+iAu4tiPqYtK+1KdX9qcvEPCp/ybrk6CAbY8L2pkWO2sv/c
	2xuKO6WWRyGvx8hytj1Wk/28rVup5rShZqDV2hOIH5m+0TypRWarx78l02B6wzDgzS976jBAAI+
	YbNixC4B41HFgsUOuepQpVDjlLA8lPxytg/Zev9TSMZxyX0XijsixQItE4Nn4K92pAapFPuZsj
X-Received: by 2002:a05:600c:4593:b0:493:a438:7f98 with SMTP id 5b1f17b1804b1-49961b94ea8mr32985035e9.18.1786138197617;
        Fri, 07 Aug 2026 14:29:57 -0700 (PDT)
Received: from foxbook (bgt135.neoplus.adsl.tpnet.pl. [83.28.83.135])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995e9eb1a0sm72083575e9.5.2026.08.07.14.29.55
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 07 Aug 2026 14:29:57 -0700 (PDT)
Date: Fri, 7 Aug 2026 23:29:52 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Dylan Robinson <dylan_robinson@motu.com>
Cc: Alan Stern <stern@rowland.harvard.edu>, Mathias Nyman
 <mathias.nyman@linux.intel.com>, linux-usb@vger.kernel.org,
 mathias.nyman@intel.com
Subject: Re: [RFT PATCHv3 1/3] xhci: fix frame id calculation and checks for
 isoc URBs
Message-ID: <20260807232952.015d380b.michal.pecio@gmail.com>
In-Reply-To: <CA+Df+jdCbY23h+Bq+ehKbJWMvTtwQDAOLk+hw=Y8Ne9zhJ_GOw@mail.gmail.com>
References: <a67e11d4-6c80-4043-9f60-ae42a15ed0d3@linux.intel.com>
	<20260521152715.288995-1-mathias.nyman@linux.intel.com>
	<20260806101706.72a8de47.michal.pecio@gmail.com>
	<0e2f28f5-aa38-4401-8287-b55aab577243@linux.intel.com>
	<20260807000155.2960c741.michal.pecio@gmail.com>
	<e3c66325-0291-40f9-a87e-1bb337ce4427@linux.intel.com>
	<20260807102604.5f649db2.michal.pecio@gmail.com>
	<310ccfe5-0212-4c8b-9213-891a7340e2f4@linux.intel.com>
	<7d514c0c-cb24-4d3f-a9a6-8107cc605bad@rowland.harvard.edu>
	<CA+Df+jdCbY23h+Bq+ehKbJWMvTtwQDAOLk+hw=Y8Ne9zhJ_GOw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 7 Aug 2026 13:30:40 -0400, Dylan Robinson wrote:
> On Thu, Aug 6, 2026 at 8:07=E2=80=AFPM Mathias Nyman
> <mathias.nyman@linux.intel.com> wrote:
> > With the hardware ep ctx check we will set the frame_id of the late
> > URB to point to the past, to the real time it was supposed to be
> > played back. xHC hardware will then trigger a 'missed service
> > event' for that TD as it was incapable of playing it at the correct
> > time, and then fast forward with MSE until it finds a TD with a
> > frame_id it can play, and play at the correct timeslot. Here we
> > lost the late data but playback stays in sync, as isoc transfer are
> > intended to work. =20
>=20
> I want to make sure I'm following along correctly. This is only true
> for host controllers that support CFC. On controllers without CFC,
> continuations are always submitted with SIA, so the controller can't
> reject expired TDs based on their Frame ID.

Yes, we are talking about the patch fixing CFC logic. You are right,
and you could only be more right with "because" in place of "so";
I tried treating old chips as if they had CFC, outcomes were weird.

> On Fri, Aug 7, 2026 at 12:48=E2=80=AFPM Alan Stern
> <stern@rowland.harvard.edu> wrote:
> > The point under discussion is really about what happens when an
> > underrun occurs by accident -- for example, if the system is
> > temporarily overloaded.  In this situation there are two logical
> > choices of action if the class driver wants to keep the queue
> > running: Keep the alignment of iso_packet_descriptors and
> > (micro)frames as it was, which means assigning some new packets to
> > times in the past, or forget about the old alignment and start
> > fresh, which means assigning the next packet to the next available
> > future time slot.  The URB_ISO_ASAP flag is how the driver
> > communicates its choice to the HCD. =20
>=20
> How is the first choice realized when the host controller doesn't
> support CFC?

Currently it isn't, everything goes "ASAP" on xHCI 1.0 hardware and
underrun creates a gap. Another patch that Mathias prepared for 7.3
would align the first URB of each new stream, but nothing more.

We get the Ring Underrun event, so we know it happened. Drivers don't
know and they seem to have no trivial and robust way to detect it. To
them, URBs are completing, submissions are succeeding, all looks fine.

Potential solutions I could think of:

1. Somehow let drivers know that a fresh start is their only choice
   (some completion status, bogus start_frame, usb_submit_urb() error,
   callback, ...) and have them ready to deal with this (hard part).

2. Try to resync in xhci-hcd: quickly return newly submitted frames
   as -EXDEV until one is far enough into the future to reliably meet
   the IST and start a new "isoc data flow" from HW's point of view.
  =20
   Complicated by the fact that new URBs may be submitted after the
   underrun occurs but before our IRQ handler learns about it. Those
   are doomed to execute with some lag (unless unlinked). We could
   mark them -EXDEV or some such so that drivers don't trust them.

Not sure if this is desired by drivers, particularly the potential
inefficiency of the "complicated" part. I wouldn't be shocked if audio
(even specifically pro audio) was the only application in the world
that truly cares about exact scheduling.

I wonder if it should be recommended that drivers which don't care
always set URB_ISO_ASAP to opt out of any such insanity just in case?
I know that uvcvideo uses ASAP, for example.

Regards,
Michal
