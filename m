Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 529C247F77E
	for <linux-usb@vger.kernel.org>; Fri,  4 Sep 2026 13:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788527635; cv=none; b=Y3szYAvySdUlIE5ipRa7LCvyRsmf6zJQ+cAS/I/kiwCzHX3gw6vTIe7f751N+vptcJ7ZEt7CeQSCYgjs0p+kxzuVl32sCHd4xQ7tu3R4jYHI1efsdd/GfxPsdzp1butm3pnQ82O2jxtW0IhcNF/eC0v1O+68WCRcAjna7iZQMzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788527635; c=relaxed/simple;
	bh=qeW9HjB/GlkaIQLm8ZbJVD+c0HOdwkjWG+Sfd7Hjcqk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VaJZM5HwPshate9Wi7ZzlWVyDPChuK2Hdg3GyOlgilScPiuIKop4HbcwnfBZe56VuxWK+YE+7W5mGc9IYjRb1Xbss2qevCbUMYWsKgl3AtodkFI8AI7z8siO1/wpFQk3Hv+DWS+O7Er3PK7c8b6bXarVQsPHHAOm953DLTiJHRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=roep+fbF; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="roep+fbF"
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-46adfc80ff6so642465fac.2
        for <linux-usb@vger.kernel.org>; Fri, 04 Sep 2026 06:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788527630; x=1789132430; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/o90ljmvuQQUSHocuJOX1OqLfyNrCD/R11+CTsvEbww=;
        b=roep+fbFqxg5iARC6e0T7klxq8PXaQgwZI06wgAhPNg53hsBhlxDq/LZoAaouTYjDd
         1sFmkD/Zbpsx82iPLR2Jac9l2YLmsbnPctkS/PSHzLU37WGek5qqeyJ8fZm+nwnDx6Yz
         Sg4NRJFAm8JyIYVI7Wl7Dr0eYRcBEuyfbkHvomWMwx4U+ZXTlFLESp71wEc8N+6eR8ef
         vzX9WktyJendVdsoNHMSvkfUOjzdZbo91N7cZkOZMvgw4pJtugTolcQxLl8pfNsnjIjn
         2OzIKZny+vvmI/NaN+kBVN61O06MCipInM9ApD2sHQBjrxm7gwL21myVjFwQFdHALgJG
         5hrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788527630; x=1789132430;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/o90ljmvuQQUSHocuJOX1OqLfyNrCD/R11+CTsvEbww=;
        b=olUzR2XOCtKKmtUuxbqHxenqKZporpe0Dynzg3schNOsypPefl/Jf8q9G3O0M4ksx7
         GAuyeHPyMakpwxCYCL4M1C0bDn9kE5b9zVxDJndX8VcPWsNWyagmJD7QvU4IMLleUpzz
         zCCTs8i72AxoSYkARAvzmW459uVhGYlj8Orsd7wUC+0D2y3jkCJ87udFZ7ljDNGqnkp2
         lHTjt1m9RnzH246znkqKgQMT4870U4Ji7VxpEWonf9LBM0OjPqNEDYfE862GbFABmNW3
         W9c/fPbe5z8pM1ZJIZ24A13MFLt6/PiKrrYQw0DFJzubam2H+4wydnTeJZqFOO2jYkBt
         AbYw==
X-Gm-Message-State: AFuF++mbjDjrQqwQI2iv1KiSA3T64iVqYY85e8H/8AFgMJGKa/0iCO5a
	sk6HdV0arXd1jAPdUVxAoTAsrPUzDyboBFjH0iCUsfBWX50ThP3UcLQW
X-Gm-Gg: AYBFou2o94XWP6MPCVfpadz8oFad3x/r6561ICWVR12ke8jsmRytyB3wA+2QuE2w2mR
	AhZXLJvJ2CCMXAoUDLSEVogW8OCDeVRWGJFn1tkDLgbFSLUI0klQyYJ7dR/hi8qBiPIVDKgQMwb
	0JNkDtNWPyHqph43lGGvU1ygPHt0yC+Jc7RuyaNqDe7CCn5Vn/HWR9tPyf2ud87RPurWAZLVt4f
	hE7+cM5Ovn6Zilg6m9xv8hFvF8DdGXyEWPDAtHw0CmtLXENSEda9fjuxzNudVTSEcX1TCUNJ0Va
	GZxTJeWe4pMMaGtrusnHdMbULRSReyNvC94PRcYCsFDwR7fYy70TMlCe7FwDXjgpMwNV3q9/NxM
	CpGxJwWedWgOFb6NV9I6O64JBtupJdDCXO6MlGma99kh7J9E1qZZLuJElosMRMacLlcZUmNtCV/
	Y8zG3A1BOzzey+oUgpP6CNV5Oh2ODuTjKEwYDOAi2Sq/ZQeH3Uzk0UfkKQtcKP3d07lgPb1TZid
	51oy9HslcWzfJZmrQPHPSPgghiMWQ==
X-Received: by 2002:a05:6820:162b:b0:6b7:46fc:1cf with SMTP id 006d021491bc7-6b746fc2ed1mr2604016eaf.46.1788527629952;
        Fri, 04 Sep 2026 06:13:49 -0700 (PDT)
Received: from localhost ([2409:40c4:180:9098:c5e4:83d7:dd06:4e15])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339ac24d7esm10301543eec.15.2026.09.04.06.13.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 06:13:49 -0700 (PDT)
Date: Fri, 4 Sep 2026 18:43:43 +0530
From: Lovekesh Solanki <lovekeshsolanki00@gmail.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Michal Pecio <michal.pecio@gmail.com>, Mathieu Fluhr <mathieu.fluhr@gmail.com>, 
	Mario Limonciello <mario.limonciello@amd.com>, Thorsten Leemhuis <regressions@leemhuis.info>, 
	regressions@lists.linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH 2/2] xhci: drop 120ms U3 LFPS wake retry wait from
 runtime resume
Message-ID: <apq4FFSD2QKG-jUu@eggarch>
References: <20260831190349.29590-1-lovekeshsolanki00@gmail.com>
 <20260831190349.29590-2-lovekeshsolanki00@gmail.com>
 <a6a8526f-4b6f-46f7-9d02-05bfe3efcd48@linux.intel.com>
 <apbrp8EaJoIfEg5X@eggarch>
 <1be8e57f-9abe-4b34-bc09-e7934a2fa1bc@linux.intel.com>
 <apg16LtZ-ru9MIBQ@eggarch>
 <082467bf-d045-45d7-b097-97a5790e79d6@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <082467bf-d045-45d7-b097-97a5790e79d6@linux.intel.com>

On Thu, Sep 03, 2026 at 10:42:48AM +0300, Mathias Nyman wrote:
> On 9/2/26 21:21, Lovekesh Solanki wrote:
> > On Wed, Sep 02, 2026 at 03:10:41PM +0300, Mathias Nyman wrote:
> > > It's possible PCI side or pm core already provides some easy way for xhci driver to check this.
> > > This specific issue is currently not on my todo list, yet.
> > Alright, would you like to me to work on this? I could look into
> > that side and possibly come up with an approach.
> 
> Yes, please, that would be great.
I took a look at the PCI / PM side, and it seems to me there isn't any
reliable approach for xhci driver to use right now.

The pci_check_pme_status() both checks and clears the pme status bit 
and the pci core devours it inside pci_pme_wakeup(), and 
pm_request_resume is async so xhci's runtime_resume may run much later
after the bit is already gone. We can't simply export pci_check_pme_status()
that wouldn't give any useful info.

One solution I can think of would be adding a pme_wake_detected bitfield
on pci_dev struct, we set it in pci_pme_wakeup() when PME is confirmed
and we clear it in pci_pm_runtime_resume() after the driver has
returned.
Then, we could directly read via pdev->pme_wake_detected in its own
resume.

What are your thoughts on this?

Regards,
Lovekesh
