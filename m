Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C82DE149C6F;
	Sun, 12 Jul 2026 09:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783849518; cv=none; b=mSVtdyN81+mkx4ZbhXqSg4rv8VJorKh/DygMJe+3LsHzGb5ZGWe3KtG2WigbzQqlITdMm8qOLxGxy/ktlLbr5NLUlls5uJe+r2iu1F4ukd0e0O069BXtqyY0M5S1EQxlmY4VHdtiY/F0Z36IYxX7Sx/eAQ4okUSeUJZ2FC62rDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783849518; c=relaxed/simple;
	bh=K7yaw9Oomiq4Fvtf7ruQBNHiCiGduKYs/9sKbs+6mx0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G2Eiz3Fyb/OGM4ggqBnRIFs8wDyZa+NC75YiY0rB5FxDAUh9PPlQ8OdRjQslV5hee7AF7EavYoy7sPILTlCGV8DbsESO85+qlm9UE3pESoRrbRmieempzZUlKhxTB6KnluzkkApLnwmTbRGBg2U4gdaSVfCBvI7CPOuF3yML5C0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=F5EtahcG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="F5EtahcG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CDC21F000E9;
	Sun, 12 Jul 2026 09:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783849516;
	bh=dxzjIYr/auLTV4lYCSC6tCzvIAXw8w5RqTzPrzo8Tvo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=F5EtahcGTsVsTYVnfPqZz7iBIB9b2Rws08KeBOH/R9n4fpj1So7cQscV0EwlzGRc4
	 7zHk9Dvo/SmmHXZcSYSBx4gpmFvyoqGs9mPRY6IDokOtxNKVjK1GBCwYp0YKBEM3/H
	 237rg03T7hts+foirXIobtMvUD13pS37D+ufcnr8=
Date: Sun, 12 Jul 2026 11:43:56 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Jaeyoung Chung <jjy600901@snu.ac.kr>
Cc: Valentina Manea <valentina.manea.m@gmail.com>,
	Shuah Khan <shuah@kernel.org>, Hongren Zheng <i@zenithal.me>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	Eulgyu Kim <eulgyukim@snu.ac.kr>
Subject: Re: [BUG] KASAN: slab-use-after-free Read in vhci_tx_loop
Message-ID: <2026071210-defacing-evacuate-d27d@gregkh>
References: <20260712094037.1560970-1-jjy600901@snu.ac.kr>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260712094037.1560970-1-jjy600901@snu.ac.kr>

On Sun, Jul 12, 2026 at 06:40:37PM +0900, Jaeyoung Chung wrote:
> Hello,
> 
> We found a slab-use-after-free Read in vhci_tx_loop on Linux v7.2-rc2
> (8cdeaa50eae8dad34885515f62559ee83e7e8dda).
> 
> The report below was produced on an x86_64 QEMU guest with KASAN. The kernel
> configuration is the same as the syzbot configuration.
> 
> Required kernel config for reproducing the issue:
> 	CONFIG_USBIP_CORE=y
> 	CONFIG_USBIP_VHCI_HCD=y
> 	CONFIG_USBIP_VHCI_HC_PORTS=8
> 	CONFIG_USBIP_VHCI_NR_HCS=16
> 	CONFIG_KASAN=y
> 	CONFIG_KASAN_GENERIC=y
> 	CONFIG_KASAN_INLINE=y
> 
> To make the race reliably reproducible, I applied the testing-only delay
> patch below. I then built and ran the reproducer as root:
> 
>   gcc repro.c -o repro -static -lpthread
>   ./repro
> 
> I do not have a proposed fix for this issue. Please let me know if any
> additional information or testing would be useful.
> 
> Reported-by: Jaeyoung Chung <jjy600901@snu.ac.kr>
> Reported-by: Eulgyu Kim <eulgyukim@snu.ac.kr>

A proposed patch would be best as you have a way to reproduce the issue.

thanks,

greg k-h
