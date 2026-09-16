Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 462D03CB54A
	for <linux-usb@vger.kernel.org>; Wed, 16 Sep 2026 17:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789580851; cv=none; b=XjFZk4NksnF2mgAl53ZeGjURDxK+0mfpCPPO33DDd7B11qXYgeczL/2il1ekWy/HWA0YFcdogIUujsv6JL5GYlWmeheKFK/KQDGN5GnRNjEN0pKYtkr400Unb6Bws9dPoUC0zBryZfulvel3CgF3ZDi+PSM96o/641oKsdyRymc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789580851; c=relaxed/simple;
	bh=G/PY36hb3mMFej1b0Th4YsjbgNjq9OtQrJFaa5sQyUo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YqHdI5yCTF3Hlz2Nlk9DPgajW53yB7LmXbyX5eBLfg7UdKT2ZD4D65y7+3PH5z7cHGeGtfEhPmCM3IjwrCVikGscZ+tdy9pW7jLumltulJJ3oBDcQGXhZ6hXcBqP1UjPgthJnh/rcJAXc3ZTUdwkI77izfdZ1EFUJEDDVGaowq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XLQ2TffJ; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XLQ2TffJ"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d8fb334e72so12280535ad.1
        for <linux-usb@vger.kernel.org>; Wed, 16 Sep 2026 10:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789580833; x=1790185633; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5fRuhsyZpo67PM/nz3BCI8bcnib/ogSlc/1jN1DlRcc=;
        b=XLQ2TffJXbd9KSLRh9hSZVNATFTKaadjzW0fmN51Abn0RMUn7f1TwJV12WAqnj/Mq5
         5LPvt1YfLNeZt0hzJo9jfyg/UyGMKO4noCXSkKzupgfV/VLdhzr/A3EXGR0SrDpXWHyg
         bmhwLSfsXd92cT2gaOLonP1Z+61XwCcfxcjhOkbesF4ocaQoWIGIiRgBhW9NoSCudjTD
         WidUfChyT4TQTa8LJYFK69SoNuo/CM94bAjMO9C+gvCNfbKrfoWyLeV/dvFH7YZHjOJz
         8ArR1VRxxpO8LDzZzUVshVwuq8fq/9BVtHSK5pf/eOaAoKONnj+0fS1TMEPGwrnHOa/X
         Sl9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789580833; x=1790185633;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5fRuhsyZpo67PM/nz3BCI8bcnib/ogSlc/1jN1DlRcc=;
        b=ItVBZ79q5jg1QdEBq4ocYf+tHmFO4rrjxu3cdAzOpA9a4S/GwgYdCuMVaqCcG2tAqP
         wHj1TtNpwT7SPHApCLk/bBBgyyQUti2nE1+iWfz+E9JVhxpIZIGdITaaik5mlOdpR1/m
         asxxnhjIZ1xvscEWbbiIot1MsqbqKefUwnFRm4ypAiV4ly+SyQxhBKItiiUv/ZpLjzbK
         3Hm97+g5YGR7xGSHOThsEB9xPpnflPkzbcDaa+8gEVzVZjBZ7jS1kV0jPZTjKCU2qAgw
         u6P+5Nrw+KLkM7NdWDqX88Ls9NDb65ZO7+nSMaTyB647rpvhYovsyIz10yo31N+4OcMN
         WUWg==
X-Gm-Message-State: AFuF++lyHdXvMQDU83D+i8bR5N56BL5MDF763I190b9ti4BEyIl1iK3+
	Zbb7btAwlrm6qkFGxJGJwTpAqixAgy7Em3MMy28avpYs2tH192U/iyXV
X-Gm-Gg: AYBFou2RI6lDuxSFc1yPwiLyXsDvQZa5g/t5dD2czglmHaD/W+diZuo1vy/BTMqRNKs
	eKFeqARg0OZ3wpZfX14D0zulW7GI8D9r3IRBo+1ojvuZEFnvuSCk7d70a+U+TFvexStw7g1esK9
	iOVNjIueHQrDjsTp8EAHRqoYlcFli6hIT9fU3vmMu3ZucAkMYES8d20wiGGSb/dqpo2aFJ7iV5J
	D7PcrrzPSU5puWqmSEXtqvpuGGJ6UR0bhMCrteddLPDYTl2Lo64DftwuXsoKL/fgmjDh/TBLjOj
	GsQNeA1tiM7fq+qv7zeYDcu/XakCw1U1plgOzgc8cDF61/l5d47oNbEGeGVIzgnHCPRCVNPf81R
	cx4XBEHN2twuLo3kLzMM7IGcl6Y/l/LrLFa70+BHe8BIKPwH02w6eqAmxzGuBHlUqelDFuhkLpQ
	tcdz74r3GS488M6W/l56l/osilHuJfBIYHutLhj474RzBz2kbjXgZ9X7cQNZXEVPe2ilVyaHtB/
	9f+xWDEZ2O8qiaHiSIi4ETTQnvxfcpXt2gogA==
X-Received: by 2002:a17:90b:5624:b0:39e:b7:cbef with SMTP id 98e67ed59e1d1-39e1e5612d3mr10626719a91.25.1789580833109;
        Wed, 16 Sep 2026 10:47:13 -0700 (PDT)
Received: from eggarch ([2409:40c4:18:7581:88e6:16cb:6cd3:1ba1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1c7e2200sm1772020a91.4.2026.09.16.10.47.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 10:47:12 -0700 (PDT)
Date: Wed, 16 Sep 2026 23:17:05 +0530
From: Lovekesh Solanki <lovekeshsolanki00@gmail.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Michal Pecio <michal.pecio@gmail.com>, Mathieu Fluhr <mathieu.fluhr@gmail.com>, 
	Mario Limonciello <mario.limonciello@amd.com>, Thorsten Leemhuis <regressions@leemhuis.info>, 
	regressions@lists.linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH 2/2] xhci: drop 120ms U3 LFPS wake retry wait from
 runtime resume
Message-ID: <aqrK5PwpJodCmbdM@eggarch>
References: <20260831190349.29590-1-lovekeshsolanki00@gmail.com>
 <20260831190349.29590-2-lovekeshsolanki00@gmail.com>
 <a6a8526f-4b6f-46f7-9d02-05bfe3efcd48@linux.intel.com>
 <apbrp8EaJoIfEg5X@eggarch>
 <1be8e57f-9abe-4b34-bc09-e7934a2fa1bc@linux.intel.com>
 <apg16LtZ-ru9MIBQ@eggarch>
 <082467bf-d045-45d7-b097-97a5790e79d6@linux.intel.com>
 <apq4FFSD2QKG-jUu@eggarch>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apq4FFSD2QKG-jUu@eggarch>

On Fri, Sep 04, 2026 at 06:43:43PM +0530, Lovekesh Solanki wrote:
> On Thu, Sep 03, 2026 at 10:42:48AM +0300, Mathias Nyman wrote:
> > On 9/2/26 21:21, Lovekesh Solanki wrote:
> > > On Wed, Sep 02, 2026 at 03:10:41PM +0300, Mathias Nyman wrote:
> > > > It's possible PCI side or pm core already provides some easy way for xhci driver to check this.
> > > > This specific issue is currently not on my todo list, yet.
> > > Alright, would you like to me to work on this? I could look into
> > > that side and possibly come up with an approach.
> > 
> > Yes, please, that would be great.
> I took a look at the PCI / PM side, and it seems to me there isn't any
> reliable approach for xhci driver to use right now.
> 
> The pci_check_pme_status() both checks and clears the pme status bit 
> and the pci core devours it inside pci_pme_wakeup(), and 
> pm_request_resume is async so xhci's runtime_resume may run much later
> after the bit is already gone. We can't simply export pci_check_pme_status()
> that wouldn't give any useful info.
> 
> One solution I can think of would be adding a pme_wake_detected bitfield
> on pci_dev struct, we set it in pci_pme_wakeup() when PME is confirmed
> and we clear it in pci_pm_runtime_resume() after the driver has
> returned.
> Then, we could directly read via pdev->pme_wake_detected in its own
> resume.
> 
> What are your thoughts on this?

Hey Mathias,

Just wondering if you have looked into the proposal above.
I suggested adding a new field to pci_dev struct for knowing whether a
resume came from PCI PME side.

Would it be better to send it as an RFC too?

Thanks,
Lovekesh
